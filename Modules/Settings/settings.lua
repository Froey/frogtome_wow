local _, Frogtome = ...
if not Frogtome.Settings then
	Frogtome.Settings = {}
end
Frogtome.Settings.Settings = {}

local SavedData = Frogtome.Data.SavedData
local Settings = Frogtome.Settings.Settings

---------------------------------
-- Settings and Default Values --
---------------------------------

Settings.Keys = {}
Settings.CharSettingFlags = {}
Settings.ReloadFlags = {}
Settings.Defaults = {}

-- General Settings

Settings.LANGUAGE = "Language"
Settings.CharSettingFlags[Settings.LANGUAGE] = false
Settings.ReloadFlags[Settings.LANGUAGE] = true
Settings.Defaults[Settings.LANGUAGE] = "EN"

Settings.SHOW_WELCOME_MESSAGE = "ShowWelcomeMessage"
Settings.CharSettingFlags[Settings.SHOW_WELCOME_MESSAGE] = false
Settings.ReloadFlags[Settings.SHOW_WELCOME_MESSAGE] = false
Settings.Defaults[Settings.SHOW_WELCOME_MESSAGE] = true

Settings.SHOW_FUN_FACTS = "ShowFunFacts"
Settings.CharSettingFlags[Settings.SHOW_FUN_FACTS] = false
Settings.ReloadFlags[Settings.SHOW_FUN_FACTS] = false
Settings.Defaults[Settings.SHOW_FUN_FACTS] = false

-- Interface Settings - Character-Specific

Settings.CHAR_SPECIFIC_SETTINGS = "CharSpecificSettings"
Settings.CharSettingFlags[Settings.CHAR_SPECIFIC_SETTINGS] = true
Settings.ReloadFlags[Settings.CHAR_SPECIFIC_SETTINGS] = false
Settings.Defaults[Settings.CHAR_SPECIFIC_SETTINGS] = false

-- Interface Settings - General

Settings.SHOW_ON_LOAD = "ShowOnLoad"
Settings.CharSettingFlags[Settings.SHOW_ON_LOAD] = true
Settings.ReloadFlags[Settings.SHOW_ON_LOAD] = false
Settings.Defaults[Settings.SHOW_ON_LOAD] = false

Settings.HIDE_ON_ESCAPE = "HideOnEscape"
Settings.CharSettingFlags[Settings.HIDE_ON_ESCAPE] = true
Settings.ReloadFlags[Settings.HIDE_ON_ESCAPE] = true
Settings.Defaults[Settings.HIDE_ON_ESCAPE] = true

Settings.SHOW_MINIMAP_ICON = "ShowMinimapIcon"
Settings.CharSettingFlags[Settings.SHOW_MINIMAP_ICON] = true
Settings.ReloadFlags[Settings.SHOW_MINIMAP_ICON] = true
Settings.Defaults[Settings.SHOW_MINIMAP_ICON] = true

Settings.SHOW_CONDENSED_VIEW = "ShowCondensedView"
Settings.CharSettingFlags[Settings.SHOW_CONDENSED_VIEW] = true
Settings.ReloadFlags[Settings.SHOW_CONDENSED_VIEW] = false
Settings.Defaults[Settings.SHOW_CONDENSED_VIEW] = false

-- Interface Settings - Characters Page

Settings.SHOW_CHARACTERS_PAGE = "ShowCharactersPage"
Settings.CharSettingFlags[Settings.SHOW_CHARACTERS_PAGE] = true
Settings.ReloadFlags[Settings.SHOW_CHARACTERS_PAGE] = true
Settings.Defaults[Settings.SHOW_CHARACTERS_PAGE] = true

Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY = "CharactersPageShowSameRealmCharactersOnly"
Settings.CharSettingFlags[Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY] = true
Settings.ReloadFlags[Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY] = false
Settings.Defaults[Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY] = true

Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE = "CharactersPageShowFactionColorsByAllegiance"
Settings.CharSettingFlags[Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE] = false
Settings.ReloadFlags[Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE] = false
Settings.Defaults[Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE] = false

-- Interface Settings - Farming Page

Settings.SHOW_FARMING_PAGE = "ShowFarmingPage"
Settings.CharSettingFlags[Settings.SHOW_FARMING_PAGE] = true
Settings.ReloadFlags[Settings.SHOW_FARMING_PAGE] = true
Settings.Defaults[Settings.SHOW_FARMING_PAGE] = true

Settings.FARMING_PAGE_RATE_METRIC_INDEX = "FarmingPageRateMetricIndex"
Settings.CharSettingFlags[Settings.FARMING_PAGE_RATE_METRIC_INDEX] = false
Settings.ReloadFlags[Settings.FARMING_PAGE_RATE_METRIC_INDEX] = false
Settings.Defaults[Settings.FARMING_PAGE_RATE_METRIC_INDEX] = 3

Settings.FARMING_PAGE_RATE_METRIC_UPDATE_TICK = "FarmingPageRateMetricUpdateTick"
Settings.CharSettingFlags[Settings.FARMING_PAGE_RATE_METRIC_UPDATE_TICK] = false
Settings.ReloadFlags[Settings.FARMING_PAGE_RATE_METRIC_UPDATE_TICK] = true
Settings.Defaults[Settings.FARMING_PAGE_RATE_METRIC_UPDATE_TICK] = 250

Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY = "FarmingPageTrackedQuestsOnly"
Settings.CharSettingFlags[Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY] = true
Settings.ReloadFlags[Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY] = false
Settings.Defaults[Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY] = true

-- Interface Settings - Questing Page

Settings.SHOW_QUESTING_PAGE = "ShowQuestingPage"
Settings.CharSettingFlags[Settings.SHOW_QUESTING_PAGE] = true
Settings.ReloadFlags[Settings.SHOW_QUESTING_PAGE] = true
Settings.Defaults[Settings.SHOW_QUESTING_PAGE] = false

Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES = "QuestingPageHideCompletedZones"
Settings.CharSettingFlags[Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES] = true
Settings.ReloadFlags[Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES] = false
Settings.Defaults[Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES] = false

Settings.QUESTING_PAGE_ZONE_QUEST_COUNT = "QuestingPageZoneQuestCount"
Settings.CharSettingFlags[Settings.QUESTING_PAGE_ZONE_QUEST_COUNT] = false
Settings.ReloadFlags[Settings.QUESTING_PAGE_ZONE_QUEST_COUNT] = false
Settings.Defaults[Settings.QUESTING_PAGE_ZONE_QUEST_COUNT] = false

Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS = "QuestingPageHideCompletedDungeons"
Settings.CharSettingFlags[Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS] = true
Settings.ReloadFlags[Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS] = false
Settings.Defaults[Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS] = false

Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT = "QuestingPageDungeonPreQuestCount"
Settings.CharSettingFlags[Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT] = false
Settings.ReloadFlags[Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT] = false
Settings.Defaults[Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT] = false

Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT = "QuestingPageDungeonQuestToBringCount"
Settings.CharSettingFlags[Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT] = false
Settings.ReloadFlags[Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT] = false
Settings.Defaults[Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT] = true

Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT = "QuestingPageDungeonQuestCount"
Settings.CharSettingFlags[Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT] = false
Settings.ReloadFlags[Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT] = false
Settings.Defaults[Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT] = true

-- Interface Settings - Notes Page

Settings.SHOW_NOTES_PAGE = "ShowNotesPage"
Settings.CharSettingFlags[Settings.SHOW_NOTES_PAGE] = true
Settings.ReloadFlags[Settings.SHOW_NOTES_PAGE] = true
Settings.Defaults[Settings.SHOW_NOTES_PAGE] = true

-- Advanced Settings

Settings.LOG_LEVEL = "LogLevel"
Settings.CharSettingFlags[Settings.LOG_LEVEL] = true
Settings.ReloadFlags[Settings.LOG_LEVEL] = false
Settings.Defaults[Settings.LOG_LEVEL] = 3

-----------------------------
-- Core Settings Functions --
-----------------------------

-- Initializes the saved settings data if necessary.
function Settings:InitializeSettings()
	SavedData:InitializeSavedData()
	if not SavedData:GetGlobalSavedData().Settings then
		SavedData:GetGlobalSavedData().Settings = {}
	end
	if not SavedData:GetCharacterSavedData().Settings then
		SavedData:GetCharacterSavedData().Settings = {}
	end
end

-- Resets all settings, removing their stored values and effectively reverting them to their default values.
function Settings:ResetAllSettings()
	Settings:InitializeSettings()
	SavedData:GetGlobalSavedData().Settings = {}
	SavedData:GetCharacterSavedData().Settings = {}
end

-- Returns whether or not character-specific settings are being used.
function Settings:IsUsingCharSpecificSettings()
	Settings:InitializeSettings()
	
	local value = SavedData:GetCharacterSavedData().Settings[Settings.CHAR_SPECIFIC_SETTINGS]
	if value == nil then
		value = Settings.Defaults[Settings.CHAR_SPECIFIC_SETTINGS]
		SavedData:GetCharacterSavedData().Settings[Settings.CHAR_SPECIFIC_SETTINGS] = value
	end
	
	return value
end

-- Returns the effective, in-use value of the provided setting.
function Settings:Get(setting)
	Settings:InitializeSettings()
	
	if setting == Settings.CHAR_SPECIFIC_SETTINGS then
		return Settings:IsUsingCharSpecificSettings()
	end
	
	local value = nil
	if Settings:IsUsingCharSpecificSettings() and Settings.CharSettingFlags[setting] then
		value = SavedData:GetCharacterSavedData().Settings[setting]
	else
		value = SavedData:GetGlobalSavedData().Settings[setting]
	end
	
	if value == nil then
		value = Settings.Defaults[setting]
		if Settings:IsUsingCharSpecificSettings() and Settings.CharSettingFlags[setting] then
			SavedData:GetCharacterSavedData().Settings[setting] = value
		else
			SavedData:GetGlobalSavedData().Settings[setting] = value
		end
	end
	
	return value
end

-- Returns the account-level value of the provided setting.
function Settings:GetAccountValue(setting)
	Settings:InitializeSettings()
	
	local value = SavedData:GetGlobalSavedData().Settings[setting]
	if value == nil then
		value = Settings.Defaults[setting]
		SavedData:GetGlobalSavedData().Settings[setting] = value
	end
	
	return value
end

-- Returns the character-level value of the provided setting.
function Settings:GetCharacterValue(setting)
	Settings:InitializeSettings()
	
	local value = SavedData:GetCharacterSavedData().Settings[setting]
	if value == nil then
		value = Settings.Defaults[setting]
		SavedData:GetCharacterSavedData().Settings[setting] = value
	end
	
	return value
end

-- Sets the value of the provided setting, adhering to whether or not character-specific settings are in use.
function Settings:Set(setting, value, listener)
	local oldValue = Settings:Get(setting)
	
	if value == nil then
		value = oldValue
	end
	
	if setting == Settings.CHAR_SPECIFIC_SETTINGS or (Settings:IsUsingCharSpecificSettings() and Settings.CharSettingFlags[setting]) then
		SavedData:GetCharacterSavedData().Settings[setting] = value
	else
		SavedData:GetGlobalSavedData().Settings[setting] = value
	end
	
	if value ~= oldValue then
		Settings:OnSettingChanged(setting, value, listener)
	end
end

-- Sets the account-level value of the provided setting.
function Settings:SetAccountValue(setting, value, listener)
	local oldValue = Settings:GetAccountValue(setting)
	
	if value == nil then
		value = oldValue
	end
	
	SavedData:GetGlobalSavedData().Settings[setting] = value
	
	if value ~= oldValue then
		Settings:OnSettingChanged(setting, value, listener)
	end
end

-- Sets the character-level value of the provided setting.
function Settings:SetCharacterValue(setting, value, listener)
	local oldValue = Settings:GetCharacterValue(setting)
	
	if value == nil then
		value = oldValue
	end
	
	SavedData:GetCharacterSavedData().Settings[setting] = value
	
	if value ~= oldValue then
		Settings:OnSettingChanged(setting, value, listener)
	end
end

-- Returns whether or not the provided setting should be editable at an account level.
function Settings:CanEditSettingAtAccountLevel(setting)
	-- This is really just the inverse of Settings:CanEditSettingAtCharacterLevel()
	return not Settings.CharSettingFlags[setting] or not Settings:IsUsingCharSpecificSettings()
end

-- Returns whether or not the provided setting should be editable at a character level.
function Settings:CanEditSettingAtCharacterLevel(setting)
	-- This is really just the inverse of Settings:CanEditSettingAtAccountLevel()
	return setting == Settings.CHAR_SPECIFIC_SETTINGS or (Settings.CharSettingFlags[setting] and Settings:IsUsingCharSpecificSettings())
end

-----------------------------------
-- Individual Settings Functions --
-----------------------------------

-- General Settings

function Settings:GetLanguage()
	return Settings:Get(Settings.LANGUAGE)
end

function Settings:SetLanguage(value, listener)
	Settings:Set(Settings.LANGUAGE, value, listener)
end

function Settings:IsShowingWelcomeMessage()
	return Settings:Get(Settings.SHOW_WELCOME_MESSAGE)
end

function Settings:SetShowingWelcomeMessage(value, listener)
	Settings:Set(Settings.SHOW_WELCOME_MESSAGE, value, listener)
end

function Settings:IsShowingFunFacts()
	return Settings:Get(Settings.SHOW_FUN_FACTS)
end

function Settings:SetShowingFunFacts(value, listener)
	Settings:Set(Settings.SHOW_FUN_FACTS, value, listener)
end

-- Interface Settings - Character-Specific

function Settings:SetUsingCharSpecificSettings(value, listener)
	Settings:Set(true, Settings.CHAR_SPECIFIC_SETTINGS, value, listener)
end

-- Interface Settings

function Settings:IsShowingOnLoad()
	return Settings:Get(Settings.SHOW_ON_LOAD)
end

function Settings:SetShowingOnLoad(value, listener)
	Settings:Set(Settings.SHOW_ON_LOAD, value, listener)
end

function Settings:IsHidingOnEscape()
	return Settings:Get(Settings.HIDE_ON_ESCAPE)
end

function Settings:SetHidingOnEscape(value, listener)
	Settings:Set(Settings.HIDE_ON_ESCAPE, value, listener)
end

function Settings:IsShowingMinimapIcon()
	return Settings:Get(Settings.SHOW_MINIMAP_ICON)
end

function Settings:SetShowingMinimapIcon(value, listener)
	Settings:Set(Settings.SHOW_MINIMAP_ICON, value, listener)
end

function Settings:IsShowingCondensedView()
	return Settings:Get(Settings.SHOW_CONDENSED_VIEW)
end

function Settings:SetShowingCondensedView(value, listener)
	Settings:Set(Settings.SHOW_CONDENSED_VIEW, value, listener)
end

-- Characters Page

function Settings:IsShowingCharactersPage()
	return Settings:Get(Settings.SHOW_CHARACTERS_PAGE)
end

function Settings:SetShowingCharactersPage(value, listener)
	Settings:Set(Settings.SHOW_CHARACTERS_PAGE, value, listener)
end

function Settings:IsShowingRealmCharactersOnlyInCharactersPage()
	return Settings:Get(Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY)
end

function Settings:SetShowingRealmCharactersOnlyInCharactersPage(value, listener)
	Settings:Set(Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY, value, listener)
end

function Settings:IsShowingFactionColorsByAllegianceInCharactersPage()
	return Settings:Get(Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE)
end

function Settings:SetShowingFactionColorsByAllegianceInCharactersPage(value, listener)
	Settings:Set(Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE, value, listener)
end

-- Farming Page

function Settings:IsShowingFarmingPage()
	return Settings:Get(Settings.SHOW_FARMING_PAGE)
end

function Settings:SetShowingFarmingPage(value, listener)
	Settings:Set(Settings.SHOW_FARMING_PAGE, value, listener)
end

function Settings:GetRateMetricIndexInFarmingPage()
	return Settings:Get(Settings.FARMING_PAGE_RATE_METRIC_INDEX)
end

function Settings:SetRateMetricIndexInFarmingPage(value, listener)
	Settings:Set(Settings.FARMING_PAGE_RATE_METRIC_INDEX, value, listener)
end

function Settings:GetRateMetricUpdateTickInFarmingPage()
	return Settings:Get(Settings.FARMING_PAGE_RATE_METRIC_UPDATE_TICK)
end

function Settings:SetRateMetricUpdateTickInFarmingPage(value, listener)
	Settings:Set(Settings.FARMING_PAGE_RATE_METRIC_UPDATE_TICK, value, listener)
end

function Settings:IsShowingDataForTrackedQuestOnlyInFarmingPage()
	return Settings:Get(Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY)
end

function Settings:SetShowingDataForTrackedQuestOnlyInFarmingPage(value, listener)
	Settings:Set(Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY, value, listener)
end

-- Questing Page

function Settings:IsShowingQuestingPage()
	return Settings:Get(Settings.SHOW_QUESTING_PAGE)
end

function Settings:SetShowingQuestingPage(value, listener)
	Settings:Set(Settings.SHOW_QUESTING_PAGE, value, listener)
end

function Settings:IsHidingCompletedZonesInQuestingPage()
	return Settings:Get(Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES)
end

function Settings:SetHidingCompletedZonesInQuestingPage(value, listener)
	Settings:Set(Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES, value, listener)
end

function Settings:IsShowingZoneQuestCountInQuestingPage()
	return Settings:Get(Settings.QUESTING_PAGE_ZONE_QUEST_COUNT)
end

function Settings:SetShowingZoneQuestCountInQuestingPage(value, listener)
	Settings:Set(Settings.QUESTING_PAGE_ZONE_QUEST_COUNT, value, listener)
end

function Settings:IsHidingCompletedDungeonsInQuestingPage()
	return Settings:Get(Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS)
end

function Settings:SetHidingCompletedDungeonsInQuestingPage(value, listener)
	Settings:Set(Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS, value, listener)
end

function Settings:IsShowingDungeonPreQuestCountInQuestingPage()
	return Settings:Get(Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT)
end

function Settings:SetShowingDungeonPreQuestCountInQuestingPage(value, listener)
	Settings:Set(Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT, value, listener)
end

function Settings:IsShowingDungeonQuestToBringCountInQuestingPage()
	return Settings:Get(Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT)
end

function Settings:SetShowingDungeonQuestToBringCountInQuestingPage(value, listener)
	Settings:Set(Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT, value, listener)
end

function Settings:IsShowingDungeonQuestCountInQuestingPage()
	return Settings:Get(Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT)
end

function Settings:SetShowingDungeonQuestCountInQuestingPage(value, listener)
	Settings:Set(Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT, value, listener)
end

-- Notes Page

function Settings:IsShowingNotesPage()
	return Settings:Get(Settings.SHOW_NOTES_PAGE)
end

function Settings:SetShowingNotesPage(value, listener)
	Settings:Set(Settings.SHOW_NOTES_PAGE, value, listener)
end

-- Advanced Settings

function Settings:GetLogLevel()
	return Settings:Get(Settings.LOG_LEVEL)
end

function Settings:SetLogLevel(value, listener)
	Settings:Set(Settings.LOG_LEVEL, value, listener)
end

---------------------------------
-- Settings Listener Functions --
---------------------------------

-- Any Settings

function Settings:GetListener(setting)
	if not Settings.Listeners then
		Settings.Listeners = {}
	end
	
	return Settings.Listeners[setting]
end

function Settings:SetListener(setting, listener)
	if not Settings.Listeners then
		Settings.Listeners = {}
	end
	
	Settings.Listeners[setting] = listener
end

function Settings:OnSettingChanged(setting, value, listener)
	if not listener then
		listener = Settings:GetListener(setting)
	end
	
	if listener then
		listener(value)
	end
	
	Settings:OnUniversalSettingChange()
end

------------------------
-- Settings Listeners --
------------------------

-- Any Settings

function Settings:SetUniversalSettingsListener(listener)
	Settings.UniversalSettingsListener = listener
end

function Settings:OnUniversalSettingChange()
	if Settings.UniversalSettingsListener then
		Settings:UniversalSettingsListener()
	end
end

-- General Settings

function Settings:SetLanguageListener(listener)
	Settings:SetListener(Settings.LANGUAGE, listener)
end

function Settings:SetShowWelcomeMessageListener(listener)
	Settings:SetListener(Settings.SHOW_WELCOME_MESSAGE, listener)
end

function Settings:SetShowFunFactsListener(listener)
	Settings:SetListener(Settings.SHOW_FUN_FACTS, listener)
end

-- Character-Specific

function Settings:SetCharSpecificSettingsListener(listener)
	Settings:SetListener(Settings.CHAR_SPECIFIC_SETTINGS, listener)
end

-- Interface Settings

function Settings:SetShowCondensedViewListener(listener)
	Settings:SetListener(Settings.SHOW_CONDENSED_VIEW, listener)
end

-- Characters Page

function Settings:SetShowCharacterPageListener(listener)
	Settings:SetListener(Settings.SHOW_CHARACTERS_PAGE, listener)
end

function Settings:SetShowRealmCharactersOnlyInCharactersPageListener(listener)
	Settings:SetListener(Settings.CHARACTERS_PAGE_SHOW_SAME_REALM_CHARACTERS_ONLY, listener)
end

function Settings:SetShowFactionColorsByAllegianceInCharactersPageListener(listener)
	Settings:SetListener(Settings.CHARACTERS_PAGE_SHOW_FACTION_COLORS_BY_ALLEGIANCE, listener)
end

-- Farming Page

function Settings:SetShowFarmingPageListener(listener)
	Settings:SetListener(Settings.SHOW_FARMING_PAGE, listener)
end

function Settings:SetRateMetricIndexInFarmingPageListener(listener)
	Settings:SetListener(Settings.FARMING_PAGE_RATE_METRIC_INDEX, listener)
end

function Settings:SetRateMetricTickInFarmingPageListener(listener)
	Settings:SetListener(Settings.FARMING_PAGE_RATE_METRIC_UPDATE_TICK, listener)
end

function Settings:SetShowDataForTrackedQuestsOnlyInFarmingPageListener(listener)
	Settings:SetListener(Settings.FARMING_PAGE_TRACKED_QUESTS_ONLY, listener)
end

-- Questing Page

function Settings:SetShowQuestingPageListener(listener)
	Settings:SetListener(Settings.SHOW_QUESTING_PAGE, listener)
end

function Settings:SetHideCompletedZonesInQuestingPageListener(listener)
	Settings:SetListener(Settings.QUESTING_PAGE_HIDE_COMPLETED_ZONES, listener)
end

function Settings:SetShowZoneQuestCountInQuestingPageListener(listener)
	Settings:SetListener(Settings.QUESTING_PAGE_ZONE_QUEST_COUNT, listener)
end

function Settings:SetHideCompletedDungeonsInQuestingPageListener(listener)
	Settings:SetListener(Settings.QUESTING_PAGE_HIDE_COMPLETED_DUNGEONS, listener)
end

function Settings:SetShowDungeonPreQuestCountInQuestingPageListener(listener)
	Settings:SetListener(Settings.QUESTING_PAGE_DUNGEON_PRE_QUEST_COUNT, listener)
end

function Settings:SetShowDungeonQuestToBringCountInQuestingPageListener(listener)
	Settings:SetListener(Settings.QUESTING_PAGE_DUNGEON_QUEST_TO_BRING_COUNT, listener)
end

function Settings:SetShowDungeonQuestCountInQuestingPageListener(listener)
	Settings:SetListener(Settings.QUESTING_PAGE_DUNGEON_QUEST_COUNT, listener)
end

-- Notes Page

function Settings:SetShowNotesPageListener(listener)
	Settings:SetListener(Settings.SHOW_NOTES_PAGE, listener)
end

-- Advanced Settings

function Settings:SetLogLevelListener(listener)
	Settings:SetListener(Settings.LOG_LEVEL, listener)
end
