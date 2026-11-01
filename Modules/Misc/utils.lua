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
