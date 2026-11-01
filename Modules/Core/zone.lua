local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Zone = {}

local Character = Frogtome.Core.Character
local Quest = Frogtome.Core.Quest
local QuestData = Frogtome.Data.QuestData
local XP = Frogtome.Core.XP
local Zone = Frogtome.Core.Zone
local ZoneData = Frogtome.Data.ZoneData

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

Zone.CONTEXT_MODULE = "Frogtome.Core.Zone"

-------------------------
-- Core Data Functions --
-------------------------

-- Returns information for all zones.
function Zone:GetAllZones(includeCities)
	local zones = {}
	for _, zone in ipairs(ZoneData.Zones) do
		if includeCities or not zone.IsCity then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns information for all zones pertinent to the provided faction.
function Zone:GetAllZonesForFaction(faction, includeCities)
	if not faction then
		faction = Character:GetFaction()
	end
	
	local zones = {}
	for _, zone in ipairs(Zone:GetAllZones(includeCities)) do
		if zone.Territory == faction or zone.Territory == "Contested" or zone.Territory == "Sanctuary" then
			table.insert(zones, zone)
		elseif #Zone:GetZoneQuestsForFaction(zone, faction) > 0 then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns information for zones appropriate for the provided level.
function Zone:GetZones(level, includeCities)
	if not level then
		level = XP:GetCurrentLevel()
	end
	
	local zones = {}
	for _, zone in ipairs(Zone:GetAllZones(includeCities)) do
		if zone.MinLevel <= level and level <= zone.MaxLevel then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns information for zones appropriate for the provided level, pertinent to the provided faction.
function Zone:GetZonesForFaction(faction, level, includeCities)
	if not faction then
		faction = Character:GetFaction()
	end
	
	local zones = {}
	for _, zone in ipairs(Zone:GetZones(level, includeCities)) do
		if zone.Territory == faction or zone.Territory == "Contested" or zone.Territory == "Sanctuary" then
			table.insert(zones, zone)
		elseif #Zone:GetZoneQuestsForFaction(zone, faction) > 0 then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns all quests associated with the provided zone.
function Zone:GetZoneQuests(zone)
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
function Zone:GetZoneQuestsForFaction(zone, faction)
	if not faction then
		faction = Character:GetFaction()
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
function Zone:GetIncompleteZones(level, includeCities)
	if not level then
		level = XP:GetCurrentLevel()
	end
	
	local zones = {}
	for _, zone in ipairs(Zone:GetAllZones(includeCities)) do
		if zone.MinLevel <= level and level <= zone.MaxLevel and #Zone:GetIncompleteZoneQuests(zone) > 0 then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns information for zones appropriate for provided level, pertinent to the provided faction, and for which incomplete quests exist.
function Zone:GetIncompleteZonesForFaction(faction, level, includeCities)
	if not faction then
		faction = Character:GetFaction()
	end
	
	local zones = {}
	for _, zone in ipairs(Zone:GetIncompleteZones(level, includeCities)) do
		if zone.Territory == faction or zone.Territory == "Contested" or zone.Territory == "Sanctuary" then
			table.insert(zones, zone)
		elseif #Zone:GetIncompleteZoneQuestsForFaction(zone, faction) > 0 then
			table.insert(zones, zone)
		end
	end
	
	return zones
end

-- Returns all quests associated with the provided zone.
function Zone:GetIncompleteZoneQuests(zone, includeLinked)
	local quests = {}
	for _, questId in ipairs(zone.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and not Quest:HasCompletedQuest(quest.ID, includeLinked) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end

-- Returns all quests associated with the provided zone.
function Zone:GetIncompleteZoneQuestsForFaction(zone, faction, includeLinked)
	if not faction then
		faction = Character:GetFaction()
	end
	
	local quests = {}
	for _, questId in ipairs(zone.Quests) do
		local quest = QuestData.Quests[questId]
		if quest and (not quest.FactionRestriction or quest.FactionRestriction == faction) and not Quest:HasCompletedQuest(quest.ID, includeLinked) then
			table.insert(quests, quest)
		end
	end
	
	return quests
end
