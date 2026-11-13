local _, Frogtome = ...
if not Frogtome.Features then
	Frogtome.Features = {}
end
Frogtome.Features.QuestLog = {}

local Log = Frogtome.Root.Log
local Quest = Frogtome.Core.Quest
local QuestLog = Frogtome.Features.QuestLog

-----------------------------
-- Quest Log State Caching --
-----------------------------

QuestLog.Lock = false
QuestLog.QuestLogListeners = {}

QuestLog.LastKnownQuestLogSize = -1

QuestLog.Quests = {}
QuestLog.QuestCount = 0
QuestLog.TotalQuestXp = 0
QuestLog.TotalQuestMoneyInCopper = 0

QuestLog.TrackedQuests = {}
QuestLog.TrackedQuestCount = 0
QuestLog.TotalTrackedQuestXp = 0
QuestLog.TotalTrackedQuestMoneyInCopper = 0

QuestLog.TurnInAbleQuests = {}
QuestLog.TurnInAbleQuestCount = 0
QuestLog.TotalTurnInAbleQuestXp = 0
QuestLog.TotalTurnInAbleQuestMoneyInCopper = 0

QuestLog.TrackedTurnInAbleQuests = {}
QuestLog.TrackedTurnInAbleQuestCount = 0
QuestLog.TotalTrackedTurnInAbleQuestXp = 0
QuestLog.TotalTrackedTurnInAbleQuestMoneyInCopper = 0

function QuestLog:InitializeQuestLog()
	QuestLog.Lock = false
	
	QuestLog:UpdateQuestLog()
end

function QuestLog:ClaimLock()
	if QuestLog.Lock then
		Log:Error("Failed to claim quest log process lock.")
		return false
	end
	
	QuestLog.Lock = true
	return true
end

function QuestLog:RelinquishLock()
	if not QuestLog.Lock then
		Log:Warn("Tried to relinquish quest log process lock while it's unclaimed.")
		return false
	end
	
	QuestLog.Lock = false
	return true
end

function QuestLog:UpdateQuestLog()
	if not QuestLog:ClaimLock() then
		Log:Error("Cannot update the session!")
		return
	end
	
	local currentQuestLogSize = Quest:GetQuestLogSize()
	if not (QuestLog.LastKnownQuestLogSize == currentQuestLogSize) then
		-- Quests were either added or removed - get a new cache
		QuestLog.Quests = Quest:GetQuestLogQuests()
	else
		-- Just update the trivial details of each quest we know about
		Quest:UpdateQuests(QuestLog.Quests)
	end
	
	QuestLog.TrackedQuests = {}
	QuestLog.TurnInAbleQuests = {}
	QuestLog.TrackedTurnInAbleQuests = {}
	
	local currentQuestCount = 0
	local currentTrackedQuestCount = 0
	local currentTurnInAbleQuestCount = 0
	local currentTrackedTurnInAbleQuestCount = 0
	
	for _, quest in pairs(QuestLog.Quests) do
		if quest.IsTracked then
			QuestLog.TrackedQuests[quest.ID] = quest
			currentTrackedQuestCount = currentTrackedQuestCount + 1
		end
		
		if quest.CanTurnIn then
			QuestLog.TurnInAbleQuests[quest.ID] = quest
			currentTurnInAbleQuestCount = currentTurnInAbleQuestCount + 1
		end
		
		if quest.IsTracked and quest.CanTurnIn then
			QuestLog.TrackedTurnInAbleQuests[quest.ID] = quest
			currentTrackedTurnInAbleQuestCount = currentTrackedTurnInAbleQuestCount + 1
		end
		
		currentQuestCount = currentQuestCount + 1
	end
	
	QuestLog.LastKnownQuestLogSize = currentQuestLogSize
	
	-- Create a manifest of what information has changed
	
	local changeManifest = {}
	
	changeManifest.QuestCount = not (QuestLog.QuestCount == currentQuestCount)
	QuestLog.QuestCount = currentQuestCount
	local currentTotalQuestXp = QuestLog:AggregateQuestXp(QuestLog.Quests)
	changeManifest.TotalQuestXp = not (QuestLog.TotalQuestXp == currentTotalQuestXp)
	QuestLog.TotalQuestXp = currentTotalQuestXp
	local currentTotalQuestMoneyInCopper = QuestLog:AggregateQuestMoneyInCopper(QuestLog.Quests)
	changeManifest.TotalQuestMoney = not (QuestLog.TotalQuestMoneyInCopper == currentTotalQuestMoneyInCopper)
	QuestLog.TotalQuestMoneyInCopper = currentTotalQuestMoneyInCopper
	
	changeManifest.TrackedQuestCount = not (QuestLog.TrackedQuestCount == currentTrackedQuestCount)
	QuestLog.TrackedQuestCount = currentTrackedQuestCount
	local currentTotalTrackedQuestXp = QuestLog:AggregateQuestXp(QuestLog.TrackedQuests)
	changeManifest.TotalTrackedQuestXp = not (QuestLog.TotalTrackedQuestXp == currentTotalTrackedQuestXp)
	QuestLog.TotalTrackedQuestXp = currentTotalTrackedQuestXp
	local currentTotalTrackedQuestMoneyInCopper = QuestLog:AggregateQuestMoneyInCopper(QuestLog.TrackedQuests)
	changeManifest.TotalTrackedQuestMoney = not (QuestLog.TotalTrackedQuestMoneyInCopper == currentTotalTrackedQuestMoneyInCopper)
	QuestLog.TotalTrackedQuestMoneyInCopper = currentTotalTrackedQuestMoneyInCopper
	
	changeManifest.TurnInAbleQuestCount = not (QuestLog.TurnInAbleQuestCount == currentTurnInAbleQuestCount)
	QuestLog.TurnInAbleQuestCount = currentTurnInAbleQuestCount
	local currentTotalTurnInAbleQuestXp = QuestLog:AggregateQuestXp(QuestLog.TurnInAbleQuests)
	changeManifest.TotalTurnInAbleQuestXp = not (QuestLog.TotalTurnInAbleQuestXp == currentTotalTurnInAbleQuestXp)
	QuestLog.TotalTurnInAbleQuestXp = currentTotalTurnInAbleQuestXp
	local currentTotalTurnInAbleQuestMoneyInCopper = QuestLog:AggregateQuestMoneyInCopper(QuestLog.TurnInAbleQuests)
	changeManifest.TotalTurnInAbleQuestMoney = not (QuestLog.TotalTurnInAbleQuestMoneyInCopper == currentTotalTurnInAbleQuestMoneyInCopper)
	QuestLog.TotalTurnInAbleQuestMoneyInCopper = currentTotalTurnInAbleQuestMoneyInCopper
	
	changeManifest.TrackedTurnInAbleQuestCount = not (QuestLog.TrackedTurnInAbleQuestCount == currentTrackedTurnInAbleQuestCount)
	QuestLog.TrackedTurnInAbleQuestCount = currentTrackedTurnInAbleQuestCount
	local currentTotalTrackedTurnInAbleQuestXp = QuestLog:AggregateQuestXp(QuestLog.TrackedTurnInAbleQuests)
	changeManifest.TotalTrackedTurnInAbleQuestXp = not (QuestLog.TotalTrackedTurnInAbleQuestXp == currentTotalTrackedTurnInAbleQuestXp)
	QuestLog.TotalTrackedTurnInAbleQuestXp = currentTotalTrackedTurnInAbleQuestXp
	local currentTotalTrackedTurnInAbleQuestMoneyInCopper = QuestLog:AggregateQuestMoneyInCopper(QuestLog.TrackedTurnInAbleQuests)
	changeManifest.TotalTrackedTurnInAbleQuestMoney = not (QuestLog.TotalTrackedTurnInAbleQuestMoneyInCopper == currentTotalTrackedTurnInAbleQuestMoneyInCopper)
	QuestLog.TotalTrackedTurnInAbleQuestMoneyInCopper = currentTotalTrackedTurnInAbleQuestMoneyInCopper
	
	-- Fire off registered listeners with the created change manifest
	
	for _, listener in ipairs(QuestLog.QuestLogListeners) do
		listener(changeManifest)
	end
	
	QuestLog:RelinquishLock()
end

function QuestLog:RegisterListener(listener)
	table.insert(QuestLog.QuestLogListeners, listener)
end

----------------------
-- Helper Functions --
----------------------

function QuestLog:AggregateQuestXp(quests)
	local totalXp = 0
	for _, quest in pairs(quests) do
		totalXp = totalXp + quest.XP
	end
	
	return totalXp
end

function QuestLog:AggregateQuestMoneyInCopper(quests)
	local totalMoneyInCopper = 0
	for _, quest in pairs(quests) do
		totalMoneyInCopper = totalMoneyInCopper + quest.MoneyInCopper
	end
	
	return totalMoneyInCopper
end

-------------------------------
-- Quest Log Query Functions --
-------------------------------

function QuestLog:IsOnQuest(questId)
	return not (QuestLog.Quests[questId] == nil)
end

function QuestLog:GetQuest(questId)
	return QuestLog.Quests[questId]
end

function QuestLog:HasAnyQuests(trackedOnly)
	if trackedOnly then
		return QuestLog:HasAnyTrackedQuests()
	end
	
	return QuestLog.QuestCount > 0
end

function QuestLog:GetQuests(trackedOnly)
	if trackedOnly then
		return QuestLog:GetAllTrackedQuests()
	end
	
	return QuestLog.Quests
end

function QuestLog:GetTotalQuestXp(trackedOnly)
	if trackedOnly then
		return QuestLog:GetTotalTrackedQuestXp()
	end
	
	return QuestLog.TotalQuestXp
end

function QuestLog:GetTotalQuestMoneyInCopper(trackedOnly)
	if trackedOnly then
		return QuestLog:GetTotalTrackedQuestMoneyInCopper()
	end
	
	return QuestLog.TotalQuestMoneyInCopper
end

function QuestLog:HasAnyTrackedQuests()
	return QuestLog.TrackedQuestCount > 0
end

function QuestLog:GetTrackedQuests()
	return QuestLog.TrackedQuests
end

function QuestLog:GetTotalTrackedQuestXp()
	return QuestLog.TotalTrackedQuestXp
end

function QuestLog:GetTotalTrackedQuestMoneyInCopper()
	return QuestLog.TotalTrackedQuestMoneyInCopper
end

function QuestLog:HasAnyTurnInAbleQuests(trackedOnly)
	if trackedOnly then
		return QuestLog:HasAnyTrackedTurnInAbleQuests()
	end
	
	return QuestLog.TurnInAbleQuestCount > 0
end

function QuestLog:GetTurnInAbleQuests(trackedOnly)
	if trackedOnly then
		return QuestLog:GetTrackedTurnInAbleQuests()
	end
	
	return QuestLog.TurnInAbleQuests
end

function QuestLog:GetTotalTurnInAbleQuestXp(trackedOnly)
	if trackedOnly then
		return QuestLog:GetTotalTrackedTurnInAbleQuestXp()
	end
	
	return QuestLog.TotalTurnInAbleQuestXp
end

function QuestLog:GetTotalTurnInAbleQuestMoneyInCopper(trackedOnly)
	if trackedOnly then
		return QuestLog:GetTotalTrackedTurnInAbleQuestMoneyInCopper()
	end
	
	return QuestLog.TotalTurnInAbleQuestMoneyInCopper
end

function QuestLog:HasAnyTrackedTurnInAbleQuests()
	return QuestLog.TrackedTurnInAbleQuestCount > 0
end

function QuestLog:GetTrackedTurnInAbleQuests()
	return QuestLog.TrackedTurnInAbleQuests
end

function QuestLog:GetTotalTrackedTurnInAbleQuestXp()
	return QuestLog.TotalTrackedTurnInAbleQuestXp
end

function QuestLog:GetTotalTrackedTurnInAbleQuestMoneyInCopper()
	return QuestLog.TotalTrackedTurnInAbleQuestMoneyInCopper
end
