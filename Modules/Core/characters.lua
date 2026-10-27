local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Characters = {}

local Characters = Frogtome.Core.Characters
local Core = Frogtome.Core.Core
local Log = Frogtome.Misc.Log
local SavedData = Frogtome.Data.SavedData
local XP = Frogtome.Core.XP

-----------------------------
-- Saved Data Interactions --
-----------------------------

-- Initialized the saved character data if necessary.
function Characters:InitializeData()
	SavedData:InitializeSavedData()
	
	local globalData = SavedData:GetGlobalSavedData()
	if not globalData.Characters then
		globalData.Characters = {}
	end
end

-- Returns the character data from saved data.
function Characters:GetCharacterData()
	return SavedData:GetGlobalSavedData().Characters
end

-- Returns a mutable list of the characters (as packages of info) stored in saved data.
function Characters:GetCharacters(sameRulesOnly)
	Characters:InitializeData()
	if not Characters:GetCharacterData() then
		return {}
	end
	
	local characters = {}
	for _, character in pairs(Characters:GetCharacterData()) do
		if not sameRulesOnly or Core:GetRules() == character.Rules then
			table.insert(characters, character)
		end
	end
	
	return characters
end

-- Returns a mutable list of the characters (as packages of info) stored in saved data, in order of each character's order attribute.
function Characters:GetSortedCharacters(sameRulesOnly)
	local characters = Characters:GetCharacters(sameRulesOnly)
	table.sort(characters, function(c1, c2) return c1.Order < c2.Order end)
	
	return characters
end

-- Squishes all characters' orders into a continuous sequence of positive integers.
function Characters:SquishCharacterOrders()
	for index, character in ipairs(Characters:GetSortedCharacters()) do
		-- Don't need any special math, just set each according to their organized order
		character.Order = index
	end
end

-- Returns the character (as a package of info) with the provided GUID that's stored in saved data.
function Characters:GetCharacter(guid)
	Characters:InitializeData()
	if not Characters:GetCharacterData() then
		return nil
	end
	
	return Characters:GetCharacterData()[guid]
end

-- Sets the provided character (as a package of info) into the saved character data, stored by their respective GUID.
function Characters:PutCharacter(character)
	Characters:InitializeData()
	if not Characters:GetCharacterData() then
		Log:Error("Failed to write character data - could not initialize saved data")
		return
	end
	
	-- If this character hasn't been given an order yet, put it last
	if character.Order == -1 then
		character.Order = #Characters:GetSortedCharacters() + 1
	end
	
	Characters:GetCharacterData()[character.GUID] = character
end

-- Removes the character (as a package of info) with the provided GUID from the saved character data.
function Characters:RemoveCharacter(guid)
	Characters:InitializeData()
	if not Characters:GetCharacterData() then
		return
	end
	
	local character = Characters:GetCharacter(guid)
	if not character then
		return
	end
	
	Characters:GetCharacterData()[guid] = nil
	Characters:SquishCharacterOrders()
end

-- Swaps the orders of the provided characters (as packages of info) within saved character data.
function Characters:SwapCharacterOrders(character1, character2)
	Characters:InitializeData()
	if not Characters:GetCharacterData() then
		return
	end
	if not character1 or not character2 then
		return
	end
	
	local swappedOrder = character1.Order
	character1.Order = character2.Order
	character2.Order = swappedOrder
	
	Characters:PutCharacter(character1)
	Characters:PutCharacter(character2)
end

-------------------------------------
-- Character Information Gathering --
-------------------------------------

-- Creates and returns the info package for the current character's profession at the specified index.
function Characters:GenerateCurrentProfessionInfo(professionIndex)
	local name, iconId, currentSkill, maxSkill = Core:GetProfessionInfo(professionIndex)
	
	local profession = {}
	profession.Name = name
	profession.IconId = iconId
	profession.CurrentSkill = currentSkill
	profession.MaxSkill = maxSkill
	
	return profession
end

-- Creates and returns the info package for the current character's inventory.
function Characters:CreateCurrentInventoryInfo()
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
function Characters:GenerateCurrentCharacter()
	local character = {}
	
	character.Order = -1
	character.Timestamp = time()
	
	character.GUID = Core:GetGUID()
	character.Server = Core:GetServer()
	character.Rules = Core:GetRules()
	character.Faction = Core:GetFactionDataString()
	character.Race = Core:GetRaceDataString()
	if character.Race:find("Skyborne", 1, true) then
		character.Race = "Skyborne"
	end
	character.Class = Core:GetClassId()
	character.Level = Core:GetCurrentLevel()
	character.BodyType = Core:GetBodyTypeName()
	character.FullName = Core:GetFullName()
	character.FirstName = Core:GetFirstName()
	character.LastName = Core:GetLastName()
	character.Guild = Core:GetGuildName()
	
	character.IsMaxLevel = Core:IsMaxLevel()
	character.CurrentXp = Core:GetCurrentXp()
	character.NeededXp = Core:GetNeededXp()
	character.RestedXp = Core:GetRestedXp()
	character.IsResting = Core:IsResting()
	character.WellRestedRank = XP:GetWellRestedRank()
	
	if Core:IsFirstProfessionLearned() then
		character.FirstProfession = Characters:GenerateCurrentProfessionInfo(Core:GetFirstProfessionIndex())
	end
	if Core:IsSecondProfessionLearned() then
		character.SecondProfession = Characters:GenerateCurrentProfessionInfo(Core:GetSecondProfessionIndex())
	end
	if Core:IsFishingProfessionLearned() then
		character.FishingProfession = Characters:GenerateCurrentProfessionInfo(Core:GetFishingProfessionIndex())
	end
	if Core:IsCookingProfessionLearned() then
		character.CookingProfession = Characters:GenerateCurrentProfessionInfo(Core:GetCookingProfessionIndex())
	end
	if Core:IsFirstAidProfessionLearned() then
		character.FirstAidProfession = Characters:GenerateCurrentProfessionInfo(Core:GetFirstAidProfessionIndex())
	end
	
	character.Inventory = Characters:CreateCurrentInventoryInfo()
	character.Money = Core:GetMoneyInWholeCopper()
	
	return character
end

-- Validates a character (as a package of info) by ensuring that certain necessary information exists.
function Characters:ValidateCharacter(character)
	local valid = true
	
	valid = valid and (character.GUID ~= nil)
	valid = valid and (character.Faction ~= nil)
	valid = valid and (character.Race ~= nil)
	valid = valid and (character.Class ~= nil)
	valid = valid and (character.Level ~= nil)
	valid = valid and (character.BodyType ~= nil)
	valid = valid and (character.FullName ~= nil)
	valid = valid and (character.FirstName ~= nil)
	valid = valid and (character.LastName ~= nil)
	
	-- These two flags should be enough to confirm that XP information is available
	valid = valid and (character.IsMaxLevel ~= nil)
	valid = valid and (character.IsResting ~= nil)
	
	valid = valid and (character.Money ~= nil)
	
	return valid
end

-- Updates the saved data for the current character.
function Characters:UpdateCurrentCharacter()
	local character = Characters:GenerateCurrentCharacter()
	if not Characters:ValidateCharacter(character) then
		Log:Warn("Invalid character package created - is some data not available?")
		return
	end
	
	local existingCharacter = Characters:GetCharacter(character.GUID)
	if existingCharacter then
		character.Order = existingCharacter.Order
	end
	
	Characters:PutCharacter(character)
end
