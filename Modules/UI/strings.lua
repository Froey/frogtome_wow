local _, Frogtome = ...
if not Frogtome.UI then
	Frogtome.UI = {}
end
Frogtome.UI.Strings = {}

local EN = Frogtome.Resources.Strings.EN
local Strings = Frogtome.UI.Strings

---------------------
-- Basic Functions --
---------------------

function Strings:InitializeStrings(language)
	Strings.Dict = nil
	if language == "EN" then
		Strings.Dict = EN
	end
end

function Strings:Get(key)
	if not Strings.Dict then
		return nil
	end
	
	return Strings.Dict[key]
end
