local _, Frogtome = ...
if not Frogtome.Settings then
	Frogtome.Settings = {}
end
Frogtome.Settings.HiddenSettings = {}

local HiddenSettings = Frogtome.Settings.HiddenSettings
local SavedData = Frogtome.Data.SavedData

----------------------------------------
-- Hidden Settings and Default Values --
----------------------------------------

HiddenSettings.Keys = {}
HiddenSettings.CharSettingFlags = {}
HiddenSettings.Defaults = {}

-- AddOn Hidden Settings

HiddenSettings.VERSION = "Version"
HiddenSettings.CharSettingFlags[HiddenSettings.VERSION] = false
HiddenSettings.Defaults[HiddenSettings.VERSION] = nil -- This forces the initial setup/upgrade to run

HiddenSettings.LOG_LEVEL = "LogLevel"
HiddenSettings.CharSettingFlags[HiddenSettings.LOG_LEVEL] = false
HiddenSettings.Defaults[HiddenSettings.LOG_LEVEL] = 3

-- Main Frame Hidden Settings

HiddenSettings.LAST_SHOWN_PAGE_ID = "LastShownPageId"
HiddenSettings.CharSettingFlags[HiddenSettings.LAST_SHOWN_PAGE_ID] = true
HiddenSettings.Defaults[HiddenSettings.LAST_SHOWN_PAGE_ID] = "CharactersPage"

-- Character Page Hidden Settings

HiddenSettings.CHAR_PAGE_LAST_SHOWN_VIEW = "CharPageLastShownView"
HiddenSettings.CharSettingFlags[HiddenSettings.CHAR_PAGE_LAST_SHOWN_VIEW] = true
HiddenSettings.Defaults[HiddenSettings.CHAR_PAGE_LAST_SHOWN_VIEW] = 1

-- Farming Page Hidden Settings

HiddenSettings.FARM_PAGE_LAST_SHOWN_VIEW_IS_XP = "FarmPageLastShownViewIsXp"
HiddenSettings.CharSettingFlags[HiddenSettings.FARM_PAGE_LAST_SHOWN_VIEW_IS_XP] = true
HiddenSettings.Defaults[HiddenSettings.FARM_PAGE_LAST_SHOWN_VIEW_IS_XP] = true

HiddenSettings.FARM_PAGE_LAST_SHOWN_GOLD_GOAL = "FarmPageLastShownGoldGoal"
HiddenSettings.CharSettingFlags[HiddenSettings.FARM_PAGE_LAST_SHOWN_GOLD_GOAL] = true
HiddenSettings.Defaults[HiddenSettings.FARM_PAGE_LAST_SHOWN_GOLD_GOAL] = 1

-- Notes Page Hidden Settings

HiddenSettings.NOTES_PAGE_LAST_SHOWN_NOTES_IS_ACCOUNT = "NotesPageLastShownNotes"
HiddenSettings.CharSettingFlags[HiddenSettings.NOTES_PAGE_LAST_SHOWN_NOTES_IS_ACCOUNT] = true
HiddenSettings.Defaults[HiddenSettings.NOTES_PAGE_LAST_SHOWN_NOTES_IS_ACCOUNT] = true

-- Dev Hidden Settings

HiddenSettings.DEV_LOGGING_ENABLED = "DevLoggingEnabled"
HiddenSettings.CharSettingFlags[HiddenSettings.DEV_LOGGING_ENABLED] = false
HiddenSettings.Defaults[HiddenSettings.DEV_LOGGING_ENABLED] = false

HiddenSettings.DEV_TOOLS_ENABLED = "DevToolsEnabled"
HiddenSettings.CharSettingFlags[HiddenSettings.DEV_TOOLS_ENABLED] = false
HiddenSettings.Defaults[HiddenSettings.DEV_TOOLS_ENABLED] = false

------------------------------------
-- Core Hidden Settings Functions --
------------------------------------

-- Initializes the saved hidden settings data if necessary
function HiddenSettings:InitializeHiddenSettings()
	SavedData:InitializeSavedData()
	if not SavedData:GetGlobalSavedData().HiddenSettings then
		SavedData:GetGlobalSavedData().HiddenSettings = {}
	end
	if not SavedData:GetCharacterSavedData().HiddenSettings then
		SavedData:GetCharacterSavedData().HiddenSettings = {}
	end
end

-- Resets all hidden settings, removing their stored values and effectively reverting them to their default values.
function HiddenSettings:ResetAllHiddenSettings()
	HiddenSettings:InitializeHiddenSettings()
	SavedData:GetGlobalSavedData().HiddenSettings = {}
	SavedData:GetCharacterSavedData().HiddenSettings = {}
end

-- Returns whether or not the provided hidden setting is character specific.
function HiddenSettings:IsHiddenSettingCharacterSpecifc(key)
	return HiddenSettings.CharSettingFlags[key]
end

-- Returns the effective value of a setting.
function HiddenSettings:Get(key)
	HiddenSettings:InitializeHiddenSettings()
	
	local value = nil
	if HiddenSettings:IsHiddenSettingCharacterSpecifc(key) then
		value = SavedData:GetCharacterSavedData().HiddenSettings[key]
	else
		value = SavedData:GetGlobalSavedData().HiddenSettings[key]
	end
	
	if value == nil then
		value = HiddenSettings.Defaults[key]
	end
	
	return value
end

-- Sets the value of a hidden setting.
function HiddenSettings:Set(key, value)
	if value == nil then
		value = HiddenSettings:Get(key)
	end
	
	if HiddenSettings:IsHiddenSettingCharacterSpecifc(key) then
		SavedData:GetCharacterSavedData().HiddenSettings[key] = value
	else
		SavedData:GetGlobalSavedData().HiddenSettings[key] = value
	end
end

-----------------------------------
-- Individual Settings Functions --
-----------------------------------

function HiddenSettings:GetVersion()
	return HiddenSettings:Get(HiddenSettings.VERSION)
end

function HiddenSettings:SetVersion(value)
	HiddenSettings:Set(HiddenSettings.VERSION, value)
end

function HiddenSettings:GetLogLevel()
	return HiddenSettings:Get(HiddenSettings.LOG_LEVEL)
end

function HiddenSettings:SetLogLevel(value)
	HiddenSettings:Set(HiddenSettings.LOG_LEVEL, value)
end

function HiddenSettings:GetLastShownPageId()
	return HiddenSettings:Get(HiddenSettings.LAST_SHOWN_PAGE_ID)
end

function HiddenSettings:SetLastShownPageId(value)
	HiddenSettings:Set(HiddenSettings.LAST_SHOWN_PAGE_ID, value)
end

function HiddenSettings:GetCharacterPageLastShownView()
	return HiddenSettings:Get(HiddenSettings.CHAR_PAGE_LAST_SHOWN_VIEW)
end

function HiddenSettings:SetCharacterPageLastShownView(value)
	HiddenSettings:Set(HiddenSettings.CHAR_PAGE_LAST_SHOWN_VIEW, value)
end

function HiddenSettings:GetFarmingPageLastShownViewIsXp()
	return HiddenSettings:Get(HiddenSettings.FARM_PAGE_LAST_SHOWN_VIEW_IS_XP)
end

function HiddenSettings:SetFarmingPageLastShownViewIsXp(value)
	HiddenSettings:Set(HiddenSettings.FARM_PAGE_LAST_SHOWN_VIEW_IS_XP, value)
end

function HiddenSettings:GetFarmingPageLastShownGoldGoal()
	return HiddenSettings:Get(HiddenSettings.FARM_PAGE_LAST_SHOWN_GOLD_GOAL)
end

function HiddenSettings:SetFarmingPageLastShownGoldGoal(value)
	HiddenSettings:Set(HiddenSettings.FARM_PAGE_LAST_SHOWN_GOLD_GOAL, value)
end

function HiddenSettings:GetNotesPageLastShownNotesIsAccount()
	return HiddenSettings:Get(HiddenSettings.NOTES_PAGE_LAST_SHOWN_NOTES_IS_ACCOUNT)
end

function HiddenSettings:SetNotesPageLastShownNotesIsAccount(value)
	HiddenSettings:Set(HiddenSettings.NOTES_PAGE_LAST_SHOWN_NOTES_IS_ACCOUNT, value)
end

function HiddenSettings:IsDevLoggingEnabled()
	return HiddenSettings:Get(HiddenSettings.DEV_LOGGING_ENABLED)
end

function HiddenSettings:SetDevLoggingEnabled(value)
	HiddenSettings:Set(HiddenSettings.DEV_LOGGING_ENABLED, value)
end

function HiddenSettings:AreDevToolsEnabled()
	return HiddenSettings:Get(HiddenSettings.DEV_TOOLS_ENABLED)
end

function HiddenSettings:SetDevToolsEnabled(value)
	HiddenSettings:Set(HiddenSettings.DEV_TOOLS_ENABLED, value)
end
