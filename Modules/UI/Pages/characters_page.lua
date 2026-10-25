local _, Frogtome = ...
if not Frogtome.UI then
	Frogtome.UI = {}
end
if not Frogtome.UI.Pages then
	Frogtome.UI.Pages = {}
end
Frogtome.UI.Pages.Characters = {}

local Characters = Frogtome.Core.Characters
local CharactersPage = Frogtome.UI.Pages.Characters
local Core = Frogtome.Core.Core
local Event = Frogtome.Core.Event
local HiddenSettings = Frogtome.Settings.HiddenSettings
local Log = Frogtome.Misc.Log
local Settings = Frogtome.Settings.Settings
local Strings = Frogtome.UI.Strings
local UI = Frogtome.UI.UI
local UIConfig = Frogtome.UI.UIConfig
local UIData = Frogtome.Data.UIData
local Utils = Frogtome.Misc.Utils

----------------------------------
-- Display Update Functionality --
----------------------------------

function CharactersPage:GetCharacterTooltip(character)
	if not character then
		return Core:GetFullName()
	end
	
	return character.FullName
end

function CharactersPage:GetGuildTooltip(character)
	if not character then
		return Core:GetGuildName()
	end
	
	return character.Guild
end

function CharactersPage:GetSortedProfessionSlots(character)
	local profession1 = character.FirstProfession
	local profession2 = character.SecondProfession
	if not profession1 or (profession1 and profession2 and UIData.ProfessionDisplayOrders[profession1.Name] > UIData.ProfessionDisplayOrders[profession2.Name]) then
		profession1 = character.SecondProfession
		profession2 = character.FirstProfession
	end
	
	return profession1, profession2
end

function CharactersPage:GetProfessionSlot1Tooltip(character)
	local profession, _ = CharactersPage:GetSortedProfessionSlots(character)
	if profession then
		return profession.Name, UIConfig.CHARACTERS_PAGE_LEARNED_PROFESSION_TOOLTIP_COLOR
	else
		return Strings:Get("CHARACTERS_PAGE_UNKNOWN_PROFESSION") .. " " .. Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_TAG"), UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_TOOLTIP_COLOR
	end
end

function CharactersPage:GetProfessionSlot2Tooltip(character)
	local _, profession = CharactersPage:GetSortedProfessionSlots(character)
	if profession then
		return profession.Name, UIConfig.CHARACTERS_PAGE_LEARNED_PROFESSION_TOOLTIP_COLOR
	else
		return Strings:Get("CHARACTERS_PAGE_UNKNOWN_PROFESSION") .. " " .. Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_TAG"), UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_TOOLTIP_COLOR
	end
end

function CharactersPage:GetFishingTooltip(character)
	if character.FishingProfession then
		return Strings:Get("CHARACTERS_PAGE_FISHING_PROFESSION"), UIConfig.CHARACTERS_PAGE_LEARNED_PROFESSION_TOOLTIP_COLOR
	else
		return Strings:Get("CHARACTERS_PAGE_FISHING_PROFESSION") .. " " .. Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_TAG"), UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_TOOLTIP_COLOR
	end
end

function CharactersPage:GetCookingTooltip(character)
	if character.CookingProfession then
		return Strings:Get("CHARACTERS_PAGE_COOKING_PROFESSION"), UIConfig.CHARACTERS_PAGE_LEARNED_PROFESSION_TOOLTIP_COLOR
	else
		return Strings:Get("CHARACTERS_PAGE_COOKING_PROFESSION") .. " " .. Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_TAG"), UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_TOOLTIP_COLOR
	end
end

function CharactersPage:GetFirstAidTooltip(character)
	if character.FirstAidProfession then
		return Strings:Get("CHARACTERS_PAGE_FIRST_AID_PROFESSION"), UIConfig.CHARACTERS_PAGE_LEARNED_PROFESSION_TOOLTIP_COLOR
	else
		return Strings:Get("CHARACTERS_PAGE_FIRST_AID_PROFESSION") .. " " .. Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_TAG"), UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_TOOLTIP_COLOR
	end
end

----------------------------
-- Display Update Process --
----------------------------

function CharactersPage:AddCharacterRow()
	local tableFrame = CharactersPage.Page.ExpandedFrameView.TableFrame
	
	local rowCount = #tableFrame.TableRows
	local rowIndex = rowCount + 1
	local row = {}
	
	row.CharacterIndex = rowIndex
	
	-- General Table Items (always visible)
	
	local generalTableParams = tableFrame.GeneralTableParams
	if not generalTableParams.Rows[rowIndex] and generalTableParams.Rows[rowIndex - 1] then
		UI:SetTableRowParameters(generalTableParams, rowIndex, generalTableParams.Rows[rowIndex - 1].Position - UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE - UIConfig.CHARACTERS_PAGE_LINE_BUFFER, generalTableParams.Rows[rowIndex - 1].Alignment, generalTableParams.Rows[rowIndex - 1].FontSize)
	end
	
	row.CharacterFactionText = UI:CreateTableText(generalTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, rowIndex)
	row.CharacterLevelText = UI:CreateTableText(generalTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, rowIndex)
	row.CharacterNameText = UI:CreateTableText(generalTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, rowIndex)
	UI:ApplyTooltipToWidget(row.CharacterNameText, "ANCHOR_RIGHT", function()
		return CharactersPage:GetCharacterTooltip(Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())[row.CharacterIndex])
	end)

	row.CharacterNameText:SetWidth(UIConfig.CHARACTERS_PAGE_NAME_MAX_WIDTH)
	row.CharacterNameText:SetWordWrap(false)
	row.CharacterNameText:SetJustifyH("LEFT")
	
	-- Info View
	
	local infoTableParams = tableFrame.InfoTableParams
	if not infoTableParams.Rows[rowIndex] and infoTableParams.Rows[rowIndex - 1] then
		UI:SetTableRowParameters(infoTableParams, rowIndex, infoTableParams.Rows[rowIndex - 1].Position - UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE - UIConfig.CHARACTERS_PAGE_LINE_BUFFER, infoTableParams.Rows[rowIndex - 1].Alignment, infoTableParams.Rows[rowIndex - 1].FontSize)
	end
	
	row.CharacterRulesText = UI:CreateTableText(infoTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, rowIndex)
	row.CharacterRulesText:SetShown(CharactersPage.InfoViewActive)
	
	row.CharacterRaceText = UI:CreateTableText(infoTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, rowIndex)
	row.CharacterRaceText:SetShown(CharactersPage.InfoViewActive)
	
	row.CharacterGuildText = UI:CreateTableText(infoTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, rowIndex)
	UI:ApplyTooltipToWidget(row.CharacterGuildText, "ANCHOR_RIGHT", function()
		return CharactersPage:GetGuildTooltip(Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())[row.CharacterIndex])
	end)
	row.CharacterGuildText:SetShown(CharactersPage.InfoViewActive)
	
	row.CharacterGuildText:SetWidth(UIConfig.CHARACTERS_PAGE_GUILD_MAX_WIDTH)
	row.CharacterGuildText:SetWordWrap(false)
	row.CharacterGuildText:SetJustifyH("CENTER")
	
	-- Experience View
	
	local experienceTableParams = tableFrame.ExperienceTableParams
	if not experienceTableParams.Rows[rowIndex] and experienceTableParams.Rows[rowIndex - 1] then
		UI:SetTableRowParameters(experienceTableParams, rowIndex, experienceTableParams.Rows[rowIndex - 1].Position - UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE - UIConfig.CHARACTERS_PAGE_LINE_BUFFER, experienceTableParams.Rows[rowIndex - 1].Alignment, experienceTableParams.Rows[rowIndex - 1].FontSize)
	end
	
	row.CharacterXpPercentageText = UI:CreateTableText(experienceTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, rowIndex)
	row.CharacterXpPercentageText:SetShown(CharactersPage.ExperienceViewActive)
	
	row.CharacterRestCapPercentageText = UI:CreateTableText(experienceTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, rowIndex)
	row.CharacterRestCapPercentageText:SetShown(CharactersPage.ExperienceViewActive)
	
	row.CharacterRestCapTimeText = UI:CreateTableText(experienceTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, rowIndex)
	row.CharacterRestCapTimeText:SetShown(CharactersPage.ExperienceViewActive)
	
	-- Inventory View
	
	local inventoryTableParams = tableFrame.InventoryTableParams
	if not inventoryTableParams.Rows[rowIndex] and inventoryTableParams.Rows[rowIndex - 1] then
		UI:SetTableRowParameters(inventoryTableParams, rowIndex, inventoryTableParams.Rows[rowIndex - 1].Position - UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE - UIConfig.CHARACTERS_PAGE_LINE_BUFFER, inventoryTableParams.Rows[rowIndex - 1].Alignment, inventoryTableParams.Rows[rowIndex - 1].FontSize)
	end
	
	row.CharacterBag1SizeText = UI:CreateTableText(inventoryTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, rowIndex)
	row.CharacterBag1SizeText:SetShown(CharactersPage.InventoryViewActive)
	
	row.CharacterBag2SizeText = UI:CreateTableText(inventoryTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, rowIndex)
	row.CharacterBag2SizeText:SetShown(CharactersPage.InventoryViewActive)
	
	row.CharacterBag3SizeText = UI:CreateTableText(inventoryTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, rowIndex)
	row.CharacterBag3SizeText:SetShown(CharactersPage.InventoryViewActive)
	
	row.CharacterBag4SizeText = UI:CreateTableText(inventoryTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, rowIndex)
	row.CharacterBag4SizeText:SetShown(CharactersPage.InventoryViewActive)
	
	row.CharacterReagentBagSizeText = UI:CreateTableText(inventoryTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 5, rowIndex)
	row.CharacterReagentBagSizeText:SetShown(CharactersPage.InventoryViewActive)
	
	row.CharacterMoneyText = UI:CreateTableText(inventoryTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, rowIndex)
	row.CharacterMoneyText:SetShown(CharactersPage.InventoryViewActive)
	
	-- Profession View
	
	local professionTableParams = tableFrame.ProfessionTableParams
	if not professionTableParams.Rows[rowIndex] and professionTableParams.Rows[rowIndex - 1] then
		UI:SetTableRowParameters(professionTableParams, rowIndex, professionTableParams.Rows[rowIndex - 1].Position - UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE - UIConfig.CHARACTERS_PAGE_LINE_BUFFER, professionTableParams.Rows[rowIndex - 1].Alignment, professionTableParams.Rows[rowIndex - 1].FontSize)
	end
	
	row.CharacterProfession1Icon, row.CharacterProfession1IconTexture = UI:CreateTableTexture(professionTableParams, tableFrame, UIData.ProfessionIcons["Unknown"], UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, 1, rowIndex, 0, 1)
	row.CharacterProfession1Icon:SetShown(CharactersPage.ProfessionViewActive)
	UI:ApplyTooltipToWidget(row.CharacterProfession1Icon, "ANCHOR_RIGHT", function()
		return CharactersPage:GetProfessionSlot1Tooltip(Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())[row.CharacterIndex])
	end)
	
	row.CharacterProfession1SkillText = UI:CreateTableText(professionTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, rowIndex)
	row.CharacterProfession1SkillText:SetShown(CharactersPage.ProfessionViewActive)
	
	row.CharacterProfession2Icon, row.CharacterProfession2IconTexture = UI:CreateTableTexture(professionTableParams, tableFrame, UIData.ProfessionIcons["Unknown"], UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, 3, rowIndex, 0, 1)
	row.CharacterProfession2Icon:SetShown(CharactersPage.ProfessionViewActive)
	UI:ApplyTooltipToWidget(row.CharacterProfession2Icon, "ANCHOR_RIGHT", function()
		return CharactersPage:GetProfessionSlot2Tooltip(Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())[row.CharacterIndex])
	end)
	
	row.CharacterProfession2SkillText = UI:CreateTableText(professionTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, rowIndex)
	row.CharacterProfession2SkillText:SetShown(CharactersPage.ProfessionViewActive)
	
	row.CharacterCookingIcon, row.CharacterCookingIconTexture = UI:CreateTableTexture(professionTableParams, tableFrame, UIData.ProfessionIcons["Cooking"], UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, 5, rowIndex, 0, 1)
	row.CharacterCookingIcon:SetShown(CharactersPage.ProfessionViewActive)
	UI:ApplyTooltipToWidget(row.CharacterCookingIcon, "ANCHOR_RIGHT", function()
		return CharactersPage:GetCookingTooltip(Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())[row.CharacterIndex])
	end)
	
	row.CharacterCookingSkillText = UI:CreateTableText(professionTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, rowIndex)
	row.CharacterCookingSkillText:SetShown(CharactersPage.ProfessionViewActive)
	
	row.CharacterFishingIcon, row.CharacterFishingIconTexture = UI:CreateTableTexture(professionTableParams, tableFrame, UIData.ProfessionIcons["Fishing"], UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, 7, rowIndex, 0, 1)
	row.CharacterFishingIcon:SetShown(CharactersPage.ProfessionViewActive)
	UI:ApplyTooltipToWidget(row.CharacterFishingIcon, "ANCHOR_RIGHT", function()
		return CharactersPage:GetFishingTooltip(Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())[row.CharacterIndex])
	end)
	
	row.CharacterFishingSkillText = UI:CreateTableText(professionTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 8, rowIndex)
	row.CharacterFishingSkillText:SetShown(CharactersPage.ProfessionViewActive)
	
	row.CharacterFirstAidIcon, row.CharacterFirstAidIconTexture = UI:CreateTableTexture(professionTableParams, tableFrame, UIData.ProfessionIcons["First Aid"], UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, UIConfig.CHARACTERS_PAGE_PROFESSION_ICON_RES, 9, rowIndex, 0, 1)
	row.CharacterFirstAidIcon:SetShown(CharactersPage.ProfessionViewActive)
	UI:ApplyTooltipToWidget(row.CharacterFirstAidIcon, "ANCHOR_RIGHT", function()
		return CharactersPage:GetFirstAidTooltip(Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())[row.CharacterIndex])
	end)
	
	row.CharacterFirstAidSkillText = UI:CreateTableText(professionTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 10, rowIndex)
	row.CharacterFirstAidSkillText:SetShown(CharactersPage.ProfessionViewActive)
	
	-- Edit Mode View
	
	local editModeTableParams = tableFrame.EditModeTableParams
	if not editModeTableParams.Rows[rowIndex] and editModeTableParams.Rows[rowIndex - 1] then
		UI:SetTableRowParameters(editModeTableParams, rowIndex, editModeTableParams.Rows[rowIndex - 1].Position - UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE - UIConfig.CHARACTERS_PAGE_LINE_BUFFER, editModeTableParams.Rows[rowIndex - 1].Alignment, editModeTableParams.Rows[rowIndex - 1].FontSize)
	end
	
	-- It SHOULD be fine to hook up these functions here; this create-row function shouldn't be called until these functions have been initialized
	row.CharacterMoveUpButton = UI:CreateTableButton(editModeTableParams, tableFrame, Strings:Get("CHARACTERS_PAGE_EDIT_MODE_MOVE_UP_BUTTON"), UIConfig.CHARACTERS_PAGE_EDIT_MODE_MOVE_BUTTON_WIDTH, UIConfig.CHARACTERS_PAGE_EDIT_MODE_BUTTON_HEIGHT, function()
		CharactersPage:MoveCharacterUp(row.CharacterIndex)
	end, 1, rowIndex, 0, UIConfig.CHARACTERS_PAGE_EDIT_MODE_BUTTON_OFFSET_Y)
	row.CharacterMoveUpButton:SetShown(CharactersPage.EditModeViewActive)
	
	row.CharacterMoveDownButton = UI:CreateTableButton(editModeTableParams, tableFrame, Strings:Get("CHARACTERS_PAGE_EDIT_MODE_MOVE_DOWN_BUTTON"), UIConfig.CHARACTERS_PAGE_EDIT_MODE_MOVE_BUTTON_WIDTH, UIConfig.CHARACTERS_PAGE_EDIT_MODE_BUTTON_HEIGHT, function()
		CharactersPage:MoveCharacterDown(row.CharacterIndex)
	end, 2, rowIndex, 0, UIConfig.CHARACTERS_PAGE_EDIT_MODE_BUTTON_OFFSET_Y)
	row.CharacterMoveDownButton:SetShown(CharactersPage.EditModeViewActive)
	
	row.CharacterGuidText = UI:CreateTableText(editModeTableParams, tableFrame, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, rowIndex)
	row.CharacterGuidText:SetShown(CharactersPage.EditModeViewActive)
	
	row.CharacterRemoveButton = UI:CreateTableButton(editModeTableParams, tableFrame, Strings:Get("CHARACTERS_PAGE_EDIT_MODE_DELETE_BUTTON"), UIConfig.CHARACTERS_PAGE_EDIT_MODE_DELETE_BUTTON_WIDTH, UIConfig.CHARACTERS_PAGE_EDIT_MODE_BUTTON_HEIGHT, function()
		CharactersPage:RemoveCharacter(row.CharacterIndex)
	end, 4, rowIndex, 0, UIConfig.CHARACTERS_PAGE_EDIT_MODE_BUTTON_OFFSET_Y)
	row.CharacterRemoveButton:SetShown(CharactersPage.EditModeViewActive)
	
	-- Attach the created row to our list of all rows
	
	tableFrame.TableRows[rowIndex] = row
end

function CharactersPage:DeleteCharacterRow()
	local tableFrame = CharactersPage.Page.ExpandedFrameView.TableFrame
	
	-- We're always deleting the last row; everything else should have been adjusted already
	local rowCount = #tableFrame.TableRows
	local row = tableFrame.TableRows[rowCount]
	
	UI:DestroyWidget(row.CharacterFactionText)
	UI:DestroyWidget(row.CharacterLevelText)
	UI:DestroyWidget(row.CharacterNameText)
	
	UI:DestroyWidget(row.CharacterRulesText)
	UI:DestroyWidget(row.CharacterRaceText)
	UI:DestroyWidget(row.CharacterGuildText)
	
	UI:DestroyWidget(row.CharacterXpPercentageText)
	UI:DestroyWidget(row.CharacterRestCapPercentageText)
	UI:DestroyWidget(row.CharacterRestCapTimeText)
	
	UI:DestroyWidget(row.CharacterBag1SizeText)
	UI:DestroyWidget(row.CharacterBag2SizeText)
	UI:DestroyWidget(row.CharacterBag3SizeText)
	UI:DestroyWidget(row.CharacterBag4SizeText)
	UI:DestroyWidget(row.CharacterReagentBagSizeText)
	UI:DestroyWidget(row.CharacterMoneyText)
	
	UI:DestroyWidget(row.CharacterProfession1Icon)
	UI:DestroyWidget(row.CharacterProfession1SkillText)
	UI:DestroyWidget(row.CharacterProfession2Icon)
	UI:DestroyWidget(row.CharacterProfession2SkillText)
	UI:DestroyWidget(row.CharacterCookingIcon)
	UI:DestroyWidget(row.CharacterCookingSkillText)
	UI:DestroyWidget(row.CharacterFishingIcon)
	UI:DestroyWidget(row.CharacterFishingSkillText)
	UI:DestroyWidget(row.CharacterFirstAidIcon)
	UI:DestroyWidget(row.CharacterFirstAidSkillText)
	
	UI:DestroyWidget(row.CharacterMoveUpButton)
	UI:DestroyWidget(row.CharacterMoveDownButton)
	UI:DestroyWidget(row.CharacterGuidText)
	UI:DestroyWidget(row.CharacterRemoveButton)
	
	tableFrame.TableRows[rowCount] = nil
end

function CharactersPage:UpdateExpandedFrameView()
	local currentTimeSeconds = time()
	local characters = Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())
	local rows = CharactersPage.Page.ExpandedFrameView.TableFrame.TableRows
	
	while #characters > #rows do
		CharactersPage:AddCharacterRow()
	end
	
	while #rows > #characters do
		-- TODO: This may cause some severe memory leaks depending on how often GC runs
		CharactersPage:DeleteCharacterRow()
	end
	
	-- NOW, update all graphics
	
	for rowIndex, character in ipairs(characters) do
		local row = rows[rowIndex]
		
		-- Faction
		
		if character.Faction == "Alliance" then
			row.CharacterFactionText:SetText(Strings:Get("CHARACTERS_PAGE_ALLIANCE_SHORTHAND"))
		elseif character.Faction == "Horde" then
			row.CharacterFactionText:SetText(Strings:Get("CHARACTERS_PAGE_HORDE_SHORTHAND"))
		end
		
		if Settings:IsShowingFactionColorsByAllegianceInCharactersPage() then
			if (Core:GetFactionDataString() == "Alliance" and character.Faction == "Alliance") or (Core:GetFactionDataString() == "Horde" and character.Faction == "Horde") then
				UI:ApplyTextWidgetFont(row.CharacterFactionText, UIConfig.GLOBAL_FRIENDLY_COLOR)
			elseif (Core:GetFactionDataString() == "Alliance" and character.Faction ~= "Alliance") or (Core:GetFactionDataString() == "Horde" and character.Faction ~= "Horde") then
				UI:ApplyTextWidgetFont(row.CharacterFactionText, UIConfig.GLOBAL_UNFRIENDLY_COLOR)
			end
		else
			if character.Faction == "Alliance" then
				UI:ApplyTextWidgetFont(row.CharacterFactionText, UIConfig.GLOBAL_ALLIANCE_COLOR)
			elseif character.Faction == "Horde" then
				UI:ApplyTextWidgetFont(row.CharacterFactionText, UIConfig.GLOBAL_HORDE_COLOR)
			end
		end
		
		-- Level
		
		row.CharacterLevelText:SetText(character.Level)
		
		-- Name (and Class)
		
		row.CharacterNameText:SetText(character.FullName)
		UI:ApplyTextWidgetFont(row.CharacterNameText, UIData.ClassColors[character.Class])
		
		-- Info
		
		if character.Rules then
			row.CharacterRulesText:SetText(character.Rules)
			UI:ApplyTextWidgetFont(row.CharacterRulesText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterRulesText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_RULES"))
			UI:ApplyTextWidgetFont(row.CharacterRulesText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		row.CharacterRaceText:SetText(character.Race)
		
		if character.Guild then
			row.CharacterGuildText:SetText(character.Guild)
			UI:ApplyTextWidgetFont(row.CharacterGuildText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterGuildText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_GUILD"))
			UI:ApplyTextWidgetFont(row.CharacterGuildText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		-- Experience
		
		if character.Level < Core:GetMaxLevel() then
			if character.CurrentXp then
				local xpPercentage = Utils:PercentageString(character.CurrentXp, character.NeededXp, 0)
				row.CharacterXpPercentageText:SetText(xpPercentage)
			else
				row.CharacterXpPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_XP"))
			end
			
			-- On initial load, this fraction can be undefined (needed XP can be 0)
			if character.RestedXp and character.NeededXp and character.NeededXp > 0 then
				local restedCapRemainingFraction = 1 - Utils:Fraction(character.RestedXp, character.NeededXp * 1.5)
				if restedCapRemainingFraction < 0 then
					-- This can happen due to Legacy Talents in WoWF. Right now there seems to be now way to get the info to
					-- properly handle it, so at least for now just resort to gracefully-ish reporing about it.
					row.CharacterRestCapPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_CURRENT_RESTED_OVERCAPPED"))
					UI:ApplyTextWidgetFont(row.CharacterRestCapPercentageText, UIConfig.CHARACTERS_PAGE_RESTED_OVERCAP_COLOR)
				elseif restedCapRemainingFraction == 0 then
					row.CharacterRestCapPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_CURRENT_RESTED_CAPPED"))
					UI:ApplyTextWidgetFont(row.CharacterRestCapPercentageText, UIConfig.CHARACTERS_PAGE_RESTED_CAP_COLOR)
				else
					row.CharacterRestCapPercentageText:SetText(Utils:PercentageString(character.RestedXp, character.NeededXp * 1.5, 0))
					UI:ApplyTextWidgetFont(row.CharacterRestCapPercentageText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
				end
				
				local restedCapTimeHours
				if character.IsResting then
					restedCapTimeHours = restedCapRemainingFraction * 240
				else
					restedCapTimeHours = restedCapRemainingFraction * 960
				end
				
				local currentTimeHours = (currentTimeSeconds - character.Timestamp) / 60 / 60
				restedCapTimeHours = restedCapTimeHours - currentTimeHours
				if restedCapTimeHours > 0 then
					if restedCapTimeHours % 1 ~= 0 then
						restedCapTimeHours = math.floor(restedCapTimeHours + 1)
					end
					
					local restedCapTimeDays = math.floor(restedCapTimeHours / 24)
					restedCapTimeHours = restedCapTimeHours % 24
					
					local restedCapTimeString
					if restedCapTimeHours == 1 then
						restedCapTimeString = tostring(restedCapTimeHours) .. " " .. Strings:Get("CHARACTERS_PAGE_EST_RESTED_HOURS_SINGULAR")
					else
						restedCapTimeString = tostring(restedCapTimeHours) .. " " .. Strings:Get("CHARACTERS_PAGE_EST_RESTED_HOURS_PLURAL")
					end
					
					if restedCapTimeDays > 0 then
						if restedCapTimeDays == 1 then
							restedCapTimeString = tostring(restedCapTimeDays) .. " " .. Strings:Get("CHARACTERS_PAGE_EST_RESTED_DAYS_SINGULAR") .. " " .. restedCapTimeString
						else
							restedCapTimeString = tostring(restedCapTimeDays) .. " " .. Strings:Get("CHARACTERS_PAGE_EST_RESTED_DAYS_PLURAL") .. " " .. restedCapTimeString
						end
					end
					
					row.CharacterRestCapTimeText:SetText(restedCapTimeString)
					
					if character.IsResting then
						UI:ApplyTextWidgetFont(row.CharacterRestCapTimeText, UIConfig.GLOBAL_RESTED_EXP_COLOR)
					else
						UI:ApplyTextWidgetFont(row.CharacterRestCapTimeText, UIConfig.GLOBAL_EXP_COLOR)
					end
				else
					row.CharacterRestCapTimeText:SetText(Strings:Get("CHARACTERS_PAGE_EST_RESTED_CAPPED"))
					UI:ApplyTextWidgetFont(row.CharacterRestCapTimeText, UIConfig.CHARACTERS_PAGE_RESTED_CAP_COLOR)
				end
			else
				row.CharacterRestCapPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_XP"))
				UI:ApplyTextWidgetFont(row.CharacterRestCapPercentageText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
				
				row.CharacterRestCapTimeText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_XP"))
				UI:ApplyTextWidgetFont(row.CharacterRestCapTimeText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
			end
		else
			row.CharacterXpPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_MAX_LEVEL"))
			UI:ApplyTextWidgetFont(row.CharacterXpPercentageText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
			
			row.CharacterRestCapPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_MAX_LEVEL"))
			UI:ApplyTextWidgetFont(row.CharacterRestCapPercentageText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
			
			row.CharacterRestCapTimeText:SetText(Strings:Get("CHARACTERS_PAGE_MAX_LEVEL"))
			UI:ApplyTextWidgetFont(row.CharacterRestCapTimeText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		-- Inventory
		
		if character.Inventory.Bag1 and character.Inventory.Bag1 > 0 then
			row.CharacterBag1SizeText:SetText(character.Inventory.Bag1)
			UI:ApplyTextWidgetFont(row.CharacterBag1SizeText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterBag1SizeText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_BAG"))
			UI:ApplyTextWidgetFont(row.CharacterBag1SizeText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		if character.Inventory.Bag2 and character.Inventory.Bag2 > 0 then
			row.CharacterBag2SizeText:SetText(character.Inventory.Bag2)
			UI:ApplyTextWidgetFont(row.CharacterBag2SizeText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterBag2SizeText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_BAG"))
			UI:ApplyTextWidgetFont(row.CharacterBag2SizeText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		if character.Inventory.Bag3 and character.Inventory.Bag3 > 0 then
			row.CharacterBag3SizeText:SetText(character.Inventory.Bag3)
			UI:ApplyTextWidgetFont(row.CharacterBag3SizeText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterBag3SizeText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_BAG"))
			UI:ApplyTextWidgetFont(row.CharacterBag3SizeText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		if character.Inventory.Bag4 and character.Inventory.Bag4 > 0 then
			row.CharacterBag4SizeText:SetText(character.Inventory.Bag4)
			UI:ApplyTextWidgetFont(row.CharacterBag4SizeText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterBag4SizeText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_BAG"))
			UI:ApplyTextWidgetFont(row.CharacterBag4SizeText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		if character.Inventory.ReagentBag and character.Inventory.ReagentBag > 0 then
			row.CharacterReagentBagSizeText:SetText(character.Inventory.ReagentBag)
			UI:ApplyTextWidgetFont(row.CharacterReagentBagSizeText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterReagentBagSizeText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_BAG"))
			UI:ApplyTextWidgetFont(row.CharacterReagentBagSizeText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		-- Money
		
		row.CharacterMoneyText:SetText(Utils:CopperToCoinString(character.Money))
		
		-- Primary Professions
		
		local profession1, profession2 = CharactersPage:GetSortedProfessionSlots(character)
		
		if profession1 then
			row.CharacterProfession1IconTexture:SetTexture(UIData.ProfessionIcons[profession1.Name])
			row.CharacterProfession1IconTexture:SetAlpha(1)
			row.CharacterProfession1SkillText:SetText(profession1.CurrentSkill)
			UI:ApplyTextWidgetFont(row.CharacterProfession1SkillText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterProfession1IconTexture:SetTexture(UIData.ProfessionIcons["Unknown"])
			row.CharacterProfession1IconTexture:SetAlpha(UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_ALPHA)
			row.CharacterProfession1SkillText:SetText(Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_SKILL"))
			UI:ApplyTextWidgetFont(row.CharacterProfession1SkillText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		if profession2 then
			row.CharacterProfession2IconTexture:SetTexture(UIData.ProfessionIcons[profession2.Name])
			row.CharacterProfession2IconTexture:SetAlpha(1)
			row.CharacterProfession2SkillText:SetText(profession2.CurrentSkill)
			UI:ApplyTextWidgetFont(row.CharacterProfession2SkillText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterProfession2IconTexture:SetTexture(UIData.ProfessionIcons["Unknown"])
			row.CharacterProfession2IconTexture:SetAlpha(UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_ALPHA)
			row.CharacterProfession2SkillText:SetText(Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_SKILL"))
			UI:ApplyTextWidgetFont(row.CharacterProfession2SkillText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		-- Secondary Professions
		
		if character.CookingProfession then
			row.CharacterCookingIconTexture:SetAlpha(1)
			row.CharacterCookingSkillText:SetText(character.CookingProfession.CurrentSkill)
			UI:ApplyTextWidgetFont(row.CharacterCookingSkillText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterCookingIconTexture:SetAlpha(UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_ALPHA)
			row.CharacterCookingSkillText:SetText(Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_SKILL"))
			UI:ApplyTextWidgetFont(row.CharacterCookingSkillText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		if character.FishingProfession then
			row.CharacterFishingIconTexture:SetAlpha(1)
			row.CharacterFishingSkillText:SetText(character.FishingProfession.CurrentSkill)
			UI:ApplyTextWidgetFont(row.CharacterFishingSkillText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterFishingIconTexture:SetAlpha(UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_ALPHA)
			row.CharacterFishingSkillText:SetText(Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_SKILL"))
			UI:ApplyTextWidgetFont(row.CharacterFishingSkillText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
		
		if character.FirstAidProfession then
			row.CharacterFirstAidIconTexture:SetAlpha(1)
			row.CharacterFirstAidSkillText:SetText(character.FirstAidProfession.CurrentSkill)
			UI:ApplyTextWidgetFont(row.CharacterFirstAidSkillText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
		else
			row.CharacterFirstAidIconTexture:SetAlpha(UIConfig.CHARACTERS_PAGE_UNLEARNED_PROFESSION_ALPHA)
			row.CharacterFirstAidSkillText:SetText(Strings:Get("CHARACTERS_PAGE_UNLEARNED_PROFESSION_SKILL"))
			UI:ApplyTextWidgetFont(row.CharacterFirstAidSkillText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
	
	-- Edit Mode
		row.CharacterMoveUpButton:SetEnabled(rowIndex > 1)
		
		row.CharacterMoveDownButton:SetEnabled(rowIndex < #rows)
		
		row.CharacterGuidText:SetText(string.sub(character.GUID, 8))
		UI:ApplyTextWidgetFont(row.CharacterGuidText, UIData.ClassColors[character.Class])
		
		row.CharacterRemoveButton:SetEnabled(character.GUID ~= Core:GetGUID())
	end
	
	-- Update the sizing of the table panel
	
	local newHeight = #rows * UIConfig.CHARACTERS_PAGE_LINE_BUFFER
	CharactersPage.Page.ExpandedFrameView.TableFrame:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH - UIConfig.CHARACTERS_PAGE_SCROLL_FRAME_SCROLLBAR_BUFFER, newHeight)
end

function CharactersPage:UpdateCondensedFrameView()
	local currentTimeSeconds = time()
	local character = Characters:GetCharacter(Core:GetGUID())
	
	-- This update might be before the first character info package is written, in the case of a new character
	if not character then
		return
	end
	
	-- Faction
	
	if character.Faction == "Alliance" then
		CharactersPage.Page.CondensedFrameView.CharacterFactionText:SetText(Strings:Get("CHARACTERS_PAGE_ALLIANCE_SHORTHAND"))
	elseif character.Faction == "Horde" then
		CharactersPage.Page.CondensedFrameView.CharacterFactionText:SetText(Strings:Get("CHARACTERS_PAGE_HORDE_SHORTHAND"))
	end
	
	if Settings:IsShowingFactionColorsByAllegianceInCharactersPage() then
		if (Core:GetFactionDataString() == "Alliance" and character.Faction == "Alliance") or (Core:GetFactionDataString() == "Horde" and character.Faction == "Horde") then
			UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterFactionText, UIConfig.GLOBAL_FRIENDLY_COLOR)
		elseif (Core:GetFactionDataString() == "Alliance" and character.Faction ~= "Alliance") or (Core:GetFactionDataString() == "Horde" and character.Faction ~= "Horde") then
			UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterFactionText, UIConfig.GLOBAL_UNFRIENDLY_COLOR)
		end
	else
		if character.Faction == "Alliance" then
			UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterFactionText, UIConfig.GLOBAL_ALLIANCE_COLOR)
		elseif character.Faction == "Horde" then
			UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterFactionText, UIConfig.GLOBAL_HORDE_COLOR)
		end
	end
	
	-- Level
	
	CharactersPage.Page.CondensedFrameView.CharacterLevelText:SetText(character.Level)
	
	-- Name (and Class)
	
	CharactersPage.Page.CondensedFrameView.CharacterNameText:SetText(character.FullName)
	UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterNameText, UIData.ClassColors[character.Class])
	
	-- Experience
	
	if character.Level < Core:GetMaxLevel() then
		if character.CurrentXp then
			local xpPercentage = Utils:PercentageString(character.CurrentXp, character.NeededXp, 0)
			CharactersPage.Page.CondensedFrameView.CharacterXpPercentageText:SetText(xpPercentage)
		else
			CharactersPage.Page.CondensedFrameView.CharacterXpPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_XP"))
		end
		
		-- On initial load, this fraction can be undefined (needed XP can be 0)
		if character.RestedXp and character.NeededXp and character.NeededXp > 0 then
			local restedCapRemainingFraction = 1 - Utils:Fraction(character.RestedXp, character.NeededXp * 1.5)
			if restedCapRemainingFraction < 0 then
				-- This can happen due to Legacy Talents in WoWF. Right now there seems to be now way to get the info to
				-- properly handle it, so at least for now just resort to gracefully-ish reporing about it.
				CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_CURRENT_RESTED_OVERCAPPED"))
				UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText, UIConfig.CHARACTERS_PAGE_RESTED_OVERCAP_COLOR)
			elseif restedCapRemainingFraction == 0 then
				CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_CURRENT_RESTED_CAPPED"))
				UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText, UIConfig.CHARACTERS_PAGE_RESTED_CAP_COLOR)
			else
				CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText:SetText(Utils:PercentageString(character.RestedXp, character.NeededXp * 1.5, 0))
				UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
			end
			
			local restedCapTimeHours
			if character.IsResting then
				restedCapTimeHours = restedCapRemainingFraction * 240
			else
				restedCapTimeHours = restedCapRemainingFraction * 960
			end
			
			local currentTimeHours = (currentTimeSeconds - character.Timestamp) / 60 / 60
			restedCapTimeHours = restedCapTimeHours - currentTimeHours
			if restedCapTimeHours > 0 then
				if restedCapTimeHours % 1 ~= 0 then
					restedCapTimeHours = math.floor(restedCapTimeHours + 1)
				end
				
				local restedCapTimeDays = math.floor(restedCapTimeHours / 24)
				restedCapTimeHours = restedCapTimeHours % 24
				
				local restedCapTimeString
				if restedCapTimeHours == 1 then
					restedCapTimeString = tostring(restedCapTimeHours) .. " " .. Strings:Get("CHARACTERS_PAGE_EST_RESTED_HOURS_SINGULAR")
				else
					restedCapTimeString = tostring(restedCapTimeHours) .. " " .. Strings:Get("CHARACTERS_PAGE_EST_RESTED_HOURS_PLURAL")
				end
				
				if restedCapTimeDays > 0 then
					if restedCapTimeDays == 1 then
						restedCapTimeString = tostring(restedCapTimeDays) .. " " .. Strings:Get("CHARACTERS_PAGE_EST_RESTED_DAYS_SINGULAR") .. " " .. restedCapTimeString
					else
						restedCapTimeString = tostring(restedCapTimeDays) .. " " .. Strings:Get("CHARACTERS_PAGE_EST_RESTED_DAYS_PLURAL") .. " " .. restedCapTimeString
					end
				end
				
				CharactersPage.Page.CondensedFrameView.CharacterRestCapTimeText:SetText(restedCapTimeString)
				
				if character.IsResting then
					UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapTimeText, UIConfig.GLOBAL_EXP_COLOR)
				else
					UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapTimeText, UIConfig.GLOBAL_DATA_TEXT_COLOR)
				end
			else
				CharactersPage.Page.CondensedFrameView.CharacterRestCapTimeText:SetText(Strings:Get("CHARACTERS_PAGE_EST_RESTED_CAPPED"))
				UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapTimeText, UIConfig.CHARACTERS_PAGE_RESTED_CAP_COLOR)
			end
		else
			CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_XP"))
			UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
			
			CharactersPage.Page.CondensedFrameView.CharacterRestCapTimeText:SetText(Strings:Get("CHARACTERS_PAGE_UNKNOWN_XP"))
			UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapTimeText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		end
	else
		CharactersPage.Page.CondensedFrameView.CharacterXpPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_MAX_LEVEL"))
		UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterXpPercentageText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		
		CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText:SetText(Strings:Get("CHARACTERS_PAGE_MAX_LEVEL"))
		UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapPercentageText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
		
		CharactersPage.Page.CondensedFrameView.CharacterRestCapTimeText:SetText(Strings:Get("CHARACTERS_PAGE_MAX_LEVEL"))
		UI:ApplyTextWidgetFont(CharactersPage.Page.CondensedFrameView.CharacterRestCapTimeText, UIConfig.GLOBAL_DISABLED_DATA_TEXT_COLOR)
	end
end

function CharactersPage:UpdateDisplay(force)
	if not force and not CharactersPage.Page:IsVisible() then
		return
	end
	
	if force or CharactersPage.Page.ExpandedFrameView:IsVisible() then
		CharactersPage:UpdateExpandedFrameView()
	end
	if force or CharactersPage.Page.CondensedFrameView:IsVisible() then
		CharactersPage:UpdateCondensedFrameView()
	end
end

----------------------------------
-- Display Update Functionality --
----------------------------------

function CharactersPage:SwapCharacterOrdersAtIndexes(index1, index2)
	local characters = Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())
	local character1 = characters[index1]
	local character2 = characters[index2]
	
	Characters:SwapCharacterOrders(character1, character2)
end

function CharactersPage:MoveCharacterUp(index)
	if index > 1 then
		CharactersPage:SwapCharacterOrdersAtIndexes(index, index - 1)
	end
	
	CharactersPage:UpdateDisplay()
end

function CharactersPage:MoveCharacterDown(index)
	if index < #CharactersPage.Page.ExpandedFrameView.TableFrame.TableRows then
		CharactersPage:SwapCharacterOrdersAtIndexes(index, index + 1)
	end
	
	CharactersPage:UpdateDisplay()
end

function CharactersPage:RemoveCharacter(index)
	local characters = Characters:GetSortedCharacters(Settings:IsShowingRealmCharactersOnlyInCharactersPage())
	local character = characters[index]
	
	Characters:RemoveCharacter(character.GUID)
	
	CharactersPage:DeleteCharacterRow(CharactersPage.Page.ExpandedFrameView.TableFrame)
	CharactersPage:UpdateDisplay()
end

function CharactersPage:SetInfoViewActive(active)
	CharactersPage.InfoViewActive = active
	
	CharactersPage.Page.ExpandedFrameView.InfoViewRulesHeaderText:SetShown(active)
	CharactersPage.Page.ExpandedFrameView.InfoViewRaceHeaderText:SetShown(active)
	CharactersPage.Page.ExpandedFrameView.InfoViewGuildHeaderText:SetShown(active)
	
	for _, row in ipairs(CharactersPage.Page.ExpandedFrameView.TableFrame.TableRows) do
		row.CharacterRulesText:SetShown(active)
		row.CharacterRaceText:SetShown(active)
		row.CharacterGuildText:SetShown(active)
	end
end

function CharactersPage:SetExperienceViewActive(active)
	CharactersPage.ExperienceViewActive = active
	
	CharactersPage.Page.ExpandedFrameView.ExperienceViewPercentageHeaderText:SetShown(active)
	CharactersPage.Page.ExpandedFrameView.ExperienceViewRestedCapPercentageHeaderText:SetShown(active)
	CharactersPage.Page.ExpandedFrameView.ExperienceViewRestedCapTimeHeaderText:SetShown(active)
	
	for _, row in ipairs(CharactersPage.Page.ExpandedFrameView.TableFrame.TableRows) do
		row.CharacterXpPercentageText:SetShown(active)
		row.CharacterRestCapPercentageText:SetShown(active)
		row.CharacterRestCapTimeText:SetShown(active)
	end
end

function CharactersPage:SetInventoryViewActive(active)
	CharactersPage.InventoryViewActive = active
	
	CharactersPage.Page.ExpandedFrameView.InventoryViewBagHeaderText:SetShown(active)
	CharactersPage.Page.ExpandedFrameView.InventoryViewMoneyHeaderText:SetShown(active)
	
	for _, row in ipairs(CharactersPage.Page.ExpandedFrameView.TableFrame.TableRows) do
		row.CharacterBag1SizeText:SetShown(active)
		row.CharacterBag2SizeText:SetShown(active)
		row.CharacterBag3SizeText:SetShown(active)
		row.CharacterBag4SizeText:SetShown(active)
		row.CharacterReagentBagSizeText:SetShown(active)
		row.CharacterMoneyText:SetShown(active)
	end
end

function CharactersPage:SetProfessionViewActive(active)
	CharactersPage.ProfessionViewActive = active
	
	CharactersPage.Page.ExpandedFrameView.ProfessionViewProfessionHeaderText:SetShown(active)
	
	for _, row in ipairs(CharactersPage.Page.ExpandedFrameView.TableFrame.TableRows) do
		row.CharacterProfession1Icon:SetShown(active)
		row.CharacterProfession1SkillText:SetShown(active)
		row.CharacterProfession2Icon:SetShown(active)
		row.CharacterProfession2SkillText:SetShown(active)
		row.CharacterCookingIcon:SetShown(active)
		row.CharacterCookingSkillText:SetShown(active)
		row.CharacterFishingIcon:SetShown(active)
		row.CharacterFishingSkillText:SetShown(active)
		row.CharacterFirstAidIcon:SetShown(active)
		row.CharacterFirstAidSkillText:SetShown(active)
	end
end

function CharactersPage:SetEditModeViewActive(active)
	CharactersPage.EditModeViewActive = active
	
	CharactersPage.Page.ExpandedFrameView.EditModeViewOrderHeaderText:SetShown(active)
	CharactersPage.Page.ExpandedFrameView.EditModeViewTrackingHeaderText:SetShown(active)
	
	for _, row in ipairs(CharactersPage.Page.ExpandedFrameView.TableFrame.TableRows) do
		row.CharacterMoveUpButton:SetShown(active)
		row.CharacterMoveDownButton:SetShown(active)
		row.CharacterGuidText:SetShown(active)
		row.CharacterRemoveButton:SetShown(active)
	end
end

function CharactersPage:SelectView(viewId)
	CharactersPage.Page.ExpandedFrameView.InfoViewButton:UnlockHighlight()
	CharactersPage.Page.ExpandedFrameView.ExperienceViewButton:UnlockHighlight()
	CharactersPage.Page.ExpandedFrameView.InventoryViewButton:UnlockHighlight()
	CharactersPage.Page.ExpandedFrameView.ProfessionViewButton:UnlockHighlight()
	CharactersPage.Page.ExpandedFrameView.EditModeViewButton:UnlockHighlight()
	if viewId then
		if viewId == 1 then
			CharactersPage.Page.ExpandedFrameView.InfoViewButton:LockHighlight()
		elseif viewId == 2 then
			CharactersPage.Page.ExpandedFrameView.ExperienceViewButton:LockHighlight()
		elseif viewId == 3 then
			CharactersPage.Page.ExpandedFrameView.InventoryViewButton:LockHighlight()
		elseif viewId == 4 then
			CharactersPage.Page.ExpandedFrameView.ProfessionViewButton:LockHighlight()
		elseif viewId == -1 then
			CharactersPage.Page.ExpandedFrameView.EditModeViewButton:LockHighlight()
		end
	end
	
	CharactersPage:SetInfoViewActive(viewId and viewId == 1)
	CharactersPage:SetExperienceViewActive(viewId and viewId == 2)
	CharactersPage:SetInventoryViewActive(viewId and viewId == 3)
	CharactersPage:SetProfessionViewActive(viewId and viewId == 4)
	CharactersPage:SetEditModeViewActive(viewId and viewId == -1)
	
	HiddenSettings:SetCharacterPageLastShownView(viewId)
	CharactersPage.CurrentViewId = viewId
end

------------------------
-- Listener Functions --
------------------------

function CharactersPage:OnExpandedFrameViewShown()
	CharactersPage:UpdateDisplay(true)
end

function CharactersPage:OnCondensedFrameViewShown()
	CharactersPage:UpdateDisplay(true)
end

function CharactersPage:OnPageShown()
	CharactersPage.CurrentViewId = HiddenSettings:GetCharacterPageLastShownView()
	
	CharactersPage:SelectView(CharactersPage.CurrentViewId)
	
	Characters:UpdateCurrentCharacter()
	CharactersPage:UpdateDisplay(true)
end

function CharactersPage:OnPageHidden()
	-- TODO
end

function CharactersPage:OnInfoViewButtonClicked()
	CharactersPage:SelectView(1)
end

function CharactersPage:OnExperienceViewButtonClicked()
	CharactersPage:SelectView(2)
end

function CharactersPage:OnInventoryViewButtonClicked()
	CharactersPage:SelectView(3)
end

function CharactersPage:OnProfessionViewButtonClicked()
	CharactersPage:SelectView(4)
end

function CharactersPage:OnEditModeViewButtonClicked()
	CharactersPage:SelectView(-1)
end

function CharactersPage:OnCharacterUpdateEvent()
	Characters:UpdateCurrentCharacter()
	CharactersPage:UpdateDisplay()
end

-----------------------
-- Page Construction --
-----------------------

function CharactersPage:BuildExpandedFrameView(page)
	local view = UI:CreateExpandedView(page)
	
	-- Content
	
	local tableScrollFrame = CreateFrame("ScrollFrame", nil, view, "UIPanelScrollFrameTemplate")
	tableScrollFrame:SetPoint("TOPLEFT", view, "TOPLEFT", UIConfig.CHARACTERS_PAGE_SCROLL_FRAME_INSET_LEFT, -UIConfig.CHARACTERS_PAGE_SCROLL_FRAME_INSET_TOP)
	tableScrollFrame:SetPoint("BOTTOMRIGHT", view, "BOTTOMRIGHT", -UIConfig.CHARACTERS_PAGE_SCROLL_FRAME_INSET_RIGHT, UIConfig.CHARACTERS_PAGE_SCROLL_FRAME_INSET_BOTTOM)
	view.TableScrollFrame = tableScrollFrame
	
	local tableFrame = CreateFrame("Frame", nil, tableScrollFrame)
	tableFrame:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH - UIConfig.CHARACTERS_PAGE_SCROLL_FRAME_SCROLLBAR_BUFFER, 200)
	tableFrame:SetPoint("TOP", tableScrollFrame, "TOP", 0, 0)
	tableScrollFrame:SetScrollChild(tableFrame)
	view.TableFrame = tableFrame
	
	-- Column Headers
	
	UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_FACTION_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_FACTION_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_LEVEL_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_LEVEL_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_NAME_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_NAME_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	
	view.InfoViewRulesHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_RULES_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_RULES_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.InfoViewRaceHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_RACE_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_RACE_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.InfoViewGuildHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_GUILD_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_GUILD_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	
	view.ExperienceViewPercentageHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_EXP_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_EXP_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.ExperienceViewRestedCapPercentageHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_CURRENT_RESTED_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_CURRENT_RESTED_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.ExperienceViewRestedCapTimeHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_EST_RESTED_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_EST_RESTED_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	
	view.InventoryViewBagHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_BAGS_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_BAGS_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.InventoryViewMoneyHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_MONEY_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_MONEY_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	
	view.ProfessionViewProfessionHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_PROFESSIONS_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_PROFESSIONS_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	
	view.EditModeViewOrderHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_CHANGE_ORDER_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_CHANGE_ORDER_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.EditModeViewTrackingHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_GUID_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_GUID_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	
	-- Table Parameters
	
	local generalTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(generalTableParams, 1, UIConfig.CHARACTERS_PAGE_BASIC_INFO_COL_1_X, "TOP", nil, false)
	UI:SetTableColumnParameters(generalTableParams, 2, UIConfig.CHARACTERS_PAGE_BASIC_INFO_COL_2_X, "TOP", nil, false)
	UI:SetTableColumnParameters(generalTableParams, 3, UIConfig.CHARACTERS_PAGE_BASIC_INFO_COL_3_X, "TOPLEFT", nil, false)
	UI:SetTableRowParameters(generalTableParams, 1, UIConfig.CHARACTERS_PAGE_TABLE_START_OFFSET_Y, nil, UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE)
	tableFrame.GeneralTableParams = generalTableParams
	
	local infoTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(infoTableParams, 1, UIConfig.CHARACTERS_PAGE_INFORMATION_COL_1_X, "TOP", nil, false)
	UI:SetTableColumnParameters(infoTableParams, 2, UIConfig.CHARACTERS_PAGE_INFORMATION_COL_2_X, "TOP", nil, false)
	UI:SetTableColumnParameters(infoTableParams, 3, UIConfig.CHARACTERS_PAGE_INFORMATION_COL_3_X, "TOP", nil, false)
	UI:SetTableRowParameters(infoTableParams, 1, UIConfig.CHARACTERS_PAGE_TABLE_START_OFFSET_Y, nil, UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE)
	tableFrame.InfoTableParams = infoTableParams
	
	local experienceTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(experienceTableParams, 1, UIConfig.CHARACTERS_PAGE_EXPERIENCE_COL_1_X, "TOP", nil, false)
	UI:SetTableColumnParameters(experienceTableParams, 2, UIConfig.CHARACTERS_PAGE_EXPERIENCE_COL_2_X, "TOP", nil, false)
	UI:SetTableColumnParameters(experienceTableParams, 3, UIConfig.CHARACTERS_PAGE_EXPERIENCE_COL_3_X, "TOP", nil, false)
	UI:SetTableRowParameters(experienceTableParams, 1, UIConfig.CHARACTERS_PAGE_TABLE_START_OFFSET_Y, nil, UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE)
	tableFrame.ExperienceTableParams = experienceTableParams
	
	local inventoryTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(inventoryTableParams, 1, UIConfig.CHARACTERS_PAGE_INVENTORY_COL_1_X, "TOP", nil, false)
	UI:SetTableColumnParameters(inventoryTableParams, 2, UIConfig.CHARACTERS_PAGE_INVENTORY_COL_2_X, "TOP", nil, false)
	UI:SetTableColumnParameters(inventoryTableParams, 3, UIConfig.CHARACTERS_PAGE_INVENTORY_COL_3_X, "TOP", nil, false)
	UI:SetTableColumnParameters(inventoryTableParams, 4, UIConfig.CHARACTERS_PAGE_INVENTORY_COL_4_X, "TOP", nil, false)
	UI:SetTableColumnParameters(inventoryTableParams, 5, UIConfig.CHARACTERS_PAGE_INVENTORY_COL_5_X, "TOP", nil, false)
	UI:SetTableColumnParameters(inventoryTableParams, 6, UIConfig.CHARACTERS_PAGE_INVENTORY_COL_6_X, "TOP", nil, false)
	UI:SetTableRowParameters(inventoryTableParams, 1, UIConfig.CHARACTERS_PAGE_TABLE_START_OFFSET_Y, nil, UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE)
	tableFrame.InventoryTableParams = inventoryTableParams
	
	local professionTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(professionTableParams, 1, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_1_X, "TOP", nil, false)
	UI:SetTableColumnParameters(professionTableParams, 2, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_2_X, "TOP", nil, false)
	UI:SetTableColumnParameters(professionTableParams, 3, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_3_X, "TOP", nil, false)
	UI:SetTableColumnParameters(professionTableParams, 4, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_4_X, "TOP", nil, false)
	UI:SetTableColumnParameters(professionTableParams, 5, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_5_X, "TOP", nil, false)
	UI:SetTableColumnParameters(professionTableParams, 6, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_6_X, "TOP", nil, false)
	UI:SetTableColumnParameters(professionTableParams, 7, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_7_X, "TOP", nil, false)
	UI:SetTableColumnParameters(professionTableParams, 8, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_8_X, "TOP", nil, false)
	UI:SetTableColumnParameters(professionTableParams, 9, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_9_X, "TOP", nil, false)
	UI:SetTableColumnParameters(professionTableParams, 10, UIConfig.CHARACTERS_PAGE_PROFESSIONS_COL_10_X, "TOP", nil, false)
	UI:SetTableRowParameters(professionTableParams, 1, UIConfig.CHARACTERS_PAGE_TABLE_START_OFFSET_Y, nil, UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE)
	tableFrame.ProfessionTableParams = professionTableParams
	
	local editModeTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(editModeTableParams, 1, UIConfig.CHARACTERS_PAGE_EDIT_MODE_COL_1_X, "TOP", UIConfig.CHARACTERS_PAGE_EDIT_MODE_BUTTON_FONT_SIZE, false)
	UI:SetTableColumnParameters(editModeTableParams, 2, UIConfig.CHARACTERS_PAGE_EDIT_MODE_COL_2_X, "TOP", UIConfig.CHARACTERS_PAGE_EDIT_MODE_BUTTON_FONT_SIZE, false)
	UI:SetTableColumnParameters(editModeTableParams, 3, UIConfig.CHARACTERS_PAGE_EDIT_MODE_COL_3_X, "TOPRIGHT", nil, false)
	UI:SetTableColumnParameters(editModeTableParams, 4, UIConfig.CHARACTERS_PAGE_EDIT_MODE_COL_4_X, "TOP", UIConfig.CHARACTERS_PAGE_EDIT_MODE_BUTTON_FONT_SIZE, false)
	UI:SetTableRowParameters(editModeTableParams, 1, UIConfig.CHARACTERS_PAGE_TABLE_START_OFFSET_Y, nil, UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE)
	tableFrame.EditModeTableParams = editModeTableParams
	
	tableFrame.TableRows = {}
	
	-- View Buttons
	
	view.InfoViewButton = UI:CreateButton(view, Strings:Get("CHARACTERS_PAGE_INFORMATION_VIEW_BUTTON"), UIConfig.CHARACTERS_PAGE_VIEW_BUTTON_WIDTH, UIConfig.CHARACTER_PAGE_VIEW_BUTTON_HEIGHT, "BOTTOMLEFT", "BOTTOMLEFT", (UIConfig.CHARACTERS_PAGE_VIEW_BUTTON_WIDTH + UIConfig.CHARACTER_PAGE_VIEW_BUTTON_BUFFER) * 0, 1, CharactersPage.OnInfoViewButtonClicked, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.ExperienceViewButton = UI:CreateButton(view, Strings:Get("CHARACTERS_PAGE_EXPERIENCE_VIEW_BUTTON"), UIConfig.CHARACTERS_PAGE_VIEW_BUTTON_WIDTH, UIConfig.CHARACTER_PAGE_VIEW_BUTTON_HEIGHT, "BOTTOMLEFT", "BOTTOMLEFT", (UIConfig.CHARACTERS_PAGE_VIEW_BUTTON_WIDTH + UIConfig.CHARACTER_PAGE_VIEW_BUTTON_BUFFER) * 1, 1, CharactersPage.OnExperienceViewButtonClicked, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.InventoryViewButton = UI:CreateButton(view, Strings:Get("CHARACTERS_PAGE_INVENTORY_VIEW_BUTTON"), UIConfig.CHARACTERS_PAGE_VIEW_BUTTON_WIDTH, UIConfig.CHARACTER_PAGE_VIEW_BUTTON_HEIGHT, "BOTTOMLEFT", "BOTTOMLEFT", (UIConfig.CHARACTERS_PAGE_VIEW_BUTTON_WIDTH + UIConfig.CHARACTER_PAGE_VIEW_BUTTON_BUFFER) * 2, 1, CharactersPage.OnInventoryViewButtonClicked, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.ProfessionViewButton = UI:CreateButton(view, Strings:Get("CHARACTERS_PAGE_PROFESSION_VIEW_BUTTON"), UIConfig.CHARACTERS_PAGE_VIEW_BUTTON_WIDTH, UIConfig.CHARACTER_PAGE_VIEW_BUTTON_HEIGHT, "BOTTOMLEFT", "BOTTOMLEFT", (UIConfig.CHARACTERS_PAGE_VIEW_BUTTON_WIDTH + UIConfig.CHARACTER_PAGE_VIEW_BUTTON_BUFFER) * 3, 1, CharactersPage.OnProfessionViewButtonClicked, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.EditModeViewButton = UI:CreateButton(view, Strings:Get("CHARACTERS_PAGE_EDIT_MODE_VIEW_BUTTON"), UIConfig.CHARACTER_PAGE_EDIT_MODE_BUTTON_WIDTH, UIConfig.CHARACTER_PAGE_VIEW_BUTTON_HEIGHT, "BOTTOMRIGHT", "BOTTOMRIGHT", UIConfig.CHARACTER_PAGE_EDIT_MODE_BUTTON_OFFSET_X, 1, CharactersPage.OnEditModeViewButtonClicked, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	
	return view
end

function CharactersPage:BuildCondensedFrameView(page)
	local view = UI:CreateCondensedView(page)
	
	-- Column Headers
	
	UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_FACTION_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_FACTION_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_LEVEL_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_LEVEL_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_NAME_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_NAME_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.ExperienceViewPercentageHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_EXP_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_EXP_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.ExperienceViewRestedCapPercentageHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_CURRENT_RESTED_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_CURRENT_RESTED_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	view.ExperienceViewRestedCapTimeHeaderText = UI:CreateText(view, Strings:Get("CHARACTERS_PAGE_EST_RESTED_HEADER"), "TOP", "TOPLEFT", UIConfig.CHARACTERS_PAGE_EST_RESTED_HEADER_X, 0, UIConfig.GLOBAL_COLUMN_HEADER_COLOR, UIConfig.CHARACTERS_PAGE_COLUMN_HEADER_FONT_SIZE)
	
	-- Table Parameters
	
	local generalTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(generalTableParams, 1, UIConfig.CHARACTERS_PAGE_BASIC_INFO_COL_1_X, "TOP", nil, false)
	UI:SetTableColumnParameters(generalTableParams, 2, UIConfig.CHARACTERS_PAGE_BASIC_INFO_COL_2_X, "TOP", nil, false)
	UI:SetTableColumnParameters(generalTableParams, 3, UIConfig.CHARACTERS_PAGE_BASIC_INFO_COL_3_X, "TOPLEFT", nil, false)
	UI:SetTableRowParameters(generalTableParams, 1, UIConfig.FARMING_PAGE_TABLE_START_OFFSET_Y - UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE - UIConfig.CHARACTERS_PAGE_LINE_BUFFER, nil, UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE)
	view.GeneralTableParams = generalTableParams
	
	local experienceTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(experienceTableParams, 1, UIConfig.CHARACTERS_PAGE_EXPERIENCE_COL_1_X, "TOP", nil, false)
	UI:SetTableColumnParameters(experienceTableParams, 2, UIConfig.CHARACTERS_PAGE_EXPERIENCE_COL_2_X, "TOP", nil, false)
	UI:SetTableColumnParameters(experienceTableParams, 3, UIConfig.CHARACTERS_PAGE_EXPERIENCE_COL_3_X, "TOP", nil, false)
	UI:SetTableRowParameters(experienceTableParams, 1, UIConfig.FARMING_PAGE_TABLE_START_OFFSET_Y - UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE - UIConfig.CHARACTERS_PAGE_LINE_BUFFER, nil, UIConfig.CHARACTERS_PAGE_DATA_FONT_SIZE)
	view.ExperienceTableParams = experienceTableParams
	
	-- Content
	
	view.CharacterFactionText = UI:CreateTableText(generalTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, 1)
	view.CharacterLevelText = UI:CreateTableText(generalTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, 1)
	view.CharacterNameText = UI:CreateTableText(generalTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 1)
	UI:ApplyTooltipToWidget(view.CharacterNameText, "ANCHOR_RIGHT", function()
		return CharactersPage:GetCharacterTooltip(Characters:GetCharacter(Core:GetGUID()))
	end)

	view.CharacterNameText:SetWidth(UIConfig.CHARACTERS_PAGE_NAME_MAX_WIDTH)
	view.CharacterNameText:SetWordWrap(false)
	view.CharacterNameText:SetJustifyH("LEFT")
	
	view.CharacterXpPercentageText = UI:CreateTableText(experienceTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, 1)
	view.CharacterRestCapPercentageText = UI:CreateTableText(experienceTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, 1)
	view.CharacterRestCapTimeText = UI:CreateTableText(experienceTableParams, view, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 1)
	
	return view
end

function CharactersPage:Build(parent)
	Log:Debug("Creating Characters page...")
	
	CharactersPage.CurrentViewId = HiddenSettings:GetCharacterPageLastShownView()
	
	local page = UI:CreatePage(parent)
	CharactersPage.Page = page
	
	local expandedView = CharactersPage:BuildExpandedFrameView(page)
	page.ExpandedFrameView = expandedView
	
	local condensedView = CharactersPage:BuildCondensedFrameView(page)
	page.CondensedFrameView = condensedView
	
	Event:SetCharacterEventListenerForWidget(page, CharactersPage.OnCharacterUpdateEvent)
	
	return page
end
