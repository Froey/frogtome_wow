local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Trait = {}

local API = Frogtome.Root.API
local Context = Frogtome.Version.Context
local Log = Frogtome.Root.Log
local Trait = Frogtome.Core.Trait
local Utils = Frogtome.Root.Utils

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

Context:SetDependencies(
	Trait.CONTEXT_MODULE,
	"GetNodeName",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetTraitTreeNodeEntryInfo", "GetTraitTreeNodeEntryDefinitionInfo" }
)
function Trait:GetNodeName(configId, nodeId, node)
	if not Context:CheckDependencies(Trait.CONTEXT_MODULE, "GetNodeName") then
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
	
	-- If we happen to have support for getting a spell's name, try that if needed
	
	local spellId = definition.spellID
	if spellId and API:IsSupported("GetSpellName") then
		return API.GetSpellName(spellId)
	end
	
	return nil
end

Context:SetDependencies(
	Trait.CONTEXT_MODULE,
	"GetNodeRank",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetTraitTreeNodeInfo" }
)
function Trait:GetNodeRank(configId, nodeId)
	if not Context:CheckDependencies(Trait.CONTEXT_MODULE, "GetNodeRank") then
		return 0
	end
	
	local node = API.GetTraitTreeNodeInfo(configId, nodeId)
	
	if node.ranksPurchased then
		return node.ranksPurchased
	else
		return node.currentRank
	end
end

Context:SetDependencies(
	Trait.CONTEXT_MODULE,
	"FindNode",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetTraitConfigInfo", "GetTraitTreeNodeIds", "GetTraitTreeNodeInfo" }
)
function Trait:FindNode(expectedNodeName, expectedNodeMaxRanks)
	if not Context:CheckDependencies(Trait.CONTEXT_MODULE, "FindNode") then
		return nil
	end
	
	local foundConfigIds = {}
	
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
	
	return Trait:GetNodeRank(Trait.CachedWellRestedNodeInfo.ConfigId, Trait.CachedWellRestedNodeInfo.NodeId)
end
