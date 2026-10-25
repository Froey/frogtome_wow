local _, Frogtome = ...
if not Frogtome.Version then
	Frogtome.Version = {}
end
Frogtome.Version.Upgrade = {}

local HiddenSettings = Frogtome.Settings.HiddenSettings
local Settings = Frogtome.Settings.Settings
local Upgrade = Frogtome.Version.Upgrade

---------------------
-- Upgrade Bridges --
---------------------

Upgrade.IS_FIRST_TIME_LAUNCH = false

function Upgrade:v1_0_0_Bridge()
	-- This is our first ever time launching Frogtome
	Upgrade.IS_FIRST_TIME_LAUNCH = true
	
	-- Triple-check ensure that settings and hidden settings are initialized
	Settings:InitializeSettings()
	HiddenSettings:InitializeHiddenSettings()
end
