local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Core = {}

local API = Frogtome.Core.API
local Core = Frogtome.Core.Core
local DungeonData = Frogtome.Data.DungeonData
local InfoData = Frogtome.Data.InfoData
local QuestData = Frogtome.Data.QuestData
local Utils = Frogtome.Misc.Utils
local XpData = Frogtome.Data.XpData
local ZoneData = Frogtome.Data.ZoneData

--------------------------------------
-- API Hookup Functions: Basic Info --
--------------------------------------

-- Returns whether or not the current character is fully loaded.
function Core:IsFullyLoaded()
	if API:IsSupported("GetCharacterLastName") then
		-- The character's name will simply be akin to "Unknown" if it's still being loaded in
		return API.GetCharacterLastName() ~= nil
	elseif API:IsSupported("GetCharacterGuid") then
		-- The next best thing we have otherwise is the GUID, which... may or may not cause bugs
		return API.GetCharacterGuid() ~= nil
	else
		-- Good luck.
		return true
	end
end

-- Returns the GUID of the current character.
function Core:GetGUID()
	if API:IsSupported("GetCharacterGuid") then
		return API.GetCharacterGuid()
	else
		return "N/A"
	end
end

-- Returns the server of the current player.
function Core:GetServer()
	if API:IsSupported("GetCharacterRealm") then
		return API.GetCharacterRealm()
	else
		return "N/A"
	end
end

-- Returns the ruleset for the current character's server.
function Core:GetRules()
	local server = Core:GetServer():lower()
	if server:find("pve", 1, true) then
		return "PvE"
	end
	if server:find("pvp", 1, true) then
		return "PvP"
	end
	if server:find("rp", 1, true) then
		return "RP"
	end
	if server:find("hc", 1, true) or server:find("hardcore", 1, true) then
		return "HC"
	end
	
	return "???"
end

-- Returns the first name of the current character.
function Core:GetFirstName()
	if API:IsSupported("GetCharacterFirstName") then
		return API.GetCharacterFirstName()
	else
		return "Unknown"
	end
end

-- Returns the last name of the current character.
function Core:GetLastName()
	if API:IsSupported("GetCharacterLastName") then
		return API.GetCharacterLastName()
	else
		return "Unknown"
	end
end

-- Returns the full name of the current character.
function Core:GetFullName()
	if API:IsSupported("GetCharacterFirstName") then
		if API:IsSupported("GetCharacterLastName") then
			return API.GetCharacterFirstName() .. " " .. API.GetCharacterLastName()
		else
			return API.GetCharacterFirstName()
		end
	else
		return "Unknown"
	end
end

-- Returns the numerical ID for the current character's body type (or sex, if you prefer).
function Core:GetBodyTypeId()
	return UnitSex("player")
end

-- Returns an English data string for the current character's body type (or sex, if you prefer).
function Core:GetBodyTypeName()
	return InfoData.BodyTypes[Core:GetBodyTypeId()]
end

-- Returns an English one-character shorthand for the current character's body type (or sex, if you prefer).
function Core:GetBodyTypeShorthand()
	return string.sub(Core:GetBodyTypeName(), 0, 0)
end

-- Returns the English data string for the current character's faction.
function Core:GetFactionDataString()
	local dataString, localizedName = UnitFactionGroup("player")
	return dataString
end

-- Returns the localized display name for the current character's faction.
function Core:GetLocalizedFactionName()
	local dataString, localizedName = UnitFactionGroup("player")
	return localizedName
end

-- Returns the numerical ID for the current character's race.
function Core:GetRaceId()
	local dataString, localizedName, id = UnitRace("player")
	return id
end

-- Returns the English data string for the current character's race.
function Core:GetRaceDataString()
	local dataString, localizedName, id = UnitRace("player")
	return dataString
end

-- Returns the localized display name for the current character's race.
function Core:GetLocalizedRaceName()
	local dataString, localizedName, id = UnitRace("player")
	return localizedName
end

-- Returns the numerical ID for the current character's class.
function Core:GetClassId()
	local localizedName, dataString, id = UnitClass("player")
	return id
end

-- Returns the English data string for the current character's class.
function Core:GetClassDataString()
	local localizedName, dataString, id = UnitClass("player")
	return dataString
end

-- Returns the localized display name for the current character's class.
function Core:GetLocalizedClassName()
	local localizedName, dataString, id = UnitClass("player")
	return localizedName
end

-- Returns the name of the guild of the current character.
function Core:GetGuildName()
	local name, rank, rankIndex, realm = GetGuildInfo("player")
	return name
end

---------------------------------
-- API Hookup Functions: Money --
---------------------------------

-- Returns the current character's money, in whole copper pieces.
function Core:GetMoneyInWholeCopper()
	return GetMoney()
end

-- Returns the current character's money, in its exact copper value.
function Core:GetMoneyInExactCopper()
	return Core:GetMoneyInWholeCopper()
end

-- Returns the current character's money, in whole silver pieces.
function Core:GetMoneyInWholeSilver()
	local copper = Core:GetMoneyInWholeCopper()
	return Utils:CopperToWholeSilver(copper)
end

-- Returns the current character's money, in its exact silver value.
function Core:GetMoneyInExactSilver()
	local copper = Core:GetMoneyInWholeCopper()
	return Utils:CopperToExactSilver(copper)
end

-- Returns the current character's money, in whole gold pieces.
function Core:GetMoneyInWholeGold()
	local copper = Core:GetMoneyInWholeCopper()
	return Utils:CopperToWholeGold(copper)
end

-- Returns the current character's money, in its exact gold value.
function Core:GetMoneyInExactGold()
	local copper = Core:GetMoneyInWholeCopper()
	return Utils:CopperToExactGold(copper)
end

-- Returns the number of gold, silver, and copper coins comprising the current character's money.
function Core:GetMoney()
	local copper = Core:GetMoneyInWholeCopper()
	return Utils:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the current character's money.
function Core:GetMoneyString(coinIconResolution)
	local copper = Core:GetMoneyInWholeCopper()
	return Utils:CopperToCoinString(copper, coinIconResolution)
end

-- Returns whether or not the current character has at least the money specified, in copper.
function Core:HasMoneyInCopper(copper)
	return Core:GetMoneyInExactCopper() >= copper
end

-- Returns whether or not the current character has at least the money specified, in silver.
function Core:HasMoneyInSilver(silver)
	return Core:GetMoneyInExactSilver() >= silver
end

-- Returns whether or not the current character has at least the money specified, in gold.
function Core:HasMoneyInGold(gold)
	return Core:GetMoneyInExactGold() >= gold
end

-------------------------------------
-- API Hookup Functions: Inventory --
-------------------------------------

-- Returns the size of the current character's container at the specified index.
function Core:GetContainerSize(index)
	if index < 0 then
		return nil
	end
	if index > 5 then
		return nil
	end
	
	return C_Container.GetContainerNumSlots(index)
end

-- Returns the size of the current character's backpack.
function Core:GetBackpackSize()
	-- Index 0 denotes the backpack
	return Core:GetContainerSize(0)
end

-- Returns the size of the current character's bag at the specified index.
function Core:GetBagSize(index)
	if index < 1 then
		return nil
	end
	if index > 4 then
		return nil
	end
	
	return Core:GetContainerSize(index)
end

-- Returns the size of the current character's reagent bag.
function Core:GetReagentBagSize()
	-- Index 5 denotes the reagent bag
	return Core:GetContainerSize(5)
end

-- Returns the total size of the current character's inventory, optionally including the reagent bag.
function Core:GetInventorySize(includeReagentBag)
	local inventorySize = Core:GetBackpackSize()
	
	for index = 1, 4 do
		inventorySize = inventorySize + Core:GetBagSize(index)
	end
	
	if includeReagentBag then
		inventorySize = inventorySize + Core:GetReagentBagSize()
	end
	
	return inventorySize
end

-- Returns the remaining space in the current character's container at the specified index.
function Core:GetContainerRemainingSpace(index)
	if index < 0 then
		return nil
	end
	if index > 5 then
		return nil
	end
	
	local freeSlots, family = C_Container.GetContainerNumFreeSlots(index)
	
	return freeSlots
end

-- Returns the remaining space in the current character's backpack.
function Core:GetBackpackRemainingSpace()
	-- Index 0 denotes the backpack
	return Core:GetContainerRemainingSpace(0)
end

-- Returns the remaining space in the current character's bag at the specified index.
function Core:GetBagRemainingSpace(index)
	if index < 0 then
		return nil
	end
	if index > 5 then
		return nil
	end
	
	return Core:GetContainerRemainingSpace(index)
end

-- Returns the size of the current character's reagent bag.
function Core:GetReagentBagRemainingSpace()
	-- Index 5 denotes the reagent bag
	return Core:GetContainerRemainingSpace(5)
end

-- Returns the total remaining space of the current character's inventory, optionally including the reagent bag.
function Core:GetInventoryRemainingSpace(includeReagentBag)
	local inventoryRemaining = Core:GetBackpackRemainingSpace()
	
	for index = 1, 4 do
		inventoryRemaining = inventoryRemaining + Core:GetBagRemainingSpace(index)
	end
	
	if includeReagentBag then
		inventoryRemaining = inventoryRemaining + Core:GetReagentBagRemainingSpace()
	end
	
	return inventoryRemaining
end

-- Returns the filled space in the current character's backpack.
function Core:GetBackpackFilledSpace()
	return Core:GetBackpackSize() - Core:GetBackpackRemainingSpace()
end

-- Returns the filled space in the current character's bag at the specified index.
function Core:GetBagFilledSpace(index)
	return Core:GetBagSize(index) - Core:GetBagRemainingSpace(index)
end

-- Returns the size of the current character's reagent bag.
function Core:GetReagentBagFilledSpace()
	return Core:GetReagentBagSize() - Core:GetReagentBagRemainingSpace()
end

-- Returns the total remaining space of the current character's inventory, optionally including the reagent bag.
function Core:GetInventoryFilledSpace(includeReagentBag)
	return Core:GetInventorySize(includeReagentBag) - Core:GetInventoryRemainingSpace(includeReagentBag)
end

--------------------------------------
-- API Hookup Functions: Quest Info --
--------------------------------------

function Core:IsRealQuest(quest)
	-- Basically, this needs to be a tangible quest visible to the player
	return quest ~= nil and not quest.isHeader and not quest.isHidden
end

function Core:IsDungeonQuest(quest)
	-- IN THEORY(??), a type of 81 here signifies a dungeon quest.
	local questTypeId = C_QuestLog.GetQuestType(quest.questID)
	return questTypeId and questTypeId == 81
end

-- Returns whether or not the current character has completed the necessary prerequisites for the quest.
function Core:HasCompletedPrereqQuestsForQuest(questId)
	local quest = QuestData.Quests[questId]
	if quest then
		for _, prereqQuestId in ipairs(quest.PrereqQuests) do
			if not C_QuestLog.IsQuestFlaggedCompleted(prereqQuestId) then
				return false
			end
		end
	end
	
	return true
end

-- Returns whether or not the current character has completed the provided quest.
function Core:HasCompletedQuest(questId, includeLinked)
	if C_QuestLog.IsQuestFlaggedCompleted(questId) then
		return true
	end
	
	-- Check linked quests
	if includeLinked and QuestData.Quests[questId] then
		for _, linkedQuestId in ipairs(QuestData.Quests[questId].LinkedQuests) do
			if Core:HasCompletedQuest(linkedQuestId, false) then
				return true
			end
		end
	end
	
	return false
end

-- Returns whether or not the current character has completed any of the provided quests.
function Core:HasCompletedAnyQuests(questIds)
	for _, questId in ipairs(questIds) do
		if Core:HasCompletedQuest(questId) then
			return true
		end
	end
	
	return false
end

-- Returns whether or not the current character has completed all of the provided quests.
function Core:HasCompletedAllQuests(questIds)
	for _, questId in ipairs(questIds) do
		if not Core:HasCompletedQuest(questId) then
			return false
		end
	end
	
	return true
end

-------------------------------------
-- API Hookup Functions: Quest Log --
-------------------------------------

-- Returns all (real) quests within the current character's quest log.
function Core:GetQuestsInQuestLog(trackedOnly)
	local quests = {}
	
	for i = 1, C_QuestLog.GetNumQuestLogEntries() do
		local quest = C_QuestLog.GetInfo(i)
		if Core:IsRealQuest(quest) and (not trackedOnly or Core:IsTrackingQuest(quest.questID)) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quest IDs of (real) quests within the current character's quest log.
function Core:GetQuestIdsInQuestLog(trackedOnly)
	local questIds = {}
	
	for i = 1, C_QuestLog.GetNumQuestLogEntries() do
		local quest = C_QuestLog.GetInfo(i)
		if Core:IsRealQuest(quest) and (not trackedOnly or Core:IsTrackingQuest(quest.questID)) then
			table.insert(questIds, quest.questID)
		end
	end
	
	return questIds
end

-- Returns all (real) dungeon quests within the current character's quest log.
function Core:GetDungeonQuestsInQuestLog(trackedOnly)
	local quests = {}
	
	for i = 1, C_QuestLog.GetNumQuestLogEntries() do
		local quest = C_QuestLog.GetInfo(i)
		if Core:IsRealQuest(quest) and Core:IsDungeonQuest(quest) and (not trackedOnly or Core:IsTrackingQuest(quest.questID)) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quest IDs of (real) dungeon quests within the current character's quest log.
function Core:GetDungeonQuestIdsInQuestLog(trackedOnly)
	local questIds = {}
	
	for i = 1, C_QuestLog.GetNumQuestLogEntries() do
		local quest = C_QuestLog.GetInfo(i)
		if Core:IsRealQuest(quest) and Core:IsDungeonQuest(quest) and (not trackedOnly or Core:IsTrackingQuest(quest.questID)) then
			table.insert(questIds, quest.questID)
		end
	end
	
	return questIds
end

-- Returns the number of quests within the current character's quest log.
function Core:GetQuestCount(trackedOnly)
	return #Core:GetQuestsInQuestLog(trackedOnly)
end

-- Returns whether or not the current character's quest log has any quests.
function Core:IsOnAnyQuest(trackedOnly)
	return Core:GetQuestCount(trackedOnly) > 0
end

-- Returns whether or not the provided quest is in the current character's quest log.
function Core:IsOnQuest(questId, includeLinked)
	for _, quest in ipairs(Core:GetQuestsInQuestLog()) do
		if quest.questID == questId then
			return true
		end
	end
	
	-- Check linked quests
	if includeLinked and QuestData.Quests[questId] then
		for _, linkedQuestId in ipairs(QuestData.Quests[questId].LinkedQuests) do
			if Core:IsOnQuest(linkedQuestId, false) then
				return true
			end
		end
	end
	
	return false
end

-- Returns whether or not the provided quest, necessarily in the current character's quest log, is complete and can be turned in.
function Core:CanTurnInQuest(questId, includeLinked)
	if not Core:IsOnQuest(questId, includeLinked) then
		return false
	end
	
	if C_QuestLog.IsComplete(questId) then
		return true
	end
	
	-- Check linked quests
	if includeLinked and QuestData.Quests[questId] then
		for _, linkedQuestId in ipairs(QuestData.Quests[questId].LinkedQuests) do
			if C_QuestLog.IsComplete(linkedQuestId) then
				return true
			end
		end
	end
	
	return false
end

-- Returns whether or not the provided quest is in the current character's quest log AND is actively being tracked.
function Core:IsTrackingQuest(questId)
	for trackedQuestIndex = 1, 40 do
		local trackedQuestId = C_QuestLog.GetQuestIDForQuestWatchIndex(trackedQuestIndex)
		if trackedQuestId == nil then
			return false
		end
		
		if trackedQuestId == questId then
			return true
		end
	end
	
	return false
end

-- Returns the XP awarded for completing the specified quest.
function Core:GetQuestXpReward(questId)
	local xp, _ = GetQuestLogRewardXP(questId)
	if xp == nil then
		xp = 0
	end
	
	return xp
end

-- Returns whether or not the specified quest has a monetary reward.
function Core:QuestHasXpReward(questId)
	return Core:GetQuestXpReward(questId) > 0
end

-- Returns whether or not any of the specified quests have an XP reward.
function Core:AnyQuestsHaveXpReward(questIds)
	for _, questId in ipairs(questIds) do
		if Core:QuestHasXpReward(questId) then
			return true
		end
	end
	
	return false
end

-- Returns whether or not all of the specified quests have an XP reward.
function Core:AllQuestsHaveXpReward(questIds)
	for _, questId in ipairs(questIds) do
		if not Core:QuestHasXpReward(questId) then
			return false
		end
	end
	
	return true
end

-- Returns the total XP reward, combined from all individual quests, for the specified list of quest IDs.
function Core:GetTotalXpRewardOfQuests(questIds)
	local questLogXp = 0
	
	for _, questId in ipairs(questIds) do
		questLogXp = questLogXp + Core:GetQuestXpReward(questId)
	end
	
	return questLogXp
end

-- Returns the monetary reward, in whole copper pieces, for completing the specified quest.
function Core:GetQuestMonetaryRewardInWholeCopper(questId)
	local copper = GetQuestLogRewardMoney(questId)
	if copper == nil then
		copper = 0
	end
	
	return copper
end

-- Returns the monetary reward, in its exact copper value, for completing the specified quest.
function Core:GetQuestMonetaryRewardInExactCopper(questId)
	return Core:GetQuestMonetaryRewardInWholeCopper(questId)
end

-- Returns the monetary reward, in whole silver pieces, for completing the specified quest.
function Core:GetQuestMonetaryRewardInWholeSilver(questId)
	local copper = Core:GetQuestMonetaryRewardInWholeCopper(questId)
	return Utils:CopperToWholeSilver(copper)
end

-- Returns the monetary reward, in its exact silver value, for completing the specified quest.
function Core:GetQuestMonetaryRewardInExactSilver(questId)
	local copper = Core:GetQuestMonetaryRewardInWholeCopper(questId)
	return Utils:CopperToExactSilver(copper)
end

-- Returns the monetary reward, in whole gold pieces, for completing the specified quest.
function Core:GetQuestMonetaryRewardInWholeGold(questId)
	local copper = Core:GetQuestMonetaryRewardInWholeCopper(questId)
	return Utils:CopperToWholeGold(copper)
end

-- Returns the monetary reward, in its exact gold value, for completing the specified quest.
function Core:GetQuestMonetaryRewardInExactGold(questId)
	local copper = Core:GetQuestMonetaryRewardInWholeCopper(questId)
	return Utils:CopperToExactGold(copper)
end

-- Returns the number of gold, silver, and copper coins awarded for completing the specified quest.
function Core:GetQuestMonetaryReward(questId)
	local copper = Core:GetQuestMonetaryRewardInWholeCopper(questId)
	return Utils:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the monetary reward for completing the specified quest.
function Core:GetQuestMonetaryRewardString(questId, coinIconResolution)
	local copper = Core:GetQuestMonetaryRewardInWholeCopper(questId)
	return Utils:CopperToCoinString(copper, coinIconResolution)
end

-- Returns whether or not the specified quest has a monetary reward.
function Core:QuestHasMonetaryReward(questId)
	return Core:GetQuestMonetaryRewardInWholeCopper(questId) > 0
end

-- Returns whether or not any of the specified quests have a monetary reward.
function Core:AnyQuestsHaveMonetaryReward(questIds)
	for _, questId in ipairs(questIds) do
		if Core:QuestHasMonetaryReward(questId) then
			return true
		end
	end
	
	return false
end

-- Returns whether or not all of the specified quests have a monetary reward.
function Core:AllQuestsHaveMonetaryReward(questIds)
	for _, questId in ipairs(questIds) do
		if not Core:QuestHasMonetaryReward(questId) then
			return false
		end
	end
	
	return true
end

-- Returns the total monetary reward, in whole copper pieces, combined from all individual quests, for the specified list of quest IDs.
function Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	local questLogCopper = 0
	
	for _, questId in ipairs(questIds) do
		questLogCopper = questLogCopper + Core:GetQuestMonetaryRewardInExactCopper(questId)
	end
	
	return questLogCopper
end

-- Returns the total monetary reward, in its exact copper value, combined from all individual quests, for the specified list of quest IDs.
function Core:GetTotalMonetaryRewardOfQuestsInExactCopper(questIds)
	return Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
end

-- Returns the total monetary reward, in whole silver pieces, combined from all individual quests, for the specified list of quest IDs.
function Core:GetTotalMonetaryRewardOfQuestsInWholeSilver(questIds)
	local copper = Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Utils:CopperToWholeSilver(copper)
end

-- Returns the total monetary reward, in its exact silver value, combined from all individual quests, for the specified list of quest IDs.
function Core:GetTotalMonetaryRewardOfQuestsInExactSilver(questIds)
	local copper = Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Utils:CopperToExactSilver(copper)
end

-- Returns the total monetary reward, in whole gold pieces, combined from all individual quests, for the specified list of quest IDs.
function Core:GetTotalMonetaryRewardOfQuestsInWholeGold(questIds)
	local copper = Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Utils:CopperToWholeGold(copper)
end

-- Returns the total monetary reward, in its exact gold value, combined from all individual quests, for the specified list of quest IDs.
function Core:GetTotalMonetaryRewardOfQuestsInExactGold(questIds)
	local copper = Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Utils:CopperToExactGold(copper)
end

-- Returns the total number of gold, silver, and copper coins, combined from all individual quests, awarded for completing the specified list of quest IDs.
function Core:GetTotalMonetaryRewardOfQuests(questIds)
	local copper = Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Utils:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the total monetary reward, combined from all individual quests, for completing the specified list of quest IDs.
function Core:GetTotalMonetaryRewardStringOfQuests(questIds, coinIconResolution)
	local copper = Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Utils:CopperToCoinString(copper, coinIconResolution)
end

-- Returns all (real) turn-in-able quests within the current character's quest log.
function Core:GetTurnInAbleQuestsInQuestLog(trackedOnly)
	local quests = {}
	
	for i = 1, C_QuestLog.GetNumQuestLogEntries() do
		local quest = C_QuestLog.GetInfo(i)
		if Core:IsRealQuest(quest) and Core:CanTurnInQuest(quest.questID) and (not trackedOnly or Core:IsTrackingQuest(quest.questID)) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quest IDs of (real) turn-in-able quests within the current character's quest log.
function Core:GetTurnInAbleQuestIdsInQuestLog(trackedOnly)
	local questIds = {}
	
	for i = 1, C_QuestLog.GetNumQuestLogEntries() do
		local quest = C_QuestLog.GetInfo(i)
		if Core:IsRealQuest(quest) and Core:CanTurnInQuest(quest.questID) and (not trackedOnly or Core:IsTrackingQuest(quest.questID)) then
			table.insert(questIds, quest.questID)
		end
	end
	
	return questIds
end

-- Returns the total XP reward, combined from all individual quests, for the current character's turn-in-able quests.
function Core:GetQuestLogTurnInAbleXpReward(trackedOnly)
	return Core:GetTotalXpRewardOfQuests(Core:GetTurnInAbleQuestIdsInQuestLog(trackedOnly))
end

-- Returns whether or not the current character's turn-in-able quests have any XP rewards.
function Core:QuestLogHasTurnInAbleXpRewards(trackedOnly)
	return Core:GetQuestLogTurnInAbleXpReward(trackedOnly) > 0
end

-- Returns the total XP reward, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTotalXpReward(trackedOnly)
	return Core:GetTotalXpRewardOfQuests(Core:GetQuestIdsInQuestLog(trackedOnly))
end

-- Returns whether or not the current character's quest log has any XP rewards.
function Core:QuestLogHasXpRewards(trackedOnly)
	return Core:GetQuestLogTotalXpReward(trackedOnly) > 0
end

-- Returns the total monetary reward, in whole copper pieces, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(Core:GetTurnInAbleQuestIdsInQuestLog(trackedOnly))
end

-- Returns the total monetary reward, in its exact copper value, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTurnInAbleMonetaryRewardInExactCopper(trackedOnly)
	return Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
end

-- Returns the total monetary reward, in whole silver pieces, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTurnInAbleMonetaryRewardInWholeSilver(trackedOnly)
	local copper = Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToWholeSilver(copper)
end

-- Returns the total monetary reward, in its exact silver value, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTurnInAbleMonetaryRewardInExactSilver(trackedOnly)
	local copper = Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToExactSilver(copper)
end

-- Returns the total monetary reward, in whole gold pieces, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTurnInAbleMonetaryRewardInWholeGold(trackedOnly)
	local copper = Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToWholeGold(copper)
end

-- Returns the total monetary reward, in its exact gold value, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTurnInAbleMonetaryRewardInExactGold(trackedOnly)
	local copper = Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToExactGold(copper)
end

-- Returns the total number of gold, silver, and copper coins, combined from all individual quests, awarded for completing the current character's turn-in-able quests.
function Core:GetQuestLogTurnInAbleMonetaryReward(trackedOnly)
	local copper = Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the total monetary reward, combined from all individual quests, for completing the current character's turn-in-able quests.
function Core:GetQuestLogTurnInAbleMonetaryRewardString(coinIconResolution, trackedOnly)
	local copper = Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToCoinString(copper, coinIconResolution)
end

-- Returns whether or not the current character's turn-in-able quests have any monetary rewards.
function Core:QuestLogHasTurnInAbleMonetaryRewards(trackedOnly)
	return Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly) > 0
end

-- Returns the total monetary reward, in whole copper pieces, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Core:GetTotalMonetaryRewardOfQuestsInWholeCopper(Core:GetQuestIdsInQuestLog(trackedOnly))
end

-- Returns the total monetary reward, in its exact copper value, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTotalMonetaryRewardInExactCopper(trackedOnly)
	return Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
end

-- Returns the total monetary reward, in whole silver pieces, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTotalMonetaryRewardInWholeSilver(trackedOnly)
	local copper = Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToWholeSilver(copper)
end

-- Returns the total monetary reward, in its exact silver value, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTotalMonetaryRewardInExactSilver(trackedOnly)
	local copper = Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToExactSilver(copper)
end

-- Returns the total monetary reward, in whole gold pieces, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTotalMonetaryRewardInWholeGold(trackedOnly)
	local copper = Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToWholeGold(copper)
end

-- Returns the total monetary reward, in its exact gold value, combined from all individual quests, for the current character's quest log.
function Core:GetQuestLogTotalMonetaryRewardInExactGold(trackedOnly)
	local copper = Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToExactGold(copper)
end

-- Returns the total number of gold, silver, and copper coins, combined from all individual quests, awarded for completing the current character's quest log.
function Core:GetQuestLogTotalMonetaryReward(trackedOnly)
	local copper = Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the total monetary reward, combined from all individual quests, for completing the current character's quest log.
function Core:GetQuestLogTotalMonetaryRewardString(coinIconResolution, trackedOnly)
	local copper = Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Utils:CopperToCoinString(copper, coinIconResolution)
end

-- Returns whether or not the current character's quest log has any monetary rewards.
function Core:QuestLogHasMonetaryRewards(trackedOnly)
	return Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly) > 0
end

-----------------------------------------
-- API Hookup Functions: Levels and XP --
-----------------------------------------

-- Returns the current level of the current character.
function Core:GetCurrentLevel()
	return UnitLevel("player")
end

-- Returns the maximum possible level for the current character.
function Core:GetMaxLevel()
	return GetMaxPlayerLevel()
end

-- Returns whether or not the current character is at the maximum possible level.
function Core:IsMaxLevel()
	return Core:GetCurrentLevel() >= Core:GetMaxLevel()
end

-- Returns the amount of XP earned by the current character for their current level.
function Core:GetCurrentXp()
	if Core:IsMaxLevel() then
		return 0
	end
	
	return UnitXP("player")
end

-- Returns the total amount of XP needed by the current character at the current level to reach the next level.
function Core:GetNeededXp()
	if Core:IsMaxLevel() then
		return 0
	end
	
	return UnitXPMax("player")
end

function Core:GetNeededXpForLevel(level)
	return XpData.NeededLevelXps[level]
end

-- Returns the numerical proportion of XP earned by the current character for their current level.
function Core:GetCurrentXpFraction()
	return Utils:Fraction(Core:GetCurrentXp(), Core:GetNeededXp())
end

-- Returns the rounded percentage string of XP earned by the current character for their current level.
function Core:GetCurrentXpPercentageString(decimals)
	return Utils:PercentageString(Core:GetCurrentXp(), Core:GetNeededXp(), decimals)
end

-- Returns the difference between the earned XP and the needed XP for the current character's current level.
function Core:GetRemainingXp()
	return Core:GetNeededXp() - Core:GetCurrentXp()
end

-- Returns the numerical proportion of XP remaining for the current character for their current level.
function Core:GetRemainingXpFraction()
	return Utils:Fraction(Core:GetRemainingXp(), Core:GetNeededXp())
end

-- Returns the total XP earned by the current character across ALL levels.
function Core:GetLifetimeXp()
	local currentLevel = Core:GetCurrentLevel()
	local currentXp = Core:GetCurrentXp()
	
	local lifetimeXp = currentXp
	for completedLevel = 1, currentLevel - 1 do
		lifetimeXp = lifetimeXp + XpData.NeededLevelXps[completedLevel]
	end
	
	return lifetimeXp
end

-- Returns the total amount of XP needed by the current character - across ALL levels - to reach max level.
function Core:GetLifetimeXpNeeded()
	local lifetimeXpNeeded = 0
	for level = 1, Core:GetMaxLevel() do
		lifetimeXpNeeded = lifetimeXpNeeded + XpData.NeededLevelXps[level]
	end
	
	return lifetimeXpNeeded
end

-- Returns the numerical proportion of total XP earned by the current character for all levels.
function Core:GetLifetimeXpFraction()
	return Utils:Fraction(Core:GetLifetimeXp(), Core:GetLifetimeXpNeeded())
end

-- Returns the rounded percentage string of total XP earned by the current character for all levels.
function Core:GetLifetimeXpPercentageString(decimals)
	return Utils:PercentageString(Core:GetLifetimeXp(), Core:GetLifetimeXpNeeded(), decimals)
end

-- Returns the rounded percentage string of XP remaining for the current character for their current level.
function Core:GetRemainingXpPercentageString(decimals)
	return Utils:PercentageString(Core:GetRemainingXp(), Core:GetNeededXp(), decimals)
end

-- Returns the numerical proportion of the provided XP against the earned XP of the current character for their current level.
function Core:GetProportionOfCurrentXpAsFraction(xp)
	return Utils:Fraction(xp, Core:GetCurrentXp())
end

-- Returns the rounded percentage string of the provided XP against the earned XP of the current character for their current level.
function Core:GetProportionOfCurrentXpAsPercentageString(xp, decimals)
	return Utils:PercentageString(xp, Core:GetCurrentXp(), decimals)
end

-- Returns the numerical proportion of the provided XP against the amount of XP needed by the current character for their current level.
function Core:GetProportionOfNeededXpAsFraction(xp)
	return Utils:Fraction(xp, Core:GetNeededXp())
end

-- Returns the rounded percentage string of the provided XP against the amount of XP needed by the current character for their current level.
function Core:GetProportionOfNeededXpAsPercentageString(xp, decimals)
	return Utils:PercentageString(xp, Core:GetNeededXp(), decimals)
end

-- Returns the numerical proportion of the provided XP against the amount of XP remaining for the current character for their current level.
function Core:GetProportionOfRemainingXpAsFraction(xp)
	return Utils:Fraction(xp, Core:GetRemainingXp())
end

-- Returns the rounded percentage string of the provided XP against the amount of XP remaining for the current character for their current level.
function Core:GetProportionOfRemainingXpAsPercentageString(xp, decimals)
	return Utils:PercentageString(xp, Core:GetRemainingXp(), decimals)
end

-- Returns whether or not the current character is currently resting.
function Core:IsResting()
	return IsResting()
end

-- Returns the amount of rested XP the current character has accumulated.
function Core:GetRestedXp()
	local restedXp = GetXPExhaustion()
	if restedXp == nil then
		return 0
	end
	
	return restedXp
end

-- Returns whether or not the current character has any accumulated rested XP.
function Core:HasRestedXp()
	return Core:GetRestedXp() > 0
end

-- Returns the current character's current XP multiplier, determined by if they are rested or not.
function Core:GetXpMultiplier()
	local id, localizedName, multiplier = GetRestState()
	
	return multiplier
end


----------------------
-- Profession Utils --
----------------------

-- Returns the indexes of all professions for the current player.
function Core:GetLearnedProfessionIndexes()
	local firstIndex, secondIndex, firstAidIndex, fishingIndex, cookingIndex = GetProfessions()
	return firstIndex, secondIndex, fishingIndex, cookingIndex, firstAidIndex
end

-- Returns the index of the "first" profession for the current player.
function Core:GetFirstProfessionIndex()
	local firstId, secondId, fishingId, cookingId, firstAidId = Core:GetLearnedProfessionIndexes()
	return firstId
end

-- Returns the index of the "second" profession for the current player.
function Core:GetSecondProfessionIndex()
	local firstId, secondId, fishingId, cookingId, firstAidId = Core:GetLearnedProfessionIndexes()
	return secondId
end

-- Returns the index of the fishing profession for the current player.
function Core:GetFishingProfessionIndex()
	local firstId, secondId, fishingId, cookingId, firstAidId = Core:GetLearnedProfessionIndexes()
	return fishingId
end

-- Returns the index of the cooking profession for the current player.
function Core:GetCookingProfessionIndex()
	local firstId, secondId, fishingId, cookingId, firstAidId = Core:GetLearnedProfessionIndexes()
	return cookingId
end

-- Returns the index of the first aid profession for the current player.
function Core:GetFirstAidProfessionIndex()
	local firstId, secondId, fishingId, cookingId, firstAidId = Core:GetLearnedProfessionIndexes()
	return firstAidId
end

-- Returns whether or not the "first" profession has been learned by the current player.
function Core:IsFirstProfessionLearned()
	return Core:GetFirstProfessionIndex() ~= nil
end

-- Returns whether or not the "second" profession has been learned by the current player.
function Core:IsSecondProfessionLearned()
	return Core:GetSecondProfessionIndex() ~= nil
end

-- Returns whether or not the fishing profession has been learned by the current player.
function Core:IsFishingProfessionLearned()
	return Core:GetFishingProfessionIndex() ~= nil
end

-- Returns whether or not the cooking profession has been learned by the current player.
function Core:IsCookingProfessionLearned()
	return Core:GetCookingProfessionIndex() ~= nil
end

-- Returns whether or not the first aid profession has been learned by the current player.
function Core:IsFirstAidProfessionLearned()
	return Core:GetFirstAidProfessionIndex() ~= nil
end

-- Returns the name, icon ID, current skill, and (dependent on learned rank) current max skill of the profession at the specified index for the current player.
function Core:GetProfessionInfo(professionIndex)
	if not professionIndex then
		return nil, nil, nil, nil
	end
	
	local name, iconId, currentSkill, maxSkill = GetProfessionInfo(professionIndex)
	return name, icon, currentSkill, maxSkill
end

-- Returns the name of the profession at the specified index for the current player.
function Core:GetProfessionName(professionIndex)
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(professionIndex)
	return name
end

-- Returns the icon ID of the profession at the specified index for the current player.
function Core:GetProfessionIconId(professionIndex)
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(professionIndex)
	return iconId
end

-- Returns the current skill of the profession at the specified index for the current player.
function Core:GetProfessionCurrentSkill(professionIndex)
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(professionIndex)
	return currentSkill
end

-- Returns the (dependent on learned rank) current max skill of the profession at the specified index for the current player.
function Core:GetProfessionMaxSkill(professionIndex)
	if not professionIndex then
		-- XXX: This hardcoded value probably does not matter
		return 300
	end
	
	local name, iconId, currentSkill, maxSkill = GetProfessionInfo(professionIndex)
	return maxSkill
end

-- Returns the name of the "first" profession for the current player.
function Core:GetFirstProfessionName()
	if not Core:IsFirstProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFirstProfessionIndex())
	return name
end

-- Returns the icon ID of the "first" profession for the current player.
function Core:GetFirstProfessionIconId()
	if not Core:IsFirstProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFirstProfessionIndex())
	return iconId
end

-- Returns the current skill of the "first" profession for the current player.
function Core:GetFirstProfessionCurrentSkill()
	if not Core:IsFirstProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFirstProfessionIndex())
	return currentSkill
end

-- Returns the (dependent on learned rank) current max skill of the "first" profession for the current player.
function Core:GetFirstProfessionMaxSkill()
	if not Core:IsFirstProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFirstProfessionIndex())
	return maxSkill
end

-- Returns the name of the "second" profession for the current player.
function Core:GetSecondProfessionName()
	if not Core:IsSecondProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetSecondProfessionIndex())
	return name
end

-- Returns the icon ID of the "second" profession for the current player.
function Core:GetSecondProfessionIconId()
	if not Core:IsSecondProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetSecondProfessionIndex())
	return iconId
end

-- Returns the current skill of the "second" profession for the current player.
function Core:GetSecondProfessionCurrentSkill()
	if not Core:IsSecondProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetSecondProfessionIndex())
	return currentSkill
end

-- Returns the (dependent on learned rank) current max skill of the "second" profession for the current player.
function Core:GetSecondProfessionMaxSkill()
	if not Core:IsSecondProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetSecondProfessionIndex())
	return maxSkill
end

-- Returns the name of the fishing profession for the current player.
function Core:GetFishingProfessionName()
	if not Core:IsFishingProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFishingProfessionIndex())
	return name
end

-- Returns the icon ID of the fishing profession for the current player.
function Core:GetFishingProfessionIconId()
	if not Core:IsFishingProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFishingProfessionIndex())
	return iconId
end

-- Returns the current skill of the fishing profession for the current player.
function Core:GetFishingProfessionCurrentSkill()
	if not Core:IsFishingProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFishingProfessionIndex())
	return currentSkill
end

-- Returns the (dependent on learned rank) current max skill of the fishing profession for the current player.
function Core:GetFishingProfessionMaxSkill()
	if not Core:IsFishingProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFishingProfessionIndex())
	return maxSkill
end

-- Returns the name of the cooking profession for the current player.
function Core:GetCookingProfessionName()
	if not Core:IsCookingProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetCookingProfessionIndex())
	return name
end

-- Returns the icon ID of the cooking profession for the current player.
function Core:GetCookingProfessionIconId()
	if not Core:IsCookingProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetCookingProfessionIndex())
	return iconId
end

-- Returns the current skill of the cooking profession for the current player.
function Core:GetCookingProfessionCurrentSkill()
	if not Core:IsCookingProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetCookingProfessionIndex())
	return currentSkill
end

-- Returns the (dependent on learned rank) current max skill of the cooking profession for the current player.
function Core:GetCookingProfessionMaxSkill()
	if not Core:IsCookingProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetCookingProfessionIndex())
	return maxSkill
end

-- Returns the name of the first aid profession for the current player.
function Core:GetFirstAidProfessionName()
	if not Core:IsFirstAidProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFirstAidProfessionIndex())
	return name
end

-- Returns the icon ID of the first aid profession for the current player.
function Core:GetFirstAidProfessionIconId()
	if not Core:IsFirstAidProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFirstAidProfessionIndex())
	return iconId
end

-- Returns the current skill of the first aid profession for the current player.
function Core:GetFirstAidProfessionCurrentSkill()
	if not Core:IsFirstAidProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFirstAidProfessionIndex())
	return currentSkill
end

-- Returns the (dependent on learned rank) current max skill of the first aid profession for the current player.
function Core:GetFirstAidProfessionMaxSkill()
	if not Core:IsFirstAidProfessionLearned() then
		return nil
	end
	
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(Core:GetFirstAidProfessionIndex())
	return maxSkill
end

----------------------------
-- Zone and Dungeon Utils --
----------------------------

-- Returns information for all zones.
function Core:GetAllZones(includeCities)
	local zones = {}
	for _, zone in ipairs(ZoneData.Zones) do
		if includeCities or not zone.IsCity then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns information for all zones pertinent to the provided faction.
function Core:GetAllZonesForFaction(faction, includeCities)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local zones = {}
	for _, zone in ipairs(Core:GetAllZones(includeCities)) do
		if zone.Territory == faction or zone.Territory == "Contested" or zone.Territory == "Sanctuary" then
			table.insert(zones, zone)
		elseif #Core:GetZoneQuestsForFaction(zone, faction) > 0 then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns information for zones appropriate for the provided level.
function Core:GetZones(level, includeCities)
	if not level then
		level = Core:GetCurrentLevel()
	end
	
	local zones = {}
	for _, zone in ipairs(Core:GetAllZones(includeCities)) do
		if zone.MinLevel <= level and level <= zone.MaxLevel then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns information for zones appropriate for the provided level, pertinent to the provided faction.
function Core:GetZonesForFaction(faction, level, includeCities)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local zones = {}
	for _, zone in ipairs(Core:GetZones(level, includeCities)) do
		if zone.Territory == faction or zone.Territory == "Contested" or zone.Territory == "Sanctuary" then
			table.insert(zones, zone)
		elseif #Core:GetZoneQuestsForFaction(zone, faction) > 0 then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns all quests associated with the provided zone.
function Core:GetZoneQuests(zone)
	local quests = {}
	for _, questId in ipairs(zone.Quests) do
		local quest = QuestData.Quests[questId]
		if quest then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quests associated with the provided zone.
function Core:GetZoneQuestsForFaction(zone, faction)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local quests = {}
	for _, questId in ipairs(zone.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and (not quest.FactionRestriction or quest.FactionRestriction == faction) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns information for zones appropriate for provided level, for which incomplete quests exist.
function Core:GetIncompleteZones(level, includeCities)
	if not level then
		level = Core:GetCurrentLevel()
	end
	
	local zones = {}
	for _, zone in ipairs(Core:GetAllZones(includeCities)) do
		if zone.MinLevel <= level and level <= zone.MaxLevel and #Core:GetIncompleteZoneQuests(zone) > 0 then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns information for zones appropriate for provided level, pertinent to the provided faction, and for which incomplete quests exist.
function Core:GetIncompleteZonesForFaction(faction, level, includeCities)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local zones = {}
	for _, zone in ipairs(Core:GetIncompleteZones(level, includeCities)) do
		if zone.Territory == faction or zone.Territory == "Contested" or zone.Territory == "Sanctuary" then
			table.insert(zones, zone)
		elseif #Core:GetIncompleteZoneQuestsForFaction(zone, faction) > 0 then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns all quests associated with the provided zone.
function Core:GetIncompleteZoneQuests(zone, includeLinked)
	local quests = {}
	for _, questId in ipairs(zone.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and not Core:HasCompletedQuest(quest.ID, includeLinked) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quests associated with the provided zone.
function Core:GetIncompleteZoneQuestsForFaction(zone, faction, includeLinked)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local quests = {}
	for _, questId in ipairs(zone.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and (not quest.FactionRestriction or quest.FactionRestriction == faction) and not Core:HasCompletedQuest(quest.ID, includeLinked) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns the zone that the provided dungeon is located in.
function Core:GetDungeonZone(dungeon)
	for _, zone in ipairs(Core:GetAllZones(true)) do
		if zone["Name"] == dungeon["Zone"] then
			return zone
		end
	end
	
	return nil
end

-- Returns information for all dungeons.
function Core:GetAllDungeons()
	return DungeonData.Dungeons
end

-- Returns information for all dungeons pertinent to the provided faction.
function Core:GetAllDungeonsForFaction(faction)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Core:GetAllDungeons()) do
		local dungeonZone = Core:GetDungeonZone(dungeon)
		if not dungeonZone.IsCity or dungeonZone.Territory == faction then
			table.insert(dungeons, dungeon)
		elseif #Core:GetDungeonQuestsForFaction(dungeon, faction) > 0 or #Core:GetDungeonMidQuestsForFaction(dungeon, faction) > 0 then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

-- Returns information for dungeons appropriate for the provided level.
function Core:GetDungeons(level)
	if not level then
		level = Core:GetCurrentLevel()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Core:GetAllDungeons()) do
		if dungeon["MinLevel"] <= level and level <= dungeon["MaxLevel"] then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

-- Returns information for dungeons appropriate for the provided level, pertinent to the provided faction.
function Core:GetDungeonsForFaction(level, faction)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	if not level then
		level = Core:GetCurrentLevel()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Core:GetDungeons(level)) do
		local dungeonZone = Core:GetDungeonZone(dungeon)
		if not dungeonZone.IsCity or dungeonZone.Territory == faction then
			table.insert(dungeons, dungeon)
		elseif #Core:GetDungeonQuestsForFaction(dungeon, faction) > 0 or #Core:GetDungeonMidQuestsForFaction(dungeon, faction) > 0 then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

-- Recursively searches for all prequests of the provided quest, adding them into the provided table if/as found.
function Core:AddAllPreQuestsRecursively(quest, preQuests)
	for _, preQuestId in ipairs(quest.PrereqQuests) do
		local preQuest = QuestData.Quests[preQuestId]
		if preQuest and (not preQuest.FactionRestriction or preQuest.FactionRestriction == Core:GetFactionDataString()) then
			table.insert(preQuests, preQuest)
			Core:AddAllPreQuestsRecursively(preQuest, preQuests)
		end
	end
end

-- Returns all "pre-quests", or quests that unlock dungeon quests, for the provided dungeon.
function Core:GetDungeonPreQuests(dungeon)
	local preQuests = {}
	for _, questId in pairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest then
			Core:AddAllPreQuestsRecursively(quest, preQuests)
		end
	end
	
	-- De-duplicate the list; quests can have shared prerequisites
	local deDupedPreQuests = {}
	for _, preQuest in ipairs(preQuests) do
		local alreadyHavePreQuest = false
		for _, deDupedPreQuest in ipairs(deDupedPreQuests) do
			if preQuest.ID == deDupedPreQuest.ID then
				alreadyHavePreQuest = true
			end
		end
		
		if not alreadyHavePreQuest then
			table.insert(deDupedPreQuests, preQuest)
		end
	end
	
	return deDupedPreQuests
end

function Core:GetDungeonPreQuestsForFaction(dungeon, faction)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local preQuests = {}
	for _, questId in pairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and (not quest.FactionRestriction or quest.FactionRestriction == faction) then
			Core:AddAllPreQuestsRecursively(quest, preQuests)
		end
	end
	
	-- De-duplicate the list; quests can have shared prerequisites
	local deDupedPreQuests = {}
	for _, preQuest in ipairs(preQuests) do
		local alreadyHavePreQuest = false
		for _, deDupedPreQuest in ipairs(deDupedPreQuests) do
			if preQuest.ID == deDupedPreQuest.ID then
				alreadyHavePreQuest = true
			end
		end
		
		if not alreadyHavePreQuest then
			table.insert(deDupedPreQuests, preQuest)
		end
	end
	
	return deDupedPreQuests
end

-- Returns all quests associated with the provided dungeon.
function Core:GetDungeonQuests(dungeon)
	local quests = {}
	for _, questId in ipairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

function Core:GetDungeonQuestsForFaction(dungeon, faction)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local quests = {}
	for _, questId in ipairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and (not quest.FactionRestriction or quest.FactionRestriction == faction) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quests found at or within the provided dungeon.
function Core:GetDungeonMidQuests(dungeon)
	local midQuests = {}
	for _, midQuestId in ipairs(dungeon.MidQuests) do
		local midQuest = QuestData.Quests[midQuestId]
		if midQuest then
			table.insert(midQuests, midQuest)
		end
	end
	
	return midQuests
end

function Core:GetDungeonMidQuestsForFaction(dungeon, faction)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local midQuests = {}
	for _, midQuestId in ipairs(dungeon.MidQuests) do
		local midQuest = QuestData.Quests[midQuestId]
		if midQuest and (not midQuest.FactionRestriction or midQuest.FactionRestriction == faction) then
			table.insert(midQuests, midQuest)
		end
	end
	
	return midQuests
end

function Core:GetIncompleteDungeons(level)
	if not level then
		level = Core:GetCurrentLevel()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Core:GetAllDungeons()) do
		if dungeon["MinLevel"] <= level and level <= dungeon["MaxLevel"] and #Core:GetIncompleteDungeonQuests(dungeon) > 0 then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

function Core:GetIncompleteDungeonsForFaction(level, faction)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	if not level then
		level = Core:GetCurrentLevel()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Core:GetIncompleteDungeons(level)) do
		local dungeonZone = Core:GetDungeonZone(dungeon)
		if not dungeonZone.IsCity or dungeonZone.Territory == faction then
			table.insert(dungeons, dungeon)
		elseif #Core:GetIncompleteDungeonQuestsForFaction(dungeon, faction) > 0 or #Core:GetDungeonMidQuestsForFaction(dungeon, faction) > 0 then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

function Core:GetIncompleteDungeonQuests(dungeon, includeLinked)
	local quests = {}
	for _, questId in ipairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and not Core:HasCompletedQuest(quest.ID, includeLinked) then
			table.insert(quests, quest)
		end
	end
	for _, midQuestId in ipairs(dungeon.MidQuests) do
		local midQuest = QuestData.Quests[midQuestId]
		if midQuestand and not Core:HasCompletedQuest(midQuest.ID, includeLinked) then
			table.insert(quests, midQuest)
		end
	end
	
	return quests
end

function Core:GetIncompleteDungeonQuestsForFaction(dungeon, faction, includeLinked)
	if not faction then
		faction = Core:GetFactionDataString()
	end
	
	local quests = {}
	for _, questId in ipairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and (not quest.FactionRestriction or quest.FactionRestriction == faction) and not Core:HasCompletedQuest(quest.ID, includeLinked) then
			table.insert(quests, quest)
		end
	end
	for _, midQuestId in ipairs(dungeon.MidQuests) do
		local midQuest = QuestData.Quests[midQuestId]
		if midQuest and (not midQuest.FactionRestriction or midQuest.FactionRestriction == faction) and not Core:HasCompletedQuest(midQuest.ID, includeLinked) then
			table.insert(quests, midQuest)
		end
	end
	
	return quests
end
