local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Quest = {}

local API = Frogtome.Root.API
local Context = Frogtome.Version.Context
local Quest = Frogtome.Core.Quest
local QuestData = Frogtome.Data.QuestData

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

Quest.CONTEXT_MODULE = "Frogtome.Core.Quest"

Quest.MAX_QUEST_LOG_SIZE = 40

------------------------------------
-- Refactored Core Data Functions --
------------------------------------

function Quest:GetQuestFactionRestriction(questId)
	if not QuestData.Quests[questId] then
		return nil
	end
	
	return QuestData.Quests[questId].FactionRestriction
end

function Quest:GetQuestZone(questId)
	if not QuestData.Quests[questId] then
		return nil
	end
	
	return QuestData.Quests[questId].Zone
end

function Quest:GetQuestName(questId)
	if not QuestData.Quests[questId] then
		return nil
	end
	
	return QuestData.Quests[questId].Name
end

function Quest:GetQuestLevel(questId)
	if not QuestData.Quests[questId] then
		return nil
	end
	
	return QuestData.Quests[questId].Level
end

function Quest:GetQuestXp(questId)
	if not QuestData.Quests[questId] then
		return nil
	end
	if not QuestData.Quests[questId].XP then
		return 0
	end
	
	return QuestData.Quests[questId].XP
end

-- Returns the XP awarded for completing the specified quest.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetRealTimeQuestXp",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetQuestXp" }
)
function Quest:GetRealTimeQuestXp(questId)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetRealTimeQuestXp") then
		return 0
	end
	
	local xp = API.GetQuestXp(questId)
	if xp == nil then
		xp = 0
	end
	
	return xp
end

function Quest:GetQuestMoneyInCopper(questId)
	if not QuestData.Quests[questId] then
		return nil
	end
	if not QuestData.Quests[questId].MoneyInCopper then
		return 0
	end
	
	return QuestData.Quests[questId].MoneyInCopper
end

-- Returns the monetary reward, in copper pieces, for completing the specified quest.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetRealTimeQuestMoneyInCopper",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetQuestMoneyInCopper" }
)
function Quest:GetRealTimeQuestMoneyInCopper(questId)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetRealTimeQuestMoneyInCopper") then
		return 0
	end
	
	local copper = API.GetQuestMoneyInCopper(questId)
	if copper == nil then
		copper = 0
	end
	
	return copper
end

-- Returns whether or not the current character has completed the provided quest.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"HasCompletedQuest",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
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

function Quest:HasCompletedPrerequisiteQuests(questId)
	local quest = QuestData.Quests[questId]
	if quest then
		for _, prereqQuestId in ipairs(quest.PrereqQuests) do
			if not Quest:HasCompletedQuest(prereqQuestId) then
				return false
			end
		end
	end
	
	return true
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
	
	for trackedQuestIndex = 1, Quest.MAX_QUEST_LOG_SIZE do
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

-- Returns the number of quests in the current character's quest log.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetQuestLogSize",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterQuestLogSize" }
)
function Quest:GetQuestLogSize()
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetQuestLogSize") then
		return 0
	end
	
	return API.GetCharacterQuestLogSize()
end

-- Returns all (real) quests within the current character's quest log.
Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"GetQuestLogQuests",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterQuestLogSize", "GetQuestInfoFromCharacterQuestLog" }
)
function Quest:GetQuestLogQuests()
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "GetQuestLogQuests") then
		return {}
	end
	
	local quests = {}
	for i = 1, API.GetCharacterQuestLogSize() do
		local rawQuest = API.GetQuestInfoFromCharacterQuestLog(i)
		if rawQuest ~= nil and not rawQuest.isHeader and not rawQuest.isHidden then
			-- Create a quest object to bundle a lot of information into
			local quest = {}
			
			local questId = rawQuest.questID
			quest.ID = questId
			
			local questFactionRestriction = Quest:GetQuestFactionRestriction(questId)
			quest.FactionRestriction = questFactionRestriction
			
			local questName = rawQuest.title
			quest.Name = questName
			
			local questZone = Quest:GetQuestZone(questId)
			quest.Zone = questZone
			
			local questLevel = rawQuest.level
			quest.Level = questLevel
			
			quests[questId] = quest
		end
	end
	
	-- This will take care of the rest of the (mutable) information we care about
	Quest:UpdateQuests(quests)
	
	return quests
end

Context:SetDependencies(
	Quest.CONTEXT_MODULE,
	"UpdateQuests",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetQuestIdAtCharacterWatchIndex" }
)
function Quest:UpdateQuests(quests)
	if not Context:CheckDependencies(Quest.CONTEXT_MODULE, "UpdateQuests") then
		return {}
	end
	
	if not quests then
		return
	end
	
	for _, quest in pairs(quests) do
		local questId = quest.ID
		
		local questXp = Quest:GetRealTimeQuestXp(questId)
		quest.XP = questXp
		
		local questMoneyInCopper = Quest:GetRealTimeQuestMoneyInCopper(questId)
		quest.MoneyInCopper = questMoneyInCopper
		
		local canTurnQuestIn = Quest:CanTurnInQuest(questId)
		quest.CanTurnIn = canTurnQuestIn
		
		-- This will be handled in the dedicated loop later
		quest.IsTracked = false
	end
	
	for trackedQuestIndex = 1, Quest.MAX_QUEST_LOG_SIZE do
		local trackedQuestId = API.GetQuestIdAtCharacterWatchIndex(trackedQuestIndex)
		if trackedQuestId == nil then
			-- Break out of this early; we can return now
			return quests
		end
		
		if quests[trackedQuestId] then
			quests[trackedQuestId].IsTracked = true
		end
	end
end
