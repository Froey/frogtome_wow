local _, Frogtome = ...
if not Frogtome.Dev then
	Frogtome.Dev = {}
end
Frogtome.Dev.Dev = {}

local Core = Frogtome.Core.Core
local Dev = Frogtome.Dev.Dev
local HiddenSettings = Frogtome.Settings.HiddenSettings
local Log = Frogtome.Misc.Log
local QuestData = Frogtome.Data.QuestData
local SavedData = Frogtome.Data.SavedData
local Session = Frogtome.Core.Session

function Dev:InitializeDevTools()
	if not HiddenSettings:AreDevToolsEnabled() then
		return
	end
	
	Log:Dev("[DEV] Dev tools enabled.")
	
	if not SavedData:GetGlobalSavedData().Dev then
		SavedData:GetGlobalSavedData().Dev = {}
	end
	
	-- Unknown Quest IDs
	
	if not SavedData:GetGlobalSavedData().Dev.UnknownQuests then
		SavedData:GetGlobalSavedData().Dev.UnknownQuests = {}
	end
	Dev.CurrentQuestIds = {}
	
	Session:RegisterListener(function(xpRelatedChange)
		Dev:FindUnknownQuests(xpRelatedChange)
	end)
	Dev:FindUnknownQuests(true)
	
	Dev:VerifyUnknownQuests()
end

function Dev:ToggleDevTools()
	local newValue = not HiddenSettings:AreDevToolsEnabled()
	HiddenSettings:SetDevToolsEnabled(newValue)
	
	if newValue then
		Log:Dev("[DEV] Enabling dev tools.")
		Dev:InitializeDevTools()
	else
		Log:Dev("[DEV] Disabling dev tools.")
	end
end

function Dev:ToggleDevLogging()
	local newValue = not HiddenSettings:IsDevLoggingEnabled()
	
	if newValue then
		HiddenSettings:SetDevLoggingEnabled(true)
		Log:Dev("[DEV] Enabling dev logging.")
	else
		Log:Dev("[DEV] Disabling dev logging.")
		HiddenSettings:SetDevLoggingEnabled(false)
	end
end

function Dev:PrintQuestLog(trackedOnly)
	Log:Dev("Quest Log:")
	
	for _, quest in ipairs(Core:GetQuestsInQuestLog(trackedOnly)) do
		local questId = quest.questID
		local questTitle = quest.title
		
		Log:Dev(" -- [" .. tostring(questId) .. "] \"" .. questTitle .. "\"")
	end
end

function Dev:PrintDungeonQuestLog(trackedOnly)
	Log:Dev("Dungeon Quests in Quest Log:")
	
	for _, quest in ipairs(Core:GetDungeonQuestsInQuestLog(trackedOnly)) do
		local questId = quest.questID
		local questTitle = quest.title
		
		Log:Dev(" -- [" .. tostring(questId) .. "] \"" .. questTitle .. "\"")
	end
end

function Dev:DoesQuestMatchExpectedQuest(quest, expectedQuest, fromSaved)
	local questsMatch = true
	
	if expectedQuest then
		if (expectedQuest.FactionRestriction ~= nil and expectedQuest.FactionRestriction ~= "") and quest.FactionRestriction ~= expectedQuest.FactionRestriction then
			quest.FactionRestriction = ""
			questsMatch = false
		end
		
		questsMatch = questsMatch and quest.Name == expectedQuest.Name
		
		if expectedQuest.Zone == nil or expectedQuest.Zone == "" then
			questsMatch = false
		end
		
		questsMatch = questsMatch and quest.Level == expectedQuest.Level
		
		-- Only trust XP data when we know this quest's level is within an acceptable range of the current character (and when it's in the character's quest log).
		-- But if that condition IS met, then we definitely want to confirm that the XP data we have on record is correct.
		local levelDiff = quest.Level - Core:GetCurrentLevel()
		if not fromSaved and Core:IsOnQuest(quest.ID) and (-5 <= levelDiff and levelDiff <= 7) then
			quest.XP = Core:GetQuestXpReward(quest.ID)
			questsMatch = questsMatch and quest.XP == expectedQuest.XP
		end
	else
		-- If we can't find this quest, still try to grab its XP info.
		local levelDiff = quest.Level - Core:GetCurrentLevel()
		if not fromSaved and Core:IsOnQuest(quest.ID) and (-5 <= levelDiff and levelDiff <= 7) then
			quest.XP = Core:GetQuestXpReward(quest.ID)
		end
		
		questsMatch = false
	end
	
	return questsMatch
end

function Dev:FindUnknownQuests(xpRelatedChange)
	if xpRelatedChange then
		local newCurrentLevel = Core:GetCurrentLevel()
		local questIdsInQuestLog = {}
		
		for _, quest in ipairs(Core:GetQuestsInQuestLog()) do
			table.insert(questIdsInQuestLog, quest.questID)
			
			local foundQuestInQuestLog = false
			if Dev.CurrentLevel and newCurrentLevel == Dev.CurrentLevel then
				-- Only update if we just picked this quest up
				for _, questId in pairs(Dev.CurrentQuestIds) do
					if quest.questID == questId then
						foundQuestInQuestLog = true
					end
				end
			end
			
			if not foundQuestInQuestLog then
				-- This is a new quest we picked up - generate data for it.
				local newQuest = {}
				newQuest.ID = quest.questID
				newQuest.FactionRestriction = Core:GetFactionDataString()
				newQuest.Name = quest.title
				newQuest.Zone = GetZoneText()
				newQuest.Level = quest.level
				newQuest.XP = 0 -- This will be reconciled when we can guarantee it will be accurate
				newQuest.PrereqQuests = {}
				newQuest.LinkedQuests = {}
				
				local dataQuest = QuestData.Quests[newQuest.ID]
				if not Dev:DoesQuestMatchExpectedQuest(newQuest, dataQuest, false) then
					local savedQuest = SavedData:GetGlobalSavedData().Dev.UnknownQuests[newQuest.ID]
					
					-- At this point, fall back to whatever XP data we have gathered previously if we can no longer gather it
					if newQuest.XP == 0 and savedQuest and savedQuest.XP > 0 then
						newQuest.XP = savedQuest.XP
					end
					
					if not Dev:DoesQuestMatchExpectedQuest(newQuest, savedQuest, false) then
						Log:Dev("[DEV] NEW OR UPDATED: (" .. tostring(newQuest.ID) .. ") \"" .. newQuest.Name .. "\"", 0xBBFFBB)
						
						if newQuest.XP == 0 and savedQuest and savedQuest.XP > 0 then
							newQuest.XP = savedQuest.XP
						end
						
						SavedData:GetGlobalSavedData().Dev.UnknownQuests[newQuest.ID] = newQuest
					end
				end
			end
		end
		
		Dev.CurrentLevel = Core:GetCurrentLevel()
		Dev.CurrentQuestIds = questIdsInQuestLog
	end
end

function Dev:VerifyUnknownQuests()
	local questsToRemove = {}
	for _, quest in pairs(SavedData:GetGlobalSavedData().Dev.UnknownQuests) do
		local dataQuest = QuestData.Quests[quest.ID]
		if Dev:DoesQuestMatchExpectedQuest(quest, dataQuest, true) then
			table.insert(questsToRemove, quest)
		end
	end
	
	for _, quest in ipairs(questsToRemove) do
		Log:Dev("[DEV] Reconciled: (" .. tostring(quest.ID) .. ") \"" .. quest.Name .. "\"", 0xFFBBBB)
		SavedData:GetGlobalSavedData().Dev.UnknownQuests[quest.ID] = nil
	end
end
