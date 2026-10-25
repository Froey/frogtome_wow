local _, Frogtome = ...
if not Frogtome.Misc then
	Frogtome.Misc = {}
end
Frogtome.Misc.Log = {}

local HiddenSettings = Frogtome.Settings.HiddenSettings
local Log = Frogtome.Misc.Log
local Utils = Frogtome.Misc.Utils

----------------
-- Log Levels --
----------------

-- The color of the special header for log messages
Log.SPECIAL_HEADER = "Frogtome: "
Log.SPECIAL_HEADER_COLOR = 0x6BD43A

Log.DEV_HEADER = "[DEV] "
Log.DEV_HEADER_COLOR = 0x00FFFF

-- Log levels and their associated name.
Log.LogLevels = {
	[-1] = "Dev",
	[1] = "Special",
	[2] = "Error",
	[3] = "Warning",
	[4] = "Info",
	[5] = "Debug",
	[6] = "Trace"
}

-- Log levels and their associated color.
Log.LogLevelColors = {
	[-1] = 0xFF88FF,
	[1] = 0x88FFFF,
	[2] = 0xFF0000,
	[3] = 0xFFFF00,
	[4] = 0xFFFFFF,
	[5] = 0xFF00FF,
	[6] = 0x999999
}

-----------------------
-- Logging Functions --
-----------------------

-- Writes a log message of the provided level and message to the in-game console.
function Log:Write(level, message, specialMessageColor)
	-- Filter out what we should and should not be logging
	if level > HiddenSettings:GetLogLevel() then
		return
	end
	if Log.LogLevels[level] == "Dev" and not HiddenSettings:IsDevLoggingEnabled() then
		return
	end
	
	local messageColor = Log.LogLevelColors[level]
	
	local logString = ""
	if Log.LogLevels[level] == "Special" or Log.LogLevels[level] == "Dev" then
		local headerString = Utils:GetColorWrappedTextString(Log.SPECIAL_HEADER, Log.SPECIAL_HEADER_COLOR)
		if Log.LogLevels[level] == "Dev" then
			headerString = Utils:GetColorWrappedTextString(Log.DEV_HEADER, Log.DEV_HEADER_COLOR) .. headerString
		end
		
		if specialMessageColor then
			messageColor = specialMessageColor
		end
		local messageString = Utils:GetColorWrappedTextString(message, messageColor)
		logString = headerString .. messageString
	else
		local headerString = "[Frogtome " .. Log.LogLevels[level] .. "] "
		logString = headerString .. message
		logString = Utils:GetColorWrappedTextString(logString, messageColor)
	end
	
	print(logString)
end

-- Writes a "dev" log message with the provided message.
function Log:Dev(message, color)
	Log:Write(-1, message, color)
end

-- Writes a "special" log message with the provided message.
function Log:Special(message, color)
	Log:Write(1, message, color)
end

-- Writes an "error" log message with the provided message.
function Log:Error(message)
	Log:Write(2, message)
end

-- Writes a "warning" log message with the provided message.
function Log:Warn(message)
	Log:Write(3, message)
end

-- Writes an "info" log message with the provided message.
function Log:Info(message)
	Log:Write(4, message)
end

-- Writes a "debug" log message with the provided message.
function Log:Debug(message)
	Log:Write(5, message)
end

-- Writes a "trace" log message with the provided message.
function Log:Trace(message)
	Log:Write(6, message)
end
