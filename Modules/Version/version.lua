local _, Frogtome = ...
if not Frogtome.Version then
	Frogtome.Version = {}
end
Frogtome.Version.Version = {}

local HiddenSettings = Frogtome.Settings.HiddenSettings
local Log = Frogtome.Misc.Log
local Upgrade = Frogtome.Version.Upgrade
local Version = Frogtome.Version.Version

------------------------
-- Version Definition --
------------------------

Version.VERSION_MAJOR_ID_MAX_VALUE = 99
Version.VERSION_MINOR_ID_MAX_VALUE = 99
Version.VERSION_PATCH_ID_MAX_VALUE = 99

Version.VERSION_MAJOR_ID = "Major"
Version.VERSION_MINOR_ID = "Minor"
Version.VERSION_PATCH_ID = "Patch"
Version.VERSION_IS_BETA = "IsBeta"

Version.CURRENT_VERSION = {
	[Version.VERSION_MAJOR_ID] = 1,
	[Version.VERSION_MINOR_ID] = 0,
	[Version.VERSION_PATCH_ID] = 0,
	[Version.VERSION_IS_BETA] = false
}

function Version:GetCurrentMajorId()
	return Version.CURRENT_VERSION[Version.VERSION_MAJOR_ID]
end

function Version:GetCurrentMinorId()
	return Version.CURRENT_VERSION[Version.VERSION_MINOR_ID]
end

function Version:GetCurrentPatchId()
	return Version.CURRENT_VERSION[Version.VERSION_PATCH_ID]
end

function Version:IsCurrentlyBeta()
	return Version.CURRENT_VERSION[Version.VERSION_IS_BETA]
end

function Version:GetCurrentLabel(includeBeta)
	local major = Version:GetCurrentMajorId()
	local minor = Version:GetCurrentMinorId()
	local patch = Version:GetCurrentPatchId()
	local beta = Version:IsCurrentlyBeta()
	
	local label = "v" .. tostring(major) .. "." .. tostring(minor) .. "." .. tostring(patch)
	if includeBeta and beta then
		label = label .. " BETA"
	end
	
	return label
end

-------------------------
-- Version Upgrade Map --
-------------------------

function Version:CreateComparableVersionId(major, minor, patch)
	return (major * 10000) + (minor * 100) + patch
end

function Version:CheckAndPerformUpgrades()
	local currentVersion = Version.CURRENT_VERSION
	local currentMajor = currentVersion[Version.VERSION_MAJOR_ID]
	local currentMinor = currentVersion[Version.VERSION_MINOR_ID]
	local currentPatch = currentVersion[Version.VERSION_PATCH_ID]
	local currentVersionId = Version:CreateComparableVersionId(currentMajor, currentMinor, currentPatch)
	
	local oldVersion  = HiddenSettings:GetVersion()
	local oldMajor = 0
	local oldMinor = 0
	local oldPatch = 0
	if oldVersion then
		oldMajor = oldVersion[Version.VERSION_MAJOR_ID]
		oldMinor = oldVersion[Version.VERSION_MINOR_ID]
		oldPatch = oldVersion[Version.VERSION_PATCH_ID]
	end
	local oldVersionId = Version:CreateComparableVersionId(oldMajor, oldMinor, oldPatch)
	
	-- Translate the upgrade bridge map into a sorted list of upgrade bridges we need to run in order
	local upgradeBridges = {}
	for id, upgradeBridgeFunction in pairs(Version.UPGRADE_BRIDGE_MAP) do
		if oldVersionId < id and id <= currentVersionId then
			local upgradeBridge = {}
			upgradeBridge.ID = id
			upgradeBridge.UpgradeBridgeFunction = upgradeBridgeFunction
			table.insert(upgradeBridges, upgradeBridge)
		end
	end
	table.sort(upgradeBridges, function(b1, b2) return b1.ID < b2.ID end)
	
	-- Run through each bridge sequentially
	for upgradeBridgeIndex, upgradeBridge in ipairs(upgradeBridges) do
		Log:Error("Running upgrade bridge " .. tostring(upgradeBridgeIndex) .. " of " .. tostring(#upgradeBridges) .. "...")
		upgradeBridge.UpgradeBridgeFunction(Version.CURRENT_VERSION)
	end
	
	-- Perform one last check on version info to see if we exited beta testing
	if oldVersion and oldVersion[Version.VERSION_IS_BETA] and not currentVersion[Version.VERSION_IS_BETA] then
		Log:Special("Beta testing has concluded - thank you so much!!!")
	end
	
	-- Finally, ensure the current version number is up-to-date
	HiddenSettings:SetVersion(currentVersion)
end

Version.UPGRADE_BRIDGE_MAP = {
	[10000] = Upgrade.v1_0_0_Bridge
}
