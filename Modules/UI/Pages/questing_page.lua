local _, Frogtome = ...
if not Frogtome.UI then
	Frogtome.UI = {}
end
if not Frogtome.UI.Pages then
	Frogtome.UI.Pages = {}
end
Frogtome.UI.Pages.Questing = {}

local Core = Frogtome.Core.Core
local DungeonData = Frogtome.Data.DungeonData
local Event = Frogtome.Core.Event
local Log = Frogtome.Misc.Log
local QuestingPage = Frogtome.UI.Pages.Questing
local Settings = Frogtome.Settings.Settings
local Strings = Frogtome.UI.Strings
local UI = Frogtome.UI.UI
local UIConfig = Frogtome.UI.UIConfig
local Utils = Frogtome.Misc.Utils
local ZoneData = Frogtome.Data.ZoneData

----------------------------------
-- Display Update Functionality --
----------------------------------

function QuestingPage:CreateTerritoryColor(territory)
	if territory == "Alliance" then
		return UIConfig.GLOBAL_ALLIANCE_ISH_COLOR
	elseif territory == "Horde" then
		return UIConfig.GLOBAL_HORDE_ISH_COLOR
	elseif territory == "Contested" then
		return UIConfig.GLOBAL_CONTESTED_ISH_COLOR
	elseif territory == "Sanctuary" then
		return UIConfig.GLOBAL_SANCTUARY_ISH_COLOR
	else
		return UIConfig.GLOBAL_DATA_TEXT_COLOR
	end
end

function QuestingPage:CreateLevelRangeString(minLevel, maxLevel)
	if minLevel < maxLevel then
		local levelRangeString = tostring(minLevel) .. "-" .. tostring(maxLevel)
		
		local currentLevel = Core:GetCurrentLevel()
		local distanceFromMinLevel = currentLevel - minLevel
		local distanceFromMaxLevel = maxLevel - currentLevel
		
		if maxLevel - minLevel >= 5 then
			if distanceFromMinLevel <= 2 and minLevel > 1 then
				if distanceFromMinLevel == 0 then
					return levelRangeString, UIConfig.GLOBAL_DIFFICULTY_EXTREME_COLOR
				else
					return levelRangeString, UIConfig.GLOBAL_DIFFICULTY_HARD_COLOR
				end
			elseif distanceFromMaxLevel <= 2 and maxLevel < 60 then
				if distanceFromMaxLevel == 0 then
					return levelRangeString, UIConfig.GLOBAL_DIFFICULTY_NEGLIGIBLE_COLOR
				else
					return levelRangeString, UIConfig.GLOBAL_DIFFICULTY_EASY_COLOR
				end
			else
				return levelRangeString, UIConfig.GLOBAL_DIFFICULTY_NORMAL_COLOR
			end
		else
			return levelRangeString, UIConfig.GLOBAL_DIFFICULTY_NORMAL_COLOR
		end
	else
		return tostring(minLevel), UIConfig.GLOBAL_DIFFICULTY_NORMAL_COLOR
	end
end

function QuestingPage:CreateZoneQuestCompletionString(zone)
	local quests = Core:GetZoneQuestsForFaction(zone)
	
	if #quests == 0 then
		return "N/A", UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
	end
	
	local completedQuests = 0
	for _, quest in ipairs(quests) do
		if Core:HasCompletedQuest(quest.ID, true) then
			completedQuests = completedQuests + 1
		end
	end
	
	local color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	if completedQuests == #quests then
		color = UIConfig.GLOBAL_POSITIVE_VALUE_COLOR
	end
	
	if Settings:IsShowingZoneQuestCountInQuestingPage() then
		return tostring(completedQuests) .. " / " .. tostring(#quests), color
	else
		return Utils:PercentageString(completedQuests, #quests, 0), color
	end
end

function QuestingPage:CreateZoneQuestXpString(zone)
	local quests = Core:GetZoneQuestsForFaction(zone)
	
	if #quests == 0 then
		return "N/A", UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
	end
	
	local currentLevel = Core:GetCurrentLevel()
	
	local availableXp = 0
	for _, quest in ipairs(quests) do
		if not Core:HasCompletedQuest(quest.ID, true) then
			availableXp = availableXp + quest.XP
		end
	end
	
	local color = UIConfig.GLOBAL_EXP_COLOR
	if availableXp == 0 then
		color = UIConfig.GLOBAL_NEGATIVE_VALUE_COLOR
	end
	
	return AbbreviateNumbers(availableXp), color
end

function QuestingPage:CreateZoneQuestCompletionTooltip(zone)
	if not zone then
		return {
			{
				["Text"] = "",
				["Color"] = UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
			}
		}
	end
	
	local quests = Core:GetIncompleteZoneQuestsForFaction(zone, nil, true)
	if #quests == 0 then
		return {
			{
				["Text"] = Strings:Get("QUESTING_PAGE_ZONE_QUEST_TOOLTIP_NO_QUESTS") .. " " .. zone.Name .. ".",
				["Color"] = UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
			}
		}
	end
	
	local lines = {}
	
	local headerLine = {}
	headerLine.Text = Strings:Get("QUESTING_PAGE_ZONE_QUEST_TOOLTIP_QUESTS") .. " " .. zone.Name .. ":"
	headerLine.Color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	table.insert(lines, headerLine)
	
	local bufferLine = {}
	bufferLine.Text = " "
	bufferLine.Color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	table.insert(lines, bufferLine)
	
	-- Sort by level and, within each level, alphabetically
	local questsForTooltip = {}
	for _, quest in ipairs(quests) do
		table.insert(questsForTooltip, quest)
	end
	-- Sorting alphabetically first should keep them in alphabetical order when we then sort by level
	table.sort(questsForTooltip, function(q1, q2) return q1.Name:lower() < q2.Name:lower() end)
	table.sort(questsForTooltip, function(q1, q2) 
		if q1.Level == -1 then
			return false
		elseif q2.Level == -1 then
			return true
		else
			return q1.Level < q2.Level
		end
	end)
	
	local limitedQuestDisplay = false
	for index, quest in ipairs(questsForTooltip) do
		if index <= UIConfig.QUESTING_PAGE_QUEST_TOOLTIP_LIMIT then
			local lineColor = UIConfig.GLOBAL_DATA_TEXT_COLOR
			if Core:HasCompletedQuest(quest.ID, true) then
				lineColor = UIConfig.GLOBAL_QUEST_COMPLETED_COLOR
			elseif Core:CanTurnInQuest(quest.ID, true) then
				lineColor = UIConfig.GLOBAL_QUEST_READY_COLOR
			elseif Core:IsOnQuest(quest.ID, true) then
				lineColor = UIConfig.GLOBAL_QUEST_IN_PROGRESS_COLOR
			elseif Core:HasCompletedPrereqQuestsForQuest(quest.ID) then
				lineColor = UIConfig.GLOBAL_QUEST_AVAILABLE_COLOR
			else
				lineColor = UIConfig.GLOBAL_QUEST_LOCKED_COLOR
			end
			
			local text = "- "
			if quest.Level > 0 then
				text = text .. "(" .. tostring(quest.Level) .. ") "
			end
			text = text .. quest.Name
			
			local line = {}
			line.Text = text
			line.Color = lineColor
			table.insert(lines, line)
		else
			limitedQuestDisplay = true
		end
	end
	if limitedQuestDisplay then
		local ellipsesLine = {}
		ellipsesLine.Text = "..."
		ellipsesLine.Color = UIConfig.GLOBAL_DATA_TEXT_COLOR
		table.insert(lines, ellipsesLine)
	end
	
	return lines
end

function QuestingPage:CreateDungeonPreQuestCompletionString(dungeon)
	local preQuests = Core:GetDungeonPreQuestsForFaction(dungeon)
	
	if #preQuests == 0 then
		return "N/A", UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
	end
	
	local completedPreQuests = 0
	for _, preQuest in ipairs(preQuests) do
		if Core:HasCompletedQuest(preQuest.ID, true) then
			completedPreQuests = completedPreQuests + 1
		end
	end
	
	local color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	if completedPreQuests == #preQuests then
		color = UIConfig.GLOBAL_POSITIVE_VALUE_COLOR
	end
	
	if Settings:IsShowingDungeonPreQuestCountInQuestingPage() then
		return tostring(completedPreQuests) .. " / " .. tostring(#preQuests), color
	else
		return Utils:PercentageString(completedPreQuests, #preQuests, 0), color
	end
end

function QuestingPage:CreateDungeonPreQuestCompletionTooltip(dungeon)
	if not dungeon then
		return {
			{
				["Text"] = "",
				["Color"] = UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
			}
		}
	end
	
	local preQuests = Core:GetDungeonPreQuestsForFaction(dungeon)
	if #preQuests == 0 then
		return {
			{
				["Text"] = Strings:Get("QUESTING_PAGE_DUNGEON_QUEST_TOOLTIP_NO_PRE_QUESTS") .. " " .. dungeon.Name .. ".",
				["Color"] = UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
			}
		}
	end
	
	local lines = {}
	
	local headerLine = {}
	headerLine.Text = Strings:Get("QUESTING_PAGE_DUNGEON_QUEST_TOOLTIP_PRE_QUESTS") .. " " .. dungeon.Name .. ":"
	headerLine.Color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	table.insert(lines, headerLine)
	
	local bufferLine = {}
	bufferLine.Text = " "
	bufferLine.Color = UIConfig.QUEST_PAGE_ITEM_LABEL_COLOR
	table.insert(lines, bufferLine)
	
	-- Sort by level and, within each level, alphabetically
	local questsForTooltip = {}
	for _, quest in ipairs(preQuests) do
		table.insert(questsForTooltip, quest)
	end
	-- Sorting alphabetically first should keep them in alphabetical order when we then sort by level
	table.sort(questsForTooltip, function(q1, q2) return q1.Name:lower() < q2.Name:lower() end)
	table.sort(questsForTooltip, function(q1, q2) 
		if q1.Level == -1 then
			return false
		elseif q2.Level == -1 then
			return true
		else
			return q1.Level < q2.Level
		end
	end)
	
	for _, quest in ipairs(questsForTooltip) do
		local lineColor = UIConfig.GLOBAL_DATA_TEXT_COLOR
		if Core:HasCompletedQuest(quest.ID, true) then
			lineColor = UIConfig.GLOBAL_QUEST_COMPLETED_COLOR
		elseif Core:CanTurnInQuest(quest.ID, true) then
			lineColor = UIConfig.GLOBAL_QUEST_READY_COLOR
		elseif Core:IsOnQuest(quest.ID, true) then
			lineColor = UIConfig.GLOBAL_QUEST_IN_PROGRESS_COLOR
		elseif Core:HasCompletedPrereqQuestsForQuest(quest.ID) then
			lineColor = UIConfig.GLOBAL_QUEST_AVAILABLE_COLOR
		else
			lineColor = UIConfig.GLOBAL_QUEST_LOCKED_COLOR
		end
		
		local text = "- "
		if quest.Level > 0 then
			text = text .. "(" .. tostring(quest.Level) .. ") "
		end
		text = text .. quest.Name
		
		local line = {}
		line.Text = text
		line.Color = lineColor
		table.insert(lines, line)
	end
	
	return lines
end

function QuestingPage:CreateDungeonQuestsToBringString(dungeon)
	local quests = Core:GetDungeonQuestsForFaction(dungeon)
	
	local heldQuests = 0
	local completedQuests = 0
	for _, quest in ipairs(quests) do
		if Core:HasCompletedQuest(quest.ID, true) then
			completedQuests = completedQuests + 1
		elseif Core:IsOnQuest(quest.ID, true) then
			heldQuests = heldQuests + 1
		end
	end
	
	local availableQuests = #quests - completedQuests
	if availableQuests == 0 then
		return "None", UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
	end
	
	local color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	if heldQuests == availableQuests then
		color = UIConfig.GLOBAL_POSITIVE_VALUE_COLOR
	end
	
	if Settings:IsShowingDungeonQuestToBringCountInQuestingPage() then
		return tostring(heldQuests) .. " / " .. tostring(availableQuests), color
	else
		return Utils:PercentageString(heldQuests, availableQuests, 0), color
	end
end

function QuestingPage:CreateDungeonQuestsToBringTooltip(dungeon)
	if not dungeon then
		return {
			{
				["Text"] = "",
				["Color"] = UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
			}
		}
	end
	
	local quests = Core:GetDungeonQuestsForFaction(dungeon)
	if #quests == 0 then
		return {
			{
				["Text"] = Strings:Get("QUESTING_PAGE_DUNGEON_QUEST_TOOLTIP_NO_QUESTS_TO_BRING") .. " " .. dungeon.Name .. ".",
				["Color"] = UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
			}
		}
	end
	
	local lines = {}
	
	local headerLine = {}
	headerLine.Text = Strings:Get("QUESTING_PAGE_DUNGEON_QUEST_TOOLTIP_QUESTS_TO_BRING") .. " " .. dungeon.Name .. ":"
	headerLine.Color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	table.insert(lines, headerLine)
	
	local bufferLine = {}
	bufferLine.Text = " "
	bufferLine.Color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	table.insert(lines, bufferLine)
	
	-- Sort by level and, within each level, alphabetically
	local questsForTooltip = {}
	for _, quest in ipairs(quests) do
		table.insert(questsForTooltip, quest)
	end
	-- Sorting alphabetically first should keep them in alphabetical order when we then sort by level
	table.sort(questsForTooltip, function(q1, q2) return q1.Name:lower() < q2.Name:lower() end)
	table.sort(questsForTooltip, function(q1, q2) 
		if q1.Level == -1 then
			return false
		elseif q2.Level == -1 then
			return true
		else
			return q1.Level < q2.Level
		end
	end)
	
	for _, quest in ipairs(questsForTooltip) do
		local lineColor = UIConfig.GLOBAL_DATA_TEXT_COLOR
		if Core:HasCompletedQuest(quest.ID, true) then
			lineColor = UIConfig.GLOBAL_QUEST_IRRELEVANT_COLOR
		elseif Core:IsOnQuest(quest.ID, true) then
			lineColor = UIConfig.GLOBAL_QUEST_IN_PROGRESS_COLOR
		elseif Core:HasCompletedPrereqQuestsForQuest(quest.ID) then
			lineColor = UIConfig.GLOBAL_QUEST_AVAILABLE_COLOR
		else
			lineColor = UIConfig.GLOBAL_QUEST_LOCKED_COLOR
		end
		
		local text = "- "
		if quest.Level > 0 then
			text = text .. "(" .. tostring(quest.Level) .. ") "
		end
		text = text .. quest.Name
		
		local line = {}
		line.Text = text
		line.Color = lineColor
		table.insert(lines, line)
	end
	
	return lines
end

function QuestingPage:CreateDungeonQuestCompletionString(dungeon)
	local quests = Core:GetDungeonQuestsForFaction(dungeon)
	local midQuests = Core:GetDungeonMidQuestsForFaction(dungeon)
	
	local completedQuests = 0
	for _, quest in ipairs(quests) do
		if Core:HasCompletedQuest(quest.ID, true) then
			completedQuests = completedQuests + 1
		end
	end
	for _, midQuest in ipairs(midQuests) do
		if Core:HasCompletedQuest(midQuest.ID, true) then
			completedQuests = completedQuests + 1
		end
	end
	
	local totalQuests = #quests + #midQuests
	if totalQuests == 0 then
		return "N/A", UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
	end
	
	local color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	if completedQuests == totalQuests then
		color = UIConfig.GLOBAL_POSITIVE_VALUE_COLOR
	end
	
	if Settings:IsShowingDungeonQuestCountInQuestingPage() then
		return tostring(completedQuests) .. " / " .. tostring(totalQuests), color
	else
		return Utils:PercentageString(completedQuests, totalQuests, 0), color
	end
end

function QuestingPage:CreateDungeonQuestCompletionTooltip(dungeon)
	if not dungeon then
		return {
			{
				["Text"] = "",
				["Color"] = UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
			}
		}
	end
	
	local quests = Core:GetDungeonQuestsForFaction(dungeon)
	local midQuests = Core:GetDungeonMidQuestsForFaction(dungeon)
	if #quests == 0 and #midQuests == 0 then
		return {
			{
				["Text"] = Strings:Get("QUESTING_PAGE_DUNGEON_QUEST_TOOLTIP_NO_QUESTS") .. " " .. dungeon.Name .. ".",
				["Color"] = UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR
			}
		}
	end
	
	local lines = {}
	
	local headerLine = {}
	headerLine.Text = Strings:Get("QUESTING_PAGE_DUNGEON_QUEST_TOOLTIP_QUESTS") .. " " .. dungeon.Name .. ":"
	headerLine.Color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	table.insert(lines, headerLine)
	
	local bufferLine = {}
	bufferLine.Text = " "
	bufferLine.Color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	table.insert(lines, bufferLine)
	
	-- Sort by level and, within each level, alphabetically
	local questsForTooltip = {}
	for _, quest in ipairs(quests) do
		table.insert(questsForTooltip, quest)
	end
	for _, midQuest in ipairs(midQuests) do
		table.insert(questsForTooltip, midQuest)
	end
	-- Sorting alphabetically first should keep them in alphabetical order when we then sort by level
	table.sort(questsForTooltip, function(q1, q2) return q1.Name:lower() < q2.Name:lower() end)
	table.sort(questsForTooltip, function(q1, q2) 
		if q1.Level == -1 then
			return false
		elseif q2.Level == -1 then
			return true
		else
			return q1.Level < q2.Level
		end
	end)
	
	for _, quest in ipairs(questsForTooltip) do
		local lineColor = UIConfig.GLOBAL_DATA_TEXT_COLOR
		if Core:HasCompletedQuest(quest.ID, true) then
			lineColor = UIConfig.GLOBAL_QUEST_COMPLETED_COLOR
		elseif Core:CanTurnInQuest(quest.ID, true) then
			lineColor = UIConfig.GLOBAL_QUEST_READY_COLOR
		elseif Core:IsOnQuest(quest.ID, true) then
			lineColor = UIConfig.GLOBAL_QUEST_IN_PROGRESS_COLOR
		elseif Core:HasCompletedPrereqQuestsForQuest(quest.ID) then
			lineColor = UIConfig.GLOBAL_QUEST_AVAILABLE_COLOR
		else
			lineColor = UIConfig.GLOBAL_QUEST_LOCKED_COLOR
		end
		
		local text = "- "
		if quest.Level > 0 then
			text = text .. "(" .. tostring(quest.Level) .. ") "
		end
		text = text .. quest.Name
		
		local line = {}
		line.Text = text
		line.Color = lineColor
		table.insert(lines, line)
	end
	
	return lines
end

----------------------------
-- Display Update Process --
----------------------------

function QuestingPage:UpdateExpandedFrameView()
	local zones
	if Settings:IsHidingCompletedZonesInQuestingPage() then
		zones = Core:GetIncompleteZonesForFaction()
	else
		zones = Core:GetZonesForFaction()
	end
	
	local zoneRows = QuestingPage.Page.ZoneRows
	
	for zoneRowIndex, zoneRow in ipairs(zoneRows) do
		if zoneRowIndex <= #zones then
			local zone = zones[zoneRowIndex]
			
			local zoneLevelRangeText, zoneLevelRangeColor = QuestingPage:CreateLevelRangeString(zone.MinLevel, zone.MaxLevel)
			zoneRow.ZoneLevelRange:SetText(zoneLevelRangeText)
			UI:ApplyTextWidgetFont(zoneRow.ZoneLevelRange, zoneLevelRangeColor)
			
			local zoneColor = QuestingPage:CreateTerritoryColor(zone.Territory)
			zoneRow.ZoneName:SetText(zone.Name)
			UI:ApplyTextWidgetFont(zoneRow.ZoneName, zoneColor)
			
			local zoneQuestCompletionText, zoneQuestCompletionColor = QuestingPage:CreateZoneQuestCompletionString(zone)
			zoneRow.ZoneQuestCompletion:SetText(zoneQuestCompletionText)
			UI:ApplyTextWidgetFont(zoneRow.ZoneQuestCompletion, zoneQuestCompletionColor)
			
			local zoneQuestXpText, zoneQuestXpColor = QuestingPage:CreateZoneQuestXpString(zone)
			zoneRow.ZoneQuestXP:SetText(zoneQuestXpText)
			UI:ApplyTextWidgetFont(zoneRow.ZoneQuestXP, zoneQuestXpColor)
		else
			zoneRow.ZoneLevelRange:SetText("")
			zoneRow.ZoneName:SetText("")
			zoneRow.ZoneQuestCompletion:SetText("")
			zoneRow.ZoneQuestXP:SetText("")
		end
	end
	
	local dungeons
	if Settings:IsHidingCompletedDungeonsInQuestingPage() then
		dungeons = Core:GetIncompleteDungeonsForFaction()
	else
		dungeons = Core:GetDungeonsForFaction()
	end
	
	local dungeonRows = QuestingPage.Page.DungeonRows
	
	for dungeonRowIndex, dungeonRow in ipairs(dungeonRows) do
		if dungeonRowIndex <= #dungeons then
			local dungeon = dungeons[dungeonRowIndex]
			local dungeonZone = Core:GetDungeonZone(dungeon)
			
			local dungeonLevelRangeText, dungeonLevelRangeColor = QuestingPage:CreateLevelRangeString(dungeon.MinLevel, dungeon.MaxLevel)
			dungeonRow.DungeonLevelRange:SetText(dungeonLevelRangeText)
			UI:ApplyTextWidgetFont(dungeonRow.DungeonLevelRange, dungeonLevelRangeColor)
			
			local dungeonColor = UIConfig.GLOBAL_DATA_TEXT_COLOR
			if dungeonZone then
				dungeonColor = QuestingPage:CreateTerritoryColor(dungeonZone.Territory)
			end
			dungeonRow.DungeonName:SetText(dungeon.Name)
			UI:ApplyTextWidgetFont(dungeonRow.DungeonName, dungeonColor)
			
			local dungeonPreQuestCompletionText, dungeonPreQuestCompletionColor = QuestingPage:CreateDungeonPreQuestCompletionString(dungeon)
			dungeonRow.DungeonPreQuestCompletion:SetText(dungeonPreQuestCompletionText)
			UI:ApplyTextWidgetFont(dungeonRow.DungeonPreQuestCompletion, dungeonPreQuestCompletionColor)
			
			local dungeonQuestsText, dungeonQuestsColor = QuestingPage:CreateDungeonQuestsToBringString(dungeon)
			dungeonRow.DungeonQuests:SetText(dungeonQuestsText)
			UI:ApplyTextWidgetFont(dungeonRow.DungeonQuests, dungeonQuestsColor)
			
			local dungeonQuestCompletionText, dungeonQuestCompletionColor = QuestingPage:CreateDungeonQuestCompletionString(dungeon)
			dungeonRow.DungeonQuestCompletion:SetText(dungeonQuestCompletionText)
			UI:ApplyTextWidgetFont(dungeonRow.DungeonQuestCompletion, dungeonQuestCompletionColor)
		else
			dungeonRow.DungeonLevelRange:SetText("")
			dungeonRow.DungeonName:SetText("")
			dungeonRow.DungeonPreQuestCompletion:SetText("")
			dungeonRow.DungeonQuests:SetText("")
			dungeonRow.DungeonQuestCompletion:SetText("")
		end
	end
end

function QuestingPage:UpdateCondensedFrameView()
	local dungeon = Core:GetIncompleteDungeonsForFaction()[1]
	
	if dungeon then
		local dungeonZone = Core:GetDungeonZone(dungeon)
		
		local dungeonLevelRangeText, dungeonLevelRangeColor = QuestingPage:CreateLevelRangeString(dungeon.MinLevel, dungeon.MaxLevel)
		QuestingPage.Page.CondensedFrameView.DungeonLevelRange:SetText(dungeonLevelRangeText)
		UI:ApplyTextWidgetFont(QuestingPage.Page.CondensedFrameView.DungeonLevelRange, dungeonLevelRangeColor)
		
		local dungeonColor = UIConfig.GLOBAL_DATA_TEXT_COLOR
		if dungeonZone then
			dungeonColor = QuestingPage:CreateTerritoryColor(dungeonZone.Territory)
		end
		QuestingPage.Page.CondensedFrameView.DungeonName:SetText(dungeon.Name)
		UI:ApplyTextWidgetFont(QuestingPage.Page.CondensedFrameView.DungeonName, dungeonColor)
		
		local dungeonPreQuestCompletionText, dungeonPreQuestCompletionColor = QuestingPage:CreateDungeonPreQuestCompletionString(dungeon)
		QuestingPage.Page.CondensedFrameView.DungeonPreQuestCompletion:SetText(dungeonPreQuestCompletionText)
		UI:ApplyTextWidgetFont(QuestingPage.Page.CondensedFrameView.DungeonPreQuestCompletion, dungeonPreQuestCompletionColor)
		
		local dungeonQuestsText, dungeonQuestsColor = QuestingPage:CreateDungeonQuestsToBringString(dungeon)
		QuestingPage.Page.CondensedFrameView.DungeonQuests:SetText(dungeonQuestsText)
		UI:ApplyTextWidgetFont(QuestingPage.Page.CondensedFrameView.DungeonQuests, dungeonQuestsColor)
		
		local dungeonQuestCompletionText, dungeonQuestCompletionColor = QuestingPage:CreateDungeonQuestCompletionString(dungeon)
		QuestingPage.Page.CondensedFrameView.DungeonQuestCompletion:SetText(dungeonQuestCompletionText)
		UI:ApplyTextWidgetFont(QuestingPage.Page.CondensedFrameView.DungeonQuestCompletion, dungeonQuestCompletionColor)
	else
		QuestingPage.Page.CondensedFrameView.DungeonLevelRange:SetText("")
		QuestingPage.Page.CondensedFrameView.DungeonName:SetText("")
		QuestingPage.Page.CondensedFrameView.DungeonPreQuestCompletion:SetText("")
		QuestingPage.Page.CondensedFrameView.DungeonQuests:SetText("")
		QuestingPage.Page.CondensedFrameView.DungeonQuestCompletion:SetText("")
	end
end

function QuestingPage:UpdateDisplay(force)
	if not force and not QuestingPage.Page:IsVisible() then
		return
	end
	
	if force or QuestingPage.Page.ExpandedFrameView:IsVisible() then
		QuestingPage:UpdateExpandedFrameView()
	end
	if force or QuestingPage.Page.CondensedFrameView:IsVisible() then
		QuestingPage:UpdateCondensedFrameView()
	end
end

------------------------
-- Listener Functions --
------------------------

function QuestingPage:OnExpandedFrameViewShown()
	QuestingPage:UpdateDisplay(true)
end

function QuestingPage:OnCondensedFrameViewShown()
	QuestingPage:UpdateDisplay(true)
end

function QuestingPage:OnPageShown()
	QuestingPage:UpdateDisplay(true)
end

function QuestingPage:OnPageHidden()
	-- TODO
end

-----------------------
-- Page Construction --
-----------------------

function QuestingPage:BuildExpandedFrameView(page)
	local view = UI:CreateExpandedView(page)
	
	local y = UIConfig.QUESTING_PAGE_TABLE_START_OFFSET_Y
	
	-- Zone Table
	
	local zoneTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(zoneTableParams, 1, UIConfig.QUESTING_PAGE_ZONE_TABLE_COLUMN_1_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(zoneTableParams, 2, UIConfig.QUESTING_PAGE_ZONE_TABLE_COLUMN_2_X, "TOP", nil)
	UI:SetTableColumnParameters(zoneTableParams, 3, UIConfig.QUESTING_PAGE_ZONE_TABLE_COLUMN_3_X, "TOP", nil)
	UI:SetTableColumnParameters(zoneTableParams, 4, UIConfig.QUESTING_PAGE_ZONE_TABLE_COLUMN_4_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(zoneTableParams, 5, UIConfig.QUESTING_PAGE_ZONE_TABLE_COLUMN_5_X, "TOP", nil)
	UI:SetTableColumnParameters(zoneTableParams, 6, UIConfig.QUESTING_PAGE_ZONE_TABLE_COLUMN_6_X, "TOP", nil)
	
	UI:SetTableRowParameters(zoneTableParams, 1, y, nil, UIConfig.QUESTING_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(zoneTableParams, view, Strings:Get("QUESTING_PAGE_ZONE_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, 1) -- TODO: Remove WIP when less WIP
	y = y - UIConfig.QUESTING_PAGE_SECTION_FONT_SIZE - UIConfig.QUESTING_PAGE_LINE_SECTION_START_SPACING
	
	UI:SetTableRowParameters(zoneTableParams, 2, y, nil, UIConfig.QUESTING_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(zoneTableParams, view, Strings:Get("QUESTING_PAGE_ZONE_LEVEL_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 2, 2)
	UI:CreateTableText(zoneTableParams, view, Strings:Get("QUESTING_PAGE_ZONE_NAME_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, 2)
	UI:CreateTableText(zoneTableParams, view, Strings:Get("QUESTING_PAGE_ZONE_PROGRESS_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, 2)
	UI:CreateTableText(zoneTableParams, view, Strings:Get("QUESTING_PAGE_ZONE_XP_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 6, 2)
	y = y - UIConfig.QUESTING_PAGE_COLUMN_HEADER_FONT_SIZE - UIConfig.QUESTING_PAGE_LINE_BUFFER
	
	page.ZoneRows = {}
	for rowIndex = 3, UIConfig.QUESTING_PAGE_MAX_ITEMS_PER_TABLE + 2 do
		UI:SetTableRowParameters(zoneTableParams, rowIndex, y, nil, UIConfig.QUESTING_PAGE_DATA_FONT_SIZE)
		
		local zoneRow = {}
		zoneRow.ZoneIndex = rowIndex - 2
		page.ZoneRows[zoneRow.ZoneIndex] = zoneRow
		
		zoneRow.ZoneLevelRange = UI:CreateTableText(zoneTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, rowIndex)
		zoneRow.ZoneName = UI:CreateTableText(zoneTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, rowIndex)
		zoneRow.ZoneQuestCompletion = UI:CreateTableText(zoneTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 5, rowIndex)
		UI:ApplyMultiLineTooltipToWidget(zoneRow.ZoneQuestCompletion, "ANCHOR_RIGHT", function()
			local zones
			if Settings:IsHidingCompletedZonesInQuestingPage() then
				zones = Core:GetIncompleteZonesForFaction()
			else
				zones = Core:GetZonesForFaction()
			end
			
			return QuestingPage:CreateZoneQuestCompletionTooltip(zones[zoneRow.ZoneIndex])
		end)
		zoneRow.ZoneQuestXP = UI:CreateTableText(zoneTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, rowIndex)
		
		if rowIndex < UIConfig.QUESTING_PAGE_MAX_ITEMS_PER_TABLE + 2 then
			y = y - UIConfig.QUESTING_PAGE_DATA_FONT_SIZE - UIConfig.QUESTING_PAGE_LINE_BUFFER
		end
	end
	y = y - UIConfig.QUESTING_PAGE_DATA_FONT_SIZE - UIConfig.QUESTING_PAGE_LINE_SECTION_END_SPACING
	
	-- Dungeon Table
	
	local dungeonTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(dungeonTableParams, 1, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_1_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 2, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_2_X, "TOP", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 3, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_3_X, "TOP", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 4, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_4_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 5, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_5_X, "TOP", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 6, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_6_X, "TOP", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 7, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_7_X, "TOP", nil)
	
	UI:SetTableRowParameters(dungeonTableParams, 1, y, nil, UIConfig.QUESTING_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(dungeonTableParams, view, Strings:Get("QUESTING_PAGE_DUNGEON_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, 1) -- TODO: Remove WIP when less WIP
	y = y - UIConfig.QUESTING_PAGE_SECTION_FONT_SIZE - UIConfig.QUESTING_PAGE_LINE_SECTION_START_SPACING
	
	UI:SetTableRowParameters(dungeonTableParams, 2, y, nil, UIConfig.QUESTING_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(dungeonTableParams, view, Strings:Get("QUESTING_PAGE_DUNGEON_LEVEL_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 2, 2)
	UI:CreateTableText(dungeonTableParams, view, Strings:Get("QUESTING_PAGE_DUNGEON_NAME_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, 2)
	UI:CreateTableText(dungeonTableParams, view, Strings:Get("QUESTING_PAGE_DUNGEON_PRE_QUEST_PROGRESS_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, 2)
	UI:CreateTableText(dungeonTableParams, view, Strings:Get("QUESTING_PAGE_DUNGEON_QUESTS_TO_BRING_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 6, 2)
	UI:CreateTableText(dungeonTableParams, view, Strings:Get("QUESTING_PAGE_DUNGEON_QUEST_PROGRESS_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 7, 2)
	y = y - UIConfig.QUESTING_PAGE_COLUMN_HEADER_FONT_SIZE - UIConfig.QUESTING_PAGE_LINE_BUFFER
	
	page.DungeonRows = {}
	for rowIndex = 3, UIConfig.QUESTING_PAGE_MAX_ITEMS_PER_TABLE + 2 do
		UI:SetTableRowParameters(dungeonTableParams, rowIndex, y, nil, 13)
		
		local dungeonRow = {}
		dungeonRow.DungeonIndex = rowIndex - 2
		page.DungeonRows[dungeonRow.DungeonIndex] = dungeonRow
		
		dungeonRow.DungeonLevelRange = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, rowIndex)
		dungeonRow.DungeonName = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, rowIndex)
		dungeonRow.DungeonPreQuestCompletion = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 5, rowIndex)
		UI:ApplyMultiLineTooltipToWidget(dungeonRow.DungeonPreQuestCompletion, "ANCHOR_RIGHT", function()
			local dungeons
			if Settings:IsHidingCompletedDungeonsInQuestingPage() then
				dungeons = Core:GetIncompleteDungeonsForFaction()
			else
				dungeons = Core:GetDungeonsForFaction()
			end
			
			return QuestingPage:CreateDungeonPreQuestCompletionTooltip(dungeons[dungeonRow.DungeonIndex])
		end)
		dungeonRow.DungeonQuests = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, rowIndex)
		UI:ApplyMultiLineTooltipToWidget(dungeonRow.DungeonQuests, "ANCHOR_RIGHT", function()
			local dungeons
			if Settings:IsHidingCompletedDungeonsInQuestingPage() then
				dungeons = Core:GetIncompleteDungeonsForFaction()
			else
				dungeons = Core:GetDungeonsForFaction()
			end
			
			return QuestingPage:CreateDungeonQuestsToBringTooltip(dungeons[dungeonRow.DungeonIndex])
		end)
		dungeonRow.DungeonQuestCompletion = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 7, rowIndex)
		UI:ApplyMultiLineTooltipToWidget(dungeonRow.DungeonQuestCompletion, "ANCHOR_RIGHT", function()
			local dungeons
			if Settings:IsHidingCompletedDungeonsInQuestingPage() then
				dungeons = Core:GetIncompleteDungeonsForFaction()
			else
				dungeons = Core:GetDungeonsForFaction()
			end
			
			return QuestingPage:CreateDungeonQuestCompletionTooltip(dungeons[dungeonRow.DungeonIndex])
		end)
		
		if rowIndex < UIConfig.QUESTING_PAGE_MAX_ITEMS_PER_TABLE + 2 then
			y = y - UIConfig.QUESTING_PAGE_DATA_FONT_SIZE - UIConfig.QUESTING_PAGE_LINE_BUFFER
		end
	end
	
	return view
end

function QuestingPage:BuildCondensedFrameView(page)
	local view = UI:CreateCondensedView(page)
	
	local y = UIConfig.QUESTING_PAGE_TABLE_START_OFFSET_Y
	
	-- Dungeon Table
	
	local dungeonTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(dungeonTableParams, 1, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_1_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 2, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_2_X, "TOP", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 3, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_3_X, "TOP", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 4, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_4_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 5, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_5_X, "TOP", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 6, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_6_X, "TOP", nil)
	UI:SetTableColumnParameters(dungeonTableParams, 7, UIConfig.QUESTING_PAGE_DUNGEON_TABLE_COLUMN_7_X, "TOP", nil)
	
	UI:SetTableRowParameters(dungeonTableParams, 1, y, nil, UIConfig.QUESTING_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(dungeonTableParams, view, Strings:Get("QUESTING_PAGE_DUNGEON_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, 1) -- TODO: Remove WIP when less WIP
	y = y - UIConfig.QUESTING_PAGE_SECTION_FONT_SIZE - UIConfig.QUESTING_PAGE_LINE_SECTION_START_SPACING - UIConfig.QUESTING_PAGE_CONDENSED_VIEW_SPACING_OFFSET
	
	UI:SetTableRowParameters(dungeonTableParams, 2, y, nil, 13)
	view.DungeonLevelRange = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, 2)
	view.DungeonName = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 2)
	view.DungeonPreQuestCompletion = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 5, 2)
	UI:ApplyMultiLineTooltipToWidget(view.DungeonPreQuestCompletion, "ANCHOR_RIGHT", function()
		return QuestingPage:CreateDungeonPreQuestCompletionTooltip(Core:GetIncompleteDungeonsForFaction()[1])
	end)
	view.DungeonQuests = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, 2)
	UI:ApplyMultiLineTooltipToWidget(view.DungeonQuests, "ANCHOR_RIGHT", function()
		return QuestingPage:CreateDungeonQuestsToBringTooltip(Core:GetIncompleteDungeonsForFaction()[1])
	end)
	view.DungeonQuestCompletion = UI:CreateTableText(dungeonTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 7, 2)
	UI:ApplyMultiLineTooltipToWidget(view.DungeonQuestCompletion, "ANCHOR_RIGHT", function()
		return QuestingPage:CreateDungeonQuestCompletionTooltip(Core:GetIncompleteDungeonsForFaction()[1])
	end)
	
	return view
end

function QuestingPage:Build(parent)
	Log:Debug("Creating Questing page...")
	
	local page = UI:CreatePage(parent, "Session")
	QuestingPage.Page = page
	
	local expandedView = QuestingPage:BuildExpandedFrameView(page)
	page.ExpandedFrameView = expandedView
	
	local condensedView = QuestingPage:BuildCondensedFrameView(page)
	page.CondensedFrameView = condensedView
	
	-- Event Listeners
	
	Event:SetSessionEventListenerForWidget(page, function()
		QuestingPage:UpdateDisplay(false)
	end)
	
	return page
end
