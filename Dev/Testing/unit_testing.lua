local _, Frogtome = ...
if not Frogtome.Dev then
	Frogtome.Dev = {}
end
if not Frogtome.Dev.Testing then
	Frogtome.Dev.Testing = {}
end
Frogtome.Dev.Testing.UnitTesting = {}

local API = Frogtome.Core.API
local Log = Frogtome.Misc.Log
local UnitTesting = Frogtome.Dev.Testing.UnitTesting

-- TODO: Some money-related unit testing can definitely be done here
-- TODO: Other testing should include XP-related proportions and XP-per-time calculations

function UnitTesting:TestAll()
	local passed = true
	
	passed = passed and UnitTesting:TestApiHookUps()
	
	return passed
end

function UnitTesting:TestApiHookUps()
	local allHookupsGood = true
	
	for hookupFunctionName, apiFunction in pairs(API.FunctionDefs) do
		local apiNamespace = API.NamespaceDefs[hookupFunctionName]
		
		if API:IsIncluded(hookupFunctionName) then
			if API:ResolveApiNamespace(apiNamespace) then
				if API:ResolveApiFunction(apiNamespace, apiFunction) then
					--Log:Dev(API:CreateApiString(apiNamespace, apiFunction) .. " as " .. hookupFunctionName, 0x88FF88)
				else
					allHookupsGood = false
					Log:Dev("BAD API HOOKUP: " .. API:CreateApiString(apiNamespace, apiFunction), 0xFF8888)
				end
			else
				allHookupsGood = false
				Log:Dev("BAD API HOOKUP: " .. API:CreateApiString(apiNamespace, nil), 0xFF8888)
			end
		else
			--Log:Dev("Unsupported API: " .. API:CreateApiString(apiNamespace, apiFunction) .. " as " .. hookupFunctionName, 0x8888FF)
		end
	end
	
	return allHookupsGood
end
