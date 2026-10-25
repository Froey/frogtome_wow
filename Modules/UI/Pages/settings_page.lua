local _, Frogtome = ...
if not Frogtome.UI then
	Frogtome.UI = {}
end
if not Frogtome.UI.Pages then
	Frogtome.UI.Pages = {}
end
Frogtome.UI.Pages.SettingsPage = {}

local Log = Frogtome.Misc.Log
local Settings = Frogtome.Settings.Settings
local SettingsPage = Frogtome.UI.Pages.SettingsPage
local Strings = Frogtome.UI.Strings
local UI = Frogtome.UI.UI
local UIConfig = Frogtome.UI.UIConfig

----------------------------
-- Display Update Process --
----------------------------

function SettingsPage:UpdateSettingFields(settingFields)
	for setting, field in pairs(settingFields) do
		-- Update the current values of the fields
		if field.Account then
			local accountValue = Settings:GetAccountValue(setting)
			if accountValue == true or accountValue == false then
				field.Account:SetChecked(accountValue)
			end
		end
		if field.Character then
			local characterValue = Settings:GetCharacterValue(setting)
			if characterValue == true or characterValue == false then
				field.Character:SetChecked(characterValue)
			end
		end
		
		-- Update usability of the fields
		if field.Account and field.Account.SetEnabled then
			if Settings:CanEditSettingAtAccountLevel(setting) then
				field.Account:SetEnabled(true)
				field.Account:SetAlpha(1)
			else
				field.Account:SetEnabled(false)
				field.Account:SetAlpha(UIConfig.SETTINGS_PAGE_DISABLED_CONTROL_ALPHA)
			end
		end
		if field.Character and field.Character.SetEnabled then
			if Settings:CanEditSettingAtCharacterLevel(setting) then
				field.Character:SetEnabled(true)
				field.Character:SetAlpha(1)
			else
				field.Character:SetEnabled(false)
				field.Character:SetAlpha(UIConfig.SETTINGS_PAGE_DISABLED_CONTROL_ALPHA)
			end
		end
		
		-- Update whether a reload is necessary
		if SettingsPage.SettingsOnBuild then
			local currentValue = Settings:Get(setting)
			local buildValue = SettingsPage.SettingsOnBuild[setting]
			
			if buildValue ~= nil and currentValue ~= buildValue then
				field.ReloadIndicator:SetShown(true)
				UI:ApplyTextWidgetFont(field.Label, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR)
			else
				field.ReloadIndicator:SetShown(false)
				UI:ApplyTextWidgetFont(field.Label, UIConfig.GLOBAL_LABEL_TEXT_COLOR)
			end
		end
	end
end

function SettingsPage:UpdateExpandedFrameView()
	SettingsPage:UpdateSettingFields(SettingsPage.Page.ExpandedFrameView.SettingFields)
end

function SettingsPage:UpdateCondensedFrameView()
	SettingsPage:UpdateSettingFields(SettingsPage.Page.CondensedFrameView.SettingFields)
end

function SettingsPage:UpdateDisplay(force)
	if not force and not SettingsPage.Page:IsVisible() then
		return
	end
	
	if force or SettingsPage.Page.ExpandedFrameView:IsVisible() then
		SettingsPage:UpdateExpandedFrameView()
	end
	if force or SettingsPage.Page.CondensedFrameView:IsVisible() then
		SettingsPage:UpdateCondensedFrameView()
	end
end

----------------------------------
-- Display Update Functionality --
----------------------------------

------------------------
-- Listener Functions --
------------------------

function SettingsPage:OnExpandedFrameViewShown()
	SettingsPage:UpdateDisplay(true)
end

function SettingsPage:OnCondensedFrameViewShown()
	SettingsPage:UpdateDisplay(true)
end

function SettingsPage:OnPageShown()
	SettingsPage:UpdateDisplay(true)
end

function SettingsPage:OnPageHidden()
	-- TODO
end

function SettingsPage:OnResetToDefaultSettingsButtonClicked()
	Settings:ResetAllSettings()
	SettingsPage:UpdateDisplay(true)
end

-----------------------
-- Page Construction --
-----------------------

function SettingsPage:BuildExpandedFrameView(page)
	local view = UI:CreateExpandedView(page)
	local widget
	
	-- Scroll Frame Setup
	
	local tableScrollFrame = CreateFrame("ScrollFrame", nil, view, "UIPanelScrollFrameTemplate")
	tableScrollFrame:SetPoint("TOPLEFT", view, "TOPLEFT", UIConfig.SETTINGS_PAGE_SCROLL_FRAME_INSET_LEFT, -UIConfig.SETTINGS_PAGE_SCROLL_FRAME_INSET_TOP)
	tableScrollFrame:SetPoint("BOTTOMRIGHT", view, "BOTTOMRIGHT", -UIConfig.SETTINGS_PAGE_SCROLL_FRAME_INSET_RIGHT, UIConfig.SETTINGS_PAGE_SCROLL_FRAME_INSET_BOTTOM)
	view.TableScrollFrame = tableScrollFrame
	
	local tableFrame = CreateFrame("Frame", nil, tableScrollFrame)
	tableFrame:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH - UIConfig.FARMING_PAGE_LINE_START_OFFSET_X, 200)
	tableFrame:SetPoint("TOP", tableScrollFrame, "TOP", 0, 0)
	tableScrollFrame:SetScrollChild(tableFrame)
	view.TableFrame = tableFrame
	
	-- Settings Table Setup
	
	local settingsTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(settingsTableParams, 1, UIConfig.SETTINGS_PAGE_TABLE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(settingsTableParams, 2, UIConfig.SETTINGS_PAGE_LINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(settingsTableParams, 3, UIConfig.SETTINGS_PAGE_ACCOUNT_VALUE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(settingsTableParams, 4, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COL_X, "TOP", UIConfig.SETTIGNS_PAGE_RELOAD_INDICATOR_FONT_SIZE)
	UI:SetTableColumnParameters(settingsTableParams, 5, UIConfig.SETTINGS_PAGE_CHARACTER_VALUE_COL_X, "TOP", nil)
	
	local y = UIConfig.SETTINGS_PAGE_TABLE_START_OFFSET_Y
	local rowIndex = 1
	
	view.SettingFields = {}
	
	-- General Settings
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_GENERAL_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, rowIndex)
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_ACCOUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, rowIndex)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARACTER_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, rowIndex)
	y = y - UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_START_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_WELCOME_MESSAGE] = {}
	view.SettingFields[Settings.SHOW_WELCOME_MESSAGE].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_GENERAL_WELCOME_MESSAGE"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_WELCOME_MESSAGE].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_WELCOME_MESSAGE, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_WELCOME_MESSAGE].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_FUN_FACTS] = {}
	view.SettingFields[Settings.SHOW_FUN_FACTS].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_GENERAL_FUN_FACTS"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_FUN_FACTS].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_FUN_FACTS, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_FUN_FACTS].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_END_SPACING
	rowIndex = rowIndex + 1
	
	-- Character-Specific Settings
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHAR_SPECIFIC_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, rowIndex)
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_ACCOUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, rowIndex)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARACTER_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, rowIndex)
	y = y - UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_START_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.CHAR_SPECIFIC_SETTINGS] = {}
	view.SettingFields[Settings.CHAR_SPECIFIC_SETTINGS].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHAR_SPECIFIC_ENABLE"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.CHAR_SPECIFIC_SETTINGS].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.CHAR_SPECIFIC_SETTINGS].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.CHAR_SPECIFIC_SETTINGS, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_END_SPACING
	rowIndex = rowIndex + 1
	
	-- Interface Settings
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_INTERFACE_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, rowIndex)
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_ACCOUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, rowIndex)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARACTER_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, rowIndex)
	y = y - UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_START_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_ON_LOAD] = {}
	view.SettingFields[Settings.SHOW_ON_LOAD].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_INTERFACE_SHOW_ON_LOAD"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_ON_LOAD].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_ON_LOAD, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_ON_LOAD].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.SHOW_ON_LOAD].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.SHOW_ON_LOAD, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.HIDE_ON_ESCAPE] = {}
	view.SettingFields[Settings.HIDE_ON_ESCAPE].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_INTERFACE_HIDE_ON_ESCAPE"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.HIDE_ON_ESCAPE].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.HIDE_ON_ESCAPE, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.HIDE_ON_ESCAPE].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.HIDE_ON_ESCAPE].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.HIDE_ON_ESCAPE, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_MINIMAP_ICON] = {}
	view.SettingFields[Settings.SHOW_MINIMAP_ICON].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_INTERFACE_MINIMAP_ICON"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_MINIMAP_ICON].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_MINIMAP_ICON, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_MINIMAP_ICON].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.SHOW_MINIMAP_ICON].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.SHOW_MINIMAP_ICON, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_GROUP_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW] = {}
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_INTERFACE_CONDENSED_VIEW"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_CONDENSED_VIEW, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.SHOW_CONDENSED_VIEW, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_END_SPACING
	rowIndex = rowIndex + 1
	
	-- Characters Page
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARPAGE_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, rowIndex)
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_ACCOUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, rowIndex)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARACTER_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, rowIndex)
	y = y - UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_START_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_CHARACTERS_PAGE] = {}
	view.SettingFields[Settings.SHOW_CHARACTERS_PAGE].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARPAGE_ENABLED"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_CHARACTERS_PAGE].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_CHARACTERS_PAGE, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_CHARACTERS_PAGE].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.SHOW_CHARACTERS_PAGE].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.SHOW_CHARACTERS_PAGE, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_GROUP_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY] = {}
	view.SettingFields[Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARPAGE_SAME_REALM_ONLY"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE] = {}
	view.SettingFields[Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARPAGE_RELATIVE_FACTION_COLORS"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_END_SPACING
	rowIndex = rowIndex + 1
	
	-- Farming Page
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_FARMPAGE_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, rowIndex)
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_ACCOUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, rowIndex)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARACTER_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, rowIndex)
	y = y - UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_START_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_FARMING_PAGE] = {}
	view.SettingFields[Settings.SHOW_FARMING_PAGE].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_FARMPAGE_ENABLED"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_FARMING_PAGE].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_FARMING_PAGE, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_FARMING_PAGE].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.SHOW_FARMING_PAGE].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.SHOW_FARMING_PAGE, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_GROUP_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY] = {}
	view.SettingFields[Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_FARMPAGE_TRACKED_QUESTS_ONLY"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_END_SPACING
	rowIndex = rowIndex + 1
	
	-- Questing Page
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_QUESTPAGE_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, rowIndex)
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_ACCOUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, rowIndex)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARACTER_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, rowIndex)
	y = y - UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_START_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_QUESTING_PAGE] = {}
	view.SettingFields[Settings.SHOW_QUESTING_PAGE].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_QUESTPAGE_ENABLED"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_QUESTING_PAGE].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_QUESTING_PAGE, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_QUESTING_PAGE].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.SHOW_QUESTING_PAGE].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.SHOW_QUESTING_PAGE, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_GROUP_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES] = {}
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_QUESTPAGE_HIDE_COMPLETED_ZONES"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.QUESTING_PAGE_ZONE_QUEST_COUNT] = {}
	view.SettingFields[Settings.QUESTING_PAGE_ZONE_QUEST_COUNT].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_QUESTPAGE_ZONE_QUEST_COUNT"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.QUESTING_PAGE_ZONE_QUEST_COUNT].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.QUESTING_PAGE_ZONE_QUEST_COUNT, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.QUESTING_PAGE_ZONE_QUEST_COUNT].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_GROUP_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS] = {}
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_QUESTPAGE_HIDE_COMPLETED_DUNGEONS"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT] = {}
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_QUESTPAGE_DUNGEON_PRE_QUEST_COUNT"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT] = {}
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_QUESTPAGE_DUNGEON_QUEST_TO_BRING_COUNT"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_LINE_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT] = {}
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_QUESTPAGE_DUNGEON_QUEST_COUNT"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_END_SPACING
	rowIndex = rowIndex + 1
	
	-- Notes Page
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_NOTESPAGE_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, rowIndex)
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_ACCOUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, rowIndex)
	UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_CHARACTER_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, rowIndex)
	y = y - UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_START_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_NOTES_PAGE] = {}
	view.SettingFields[Settings.SHOW_NOTES_PAGE].Label = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_NOTESPAGE_ENABLED"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_NOTES_PAGE].Account = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_NOTES_PAGE, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_NOTES_PAGE].ReloadIndicator = UI:CreateTableText(settingsTableParams, tableFrame, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.SHOW_NOTES_PAGE].Character = UI:CreateTableCheckbox(settingsTableParams, tableFrame, false, function(value)
		Settings:SetCharacterValue(Settings.SHOW_NOTES_PAGE, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	y = y - UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE - UIConfig.SETTINGS_PAGE_SECTION_END_SPACING
	rowIndex = rowIndex + 1
	
	UI:CreateButton(tableFrame, Strings:Get("SETTINGS_PAGE_RESET_SETTINGS_BUTTON"), UIConfig.SETTINGS_PAGE_RESET_SETTINGS_BUTTON_WIDTH, UIConfig.SETTINGS_PAGE_RESET_SETTINGS_BUTTON_HEIGHT, "TOP", "TOP", 0, y, SettingsPage.OnResetToDefaultSettingsButtonClicked)
	
	return view
end

function SettingsPage:BuildCondensedFrameView(page)
	local view = UI:CreateCondensedView(page)
	
	local settingsTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(settingsTableParams, 1, UIConfig.SETTINGS_PAGE_TABLE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(settingsTableParams, 2, UIConfig.SETTINGS_PAGE_LINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(settingsTableParams, 3, UIConfig.SETTINGS_PAGE_ACCOUNT_VALUE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(settingsTableParams, 4, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COL_X, "TOP", UIConfig.SETTIGNS_PAGE_RELOAD_INDICATOR_FONT_SIZE)
	UI:SetTableColumnParameters(settingsTableParams, 5, UIConfig.SETTINGS_PAGE_CHARACTER_VALUE_COL_X, "TOP", nil)
	
	local y = UIConfig.SETTINGS_PAGE_TABLE_START_OFFSET_Y
	local rowIndex = 1
	
	view.SettingFields = {}
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, view, "Interface Settings", UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, rowIndex)
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_COLUMN_HEADER_FONT_SIZE)
	UI:CreateTableText(settingsTableParams, view, Strings:Get("SETTINGS_PAGE_ACCOUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, rowIndex)
	UI:CreateTableText(settingsTableParams, view, Strings:Get("SETTINGS_PAGE_CHARACTER_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, rowIndex)
	y = y - UIConfig.SETTINGS_PAGE_SECTION_FONT_SIZE - UIConfig.SETTINGS_PAGE_CONDENSED_VIEW_SECTION_START_SPACING
	rowIndex = rowIndex + 1
	
	UI:SetTableRowParameters(settingsTableParams, rowIndex, y, nil, UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE)
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW] = {}
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW].Label = UI:CreateTableText(settingsTableParams, view, Strings:Get("SETTINGS_PAGE_INTERFACE_CONDENSED_VIEW"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, rowIndex)
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW].Account = UI:CreateTableCheckbox(settingsTableParams, view, false, function(value)
		Settings:SetAccountValue(Settings.SHOW_CONDENSED_VIEW, value)
	end, 3, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW].ReloadIndicator = UI:CreateTableText(settingsTableParams, view, Strings:Get("SETTINGS_PAGE_RELOAD_INDICATOR"), UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_COLOR, 4, rowIndex, 0, UIConfig.SETTINGS_PAGE_RELOAD_INDICATOR_OFFSET_Y)
	view.SettingFields[Settings.SHOW_CONDENSED_VIEW].Character = UI:CreateTableCheckbox(settingsTableParams, view, false, function(value)
		Settings:SetCharacterValue(Settings.SHOW_CONDENSED_VIEW, value)
	end, 5, rowIndex, 0, math.ceil(UIConfig.SETTINGS_PAGE_LINE_FONT_SIZE / 2) + 2)
	
	return view
end

function SettingsPage:Build(parent)
	Log:Debug("Creating Settings page...")
	
	local page = UI:CreatePage(parent, "Session")
	SettingsPage.Page = page
	
	local expandedView = SettingsPage:BuildExpandedFrameView(page)
	page.ExpandedFrameView = expandedView
	
	local condensedView = SettingsPage:BuildCondensedFrameView(page)
	page.CondensedFrameView = condensedView
	
	-- Event Listeners
	
	Settings:SetUniversalSettingsListener(SettingsPage.UpdateDisplay)
	
	-- Reload Indicator Tracking
	
	SettingsPage.SettingsOnBuild = {}
	for setting, flag in pairs(Settings.ReloadFlags) do
		if flag then
			SettingsPage.SettingsOnBuild[setting] = Settings:Get(setting)
		end
	end
	
	return page
end
