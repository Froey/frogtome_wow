local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Trait = {}

local API = Frogtome.Core.API
local Log = Frogtome.Misc.Log
local Trait = Frogtome.Core.Trait
local Utils = Frogtome.Misc.Utils

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

Trait.CONTEXT_MODULE = "Frogtome.Core.Trait"

Trait.NodeDiscoveryByTypeFloor = 0
Trait.NodeDiscoveryByTypeCeiling = 5
Trait.NodeDiscoveryBySystemFloor = 1
Trait.NodeDiscoveryBySystemCeiling = 200

Trait.CachedWellRestedNodeInfo = nil
Trait.ExpectedWellRestedNodeName = "Well Rested"
Trait.ExpectedWellRestedNodeMaxRanks = 5

-------------------------
-- Core Data Functions --
-------------------------

function Trait:GetNodeName(configId, nodeId, node)
	if not API:AreAllSupported({ "GetTraitTreeNodeEntryInfo", "GetTraitTreeNodeEntryDefinitionInfo" }) then
		return nil
	end
	
	local entryId = nil
	if node.activeEntry then
		entryId = node.activeEntry.entryID
	elseif node.entryIDs then
		entryId = node.entryIDs[1]
	end
	if not entryId then
		return nil
	end
	
	local entry = API.GetTraitTreeNodeEntryInfo(configId, entryId)
	if not entry then
		return nil
	end
	
	local definitionId = entry.definitionID
	if not definitionId then
		return nil
	end
	
	local definition = API.GetTraitTreeNodeEntryDefinitionInfo(definitionId)
	if not definition then
		return nil
	end
	
	-- We have something we can return the name of
	
	local overrideName = definition.overrideName
	if overrideName and overrideName ~= "" then
		return overrideName
	end
	
	local spellId = definition.spellID
	if spellId and API:IsSupported("GetSpellName") then
		return API.GetSpellName(spellId)
	end
	
	return nil
end

function Trait:FindNode(expectedNodeName, expectedNodeMaxRanks)
	local foundConfigIds = {}
	
	-- Very debug-like code for the time being, while we figure out if Well Rested has a permanent ID
	
	-- Attempt to collect possible trait nodes by type
	if API:IsSupported("GetTraitConfigIdsFromTypeId") then
		for typeId = Trait.NodeDiscoveryByTypeFloor, Trait.NodeDiscoveryByTypeCeiling do
			local configIds = API.GetTraitConfigIdsFromTypeId(typeId)
			if configIds then
				for _, configId in ipairs(configIds) do
					if foundConfigIds[configId] == nil then
						foundConfigIds[configId] = "Type ID: " .. tostring(typeId)
					end
				end
			end
		end
	else
		Log:Dev("Skipping discovery of \"" .. expectedNodeName .. "\" trait via types.")
	end
	
	-- Collect possible trait nodes by system ID
	if API:IsSupported("GetTraitConfigIdFromSystemId") then
		for systemId = Trait.NodeDiscoveryBySystemFloor, Trait.NodeDiscoveryBySystemCeiling do
			local configId = API.GetTraitConfigIdFromSystemId(systemId)
			if configId and foundConfigIds[configId] == nil then
				foundConfigIds[configId] = "System ID: " .. tostring(systemId)
			end
		end
	else
		Log:Dev("Skipping discovery of \"" .. expectedNodeName .. "\" trait via systems.")
	end
	
	-- Get the actual trait node, caching its info if successful
	if API:AreAllSupported({ "GetTraitConfigInfo", "GetTraitTreeNodeIds", "GetTraitTreeNodeInfo" }) then
		for configId, _ in pairs(foundConfigIds) do
			local configInfo = API.GetTraitConfigInfo(configId)
			if configInfo and configInfo.treeIDs then
				for _, treeId in ipairs(configInfo.treeIDs) do
					local nodeIds = API.GetTraitTreeNodeIds(treeId)
					if nodeIds then
						for _, nodeId in ipairs(nodeIds) do
							local node = API.GetTraitTreeNodeInfo(configId, nodeId)
							if node then
								local nodeName = Trait:GetNodeName(configId, nodeId, node)
								if nodeName == expectedNodeName and node.maxRanks == expectedNodeMaxRanks then
									Log:Dev("Found \"" .. expectedNodeName .. "\": config=" .. tostring(configId) .. ", node=" .. tostring(nodeId))
									return {
										["ConfigId"] = configId,
										["NodeId"] = nodeId
									}
								else
									-- debug code for narrowing it down?
								end
							end
						end
					end
				end
			end
		end
	else
		Log:Dev("Did not have necessary dependencies to search trait trees for \"" .. expectedNodeName .. "\".")
	end
	
	Log:Dev("Did not find \"" .. expectedNodeName .. "\".")
	return {}
end

----------------------------------
-- Traits-of-Interest Functions --
----------------------------------

function Trait:GetWellRestedRank(forceCacheReset)
	if not Trait.CachedWellRestedNodeInfo or forceCacheReset then
		-- XXX: Does the timing of this matter? Do we need to try to discover this multiple times?
		-- XXX: This may do absolutely nothing until the feature is unlocked with the first legacy talent
		Trait.CachedWellRestedNodeInfo = Trait:FindNode(Trait.ExpectedWellRestedNodeName, Trait.ExpectedWellRestedNodeMaxRanks)
	end
	
	if not Trait.CachedWellRestedNodeInfo.ConfigId or not Trait.CachedWellRestedNodeInfo.NodeId then
		-- We don't have what we need to get info for "Well Rested". Return a default of zero
		return 0
	end
	
	local wellRestedConfigId = Trait.CachedWellRestedNodeInfo.ConfigId
	local wellRestedNodeId = Trait.CachedWellRestedNodeInfo.NodeId
	local wellRestedNode = API.GetTraitTreeNodeInfo(wellRestedConfigId, wellRestedNodeId)
	
	if wellRestedNode.ranksPurchased then
		return wellRestedNode.ranksPurchased
	else
		return wellRestedNode.currentRank
	end
end
