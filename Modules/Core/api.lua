local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.API = {}

local API = Frogtome.Core.API
local Log = Frogtome.Misc.Log

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

API.UseProtectedCalls = false

API.ExclusionDefs = {}
API.NamespaceDefs = {}
API.FunctionDefs = {}

---------------------
-- Core API Hookup --
---------------------

-- Formats the provided namespace and function into a representative string value.
function API:CreateApiString(apiNamespace, apiFunction)
	local apiString = ""
	
	if apiNamespace then
		apiString = apiString .. apiNamespace
		if apiFunction then
			apiString = apiString .. "."
		end
	end
	
	if apiFunction then
		apiString = apiString .. apiFunction .. "()"
	end
	
	return apiString
end

-- Attempts to resolve the provided namespace, returning the success of which and the resulting namespace.
function API:ResolveApiNamespace(apiNamespace)
	local resolvedApiNamespace = _G
	if apiNamespace then
		resolvedApiNamespace = _G[apiNamespace]
	end
	
	return resolvedApiNamespace ~= nil, resolvedApiNamespace
end

-- Attempts to resolve the (provided namespace and) provided function, returning the success of which, the resulting namespace, and the resulting function.
function API:ResolveApiFunction(apiNamespace, apiFunction)
	local apiNamespaceResolved, resolvedApiNamespace = API:ResolveApiNamespace(apiNamespace)
	if not apiNamespaceResolved then
		return false, nil, nil
	end
	
	local resolvedApiFunction = resolvedApiNamespace[apiFunction]
	return resolvedApiFunction ~= nill, resolvedApiNamespace, resolvedApiFunction
end

-- Executes an actual call for an API function.
function API:Call(apiFunction, ...)
	local apiFunctionArgs = { ... }
	
	if API.UseProtectedCalls then
		local results = { pcall(apiFunction, unpack(apiFunctionArgs)) }
		if select(1, unpack(results)) then
			Log:Trace("API call succeeded.")
			
			table.remove(results, 1)
			return results
		else
			Log:Error("API call failed unexpectedly.")
		end
	else
		return { apiFunction(unpack(apiFunctionArgs)) }
	end
end

-- Registers the provided information as a callable function in the API.
function API:HookUp(projectExclusions, apiNamespace, apiFunction, apiFunctionExpectedArgCount, apiFunctionForcedArgs, hookupFunctionName, ...)
	-- Track exclusions, namespace, and function, for if/when we want to test their existence
	API.ExclusionDefs[hookupFunctionName] = projectExclusions
	API.NamespaceDefs[hookupFunctionName] = apiNamespace
	API.FunctionDefs[hookupFunctionName] = apiFunction
	
	local returnIndexes = { ... }
	
	-- Wrap the abstract hookup of this API function within our own function for calling it
	API[hookupFunctionName] = function(...)
		local allApiFunctionArgs = {}
		
		-- Include arguments we've forced from hooking-up this API call
		if apiFunctionForcedArgs then
			for _, apiFunctonForcedArg in ipairs(apiFunctionForcedArgs) do
				table.insert(allApiFunctionArgs, apiFunctonForcedArg)
			end
		end
		
		-- Include arguments supplied dynamically from elsewhere in the code
		local apiFunctionSuppliedArgs = { ... }
		for _, apiFunctionSuppliedArg in ipairs(apiFunctionSuppliedArgs) do
			table.insert(allApiFunctionArgs, apiFunctionSuppliedArg)
		end
		
		-- Confirm that we have the expected number of arguments
		if #allApiFunctionArgs ~= apiFunctionExpectedArgCount then
			Log:Error(tostring(apiNamespace) .. "." .. tostring(apiFunction) .. ": Expected " .. tostring(apiFunctionExpectedArgCount) .. " args, got " .. tostring(#allApiFunctionArgs) .. ".")
			return
		end
		
		-- Attempt to execute the function
		local apiFunctionResolved, _, resolvedApiFunction = API:ResolveApiFunction(apiNamespace, apiFunction)
		if not apiFunctionResolved then
			Log:Error("Failed to call " .. API:CreateApiString(apiNamespace, apiFunction) .. " - doesn't exist.")
		end
		local returnValues = API:Call(resolvedApiFunction, unpack(allApiFunctionArgs))
		
		-- Parse the output for relevancy; the hook-up has declared what we care about
		local resolvedReturnValues = {}
		if #returnIndexes > 0 then
			for _, returnIndex in ipairs(returnIndexes) do
				table.insert(resolvedReturnValues, (select(returnIndex, unpack(returnValues))))
			end
		else
			-- Just forward along whatever was returned
			resolvedReturnValues = returnValues
		end
		
		-- Return the relevant output
		return unpack(resolvedReturnValues)
	end
end

----------------------
-- API Verification --
----------------------

-- Returns whether or not the provided hookup is included for this project/flavor of the game.
function API:IsIncluded(hookupFunctionName)
	local hookupFunctionExclusions = API.ExclusionDefs[hookupFunctionName]
	if #hookupFunctionExclusions > 0 then
		for _, exclusion in ipairs(hookupFunctionExclusions) do
			if exclusion == WOW_PROJECT_ID then
				return false
			end
		end
	end
	
	return true
end

function API:AreAllIncluded(hookupFunctionNames)
	for _, hookupFunctionName in ipairs(hookupFunctionNames) do
		if not API:IsIncluded(hookupFunctionName) then
			return false
		end
	end
	
	return true
end

-- Returns whether or not the provided hookup can be successfully resolved to its intended API.
function API:IsSupported(hookupFunctionName, ignoreInclusion)
	if not ignoreInclusion and not API:IsIncluded(hookupFunctionName) then
		return false
	end
	
	local apiNamespace = API.NamespaceDefs[hookupFunctionName]
	local apiFunction = API.FunctionDefs[hookupFunctionName]
	
	return API:ResolveApiFunction(apiNamespace, apiFunction)
end

function API:AreAllSupported(hookupFunctionNames, ignoreInclusion)
	for _, hookupFunctionName in ipairs(hookupFunctionNames) do
		if not API:IsSupported(hookupFunctionName, ignoreInclusion) then
			return false
		end
	end
	
	return true
end
