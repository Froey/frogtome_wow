local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Character = {}

local API = Frogtome.Core.API
local Character = Frogtome.Core.Character
local Context = Frogtome.Version.Context
local Core = Frogtome.Core.Core
local InfoData = Frogtome.Data.InfoData
local Log = Frogtome.Misc.Log
local SavedData = Frogtome.Data.SavedData
local XP = Frogtome.Core.XP

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

Character.CONTEXT_MODULE = "Frogtome.Core.Character"

-------------------------
-- Core Data Functions --
-------------------------

-- Returns the GUID of the current character.
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetGuid",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterGuid" }
)
function Character:GetGuid()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetGuid") then
		return "???"
	end
	
	return API.GetCharacterGuid()
end

-- Returns the server of the current player.
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetServer",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterServer" }
)
function Character:GetServer()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetServer") then
		return "???"
	end
	
	return API.GetCharacterServer()
end

-- Returns the (server's) ruleset for the current character.
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetRuleset",
	{ Context.FOREVER_ID }, 
	{ "GetCharacterServer" }
)
function Character:GetRuleset()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetRuleset") then
		return "???"
	end
	
	local server = Character:GetServer():lower()
	if server:find("pve", 1, true) then
		return "PvE"
	end
	if server:find("pvp", 1, true) then
		return "PvP"
	end
	if server:find("rp", 1, true) then
		return "RP"
	end
	if server:find("hc", 1, true) or server:find("hardcore", 1, true) then
		return "HC"
	end
	
	return "???"
end

-- Returns the English data string for the current character's faction.
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetFaction",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterFactionDataString" }
)
function Character:GetFaction()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetFaction") then
		return "Unknown"
	end
	
	return API.GetCharacterFactionDataString()
end

-- Returns the English data string for the current character's race.
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetRace",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterRaceDataString" }
)
function Character:GetRace()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetRace") then
		return "Unknown"
	end
	
	return API.GetCharacterFactionDataString()
end

-- Returns the numerical ID for the current character's class.
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetClassId",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterClassId" }
)
function Character:GetClassId()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetClassId") then
		return nil
	end
	
	return API.GetCharacterClassId()
end

-- Returns an English data string for the current character's body type (or sex, if you prefer).
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetBodyType",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterBodyTypeId" }
)
function Character:GetBodyType()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetBodyType") then
		return nil
	end
	
	return InfoData.BodyTypes[API.GetCharacterBodyTypeId()]
end

-- Returns the first name of the current character.
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetFirstName",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterFirstName" }
)
function Character:GetFirstName()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetFirstName") then
		return "Unknown"
	end
	
	return API.GetCharacterFirstName()
end

-- Returns the last name of the current character.
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetLastName",
	{ Context.FOREVER_ID }, 
	{ "GetCharacterLastName" }
)
function Character:GetLastName()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetLastName") then
		return nil
	end
	
	return API.GetCharacterLastName()
end

-- Returns the full name of the current character.
function Character:GetFullName()
	local firstName = Character:GetFirstName()
	local lastName = Character:GetLastName()
	
	if lastName then
		return firstName .. " " .. lastName
	else
		return firstName
	end
end

-- Returns the name of the guild for the current character.
Context:SetDependencies(
	Character.CONTEXT_MODULE,
	"GetGuildName",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterGuildName" }
)
function Character:GetGuildName()
	if not Context:CheckDependencies(Character.CONTEXT_MODULE, "GetGuildName") then
		return nil
	end
	
	return API.GetCharacterGuildName()
end

-----------------------------
-- Saved Data Interactions --
-----------------------------

-- Initialized the saved character data if necessary.
function Character:InitializeData()
	SavedData:InitializeSavedData()
	
	local globalData = SavedData:GetGlobalSavedData()
	if not globalData.Characters then
		globalData.Characters = {}
	end
end

-- Returns the character data from saved data.
function Character:GetCharacterData()
	return SavedData:GetGlobalSavedData().Characters
end

-- Returns a mutable list of the characters (as packages of info) stored in saved data.
function Character:GetCharacters(sameRulesOnly)
	Character:InitializeData()
	if not Character:GetCharacterData() then
		return {}
	end
	
	local characters = {}
	for _, character in pairs(Character:GetCharacterData()) do
		if not sameRulesOnly or Character:GetRuleset() == character.Rules then
			table.insert(characters, character)
		end
	end
	
	return characters
end

-- Returns a mutable list of the characters (as packages of info) stored in saved data, in order of each character's order attribute.
function Character:GetSortedCharacters(sameRulesOnly)
	local characters = Character:GetCharacters(sameRulesOnly)
	table.sort(characters, function(c1, c2) return c1.Order < c2.Order end)
	
	return characters
end

-- Squishes all characters' orders into a continuous sequence of positive integers.
function Character:SquishCharacterOrders()
	for index, character in ipairs(Character:GetSortedCharacters()) do
		-- Don't need any special math, just set each according to their organized order
		character.Order = index
	end
end

-- Returns the character (as a package of info) with the provided GUID that's stored in saved data.
function Character:GetCharacter(guid)
	Character:InitializeData()
	if not Character:GetCharacterData() then
		return nil
	end
	
	return Character:GetCharacterData()[guid]
end

-- Sets the provided character (as a package of info) into the saved character data, stored by their respective GUID.
function Character:PutCharacter(character)
	Character:InitializeData()
	if not Character:GetCharacterData() then
		Log:Error("Failed to write character data - could not initialize saved data")
		return
	end
	
	-- If this character hasn't been given an order yet, put it last
	if character.Order == -1 then
		character.Order = #Character:GetSortedCharacters() + 1
	end
	
	Character:GetCharacterData()[character.GUID] = character
end

-- Removes the character (as a package of info) with the provided GUID from the saved character data.
function Character:RemoveCharacter(guid)
	Character:InitializeData()
	if not Character:GetCharacterData() then
		return
	end
	
	local character = Character:GetCharacter(guid)
	if not character then
		return
	end
	
	Character:GetCharacterData()[guid] = nil
	Character:SquishCharacterOrders()
end

-- Swaps the orders of the provided characters (as packages of info) within saved character data.
function Character:SwapCharacterOrders(character1, character2)
	Character:InitializeData()
	if not Character:GetCharacterData() then
		return
	end
	if not character1 or not character2 then
		return
	end
	
	local swappedOrder = character1.Order
	character1.Order = character2.Order
	character2.Order = swappedOrder
	
	Character:PutCharacter(character1)
	Character:PutCharacter(character2)
end

-------------------------------------
-- Character Information Gathering --
-------------------------------------

-- Creates and returns the info package for the current character's profession at the specified index.
function Character:GenerateCurrentProfessionInfo(professionIndex)
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(professionIndex)
	
	local profession = {}
	profession.Name = name
	profession.IconId = iconId
	profession.CurrentSkill = currentSkill
	profession.MaxSkill = maxSkill
	
	return profession
end

-- Creates and returns the info package for the current character's inventory.
function Character:CreateCurrentInventoryInfo()
	local inventory = {}
	
	inventory.TotalSize = Core:GetInventorySize(true)
	
	inventory.Backpack = Core:GetBackpackSize()
	inventory.Bag1 = Core:GetBagSize(1)
	inventory.Bag2 = Core:GetBagSize(2)
	inventory.Bag3 = Core:GetBagSize(3)
	inventory.Bag4 = Core:GetBagSize(4)
	inventory.ReagentBag = Core:GetReagentBagSize()
	
	return inventory
end

-- Creates and returns the representative character info package for the current chracter.
function Character:GenerateCurrentCharacter()
	local character = {}
	
	character.Order = -1
	character.Timestamp = time() -- TODO: put into API
	
	character.GUID = Character:GetGuid()
	character.Server = Character:GetServer()
	character.Rules = Character:GetRuleset()
	character.Faction = Character:GetFaction()
	character.Race = Character:GetRace()
	if character.Race:find("Skyborne", 1, true) then
		character.Race = "Skyborne"
	end
	character.Class = Character:GetClassId()
	character.BodyType = Character:GetBodyType()
	character.FirstName = Character:GetFirstName()
	character.LastName = Character:GetLastName()
	character.FullName = Character:GetFullName()
	character.Guild = Character:GetGuildName()
	
	character.Level = Core:GetCurrentLevel()
	character.IsMaxLevel = Core:IsMaxLevel()
	character.CurrentXp = Core:GetCurrentXp()
	character.NeededXp = Core:GetNeededXp()
	character.RestedXp = Core:GetRestedXp()
	character.IsResting = Core:IsResting()
	character.WellRestedRank = XP:GetWellRestedRank()
	
	if Core:IsFirstProfessionLearned() then
		character.FirstProfession = Character:GenerateCurrentProfessionInfo(Core:GetFirstProfessionIndex())
	end
	if Core:IsSecondProfessionLearned() then
		character.SecondProfession = Character:GenerateCurrentProfessionInfo(Core:GetSecondProfessionIndex())
	end
	if Core:IsFishingProfessionLearned() then
		character.FishingProfession = Character:GenerateCurrentProfessionInfo(Core:GetFishingProfessionIndex())
	end
	if Core:IsCookingProfessionLearned() then
		character.CookingProfession = Character:GenerateCurrentProfessionInfo(Core:GetCookingProfessionIndex())
	end
	if Core:IsFirstAidProfessionLearned() then
		character.FirstAidProfession = Character:GenerateCurrentProfessionInfo(Core:GetFirstAidProfessionIndex())
	end
	
	character.Inventory = Character:CreateCurrentInventoryInfo()
	character.Money = Core:GetMoneyInWholeCopper()
	
	return character
end

-- Validates a character (as a package of info) by ensuring that certain necessary information exists.
function Character:ValidateCharacter(character)
	local valid = true
	
	valid = valid and (character.GUID ~= nil)
	valid = valid and (character.Faction ~= nil)
	valid = valid and (character.Race ~= nil)
	valid = valid and (character.Class ~= nil)
	valid = valid and (character.Level ~= nil)
	valid = valid and (character.BodyType ~= nil)
	valid = valid and (character.FullName ~= nil)
	valid = valid and (character.FirstName ~= nil)
	
	-- These two flags should be enough to confirm that XP information is available
	valid = valid and (character.IsMaxLevel ~= nil)
	valid = valid and (character.IsResting ~= nil)
	
	valid = valid and (character.Money ~= nil)
	
	return valid
end

-- Updates the saved data for the current character.
function Character:UpdateCurrentCharacter()
	local character = Character:GenerateCurrentCharacter()
	if not Character:ValidateCharacter(character) then
		Log:Warn("Invalid character package created - is some data not available?")
		return
	end
	
	local existingCharacter = Character:GetCharacter(character.GUID)
	if existingCharacter then
		character.Order = existingCharacter.Order
	end
	
	Character:PutCharacter(character)
end
