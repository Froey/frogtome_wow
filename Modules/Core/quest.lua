local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Quest = {}

local API = Frogtome.Core.API
local Context = Frogtome.Version.Context
local Quest = Frogtome.Core.Quest
local QuestData = Frogtome.Data.QuestData

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

Quest.CONTEXT_MODULE = "Frogtome.Core.Quest"

-------------------------
-- Core Data Functions --
-------------------------

function Quest:IsRealQuest(quest)
	-- Basically, this needs to be a tangible quest visible to the player
	return quest ~= nil and not quest.isHeader and not quest.isHidden
end

Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"IsDungeonQuest",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetQuestType" }
)
function Quest:IsDungeonQuest(quest)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "IsDungeonQuest") then
		return false
	end
	
	-- IN THEORY(??), a type of 81 here signifies a dungeon quest.
	local questTypeId = API.GetQuestType(quest.questID)
	return questTypeId and questTypeId == 81
end

-- Returns whether or not the current character has completed the necessary prerequisites for the quest.
function Quest:HasCompletedPrereqQuestsForQuest(quest, includeLinked)
	local quest = QuestData.Quests[questId]
	if quest then
		for _, prereqQuestId in ipairs(quest.PrereqQuests) do
			if not Quest:HasCompletedQuest(prereqQuestId, includeLinked) then
				return false
			end
		end
	end
	
	return true
end

-- Returns whether or not the current character has completed the provided quest.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"HasCompletedQuest",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "IsQuestCompletedForCharacter" }
)
function Quest:HasCompletedQuest(questId, includeLinked)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "HasCompletedQuest") then
		return false
	end
	
	if API.IsQuestCompletedForCharacter(questId) then
		return true
	end
	
	-- Check linked quests
	if includeLinked and QuestData.Quests[questId] then
		for _, linkedQuestId in ipairs(QuestData.Quests[questId].LinkedQuests) do
			if Quest:HasCompletedQuest(linkedQuestId, false) then
				return true
			end
		end
	end
	
	return false
end

-- Returns whether or not the current character has completed any of the provided quests.
function Quest:HasCompletedAnyQuests(questIds)
	for _, questId in ipairs(questIds) do
		if Quest:HasCompletedQuest(questId) then
			return true
		end
	end
	
	return false
end

-- Returns whether or not the current character has completed all of the provided quests.
function Quest:HasCompletedAllQuests(questIds)
	for _, questId in ipairs(questIds) do
		if not Quest:HasCompletedQuest(questId) then
			return false
		end
	end
	
	return true
end

-------------------------------------
-- API Hookup Functions: Quest Log --
-------------------------------------

-- Returns all (real) quests within the current character's quest log.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetQuestsInQuestLog",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterQuestLogSize", "GetQuestInfoFromCharacterQuestLog" }
)
function Quest:GetQuestsInQuestLog(trackedOnly)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetQuestsInQuestLog") then
		return {}
	end
	
	local quests = {}
	
	for i = 1, API.GetCharacterQuestLogSize() do
		local quest = API.GetQuestInfoFromCharacterQuestLog(i)
		if Quest:IsRealQuest(quest) and (not trackedOnly or Quest:IsTrackingQuest(quest.questID)) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quest IDs of (real) quests within the current character's quest log.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetQuestIdsInQuestLog",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterQuestLogSize", "GetQuestInfoFromCharacterQuestLog" }
)
function Quest:GetQuestIdsInQuestLog(trackedOnly)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetQuestIdsInQuestLog") then
		return {}
	end
	
	local questIds = {}
	
	for i = 1, API.GetCharacterQuestLogSize() do
		local quest = API.GetQuestInfoFromCharacterQuestLog(i)
		if Quest:IsRealQuest(quest) and (not trackedOnly or Quest:IsTrackingQuest(quest.questID)) then
			table.insert(questIds, quest.questID)
		end
	end
	
	return questIds
end

-- Returns all (real) dungeon quests within the current character's quest log.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetDungeonQuestsInQuestLog",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterQuestLogSize", "GetQuestInfoFromCharacterQuestLog" }
)
function Quest:GetDungeonQuestsInQuestLog(trackedOnly)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetDungeonQuestsInQuestLog") then
		return {}
	end
	
	local quests = {}
	
	for i = 1, API.GetCharacterQuestLogSize() do
		local quest = API.GetQuestInfoFromCharacterQuestLog(i)
		if Quest:IsRealQuest(quest) and Quest:IsDungeonQuest(quest) and (not trackedOnly or Quest:IsTrackingQuest(quest.questID)) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quest IDs of (real) dungeon quests within the current character's quest log.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetDungeonQuestIdsInQuestLog",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterQuestLogSize", "GetQuestInfoFromCharacterQuestLog" }
)
function Quest:GetDungeonQuestIdsInQuestLog(trackedOnly)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetDungeonQuestIdsInQuestLog") then
		return {}
	end
	
	local questIds = {}
	
	for i = 1, API.GetCharacterQuestLogSize() do
		local quest = API.GetQuestInfoFromCharacterQuestLog(i)
		if Quest:IsRealQuest(quest) and Quest:IsDungeonQuest(quest) and (not trackedOnly or Quest:IsTrackingQuest(quest.questID)) then
			table.insert(questIds, quest.questID)
		end
	end
	
	return questIds
end

-- Returns the number of quests within the current character's quest log.
function Quest:GetQuestCount(trackedOnly)
	return #Quest:GetQuestsInQuestLog(trackedOnly)
end

-- Returns whether or not the current character's quest log has any quests.
function Quest:IsOnAnyQuest(trackedOnly)
	return Quest:GetQuestCount(trackedOnly) > 0
end

-- Returns whether or not the provided quest is in the current character's quest log.
function Quest:IsOnQuest(questId, includeLinked)
	for _, quest in ipairs(Quest:GetQuestsInQuestLog()) do
		if quest.questID == questId then
			return true
		end
	end
	
	-- Check linked quests
	if includeLinked and QuestData.Quest[questId] then
		for _, linkedQuestId in ipairs(QuestData.Quests[questId].LinkedQuests) do
			if Quest:IsOnQuest(linkedQuestId, false) then
				return true
			end
		end
	end
	
	return false
end

-- Returns whether or not the provided quest, necessarily in the current character's quest log, is complete and can be turned in.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"CanTurnInQuest",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "IsQuestReadyForTurnInForCharacter" }
)
function Quest:CanTurnInQuest(questId, includeLinked)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "CanTurnInQuest") then
		return false
	end
	
	if not Quest:IsOnQuest(questId, includeLinked) then
		return false
	end
	
	if API.IsQuestReadyForTurnInForCharacter(questId) then
		return true
	end
	
	-- Check linked quests
	if includeLinked and QuestData.Quests[questId] then
		for _, linkedQuestId in ipairs(QuestData.Quests[questId].LinkedQuests) do
			if API.IsQuestReadyForTurnInForCharacter(linkedQuestId) then
				return true
			end
		end
	end
	
	return false
end

-- Returns whether or not the provided quest is in the current character's quest log AND is actively being tracked.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"IsTrackingQuest",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetQuestIdAtCharacterWatchIndex" }
)
function Quest:IsTrackingQuest(questId)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "IsTrackingQuest") then
		return false
	end
	
	for trackedQuestIndex = 1, 40 do
		local trackedQuestId = API.GetQuestIdAtCharacterWatchIndex(trackedQuestIndex)
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
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetQuestXpReward",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetQuestXp" }
)
function Quest:GetQuestXpReward(questId)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetQuestXpReward") then
		return 0
	end
	
	local xp = API.GetQuestXp(questId)
	if xp == nil then
		xp = 0
	end
	
	return xp
end

-- Returns whether or not the specified quest has a monetary reward.
function Quest:QuestHasXpReward(questId)
	return Quest:GetQuestXpReward(questId) > 0
end

-- Returns whether or not any of the specified quests have an XP reward.
function Quest:AnyQuestsHaveXpReward(questIds)
	for _, questId in ipairs(questIds) do
		if Quest:QuestHasXpReward(questId) then
			return true
		end
	end
	
	return false
end

-- Returns whether or not all of the specified quests have an XP reward.
function Quest:AllQuestsHaveXpReward(questIds)
	for _, questId in ipairs(questIds) do
		if not Quest:QuestHasXpReward(questId) then
			return false
		end
	end
	
	return true
end

-- Returns the total XP reward, combined from all individual quests, for the specified list of quest IDs.
function Quest:GetTotalXpRewardOfQuests(questIds)
	local questLogXp = 0
	
	for _, questId in ipairs(questIds) do
		questLogXp = questLogXp + Quest:GetQuestXpReward(questId)
	end
	
	return questLogXp
end

-- Returns the monetary reward, in whole copper pieces, for completing the specified quest.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetQuestMonetaryRewardInWholeCopper",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetQuestMoneyInCopper" }
)
function Quest:GetQuestMonetaryRewardInWholeCopper(questId)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetQuestMonetaryRewardInWholeCopper") then
		return 0
	end
	
	local copper = API.GetQuestMoneyInCopper(questId)
	if copper == nil then
		copper = 0
	end
	
	return copper
end

-- Returns the monetary reward, in its exact copper value, for completing the specified quest.
function Quest:GetQuestMonetaryRewardInExactCopper(questId)
	return Quest:GetQuestMonetaryRewardInWholeCopper(questId)
end

-- Returns the monetary reward, in whole silver pieces, for completing the specified quest.
function Quest:GetQuestMonetaryRewardInWholeSilver(questId)
	local copper = Quest:GetQuestMonetaryRewardInWholeCopper(questId)
	return Money:CopperToWholeSilver(copper)
end

-- Returns the monetary reward, in its exact silver value, for completing the specified quest.
function Quest:GetQuestMonetaryRewardInExactSilver(questId)
	local copper = Quest:GetQuestMonetaryRewardInWholeCopper(questId)
	return Money:CopperToExactSilver(copper)
end

-- Returns the monetary reward, in whole gold pieces, for completing the specified quest.
function Quest:GetQuestMonetaryRewardInWholeGold(questId)
	local copper = Quest:GetQuestMonetaryRewardInWholeCopper(questId)
	return Money:CopperToWholeGold(copper)
end

-- Returns the monetary reward, in its exact gold value, for completing the specified quest.
function Quest:GetQuestMonetaryRewardInExactGold(questId)
	local copper = Quest:GetQuestMonetaryRewardInWholeCopper(questId)
	return Money:CopperToExactGold(copper)
end

-- Returns the number of gold, silver, and copper coins awarded for completing the specified quest.
function Quest:GetQuestMonetaryReward(questId)
	local copper = Quest:GetQuestMonetaryRewardInWholeCopper(questId)
	return Money:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the monetary reward for completing the specified quest.
function Quest:GetQuestMonetaryRewardString(questId, coinIconResolution)
	local copper = Quest:GetQuestMonetaryRewardInWholeCopper(questId)
	return Money:CopperToCoinString(copper, coinIconResolution)
end

-- Returns whether or not the specified quest has a monetary reward.
function Quest:QuestHasMonetaryReward(questId)
	return Quest:GetQuestMonetaryRewardInWholeCopper(questId) > 0
end

-- Returns whether or not any of the specified quests have a monetary reward.
function Quest:AnyQuestsHaveMonetaryReward(questIds)
	for _, questId in ipairs(questIds) do
		if Quest:QuestHasMonetaryReward(questId) then
			return true
		end
	end
	
	return false
end

-- Returns whether or not all of the specified quests have a monetary reward.
function Quest:AllQuestsHaveMonetaryReward(questIds)
	for _, questId in ipairs(questIds) do
		if not Quest:QuestHasMonetaryReward(questId) then
			return false
		end
	end
	
	return true
end

-- Returns the total monetary reward, in whole copper pieces, combined from all individual quests, for the specified list of quest IDs.
function Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	local questLogCopper = 0
	
	for _, questId in ipairs(questIds) do
		questLogCopper = questLogCopper + Quest:GetQuestMonetaryRewardInExactCopper(questId)
	end
	
	return questLogCopper
end

-- Returns the total monetary reward, in its exact copper value, combined from all individual quests, for the specified list of quest IDs.
function Quest:GetTotalMonetaryRewardOfQuestsInExactCopper(questIds)
	return Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
end

-- Returns the total monetary reward, in whole silver pieces, combined from all individual quests, for the specified list of quest IDs.
function Quest:GetTotalMonetaryRewardOfQuestsInWholeSilver(questIds)
	local copper = Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Money:CopperToWholeSilver(copper)
end

-- Returns the total monetary reward, in its exact silver value, combined from all individual quests, for the specified list of quest IDs.
function Quest:GetTotalMonetaryRewardOfQuestsInExactSilver(questIds)
	local copper = Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Money:CopperToExactSilver(copper)
end

-- Returns the total monetary reward, in whole gold pieces, combined from all individual quests, for the specified list of quest IDs.
function Quest:GetTotalMonetaryRewardOfQuestsInWholeGold(questIds)
	local copper = Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Money:CopperToWholeGold(copper)
end

-- Returns the total monetary reward, in its exact gold value, combined from all individual quests, for the specified list of quest IDs.
function Quest:GetTotalMonetaryRewardOfQuestsInExactGold(questIds)
	local copper = Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Money:CopperToExactGold(copper)
end

-- Returns the total number of gold, silver, and copper coins, combined from all individual quests, awarded for completing the specified list of quest IDs.
function Quest:GetTotalMonetaryRewardOfQuests(questIds)
	local copper = Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Money:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the total monetary reward, combined from all individual quests, for completing the specified list of quest IDs.
function Quest:GetTotalMonetaryRewardStringOfQuests(questIds, coinIconResolution)
	local copper = Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(questIds)
	return Money:CopperToCoinString(copper, coinIconResolution)
end

-- Returns all (real) turn-in-able quests within the current character's quest log.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetTurnInAbleQuestsInQuestLog",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterQuestLogSize", "GetQuestInfoFromCharacterQuestLog" }
)
function Quest:GetTurnInAbleQuestsInQuestLog(trackedOnly)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetTurnInAbleQuestsInQuestLog") then
		return 0
	end
	
	local quests = {}
	
	for i = 1, API.GetCharacterQuestLogSize() do
		local quest = API.GetQuestInfoFromCharacterQuestLog(i)
		if Quest:IsRealQuest(quest) and Quest:CanTurnInQuest(quest.questID) and (not trackedOnly or Quest:IsTrackingQuest(quest.questID)) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quest IDs of (real) turn-in-able quests within the current character's quest log.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetTurnInAbleQuestIdsInQuestLog",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterQuestLogSize", "GetQuestInfoFromCharacterQuestLog" }
)
function Quest:GetTurnInAbleQuestIdsInQuestLog(trackedOnly)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetTurnInAbleQuestIdsInQuestLog") then
		return 0
	end
	
	local questIds = {}
	
	for i = 1, API.GetCharacterQuestLogSize() do
		local quest = API.GetQuestInfoFromCharacterQuestLog(i)
		if Quest:IsRealQuest(quest) and Quest:CanTurnInQuest(quest.questID) and (not trackedOnly or Quest:IsTrackingQuest(quest.questID)) then
			table.insert(questIds, quest.questID)
		end
	end
	
	return questIds
end

-- Returns the total XP reward, combined from all individual quests, for the current character's turn-in-able quests.
function Quest:GetQuestLogTurnInAbleXpReward(trackedOnly)
	return Quest:GetTotalXpRewardOfQuests(Quest:GetTurnInAbleQuestIdsInQuestLog(trackedOnly))
end

-- Returns whether or not the current character's turn-in-able quests have any XP rewards.
function Quest:QuestLogHasTurnInAbleXpRewards(trackedOnly)
	return Quest:GetQuestLogTurnInAbleXpReward(trackedOnly) > 0
end

-- Returns the total XP reward, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTotalXpReward(trackedOnly)
	return Quest:GetTotalXpRewardOfQuests(Quest:GetQuestIdsInQuestLog(trackedOnly))
end

-- Returns whether or not the current character's quest log has any XP rewards.
function Quest:QuestLogHasXpRewards(trackedOnly)
	return Quest:GetQuestLogTotalXpReward(trackedOnly) > 0
end

-- Returns the total monetary reward, in whole copper pieces, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(Quest:GetTurnInAbleQuestIdsInQuestLog(trackedOnly))
end

-- Returns the total monetary reward, in its exact copper value, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTurnInAbleMonetaryRewardInExactCopper(trackedOnly)
	return Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
end

-- Returns the total monetary reward, in whole silver pieces, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeSilver(trackedOnly)
	local copper = Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToWholeSilver(copper)
end

-- Returns the total monetary reward, in its exact silver value, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTurnInAbleMonetaryRewardInExactSilver(trackedOnly)
	local copper = Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToExactSilver(copper)
end

-- Returns the total monetary reward, in whole gold pieces, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeGold(trackedOnly)
	local copper = Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToWholeGold(copper)
end

-- Returns the total monetary reward, in its exact gold value, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTurnInAbleMonetaryRewardInExactGold(trackedOnly)
	local copper = Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToExactGold(copper)
end

-- Returns the total number of gold, silver, and copper coins, combined from all individual quests, awarded for completing the current character's turn-in-able quests.
function Quest:GetQuestLogTurnInAbleMonetaryReward(trackedOnly)
	local copper = Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Money:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the total monetary reward, combined from all individual quests, for completing the current character's turn-in-able quests.
function Quest:GetQuestLogTurnInAbleMonetaryRewardString(coinIconResolution, trackedOnly)
	local copper = Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToCoinString(copper, coinIconResolution)
end

-- Returns whether or not the current character's turn-in-able quests have any monetary rewards.
function Quest:QuestLogHasTurnInAbleMonetaryRewards(trackedOnly)
	return Quest:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly) > 0
end

-- Returns the total monetary reward, in whole copper pieces, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Quest:GetTotalMonetaryRewardOfQuestsInWholeCopper(Quest:GetQuestIdsInQuestLog(trackedOnly))
end

-- Returns the total monetary reward, in its exact copper value, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTotalMonetaryRewardInExactCopper(trackedOnly)
	return Quest:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
end

-- Returns the total monetary reward, in whole silver pieces, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTotalMonetaryRewardInWholeSilver(trackedOnly)
	local copper = Quest:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToWholeSilver(copper)
end

-- Returns the total monetary reward, in its exact silver value, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTotalMonetaryRewardInExactSilver(trackedOnly)
	local copper = Quest:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToExactSilver(copper)
end

-- Returns the total monetary reward, in whole gold pieces, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTotalMonetaryRewardInWholeGold(trackedOnly)
	local copper = Quest:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToWholeGold(copper)
end

-- Returns the total monetary reward, in its exact gold value, combined from all individual quests, for the current character's quest log.
function Quest:GetQuestLogTotalMonetaryRewardInExactGold(trackedOnly)
	local copper = Quest:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToExactGold(copper)
end

-- Returns the total number of gold, silver, and copper coins, combined from all individual quests, awarded for completing the current character's quest log.
function Quest:GetQuestLogTotalMonetaryReward(trackedOnly)
	local copper = Quest:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Money:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the total monetary reward, combined from all individual quests, for completing the current character's quest log.
function Quest:GetQuestLogTotalMonetaryRewardString(coinIconResolution, trackedOnly)
	local copper = Quest:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)
	return Money:CopperToCoinString(copper, coinIconResolution)
end

-- Returns whether or not the current character's quest log has any monetary rewards.
function Quest:QuestLogHasMonetaryRewards(trackedOnly)
	return Quest:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly) > 0
end
