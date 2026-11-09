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

Trait.WellRestedNodeId = 110301
Trait.WellRestedName = "Well Rested"
Trait.WellRestedMaxRank = 5

-------------------------
-- Core Data Functions --
-------------------------

function Trait:CreateTraitInfoCache(nodeId, name, maxRank)
	return {
		["ConfigId"] = nil,
		["NodeId"] = nodeId,
		["Name"] = name,
		["MaxRank"] = maxRank,
		["WasFound"] = false
	}
end

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
function Trait:FindNode(trait)
	if not Context:CheckDependencies(Trait.CONTEXT_MODULE, "FindNode") then
		return false
	end
	
	trait.WasFound = false
	
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
	end
	
	-- Collect possible trait nodes by system ID
	if API:IsSupported("GetTraitConfigIdFromSystemId") then
		for systemId = Trait.NodeDiscoveryBySystemFloor, Trait.NodeDiscoveryBySystemCeiling do
			local configId = API.GetTraitConfigIdFromSystemId(systemId)
			if configId and foundConfigIds[configId] == nil then
				foundConfigIds[configId] = "System ID: " .. tostring(systemId)
			end
		end
	end
	
	-- Get the actual trait node, caching its info if successful
	for configId, _ in pairs(foundConfigIds) do
		local configInfo = API.GetTraitConfigInfo(configId)
		if configInfo and configInfo.treeIDs then
			for _, treeId in ipairs(configInfo.treeIDs) do
				local node = nil
				if trait.NodeId then
					local node = API.GetTraitTreeNodeInfo(configId, trait.NodeId)
					if node then
						--print("testing")
						
						local nodeName = Trait:GetNodeName(configId, trait.NodeId, node)
						--print(nodeName)
						if nodeName == trait.Name and node.maxRanks == trait.MaxRank then
							Log:Dev("Found \"" .. trait.Name .. "\": config=" .. tostring(configId) .. ", node=" .. tostring(trait.NodeId))
							
							trait.ConfigId = configId
							trait.WasFound = true
							
							return true
						end
					end
				else
					local nodeIds = API.GetTraitTreeNodeIds(treeId)
					if nodeIds then
						for _, nodeId in ipairs(nodeIds) do
							local node = API.GetTraitTreeNodeInfo(configId, nodeId)
							if node then
								local nodeName = Trait:GetNodeName(configId, nodeId, node)
								if nodeName == trait.Name and node.maxRanks == trait.MaxRank then
									Log:Dev("Found \"" .. trait.Name .. "\": config=" .. tostring(configId) .. ", node=" .. tostring(nodeId))
									
									trait.ConfigId = configId
									trait.NodeId = nodeId
									trait.WasFound = true
									
									return true
								end
							end
						end
					end
				end
			end
		end
	end
	
	--print(trait.WasFound)
	return false
end

--------------------------------
-- Trait Monitoring Functions --
--------------------------------

Trait.RegisteredTraits = {}
Trait.RegisteredTraits[Trait.WellRestedName] = Trait:CreateTraitInfoCache(Trait.WellRestedNodeId, Trait.WellRestedName, Trait.WellRestedMaxRank)

function Trait:WasTraitFound(traitName)
	if not Trait.RegisteredTraits[traitName] then
		return false
	end
	
	return Trait.RegisteredTraits[traitName].WasFound
end

function Trait:TryResolveTrait(traitName, forceSearch)
	if Trait:WasTraitFound(traitName) and not forceSearch then
		return true
	end
	
	if not Trait.RegisteredTraits[traitName] then
		return false
	end
	
	local trait = Trait.RegisteredTraits[traitName]
	return Trait:FindNode(trait)
end

function Trait:GetTraitRank(traitName)
	if not Trait:WasTraitFound(traitName) then
		return 0
	end
	
	local trait = Trait.RegisteredTraits[traitName]
	return Trait:GetNodeRank(trait.ConfigId, trait.NodeId)
end

function Trait:GetTraitMaxRank(traitName)
	if not Trait.RegisteredTraits[traitName] then
		return false
	end
	
	return Trait.RegisteredTaits[traitName].MaxRanks
end
