local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Money = {}

local API = Frogtome.Root.API
local Context = Frogtome.Version.Context
local Money = Frogtome.Core.Money

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

Money.CONTEXT_MODULE = "Frogtome.Core.Money"

-- Conversion rates for the currency in World of Warcraft
Money.COPPER_TO_SILVER_RATE = .01
Money.COPPER_TO_GOLD_RATE = .0001
Money.SILVER_TO_COPPER_RATE = 100
Money.SILVER_TO_GOLD_RATE = .01
Money.GOLD_TO_COPPER_RATE = 10000
Money.GOLD_TO_SILVER_RATE = 100

-------------------------
-- Core Data Functions --
-------------------------

-- Returns the current character's money, in whole copper pieces.
Context:SetDependencies(
	Money.CONTEXT_MODULE,
	"GetMoneyInWholeCopper",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCharacterMoneyInCopper" }
)
function Money:GetMoneyInWholeCopper()
	if not Context:CheckDependencies(Money.CONTEXT_MODULE, "GetMoneyInWholeCopper") then
		return 0
	end
	
	return API.GetCharacterMoneyInCopper()
end

-- Returns the current character's money, in its exact copper value.
function Money:GetMoneyInExactCopper()
	return Money:GetMoneyInWholeCopper()
end

-- Returns the current character's money, in whole silver pieces.
function Money:GetMoneyInWholeSilver()
	local copper = Money:GetMoneyInWholeCopper()
	return Money:CopperToWholeSilver(copper)
end

-- Returns the current character's money, in its exact silver value.
function Money:GetMoneyInExactSilver()
	local copper = Money:GetMoneyInWholeCopper()
	return Money:CopperToExactSilver(copper)
end

-- Returns the current character's money, in whole gold pieces.
function Money:GetMoneyInWholeGold()
	local copper = Money:GetMoneyInWholeCopper()
	return Money:CopperToWholeGold(copper)
end

-- Returns the current character's money, in its exact gold value.
function Money:GetMoneyInExactGold()
	local copper = Money:GetMoneyInWholeCopper()
	return Money:CopperToExactGold(copper)
end

-- Returns the number of gold, silver, and copper coins comprising the current character's money.
function Money:GetMoney()
	local copper = Money:GetMoneyInWholeCopper()
	return Money:ConvertCopperCoins(copper)
end

-- Returns the decorative string representing the current character's money.
function Money:GetMoneyString(coinIconResolution)
	local copper = Money:GetMoneyInWholeCopper()
	return Money:CopperToCoinString(copper, coinIconResolution)
end

-- Returns whether or not the current character has at least the money specified, in copper.
function Money:HasMoneyInCopper(copper)
	return Money:GetMoneyInExactCopper() >= copper
end

-- Returns whether or not the current character has at least the money specified, in silver.
function Money:HasMoneyInSilver(silver)
	return Money:GetMoneyInExactSilver() >= silver
end

-- Returns whether or not the current character has at least the money specified, in gold.
function Money:HasMoneyInGold(gold)
	return Money:GetMoneyInExactGold() >= gold
end

--------------------------------
-- Money Conversion Functions --
--------------------------------

-- Returns the exact converted value of the provided currency, using the provided conversion rate.
function Money:ConvertExactCoins(amount, conversionRate)
	return amount * conversionRate
end

-- Returns the converted value (in whole coins) of the provided currency, using the provided conversion rate, as well as the remaining original currency.
function Money:ConvertWholeCoins(amount, conversionRate)
	local exact = Money:ConvertExactCoins(amount, conversionRate)
	local whole = math.floor(exact)
	
	local reversionRate = 1 / conversionRate
	local remainder = 0
	if reversionRate > 1 then
		remainder = amount % reversionRate
	end
	
	return whole, remainder
end

-- Converts copper into its exact value in silver.
function Money:CopperToExactSilver(copper)
	return Money:ConvertExactCoins(copper, Money.COPPER_TO_SILVER_RATE)
end

-- Converts copper into its equivalent value in whole silver pieces.
function Money:CopperToWholeSilver(copper)
	return Money:ConvertWholeCoins(copper, Money.COPPER_TO_SILVER_RATE)
end

-- Converts copper into its exact value in gold.
function Money:CopperToExactGold(copper)
	return Money:ConvertExactCoins(copper, Money.COPPER_TO_GOLD_RATE)
end

-- Coverts copper into its equivalent value in whole gold pieces.
function Money:CopperToWholeGold(copper)
	return Money:ConvertWholeCoins(copper, Money.COPPER_TO_GOLD_RATE)
end

-- Converts silver into its exact value in copper.
function Money:SilverToExactCopper(silver)
	return Money:ConvertExactCoins(silver, Money.SILVER_TO_COPPER_RATE)
end

-- Converts silver into its equivalent value in whole copper pieces.
function Money:SilverToWholeCopper(silver)
	return Money:ConvertWholeCoins(silver, Money.SILVER_TO_COPPER_RATE)
end

-- Converts silver into its exact value in gold.
function Money:SilverToExactGold(silver)
	return Money:ConvertExactCoins(silver, Money.SILVER_TO_GOLD_RATE)
end

-- Converts silver into its equivalent value in whole gold pieces.
function Money:SilverToWholeGold(silver)
	return Money:ConvertWholeCoins(silver, Money.SILVER_TO_GOLD_RATE)
end

-- Converts gold into its exact value in copper.
function Money:GoldToExactCopper(gold)
	return Money:ConvertExactCoins(gold, Money.GOLD_TO_COPPER_RATE)
end

-- Converts gold into its equivalent value in whole copper pieces.
function Money:GoldToWholeCopper(gold)
	return Money:ConvertWholeCoins(gold, Money.GOLD_TO_COPPER_RATE)
end

-- Converts gold into its exact value in silver.
function Money:GoldToExactSilver(gold)
	return Money:ConvertExactCoins(gold, Money.GOLD_TO_SILVER_RATE)
end

-- Converts gold into its equivalent value in whole silver pieces.
function Money:GoldToWholeSilver(gold)
	return Money:ConvertWholeCoins(gold, Money.GOLD_TO_SILVER_RATE)
end

-- Converts copper coins into as few coins as possible (the corresponding combined value of gold, silver, and copper coins).
function Money:ConvertCopperCoins(copper)
	copper = math.floor(copper)
	
	-- This follows the (VERY SAFE) assumption that copper is worth less than silver, is worth less than gold.
	local silver, remainingCopper = Money:CopperToWholeSilver(copper)
	local gold, remainingSilver = Money:SilverToWholeGold(silver)
	
	return gold, remainingSilver, remainingCopper
end

-- Converts silver coins into as few coins as possible (the corresponding combined value of gold, silver, and copper coins).
function Money:ConvertSilverCoins(silver)
	silver = math.floor(silver)
	
	-- This follows the (VERY SAFE) assumption that copper is worth less than silver, is worth less than gold.
	local gold, remainingSilver = Money:SilverToWholeGold(silver)
	
	return gold, remainingSilver, 0
end

-- Converts gold coins into as few coins as possible (the corresponding combined value of gold, silver, and copper coins).
function Money:ConvertSilverCoins(gold)
	gold = math.floor(gold)
	
	-- This follows the (VERY SAFE) assumption that copper is worth less than silver, is worth less than gold.
	
	return gold, 0, 0
end

----------------------------
-- Money String Functions --
----------------------------

-- Returns the decorative string of coins corresponding to the provided value of copper, using the provided resolution for coin icons.
Context:SetDependencies(
	Money.CONTEXT_MODULE,
	"CopperToCoinString",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCoinStringFromCopper" }
)
function Money:CopperToCoinString(copper, coinIconResolution)
	if not Context:CheckDependencies(Money.CONTEXT_MODULE, "CopperToCoinString") then
		return nil
	end
	
	copper = math.floor(copper)
	return API.GetCoinStringFromCopper(copper, coinIconResolution)
end

-- Returns the decorative string of coins corresponding to the provided value of silver, using the provided resolution for coin icons.
Context:SetDependencies(
	Money.CONTEXT_MODULE,
	"SilverToCoinString",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCoinStringFromCopper" }
)
function Money:SilverToCoinString(silver, coinIconResolution)
	if not Context:CheckDependencies(Money.CONTEXT_MODULE, "SilverToCoinString") then
		return nil
	end
	
	local copper = Money:SilverToWholeCopper(silver)
	return API.GetCoinStringFromCopper(copper, coinIconResolution)
end

-- Returns the decorative string of coins corresponding to the provided value of gold, using the provided resolution for coin icons.
Context:SetDependencies(
	Money.CONTEXT_MODULE,
	"GoldToCoinString",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCoinStringFromCopper" }
)
function Money:GoldToCoinString(gold, coinIconResolution)
	if not Context:CheckDependencies(Money.CONTEXT_MODULE, "GoldToCoinString") then
		return nil
	end
	
	local copper = Money:GoldToWholeCopper(gold)
	return API.GetCoinStringFromCopper(copper, coinIconResolution)
end
