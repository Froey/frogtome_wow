local _, Frogtome = ...
if not Frogtome.Misc then
	Frogtome.Misc = {}
end
Frogtome.Misc.Utils = {}

local Utils = Frogtome.Misc.Utils

-----------------
-- Color Utils --
-----------------

-- Returns a lowercase string from the provided hex, to the provided size.
function Utils:CreateHexString(hex, size)
	local formatString = "%0" .. tostring(size) .. "X"
	return string.lower(string.format(formatString, hex))
end

-- Returns a lowercase 8-character string from the provided hex and its opacity, with the opacity as either the leading or trailing characters.
function Utils:CreateHexStringWithOpacity(hex, opacityHex, leadingOpacity)
	local hexString = Utils:CreateHexString(hex, 6)
	local opacityString = Utils:CreateHexString(opacityHex, 2)
	
	if leadingOpacity then
		hexString = string.lower(opacityString) .. hexString
	else
		hexString = hexString .. string.lower(opacityString)
	end
	
	return hexString
end

-- Returns the string of the provided text wrapped in the provided color at the provided opacity.
function Utils:GetColorWrappedTextString(text, colorHex, opacityHex)
	if not opacityHex then
		opacityHex = 0xFF
	end
	
	return "|c" .. Utils:CreateHexStringWithOpacity(colorHex, opacityHex, true) .. text .. "|r"
end

-- Returns the RGBA components derived from the provided color hex
function Utils:GetColorsFromHex(hex, leadingOpacity)
	local r, g, b, a = 1
	local remainingHex = hex
	
	if leadingOpacity == nil then
		-- Assume there is no opacity data; default to full alpha
		b = bit.band(remainingHex, 0xFF) / 0xFF
		remainingHex = bit.rshift(remainingHex, 8)
		
		g = bit.band(remainingHex, 0xFF) / 0xFF
		remainingHex = bit.rshift(remainingHex, 8)
		
		r = bit.band(remainingHex, 0xFF) / 0xFF
		remainingHex = bit.rshift(remainingHex, 8)
		
		a = 1
	elseif leadingOpacity then
		-- Opacity is leftmost (last to decode)
		b = bit.band(remainingHex, 0xFF) / 0xFF
		remainingHex = bit.rshift(remainingHex, 8)
		
		g = bit.band(remainingHex, 0xFF) / 0xFF
		remainingHex = bit.rshift(remainingHex, 8)
		
		r = bit.band(remainingHex, 0xFF) / 0xFF
		remainingHex = bit.rshift(remainingHex, 8)
		
		a = bit.band(remainingHex, 0xFF) / 0xFF
	else
		-- Opacity is rightmost (first to decode)
		a = bit.band(remainingHex, 0xFF) / 0xFF
		remainingHex = bit.rshift(remainingHex, 8)
		
		b = bit.band(remainingHex, 0xFF) / 0xFF
		remainingHex = bit.rshift(remainingHex, 8)
		
		g = bit.band(remainingHex, 0xFF) / 0xFF
		remainingHex = bit.rshift(remainingHex, 8)
		
		r = bit.band(remainingHex, 0xFF) / 0xFF
	end
	
	return r, g, b, a
end

----------------
-- Math Utils --
----------------

-- Returns a fraction, as a decimal (0 being 0/2, 0.5 being 1/2, 1 being 2/2), of the numerator over the denominator.
function Utils:Fraction(numerator, denominator)
	if denominator == 0 then
		return nil
	end
	
	return numerator / denominator
end

-- Rounds the provided number to the provided number of decimal places.
function Utils:Round(number, decimals)
	if not decimals then
		decimals = 0
	end
	
	number = math.floor(number * (10 ^ (decimals + 1)))
	if number % 10 >= 5 then
		number = number + 10
	end
	number = math.floor(number / 10) / (10 ^ decimals)
	
	if asString then
		number = tostring(number) .. "%"
	end
	
	return number
end

-- Creates the percent value of the numerator over the denominator, rounding to the provided number of decimal places.
function Utils:Percentage(numerator, denominator, decimals)
	local fraction = Utils:Fraction(numerator, denominator)
	if fraction == nil then
		return nil
	end
	
	return Utils:Round(fraction * 100, decimals)
end

-- Creates the percent value of the fraction, rounding to the provided number of decimal places.
function Utils:PercentageFromFraction(fraction, decimals)
	if fraction == nil then
		return nil
	end
	
	return Utils:Round(fraction * 100, decimals)
end

-- Creates a string representing the percent value of the numerator over the denominator, rounding to the provided number of decimal places.
function Utils:PercentageString(numerator, denominator, decimals)
	local percentage = Utils:Percentage(numerator, denominator, decimals)
	if percentage == nil then
		return "N/A"
	end
	
	return tostring(percentage) .. "%"
end

-- Creates a string representing the percent value of the fraction, rounding to the provided number of decimal places.
function Utils:PercentageStringFromFraction(fraction, decimals)
	local percentage = Utils:PercentageFromFraction(fraction, decimals)
	if percentage == nil then
		return "N/A"
	end
	
	return tostring(percentage) .. "%"
end

-----------------
-- Money Utils --
-----------------

-- Conversion rates for the currency in World of Warcraft
Utils.COPPER_TO_SILVER_RATE = .01
Utils.COPPER_TO_GOLD_RATE = .0001
Utils.SILVER_TO_COPPER_RATE = 100
Utils.SILVER_TO_GOLD_RATE = .01
Utils.GOLD_TO_COPPER_RATE = 10000
Utils.GOLD_TO_SILVER_RATE = 100

-- Returns the exact converted value of the provided currency, using the provided conversion rate.
function Utils:ConvertExactCoins(amount, conversionRate)
	return amount * conversionRate
end

-- Returns the converted value (in whole coins) of the provided currency, using the provided conversion rate, as well as the remaining original currency.
function Utils:ConvertWholeCoins(amount, conversionRate)
	local exact = Utils:ConvertExactCoins(amount, conversionRate)
	local whole = math.floor(exact)
	
	local reversionRate = 1 / conversionRate
	local remainder = 0
	if reversionRate > 1 then
		remainder = amount % reversionRate
	end
	
	return whole, remainder
end

-- Converts copper into its exact value in silver.
function Utils:CopperToExactSilver(copper)
	return Utils:ConvertExactCoins(copper, Utils.COPPER_TO_SILVER_RATE)
end

-- Converts copper into its equivalent value in whole silver pieces.
function Utils:CopperToWholeSilver(copper)
	return Utils:ConvertWholeCoins(copper, Utils.COPPER_TO_SILVER_RATE)
end

-- Converts copper into its exact value in gold.
function Utils:CopperToExactGold(copper)
	return Utils:ConvertExactCoins(copper, Utils.COPPER_TO_GOLD_RATE)
end

-- Coverts copper into its equivalent value in whole gold pieces.
function Utils:CopperToWholeGold(copper)
	return Utils:ConvertWholeCoins(copper, Utils.COPPER_TO_GOLD_RATE)
end

-- Converts silver into its exact value in copper.
function Utils:SilverToExactCopper(silver)
	return Utils:ConvertExactCoins(silver, Utils.SILVER_TO_COPPER_RATE)
end

-- Converts silver into its equivalent value in whole copper pieces.
function Utils:SilverToWholeCopper(silver)
	return Utils:ConvertWholeCoins(silver, Utils.SILVER_TO_COPPER_RATE)
end

-- Converts silver into its exact value in gold.
function Utils:SilverToExactGold(silver)
	return Utils:ConvertExactCoins(silver, Utils.SILVER_TO_GOLD_RATE)
end

-- Converts silver into its equivalent value in whole gold pieces.
function Utils:SilverToWholeGold(silver)
	return Utils:ConvertWholeCoins(silver, Utils.SILVER_TO_GOLD_RATE)
end

-- Converts gold into its exact value in copper.
function Utils:GoldToExactCopper(gold)
	return Utils:ConvertExactCoins(gold, Utils.GOLD_TO_COPPER_RATE)
end

-- Converts gold into its equivalent value in whole copper pieces.
function Utils:GoldToWholeCopper(gold)
	return Utils:ConvertWholeCoins(gold, Utils.GOLD_TO_COPPER_RATE)
end

-- Converts gold into its exact value in silver.
function Utils:GoldToExactSilver(gold)
	return Utils:ConvertExactCoins(gold, Utils.GOLD_TO_SILVER_RATE)
end

-- Converts gold into its equivalent value in whole silver pieces.
function Utils:GoldToWholeSilver(gold)
	return Utils:ConvertWholeCoins(gold, Utils.GOLD_TO_SILVER_RATE)
end

-- Converts copper coins into as few coins as possible (the corresponding combined value of gold, silver, and copper coins).
function Utils:ConvertCopperCoins(copper)
	copper = math.floor(copper)
	
	-- This follows the (VERY SAFE) assumption that copper is worth less than silver, is worth less than gold.
	local silver, remainingCopper = Utils:CopperToWholeSilver(copper)
	local gold, remainingSilver = Utils:SilverToWholeGold(silver)
	
	return gold, remainingSilver, remainingCopper
end

-- Converts silver coins into as few coins as possible (the corresponding combined value of gold, silver, and copper coins).
function Utils:ConvertSilverCoins(silver)
	silver = math.floor(silver)
	
	-- This follows the (VERY SAFE) assumption that copper is worth less than silver, is worth less than gold.
	local gold, remainingSilver = Utils:SilverToWholeGold(silver)
	
	return gold, remainingSilver, 0
end

-- Converts gold coins into as few coins as possible (the corresponding combined value of gold, silver, and copper coins).
function Utils:ConvertSilverCoins(gold)
	gold = math.floor(gold)
	
	-- This follows the (VERY SAFE) assumption that copper is worth less than silver, is worth less than gold.
	
	return gold, 0, 0
end

-- Returns the decorative string of coins corresponding to the provided value of copper, using the provided resolution for coin icons.
function Utils:CopperToCoinString(copper, coinIconResolution)
	copper = math.floor(copper)
	return C_CurrencyInfo.GetCoinTextureString(copper, coinIconResolution)
end

-- Returns the decorative string of coins corresponding to the provided value of silver, using the provided resolution for coin icons.
function Utils:SilverToCoinString(silver, coinIconResolution)
	local copper = Utils:SilverToWholeCopper(silver)
	return C_CurrencyInfo.GetCoinTextureString(copper, coinIconResolution)
end

-- Returns the decorative string of coins corresponding to the provided value of gold, using the provided resolution for coin icons.
function Utils:GoldToCoinString(gold, coinIconResolution)
	local copper = Utils:GoldToWholeCopper(gold)
	return C_CurrencyInfo.GetCoinTextureString(copper, coinIconResolution)
end
