local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Dungeon = {}

local Character = Frogtome.Core.Character
local Dungeon = Frogtome.Core.Dungeon
local DungeonData = Frogtome.Core.Dungeon
local Quest = Frogtome.Core.Quest
local QuestData = Frogtome.Data.QuestData
local XP = Frogtome.Core.XP
local Zone = Frogtome.Core.Zone

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

Dungeon.CONTEXT_MODULE = "Frogtome.Core.Dungeon"

-------------------------
-- Core Data Functions --
-------------------------

-- Returns the zone that the provided dungeon is located in.
function Dungeon:GetDungeonZone(dungeon)
	for _, zone in ipairs(Zone:GetAllZones(true)) do
		if zone["Name"] == dungeon["Zone"] then
			return zone
		end
	end
	
	return nil
end

-- Returns information for all dungeons.
function Dungeon:GetAllDungeons()
	return DungeonData.Dungeons
end

-- Returns information for all dungeons pertinent to the provided faction.
function Dungeon:GetAllDungeonsForFaction(faction)
	if not faction then
		faction = Character:GetFaction()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Dungeon:GetAllDungeons()) do
		local dungeonZone = Dungeon:GetDungeonZone(dungeon)
		if not dungeonZone.IsCity or dungeonZone.Territory == faction then
			table.insert(dungeons, dungeon)
		elseif #Dungeon:GetDungeonQuestsForFaction(dungeon, faction) > 0 or #Dungeon:GetDungeonMidQuestsForFaction(dungeon, faction) > 0 then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

-- Returns information for dungeons appropriate for the provided level.
function Dungeon:GetDungeons(level)
	if not level then
		level = XP:GetCurrentLevel()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Dungeon:GetAllDungeons()) do
		if dungeon["MinLevel"] <= level and level <= dungeon["MaxLevel"] then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

-- Returns information for dungeons appropriate for the provided level, pertinent to the provided faction.
function Dungeon:GetDungeonsForFaction(level, faction)
	if not faction then
		faction = Character:GetFaction()
	end
	
	if not level then
		level = XP:GetCurrentLevel()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Dungeon:GetDungeons(level)) do
		local dungeonZone = Dungeon:GetDungeonZone(dungeon)
		if not dungeonZone.IsCity or dungeonZone.Territory == faction then
			table.insert(dungeons, dungeon)
		elseif #Dungeon:GetDungeonQuestsForFaction(dungeon, faction) > 0 or #Dungeon:GetDungeonMidQuestsForFaction(dungeon, faction) > 0 then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

-- Recursively searches for all prequests of the provided quest, adding them into the provided table if/as found.
function Dungeon:AddAllPreQuestsRecursively(quest, preQuests)
	for _, preQuestId in ipairs(quest.PrereqQuests) do
		local preQuest = QuestData.Quests[preQuestId]
		if preQuest and (not preQuest.FactionRestriction or preQuest.FactionRestriction == Character:GetFaction()) then
			table.insert(preQuests, preQuest)
			Dungeon:AddAllPreQuestsRecursively(preQuest, preQuests)
		end
	end
end

-- Returns all "pre-quests", or quests that unlock dungeon quests, for the provided dungeon.
function Dungeon:GetDungeonPreQuests(dungeon)
	local preQuests = {}
	for _, questId in pairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest then
			Dungeon:AddAllPreQuestsRecursively(quest, preQuests)
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

function Dungeon:GetDungeonPreQuestsForFaction(dungeon, faction)
	if not faction then
		faction = Character:GetFaction()
	end
	
	local preQuests = {}
	for _, questId in pairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and (not quest.FactionRestriction or quest.FactionRestriction == faction) then
			Dungeon:AddAllPreQuestsRecursively(quest, preQuests)
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
function Dungeon:GetDungeonQuests(dungeon)
	local quests = {}
	for _, questId in ipairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

function Dungeon:GetDungeonQuestsForFaction(dungeon, faction)
	if not faction then
		faction = Character:GetFaction()
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
function Dungeon:GetDungeonMidQuests(dungeon)
	local midQuests = {}
	for _, midQuestId in ipairs(dungeon.MidQuests) do
		local midQuest = QuestData.Quests[midQuestId]
		if midQuest then
			table.insert(midQuests, midQuest)
		end
	end
	
	return midQuests
end

function Dungeon:GetDungeonMidQuestsForFaction(dungeon, faction)
	if not faction then
		faction = Character:GetFaction()
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

function Dungeon:GetIncompleteDungeons(level)
	if not level then
		level = XP:GetCurrentLevel()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Dungeon:GetAllDungeons()) do
		if dungeon["MinLevel"] <= level and level <= dungeon["MaxLevel"] and #Dungeon:GetIncompleteDungeonQuests(dungeon) > 0 then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

function Dungeon:GetIncompleteDungeonsForFaction(level, faction)
	if not faction then
		faction = Character:GetFaction()
	end
	
	if not level then
		level = XP:GetCurrentLevel()
	end
	
	local dungeons = {}
	for _, dungeon in ipairs(Dungeon:GetIncompleteDungeons(level)) do
		local dungeonZone = Dungeon:GetDungeonZone(dungeon)
		if not dungeonZone.IsCity or dungeonZone.Territory == faction then
			table.insert(dungeons, dungeon)
		elseif #Dungeon:GetIncompleteDungeonQuestsForFaction(dungeon, faction) > 0 or #Dungeon:GetDungeonMidQuestsForFaction(dungeon, faction) > 0 then
			table.insert(dungeons, dungeon)
		end
	end
	
	return dungeons
end

function Dungeon:GetIncompleteDungeonQuests(dungeon, includeLinked)
	local quests = {}
	for _, questId in ipairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and not Quest:HasCompletedQuest(quest.ID, includeLinked) then
			table.insert(quests, quest)
		end
	end
	for _, midQuestId in ipairs(dungeon.MidQuests) do
		local midQuest = QuestData.Quests[midQuestId]
		if midQuestand and not Quest:HasCompletedQuest(midQuest.ID, includeLinked) then
			table.insert(quests, midQuest)
		end
	end
	
	return quests
end

function Dungeon:GetIncompleteDungeonQuestsForFaction(dungeon, faction, includeLinked)
	if not faction then
		faction = Character:GetFaction()
	end
	
	local quests = {}
	for _, questId in ipairs(dungeon.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and (not quest.FactionRestriction or quest.FactionRestriction == faction) and not Quest:HasCompletedQuest(quest.ID, includeLinked) then
			table.insert(quests, quest)
		end
	end
	for _, midQuestId in ipairs(dungeon.MidQuests) do
		local midQuest = QuestData.Quests[midQuestId]
		if midQuest and (not midQuest.FactionRestriction or midQuest.FactionRestriction == faction) and not Quest:HasCompletedQuest(midQuest.ID, includeLinked) then
			table.insert(quests, midQuest)
		end
	end
	
	return quests
end
