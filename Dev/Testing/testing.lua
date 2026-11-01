local _, Frogtome = ...
if not Frogtome.Dev then
	Frogtome.Dev = {}
end
if not Frogtome.Dev.Testing then
	Frogtome.Dev.Testing = {}
end
Frogtome.Dev.Testing.Testing = {}

local FunctionalTesting = Frogtome.Dev.Testing.FunctionalTesting
local Testing = Frogtome.Dev.Testing.Testing
local UnitTesting = Frogtome.Dev.Testing.UnitTesting

function Testing:TestAll()
	local passed = true
	
	passed = passed and UnitTesting:TestAll()
	passed = passed and FunctionalTesting:TestAll()
	
	return passed
end
