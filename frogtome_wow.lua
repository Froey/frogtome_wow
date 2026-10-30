local _, Frogtome = ...
Frogtome.Main = {}

local Character = Frogtome.Core.Character
local CharactersPage = Frogtome.UI.Pages.Characters
local Context = Frogtome.Version.Context
local Dev = Frogtome.Dev.Dev
local FarmingPage = Frogtome.UI.Pages.Farming
local FunctionalTesting = Frogtome.Dev.Testing.FunctionalTesting
local FunFacts = Frogtome.Core.FunFacts
local HiddenSettings = Frogtome.Settings.HiddenSettings
local Log = Frogtome.Misc.Log
local Main = Frogtome.Main
local MainFrame = Frogtome.UI.MainFrame
local NotesPage = Frogtome.UI.Pages.Notes
local SavedData = Frogtome.Data.SavedData
local Session = Frogtome.Core.Session
local Settings = Frogtome.Settings.Settings
local Strings = Frogtome.UI.Strings
local Testing = Frogtome.Dev.Testing.Testing
local UI = Frogtome.UI.UI
local Upgrade = Frogtome.Version.Upgrade
local Utils = Frogtome.Misc.Utils
local Version = Frogtome.Version.Version

-------------------------------
-- Overarching Functionality --
-------------------------------

function Main:Initialize()
	-- If Frogtome is not supported in this context, run tests that might help make it so, but otherwise bail.
	if not Context:IsProjectSupported() then
		Log:Special("Frogtome does not support this version of the game. Running tests but halting initialization...", 0xFF3333)
		Testing:TestAll()
		
		return
	end
	
	-- Perform any upgrades needed for this version of Frogtome
	Version:CheckAndPerformUpgrades()
	
	Log:Debug("Hooking up database...")
	SavedData:InitializeSavedData()
	Settings:InitializeSettings()
	
	Strings:InitializeStrings("EN")
	
	Log:Debug("Hooking up settings...")
	Main:HookUpSettings()
	
	Log:Debug("Performing pre-UI initializations...")
	FunFacts:InitializeFunFacts()
	
	Log:Debug("Constructing UI...")
	MainFrame:Build()
	
	-- This HAS to happen after the UI is set up
	Log:Debug("Performing post-UI initializations...")
	Session:InitializeSession()
	Session:ResetSession()
	
	Dev:InitializeDevTools()
	
	Log:Info("Finished all startup steps!")
	if Settings:IsShowingWelcomeMessage() then
		if Upgrade.IS_FIRST_TIME_LAUNCH then
			Log:Special("Welcome to Frogtome, " .. Character:GetFirstName() .. "!\nTo get started, use the Frogtome minimap icon or type:\n  /frogtome\nFor a list of all slash commands, type:\n  /frogtome help\nThis startup message will no longer appear.")
		else
			Log:Special("Welcome back, " .. Character:GetFirstName() .. "!")
		end
	end
	
	-- Finally, if directed, automatically open Frogtome.
	if Settings:IsShowingOnLoad() then
		-- The main frame should start hidden normally, and this Toggle() call will trigger page selection
		MainFrame:Toggle()
	end
	
	Testing:TestAll()
end

-----------------------------
-- Slash Command Arguments --
-----------------------------

Main.SlashCommandHelpString = "Slash Commands: /frogtome | /ft | /frog\nUsage: /frogtome [arg1] [arg2] ...\nOptional Arguments:\n   help : Shows help for Frogtome slash commands.\n   silent : Prevents other args from changing Frogtome's visibility.\n   show : Shows Frogtome.\n   hide : Hides Frogtome.\n   expanded : Uses the expanded (normal) view for Frogtome.\n   condensed : Uses the condensed view for Frogtome.\n   page [name [view]] : Show a specific Frogtome page by name.\n      (For Characters/Farming/Notes, the view is also needed.)"

Main.SlashCommandArgsDict = {
	["help"] = function()
		Log:Special(Main.SlashCommandHelpString, 0xFFFFAA)
		return nil, nil
	end,
	["silent"] = function()
		return false, nil
	end,
	["show"] = function()
		return true, true
	end,
	["hide"] = function()
		return true, false
	end,
	["expanded"] = function()
		Settings:SetShowingCondensedView(false)
		return nil, nil
	end,
	["condensed"] = function()
		Settings:SetShowingCondensedView(true)
		return nil, nil
	end,
	["page"] = {
		["characters"] = {
			["information"] = function()
				MainFrame:SelectPage("CharactersPage")
				CharactersPage:SelectView(1)
				return nil, nil
			end,
			["experience"] = function()
				MainFrame:SelectPage("CharactersPage")
				CharactersPage:SelectView(2)
				return nil, nil
			end,
			["inventory"] = function()
				MainFrame:SelectPage("CharactersPage")
				CharactersPage:SelectView(3)
				return nil, nil
			end,
			["professions"] = function()
				MainFrame:SelectPage("CharactersPage")
				CharactersPage:SelectView(4)
				return nil, nil
			end
		},
		["farming"] = {
			["xp"] = function()
				MainFrame:SelectPage("FarmingPage")
				if not FarmingPage.ShowingXpView then
					FarmingPage:OnSwitchViewButtonClicked()
				end
				return nil, nil
			end,
			["gold"] = function()
				MainFrame:SelectPage("FarmingPage")
				if FarmingPage.ShowingXpView then
					FarmingPage:OnSwitchViewButtonClicked()
				end
				return nil, nil
			end
		},
		["questing"] = function()
			MainFrame:SelectPage("QuestingPage")
			return nil, nil
		end,
		["notes"] = {
			["account"] = function()
				MainFrame:SelectPage("NotesPage")
				NotesPage:OnAccountButtonClicked()
				return nil, nil
			end,
			["character"] = function()
				MainFrame:SelectPage("NotesPage")
				NotesPage:OnCharacterButtonClicked()
				return nil, nil
			end
		},
		["settings"] = function()
			MainFrame:SelectPage("SettingsPage")
			return nil, nil
		end
	},
	["dev"] = {
		["ll"] = {
			["1"] = function()
				HiddenSettings:SetLogLevel(1)
				return nil, nil
			end,
			["2"] = function()
				HiddenSettings:SetLogLevel(2)
				return nil, nil
			end,
			["3"] = function()
				HiddenSettings:SetLogLevel(3)
				return nil, nil
			end,
			["4"] = function()
				HiddenSettings:SetLogLevel(4)
				return nil, nil
			end,
			["5"] = function()
				HiddenSettings:SetLogLevel(5)
				return nil, nil
			end,
			["6"] = function()
				HiddenSettings:SetLogLevel(6)
				return nil, nil
			end
		},
		["ql"] = {
			["tracked"] = function()
				Dev:PrintQuestLog(true)
				return nil, nil
			end,
			["all"] = function()
				Dev:PrintQuestLog(false)
				return nil, nil
			end
		},
		["dql"] = {
			["tracked"] = function()
				Dev:PrintDungeonQuestLog(true)
				return nil, nil
			end,
			["all"] = function()
				Dev:PrintDungeonQuestLog(false)
				return nil, nil
			end
		}
	}
}

function Main:FindAndExecuteSlashCommandArg(args, argIndex, argDict)
	local arg = args[argIndex]
	if not arg then
		Log:Error("Missing expected slash command arg")
		return math.maxinteger, false
	end
	
	local argEntry = argDict[arg:lower()]
	
	-- Case 1: The arg was not found in the supplied dictionary. Error out and don't continue with any other args
	if not argEntry then
		Log:Error("Unexpected slash command arg: '" .. arg .. "'")
		return math.maxinteger, false
	end
	
	-- Case 2: The arg points directly to a function. Execute the function and return the results
	if type(argEntry) == "function" then
		local shouldForceMainFrameView, forcedMainFrameView = argEntry()
		return argIndex + 1, shouldForceMainFrameView, forcedMainFrameView
	end
	
	-- Case 3: The arg should instead be pointing to another dictionary. Get the results of searching deeper
	return Main:FindAndExecuteSlashCommandArg(args, argIndex + 1, argEntry)
end

function Main:OnSlashCommand(args)
	local shouldStillToggleMainFrameView = true
	local shouldStillForceMainFrameView = nil
	local stillForcedMainFrameView = nil
	
	local argList = {}
	for arg in string.gmatch(args, "%S+") do
		table.insert(argList, arg)
	end
	
	-- Perform a recursive search of the args dictionary for each of the supplied (sub-)arguments
	local argIndex = 1
	while argIndex ~= nil and argIndex <= #argList do
		-- Any present arguments means we shouldn't just simply toggle the view
		shouldStillToggleMainFrameView = false
		
		local nextArgIndex, shouldForceMainFrameView, forcedMainFrameView = Main:FindAndExecuteSlashCommandArg(argList, argIndex, Main.SlashCommandArgsDict)
		
		if shouldStillForceMainFrameView == nil then
			shouldStillForceMainFrameView = shouldForceMainFrameView
		elseif shouldForceMainFrameView ~= nil then
			shouldStillForceMainFrameView = shouldStillForceMainFrameView and shouldForceMainFrameView
		end
		
		if stillForcedMainFrameView == nil then
			stillForcedMainFrameView = forcedMainFrameView
		elseif forcedMainFrameView ~= nil then
			shouldStillForceMainFrameView = forcedMainFrameView
		end
		
		argIndex = nextArgIndex
	end
	
	if shouldStillToggleMainFrameView then
		MainFrame:Toggle()
	elseif shouldStillForceMainFrameView and stillForcedMainFrameView ~= nil then
		if (MainFrame.Frame:IsShown() and not stillForcedMainFrameView) or (not MainFrame.Frame:IsShown() and stillForcedMainFrameView) then
			MainFrame:Toggle()
		end
	end
end

---------------------------------
-- Slash Command Configuration --
---------------------------------

if Context:IsProjectSupported() then
	SLASH_FROGTOME1 = "/frogtome"
	SLASH_FROGTOME2 = "/ft"
	SLASH_FROGTOME3 = "/frog"
	SlashCmdList.FROGTOME = function(args)
		Main:OnSlashCommand(args)
	end
end

------------------------
-- Settings Listeners --
------------------------

function Main:HookUpSettings()
	Settings:SetShowCondensedViewListener(MainFrame.AdjustToPreferredView)
end

--------------------------------------------
-- External Registration and Minimap Icon --
--------------------------------------------

local FrogtomeBroker

local LDB = LibStub:GetLibrary("LibDataBroker-1.1")
if LDB then
	FrogtomeBroker = LDB:NewDataObject("Frogtome", {
		type = "launcher",
		text = "Frogtome",
		icon = "Interface\\AddOns\\frogtome_wow\\Resources\\Icons\\frogtome.tga",
		
		OnClick = function(self, button, mods)
			local shiftDown = IsShiftKeyDown()
			local ctrlDown = IsControlKeyDown()
			local altDown = IsAltKeyDown()
			
			if shiftDown and ctrlDown and altDown then
				if button == "LeftButton" then
					Dev:ToggleDevLogging()
				elseif button == "RightButton" then
					Dev:ToggleDevTools()
				end
				
				return
			end
			
			if button == "LeftButton" then
				MainFrame:Toggle()
			elseif button == "RightButton" then
				Settings:SetShowingCondensedView(not Settings:IsShowingCondensedView())
			end
		end,
		
		OnTooltipShow = function(tooltip)
			tooltip:AddLine("|cff6bd43aFrogtome|r (" .. Version:GetCurrentLabel(true) .. ")")
			tooltip:AddLine("|cff888888(Left Click):|r |cffffffffUses the expanded view.")
			tooltip:AddLine("|cff888888(Right Click):|r |cffffffffUses the condensed view.")
		end
	})
end

if Context:IsProjectSupported() then
	local LibDBIcon = LibStub:GetLibrary("LibDBIcon-1.0")
	if FrogtomeBroker and LibDBIcon then
		if Settings:IsShowingMinimapIcon() then
			SavedData:InitializeSavedData()
			LibDBIcon:Register("Frogtome", FrogtomeBroker, SavedData:GetGlobalSavedData())
		end
	end
end

--------------------
-- Initialization --
--------------------

Main:Initialize()
