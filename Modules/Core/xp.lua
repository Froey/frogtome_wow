local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.XP = {}

local API = Frogtome.Core.API
local Log = Frogtome.Misc.Log
local Utils = Frogtome.Misc.Utils
local XP = Frogtome.Core.XP
local XpData = Frogtome.Data.XpData

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

XP.MinLevel = 1
XP.MaxLevel = API.GetCharacterMaxLevel()

XP.BaseRestedCapFraction = 1.5
XP.AdditionalRestedCapFractionPerRank = XP.BaseRestedCapFraction * 0.04
XP.BaseRestedCapTimeWhenRestingInHours = 24 * 10
XP.BaseRestedCapTimeWhenNotRestingInHours = XP.BaseRestedCapTimeWhenRestingInHours * 4

XP.CachedWellRestedNodeInfo = nil
XP.WellRestedNodeDiscoveryByTypeFloor = 0
XP.WellRestedNodeDiscoveryByTypeCeiling = 5
XP.WellRestedNodeDiscoveryBySystemFloor = 1
XP.WellRestedNodeDiscoveryBySystemCeiling = 200

XP.ExpectedWellRestedNodeName = "Well Rested"
XP.ExpectedWellRestedNodeMaxRanks = 5

-----------------------
-- Earned Experience --
-----------------------

function XP:GetCurrentLevel()
	return API.GetCharacterLevel()
end

function XP:GetMinLevel()
	return XP.MinLevel
end

function XP:GetMaxLevel()
	return XP.MaxLevel
end

function XP:ClampLevel(level)
	if level < XP.MinLevel then
		return XP.MinLevel
	end
	
	if level > XP.MaxLevel then
		return XP.MaxLevel
	end
	
	return level
end

function XP:IsMaxLevel(level)
	if not level then
		level = XP:GetCurrentLevel()
	end
	level = XP:ClampLevel(level)
	
	return level >= XP.MaxLevel
end

function XP:GetCurrentXp()
	if XP:IsMaxLevel() then
		return 0
	end
	
	return API.GetCharacterXp()
end

function XP:GetNeededXp(level)
	if not level then
		level = XP:GetCurrentLevel()
	end
	level = XP:ClampLevel(level)
	
	if XP:IsMaxLevel(level) then
		return 0
	end
	
	if level == XP:GetCurrentLevel() then
		-- Try to go right to the source of truth when possible
		return API.GetCharacterNeededXp()
	else
		return XpData.NeededLevelXps[level]
	end
end

function XP:GetRemainingXp()
	return XP:GetNeededXp() - XP:GetCurrentXp()
end

function XP:GetCurrentLifetimeXp(currentLevel, currentXp)
	if not currentLevel then
		currentLevel = XP:GetCurrentLevel()
	end
	currentLevel = XP:ClampLevel(currentLevel)
	
	if not currentXp then
		currentXp = XP:GetCurrentXp()
	end
	-- TODO: do local level-up if currentXp is really high?
	
	local lifetimeXp = currentLevel
	for completedLevel = XP.MinLevel, level - 1 do
		lifetimeXp = lifetimeXp + XpData.NeededLevelXps[completedLevel]
	end
	
	return lifetimeXp
end

function XP:GetNeededLifetimeXp()
	local lifetimeXpNeeded = 0
	for level = XP.MinLevel, XP.MaxLevel do
		lifetimeXpNeeded = lifetimeXpNeeded + XpData.NeededLevelXps[level]
	end
	
	return lifetimeXpNeeded
end

function XP:GetRemainingLifetimeXp(currentLevel, currentXp)
	return XP:GetNeededLifetimeXp() - XP:GetCurrentLifetimeXp(currentLevel, currentXp)
end

-----------------------
-- Rested Experience --
-----------------------

function XP:IsResting()
	return API.IsCharacterResting()
end

function XP:GetRestedXp()
	local restedXp = API.GetCharacterRestedXp()
	if restedXp == nil then
		return 0
	end
	
	return restedXp
end

function XP:HasRestedXp()
	return XP:GetRestedXp() > 0
end

function XP:GetXpMultiplier()
	local multiplier = API.GetCharacterRestedXpMultiplier()
	if multipler == nul then
		multiplier = 1
	end
	
	return multiplier
end

function XP:GetCurrentRestedCapFraction(restedXp, neededXp, wellRestedRank)
	if not restedXp then
		restedXp = XP:GetRestedXp()
	end
	
	if not neededXp then
		neededXp = XP:GetNeededXp()
	end
	
	if not wellRestedRank then
		wellRestedRank = XP:GetWellRestedRank()
	end
	
	-- For a character loaded in right after creation, neededXp can be zero. Default to zero here in that case.
	if not neededXp or neededXp == 0 then
		return 0
	end
	
	local restedXpCapFraction = XP.BaseRestedCapFraction + (XP.AdditionalRestedCapFractionPerRank * wellRestedRank)
	local restedXpCapAmount = neededXp * restedXpCapFraction
	
	return Utils:Fraction(restedXp, restedXpCapAmount)
end

function XP:GetRemainingRestedCapFraction(restedXp, neededXp, wellRestedRank)
	return 1 - XP:GetCurrentRestedCapFraction(restedXp, neededXp, wellRestedRank)
end

function XP:GetTotalRestedCapTimeInHours(isResting)
	if isResting == nil then
		isResting = XP:IsResting()
	end
	
	if isResting then
		return XP.BaseRestedCapTimeWhenRestingInHours
	else
		return XP.BaseRestedCapTimeWhenNotRestingInHours
	end
end

function XP:GetRemainingRestedCapTimeInHours(lastKnownRestedXp, neededXp, wellRestedRank, isResting, timeSinceLastKnownRestedXpInHours)
	if isResting == nil then
		isResting = XP:IsResting()
	end
	
	if not timeSinceLastKnownRestedXpInHours then
		timeSinceLastKnownRestedXpInHours = 0
	end
	
	local remainingRestedCapFraction = XP:GetRemainingRestedCapFraction(lastKnownRestedXp, neededXp, wellRestedRank)
	local totalRestedCapTimeInHours = XP:GetTotalRestedCapTimeInHours(isResting)
	
	local remainingRestedCapTimeInHours = (totalRestedCapTimeInHours * remainingRestedCapFraction) - timeSinceLastKnownRestedXpInHours
	if remainingRestedCapTimeInHours < 0 then
		remainingRestedCapTimeInHours = 0
	end
	
	return remainingRestedCapTimeInHours
end

function XP:GetRemainingRestedCapTimeInDaysPlusHours(lastKnownRestedXp, neededXp, wellRestedRank, isResting, timeSinceLastKnownRestedXpInHours)
	local remainingRestedCapTimeInHours = XP:GetRemainingRestedCapTimeInHours(lastKnownRestedXp, neededXp, wellRestedRank, isResting, timeSinceLastKnownRestedXpInHours)
	if remainingRestedCapTimeInHours % 1 ~= 0 then
		remainingRestedCapTimeInHours = math.floor(remainingRestedCapTimeInHours + 1)
	end
	
	local remainingRestedCapTimeInDays = math.floor(remainingRestedCapTimeInHours / 24)
	remainingRestedCapTimeInHours = remainingRestedCapTimeInHours % 24
	
	return remainingRestedCapTimeInDays, remainingRestedCapTimeInHours
end

-----------------------
-- Well Rested Trait --
-----------------------

-- TODO: This stretches WELL BEYOND the scope of this module. This should probably be moved to elsewhere.
function XP:GetNodeName(configId, nodeId, node)
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

function XP:DiscoverWellRestedNode()
	local foundConfigIds = {}
	
	-- Very debug-like code for the time being, while we figure out if Well Rested has a permanent ID
	
	-- Attempt to collect possible "Well Rested" traits by type
	if API:IsSupported("GetTraitConfigIdsFromTypeId") then
		for typeId = XP.WellRestedNodeDiscoveryByTypeFloor, XP.WellRestedNodeDiscoveryByTypeCeiling do
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
		Log:Dev("Skipping discovery of \"Well Rested\" trait via types.")
	end
	
	-- Collect possible "Well Rested" traits by system ID
	if API:IsSupported("GetTraitConfigIdFromSystemId") then
		for systemId = XP.WellRestedNodeDiscoveryBySystemFloor, XP.WellRestedNodeDiscoveryBySystemCeiling do
			local configId = API.GetTraitConfigIdFromSystemId(systemId)
			if configId and foundConfigIds[configId] == nil then
				foundConfigIds[configId] = "System ID: " .. tostring(systemId)
			end
		end
	else
		Log:Dev("Skipping discovery of \"Well Rested\" trait via systems.")
	end
	
	local traitTreeDivingDependencies = {
		"GetTraitConfigInfo",
		"GetTraitTreeNodeIds,"
	}
	
	-- Get the actual "Well Rested" trait
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
								local nodeName = XP:GetNodeName(configId, nodeId, node)
								if nodeName == XP.ExpectedWellRestedNodeName and node.maxRanks == XP.ExpectedWellRestedNodeMaxRanks then
									Log:Dev("Found \"Well Rested\": " .. tostring(configId) .. ", " .. tostring(nodeId))
									XP.CachedWellRestedNodeInfo = {
										["ConfigId"] = configId,
										["NodeId"] = nodeId
									}
									return
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
		Log:Dev("Did not have necessary dependencies to search trait trees for \"Well Rested\".")
	end
	
	Log:Dev("Did not find \"Well Rested\".")
	XP.CachedWellRestedNodeInfo = {}
end

function XP:GetWellRestedRank(forceCacheReset)
	if not XP.CachedWellRestedNodeInfo or forceCacheReset then
		-- XXX: Does the timing of this matter? Do we need to try to discover this multiple times?
		-- XXX: This may do absolutely nothing until the feature is unlocked with the first legacy talent
		XP:DiscoverWellRestedNode()
	end
	
	if not XP.CachedWellRestedNodeInfo.ConfigId or not XP.CachedWellRestedNodeInfo.NodeId then
		-- We don't have what we need to get info for "Well Rested". Return a default of zero
		return 0
	end
	
	local wellRestedConfigId = XP.CachedWellRestedNodeInfo.ConfigId
	local wellRestedNodeId = XP.CachedWellRestedNodeInfo.NodeId
	local wellRestedNode = API.GetTraitTreeNodeInfo(wellRestedConfigId, wellRestedNodeId)
	
	if wellRestedNode.ranksPurchased then
		return wellRestedNode.ranksPurchased
	else
		return wellRestedNode.currentRank
	end
end
