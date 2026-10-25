local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.FunFacts = {}

local Characters = Frogtome.Core.Characters
local Core = Frogtome.Core.Core
local Event = Frogtome.Core.Event
local FunFacts = Frogtome.Core.FunFacts
local Log = Frogtome.Misc.Log
local Settings = Frogtome.Settings.Settings
local Utils = Frogtome.Misc.Utils

------------------------------
-- Fun Fact Utility Methods --
------------------------------

FunFacts.INSPIRATIONALS = {
	"You got this, champ!",
	"Don't stop now!",
	"Your dad would be proud!",
	"Your raid leader knows you can do better!",
	"Who needs grass anyways??"
}

function FunFacts:GetRandomInspirational()
	return FunFacts.INSPIRATIONALS[math.random(#FunFacts.INSPIRATIONALS)]
end

function FunFacts:GetProfessionSummary()
	local professionSummary = {
		["Cooking"] = {
			["IsPrimary"] = false,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["First Aid"] = {
			["IsPrimary"] = false,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Fishing"] = {
			["IsPrimary"] = false,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Enchanting"] = {
			["IsPrimary"] = true,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Skinning"] = {
			["IsPrimary"] = true,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Leatherworking"] = {
			["IsPrimary"] = true,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Mining"] = {
			["IsPrimary"] = true,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Blacksmithing"] = {
			["IsPrimary"] = true,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Herbalism"] = {
			["IsPrimary"] = true,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Alchemy"] = {
			["IsPrimary"] = true,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Tailoring"] = {
			["IsPrimary"] = true,
			["TotalSkill"] = 0,
			["Count"] = 0
		},
		["Engineering"] = {
			["IsPrimary"] = true,
			["TotalSkill"] = 0,
			["Count"] = 0
		}
	}
	
	for _, character in ipairs(Characters:GetCharacters()) do
		if character.FirstProfession then
			professionSummary[character.FirstProfession.Name].Count = professionSummary[character.FirstProfession.Name].Count + 1
			professionSummary[character.FirstProfession.Name].TotalSkill = professionSummary[character.FirstProfession.Name].TotalSkill + character.FirstProfession.CurrentSkill
		end
		if character.SecondProfession then
			professionSummary[character.SecondProfession.Name].Count = professionSummary[character.SecondProfession.Name].Count + 1
			professionSummary[character.SecondProfession.Name].TotalSkill = professionSummary[character.SecondProfession.Name].TotalSkill + character.SecondProfession.CurrentSkill
		end
		if character.FishingProfession then
			professionSummary[character.FishingProfession.Name].Count = professionSummary[character.FishingProfession.Name].Count + 1
			professionSummary[character.FishingProfession.Name].TotalSkill = professionSummary[character.FishingProfession.Name].TotalSkill + character.FishingProfession.CurrentSkill
		end
		if character.CookingProfession then
			professionSummary[character.CookingProfession.Name].Count = professionSummary[character.CookingProfession.Name].Count + 1
			professionSummary[character.CookingProfession.Name].TotalSkill = professionSummary[character.CookingProfession.Name].TotalSkill + character.CookingProfession.CurrentSkill
		end
		if character.FirstAidProfession then
			professionSummary[character.FirstAidProfession.Name].Count = professionSummary[character.FirstAidProfession.Name].Count + 1
			professionSummary[character.FirstAidProfession.Name].TotalSkill = professionSummary[character.FirstAidProfession.Name].TotalSkill + character.FirstAidProfession.CurrentSkill
		end
	end
	
	return professionSummary
end

------------------------
-- Fun Fact Functions --
------------------------

function FunFacts:GenerateLifetimeBoarXPFunFact()
	if Core:IsMaxLevel() then
		return nil
	end
	
	local totalLifetimeXp = Core:GetLifetimeXp()
	local totalLifetimeBoars = totalLifetimeXp / 50
	
	local funFact = "You've earned a total of " .. BreakUpLargeNumbers(totalLifetimeXp) .. " lifetime XP on this character! That's the equivalent of " .. BreakUpLargeNumbers(totalLifetimeBoars, 1) .. " Level 1 Boars!... Y'know, if they all actually offered XP..."
	
	return funFact
end

function FunFacts:GenerateLifetimeXpFunFact()
	if Core:IsMaxLevel() then
		return nil
	end
	
	local totalLifetimeXp = Core:GetLifetimeXp()
	local neededLifetimeXp = Core:GetLifetimeXpNeeded()
	local lifetimeXpPercentage = Core:GetLifetimeXpPercentageString(2)
	
	local funFact = "You have " .. BreakUpLargeNumbers(totalLifetimeXp) .. " of the " .. BreakUpLargeNumbers(math.floor(neededLifetimeXp)) .. " (" .. lifetimeXpPercentage .. ") total XP you need to reach max level! " .. FunFacts:GetRandomInspirational()
	
	return funFact
end

function FunFacts:GenerateLowestAveragePrimaryProfessionFunFact()
	local professionSummary = FunFacts:GetProfessionSummary()
	
	local lowestPrimaryProfessionName = nil
	local lowestPrimaryProfessionAverageSkill = -1
	local multipleLowestPrimaryProfessions = false
	for professionName, professionDetails in pairs(professionSummary) do
		if professionDetails.IsPrimary and professionDetails.Count > 0 then
			local professionAverageSkill = professionDetails.TotalSkill / professionDetails.Count
			if lowestPrimaryProfessionName == nil or professionAverageSkill < lowestPrimaryProfessionAverageSkill then
				lowestPrimaryProfessionName = professionName
				lowestPrimaryProfessionAverageSkill = professionAverageSkill
				multipleLowestPrimaryProfessions = false
			elseif professionAverageSkill == lowestPrimaryProfessionAverageSkill then
				multipleLowestPrimaryProfessions = true
			end
		end
	end
	
	if multipleLowestPrimaryProfessions then
		return nil
	end
	
	local funFact = "Your least-experience learned primary profession, on average, is " .. lowestPrimaryProfessionName .. " (" .. Utils:Round(lowestPrimaryProfessionAverageSkill, 1) .. ")! "
	
	local professionPunDict = {
		["Enchanting"] = "Don't leave that profession in the DUST!",
		["Skinning"] = "You should stop HIDE'ing from working on that!",
		["Leatherworking"] = "Don't let it be a STAIN on your skillset!",
		["Mining"] = "Don't let your progress be in VEIN!",
		["Blacksmithing"] = "You should really IRON out that weakness!",
		["Herbalism"] = "You shouldn't LEAF it alone for much longer!",
		["Alchemy"] = "I bet you're BREW'ding over that one!",
		["Tailoring"] = "You should find the time to WEAVE more practice into your daily routine!",
		["Engineering"] = "You really need more of a SPRING in your step!"
	}
	funFact = funFact .. professionPunDict[lowestPrimaryProfessionName]
	
	return funFact
end

function FunFacts:GenerateHighestAveragePrimaryProfessionFunFact()
	local professionSummary = FunFacts:GetProfessionSummary()
	
	local highestPrimaryProfessionName = nil
	local highestPrimaryProfessionAverageSkill = -1
	local multipleHighestPrimaryProfessions = false
	for professionName, professionDetails in pairs(professionSummary) do
		if professionDetails.IsPrimary and professionDetails.Count > 0 then
			local professionAverageSkill = professionDetails.TotalSkill / professionDetails.Count
			if highestPrimaryProfessionName == nil or professionAverageSkill > highestPrimaryProfessionAverageSkill then
				highestPrimaryProfessionName = professionName
				highestPrimaryProfessionAverageSkill = professionAverageSkill
				multipleHighestPrimaryProfessions = false
			elseif professionAverageSkill == highestPrimaryProfessionAverageSkill then
				multipleHighestPrimaryProfessions = true
			end
		end
	end
	
	if multipleHighestPrimaryProfessions then
		return nil
	end
	
	local funFact = "Your most-experience learned primary profession, on average, is " .. highestPrimaryProfessionName .. " (" .. Utils:Round(highestPrimaryProfessionAverageSkill, 1) .. ")! "
	
	local professionPunDict = {
		["Enchanting"] = "Maybe you'll find another profession just as ENCHANTING...",
		["Skinning"] = "FUR what it's worth, you should get more skill in others as well!",
		["Leatherworking"] = "You really should work on others, LEATHER you like it or not!",
		["Mining"] = "You should PICK another profession to work on instead!",
		["Blacksmithing"] = "It shouldn't have to be HAMMERED home how important the others are!",
		["Herbalism"] = "You should really BRANCH out to other professions, y'know?",
		["Alchemy"] = "Why don't you MIX it up a little bit and try others?",
		["Tailoring"] = "I guess no other profession SEAMS that important to you!",
		["Engineering"] = "You should really GEAR up for working more on others!"
	}
	funFact = funFact .. professionPunDict[highestPrimaryProfessionName]
	
	return funFact
end

FunFacts.FUN_FACT_DICTIONARY = {
	[1] = FunFacts.GenerateLifetimeBoarXPFunFact,
	[2] = FunFacts.GenerateLifetimeXpFunFact,
	[3] = FunFacts.GenerateLowestAveragePrimaryProfessionFunFact,
	[4] = FunFacts.GenerateHighestAveragePrimaryProfessionFunFact
}

--------------------------------
-- Fun Fact Trigger Functions --
--------------------------------

function FunFacts:InitializeFunFacts()
	Event:RegisterTickUpdateListener(900000, FunFacts.DoAFunFact)
end

function FunFacts:CreateShuffledFunFactIdList()
	local orderedFunFactIds = {}
	for funFactId = 1, #FunFacts.FUN_FACT_DICTIONARY do
		table.insert(orderedFunFactIds, funFactId)
	end
	
	local shuffledFunFactIds = {}
	while #orderedFunFactIds > 0 do
		local randomFunFactIdIndex = math.random(#orderedFunFactIds)
		local randomFunFactId = orderedFunFactIds[randomFunFactIdIndex]
		table.insert(shuffledFunFactIds, randomFunFactId)
		
		table.remove(orderedFunFactIds, randomFunFactIdIndex)
	end
	
	return shuffledFunFactIds
end

function FunFacts:DoAFunFact()
	if not Settings:IsShowingFunFacts() then
		return
	end
	
	local shuffledFunFactIds = FunFacts:CreateShuffledFunFactIdList()
	while #shuffledFunFactIds > 0 do
		local funFactId = shuffledFunFactIds[1]
		table.remove(shuffledFunFactIds, 1)
		
		local funFactText = FunFacts.FUN_FACT_DICTIONARY[funFactId]()
		if funFactText then
			Log:Special(funFactText, 0xFFFFBB)
			return
		end
	end
	
	Log:Error("No fun facts are available.")
end
