local _, Frogtome = ...
if not Frogtome.Dev then
	Frogtome.Dev = {}
end
if not Frogtome.Dev.Testing then
	Frogtome.Dev.Testing = {}
end
Frogtome.Dev.Testing.FunctionalTesting = {}

local Config = Frogtome.Config
local Core = Frogtome.Core
local Dev = Frogtome.Dev.Dev
local FunctionalTesting = Frogtome.Dev.Testing.FunctionalTesting
local Utils = Frogtome.Utils

function FunctionalTesting:TestCoreBasicInfo()
	local result = "COREBASICINFO:"
	
	result = " - guid="
	result = result .. Core:GetGUID()
	
	print(result)
	
	result = " - first="
	result = result .. Core:GetFirstName()
	
	result = result .. ", last="
	result = result .. Core:GetLastName()
	
	result = result .. ", full="
	result = result .. Core:GetFullName()
	
	print(result)
	
	result = " - faction="
	result = result .. Core:GetFactionDataString()
	
	result = result .. ", class="
	result = result .. Core:GetClassDataString()
	
	result = result .. ", classid="
	result = result .. Core:GetClassId()
	
	print(result)
end

function FunctionalTesting:TestCoreMoney()
	local result = "COREMONEY:"
	
	print(result)
	
	result = " - money="
	result = result .. Core:GetMoneyString(Config.CONSOLE_COIN_ICON_RESOLUTION)
	
	print(result)
	
	result = " - exactGold="
	result = result .. tostring(Core:GetMoneyInExactGold())
	
	print(result)
	
	result = " - exactSilver="
	result = result .. tostring(Core:GetMoneyInExactSilver())
	
	print(result)
	
	result = " - exactCopper="
	result = result .. tostring(Core:GetMoneyInExactCopper())
	
	print(result)
	
	result = " - Can afford Profession (" .. Utils:CopperToCoinString(90, Config.CONSOLE_COIN_ICON_RESOLUTION) .. "): "
	result = result .. tostring(Core:HasMoneyInCopper(90))
	
	print(result)
	
	result = " - Can afford Pouch (" .. Utils:SilverToCoinString(4.5, Config.CONSOLE_COIN_ICON_RESOLUTION) .. "): "
	result = result .. tostring(Core:HasMoneyInSilver(4.5, Config.CONSOLE_COIN_ICON_RESOLUTION))
	
	print(result)
	
	result = " - Can afford Talent Respec (" .. Utils:GoldToCoinString(1, Config.CONSOLE_COIN_ICON_RESOLUTION) .. "): "
	result = result .. tostring(Core:HasMoneyInGold(1))
	
	print(result)
	
	result = " - Can afford Riding (" .. Utils:GoldToCoinString(95, Config.CONSOLE_COIN_ICON_RESOLUTION) .. "): "
	result = result .. tostring(Core:HasMoneyInGold(95))
	
	print(result)
end

function FunctionalTesting:TestCoreInventory()
	local result = "COREINVENTORY:"
	
	print (result)
	
	result = " - Inventory size: "
	result = result .. tostring(Core:GetInventorySize(true)) .. " w/ RB, " .. tostring(Core:GetInventorySize(false)) .. " w/o"
	
	print(result)
	
	result = " -- (RB to BP: "
	result = result .. tostring(Core:GetReagentBagSize()) .. ", "
	result = result .. tostring(Core:GetBagSize(4)) .. ", "
	result = result .. tostring(Core:GetBagSize(3)) .. ", "
	result = result .. tostring(Core:GetBagSize(2)) .. ", "
	result = result .. tostring(Core:GetBagSize(1)) .. ", "
	result = result .. tostring(Core:GetBackpackSize()) .. ")"
	
	print(result)
	
	result = " - Filled space: "
	result = result .. tostring(Core:GetInventoryFilledSpace(true)) .. " w/ RB, " .. tostring(Core:GetInventoryFilledSpace(false)) .. " w/o"
	
	print(result)
	
	result = " -- (RB to BP: "
	result = result .. tostring(Core:GetReagentBagFilledSpace()) .. ", "
	result = result .. tostring(Core:GetBagFilledSpace(4)) .. ", "
	result = result .. tostring(Core:GetBagFilledSpace(3)) .. ", "
	result = result .. tostring(Core:GetBagFilledSpace(2)) .. ", "
	result = result .. tostring(Core:GetBagFilledSpace(1)) .. ", "
	result = result .. tostring(Core:GetBackpackFilledSpace()) .. ")"
	
	print(result)
	
	result = " - Remaining space: "
	result = result .. tostring(Core:GetInventoryRemainingSpace(true)) .. " w/ RB, " .. tostring(Core:GetInventoryRemainingSpace(false)) .. " w/o"
	
	print(result)
	
	result = " -- (RB to BP: "
	result = result .. tostring(Core:GetReagentBagRemainingSpace()) .. ", "
	result = result .. tostring(Core:GetBagRemainingSpace(4)) .. ", "
	result = result .. tostring(Core:GetBagRemainingSpace(3)) .. ", "
	result = result .. tostring(Core:GetBagRemainingSpace(2)) .. ", "
	result = result .. tostring(Core:GetBagRemainingSpace(1)) .. ", "
	result = result .. tostring(Core:GetBackpackRemainingSpace()) .. ")"
	
	print(result)
end

function FunctionalTesting:TestCoreQuestInfo()
	local result = "COREQUESTINFO:"
	
	print(result)
	
	local testQuestId1 = 95314
	result = " - \"That Shadowvale Green Elixir\": "
	result = result .. tostring(Core:GetQuestXpReward(testQuestId1)) .. " XP and "
	result = result .. Core:GetQuestMonetaryRewardString(testQuestId1, Core.CONSOLE_COIN_ICON_RESOLUTION)
	
	print(result)
	
	local testQuestId2 = 357
	result = " - \"The Lich's Identity\": "
	result = result .. tostring(Core:GetQuestXpReward(testQuestId2)) .. " XP and "
	result = result .. Core:GetQuestMonetaryRewardString(testQuestId2, Core.CONSOLE_COIN_ICON_RESOLUTION)
	
	print(result)
	
	local testQuestIds = {}
	table.insert(testQuestIds, testQuestId1)
	table.insert(testQuestIds, testQuestId2)
	result = " - Combined: "
	result = result .. tostring(Core:GetTotalXpRewardOfQuests(testQuestIds)) .. " XP and "
	result = result .. Core:GetTotalMonetaryRewardStringOfQuests(testQuestIds, Core.CONSOLE_COIN_ICON_RESOLUTION)
	
	print(result)
	
	-- TODO: Is there a test procedure that can (sanely) be done here?
end

function FunctionalTesting:TestCoreQuestLog()
	local result = "COREQUESTLOG:"
	
	print(result)
	
	result = " - Total Available XP: "
	if Core:QuestLogHasXpRewards() then
		result = result .. tostring(Core:GetQuestLogTotalXpReward())
	else
		result = result .. "None"
	end
	
	print(result)
	
	result = " - Total Money: "
	if Core:QuestLogHasMonetaryRewards() then
		result = result .. tostring(Core:GetQuestLogTotalMonetaryRewardString())
	else
		result = result .. "None"
	end
	
	print(result)
	
	Dev:PrintQuestLog()
end

function FunctionalTesting:TestCoreLevelsAndXp()
	local result = "CORELEVELANDXP:"
	
	print (result)
	
	result = " - level="
	result = result .. Core:GetCurrentLevel()
	
	result = result .. ", max="
	result = result .. Core:GetMaxLevel()
	
	result = result .. ", isMax="
	result = result .. tostring(Core:IsMaxLevel())
	
	print(result)
	
	result = " - currentXp="
	result = result .. Core:GetCurrentXp()
	
	result = result .. ", neededXp="
	result = result .. Core:GetNeededXp()
	
	result = result .. ", remainingXp="
	result = result .. Core:GetRemainingXp()
	
	print(result)
	
	result = " - currentXp%="
	result = result .. Core:GetCurrentXpPercentageString(Config.PERCENT_DECIMALS)
	
	result = result .. ", remainingXp%="
	result = result .. Core:GetRemainingXpPercentageString(Config.PERCENT_DECIMALS)
	
	print(result)
	
	result = " - isResting="
	result = result .. tostring(Core:IsResting())
	
	result = result .. ", isRested="
	result = result .. tostring(Core:HasRestedXp())
	
	result = result .. ", restedXp="
	result = result .. Core:GetRestedXp()
	
	result = result .. ", mult="
	result = result .. Core:GetXpMultiplier()
	
	print(result)
	
	local dummyQuestXp = 1000
	result = " - For a quest that awards " .. tostring(dummyQuestXp) .. " XP:"
	
	print(result)
	
	result = " -- amount of current XP: "
	result = result .. tostring(Core:GetProportionOfCurrentXpAsFraction(dummyQuestXp)) .. " ("
	result = result .. tostring(Core:GetProportionOfCurrentXpAsPercentageString(dummyQuestXp, Config.PERCENT_DECIMALS)) .. ")"
	
	print(result)
	
	result = " -- amount of needed XP: "
	result = result .. tostring(Core:GetProportionOfNeededXpAsFraction(dummyQuestXp)) .. " ("
	result = result .. tostring(Core:GetProportionOfNeededXpAsPercentageString(dummyQuestXp, Config.PERCENT_DECIMALS)) .. ")"
	
	print(result)
	
	result = " -- amount of remaining XP: "
	result = result .. tostring(Core:GetProportionOfRemainingXpAsFraction(dummyQuestXp)) .. " ("
	result = result .. tostring(Core:GetProportionOfRemainingXpAsPercentageString(dummyQuestXp, Config.PERCENT_DECIMALS)) .. ")"
	
	print(result)
end

function FunctionalTesting:Run(corebasicinfo, coremoney, coreinventory, corequestinfo, corequestlog, corelevelsandxp)
	if not corebasicinfo and not coremoney and not coreinventory and not corequestinfo and not corequestlog and not corelevelsandxp then
		return
	end
	
	print("---- NEW TEST EXECUTION ----")
	
	if Core:IsFullyLoaded() then
		if corebasicinfo then
			FunctionalTesting:TestCoreBasicInfo()
		end
		if coremoney then
			FunctionalTesting:TestCoreMoney()
		end
		if coreinventory then
			FunctionalTesting:TestCoreInventory()
		end
		if corequestinfo then
			FunctionalTesting:TestCoreQuestInfo()
		end
		if corequestlog then
			FunctionalTesting:TestCoreQuestLog()
		end
		if corelevelsandxp then
			FunctionalTesting:TestCoreLevelsAndXp()
		end
	else
		print("<< Character not fully loaded. Skipping. >>")
	end
	
	print("---- End Test Execution ----")
end

function FunctionalTesting:RunLimitedSuite()
	local corebasicinfo = false
	local coremoney = false
	local coreinventory = false
	local corequestinfo = false
	local corequestlog = false
	local corelevelsandxp = false
	
	FunctionalTesting:Run(corebasicinfo, coremoney, coreinventory, corequestinfo, corequestlog, corelevelsandxp)
end

function FunctionalTesting:RunFullSuite()
	FunctionalTesting:Run(true, true, true, true, true, true)
end
