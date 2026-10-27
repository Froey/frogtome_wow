local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.API = {}

local API = Frogtome.Core.API

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
	local apiFunctionArgs = {...}
	
	if API.UseProtectedCalls then
		local results = { pcall(apiFunction, unpack(apiFunctionArgs)) }
		if select(1, unpack(results)) then
			print("Protected call succeeded!")
			
			table.remove(results, 1)
			return results
		else
			print("PROTECTED CALL FAILED.")
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
	
	local returnIndexes = {...}
	
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
		local apiFunctionSuppliedArgs = {...}
		for _, apiFunctionSuppliedArg in ipairs(apiFunctionSuppliedArgs) do
			table.insert(allApiFunctionArgs, apiFunctionSuppliedArg)
		end
		
		-- Confirm that we have the expected number of arguments
		if #allApiFunctionArgs ~= apiFunctionExpectedArgCount then
			print(tostring(apiNamespace) .. "." .. tostring(apiFunction) .. ": Expected " .. tostring(apiFunctionExpectedArgCount) .. " args, got " .. tostring(#allApiFunctionArgs) .. ".")
			return
		end
		
		-- Attempt to execute the function
		local apiFunctionResolved, _, resolvedApiFunction = API:ResolveApiFunction(apiNamespace, apiFunction)
		if not apiFunctionResolved then
			print("Failed to call " .. API:CreateApiString(apiNamespace, apiFunction) .. " - doesn't exist.")
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

-- Returns whether or not the provided hookup is supported for this project/flavor of the game.
function API:IsHookupSupported(hookupFunctionName)
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

-- Returns whether or not the provided hookup can be successfully resolved to its intended API.
function API:IsHookupSuccessful(hookupFunctionName)
	local apiNamespace = API.NamespaceDefs[hookupFunctionName]
	local apiFunction = API.FunctionDefs[hookupFunctionName]
	
	return API:ResolveApiFunction(apiNamespace, apiFunction)
end

-- Returns whether or not all expected hookups exist and are supported.
function API:VerifyApiHookups()
	for hookupFunctionName, apiFunction in pairs(API.FunctionDefs) do
		local apiNamespace = API.NamespaceDefs[hookupFunctionName]
		
		-- Only bother if the hookup is actually supported
		if API:IsHookupSupported(hookupFunctionName) then
			-- Verify that we can resolve the function
			local resolved = API:ResolveApiFunction(apiNamespace, apiFunction)
			if not apiNamespaceResolved then
				print(API:CreateApiString(apiNamespace, apiFunction) .. " is not supported for projectId=" .. tostring(WOW_PROJECT_ID))
				return false
			end
		end
	end
	
	return true
end

-------------------------------------------
-- Supported API Calls: General (System) --
-------------------------------------------

API:HookUp({}, nil, "GetTime", 0, nil, "GetTimeInSeconds")

API:HookUp({}, nil, "IsShiftKeyDown", 0, nil, "IsShiftKeyDown")
API:HookUp({}, nil, "IsControlKeyDown", 0, nil, "IsControlKeyDown")
API:HookUp({}, nil, "IsAltKeyDown", 0, nil, "IsAltKeyDown")

----------------------------------------------
-- Supported API Calls: General (Character) --
----------------------------------------------

API:HookUp({}, nil, "GetRealmName", 0, nil, "GetCharacterRealm")
API:HookUp({}, nil, "UnitGUID", 1, { "player" }, "GetCharacterGuid")
API:HookUp({}, nil, "UnitName", 1, { "player" }, "GetCharacterFirstName", 1)
API:HookUp({5}, nil, "UnitName", 1, { "player" }, "GetCharacterLastName", 2)
API:HookUp({}, nil, "UnitSex", 1, { "player" }, "GetCharacterBodyTypeId")
API:HookUp({}, nil, "UnitFactionGroup", 1, { "player" }, "GetCharacterFactionDataString")
API:HookUp({}, nil, "UnitRace", 1, { "player" }, "GetCharacterRaceDataString")
API:HookUp({}, nil, "UnitClass", 1, { "player" }, "GetCharacterClassId")
API:HookUp({}, nil, "GetGuildInfo", 1, { "player" }, "GetCharacterGuildName")
API:HookUp({}, nil, "GetMoney", 1, { "player" }, "GetCharacterMoneyInCopper")

---------------------------------------
-- Supported API Calls: General (XP) --
---------------------------------------

API:HookUp({}, nil, "UnitLevel", 1, { "player" }, "GetCharacterLevel")
API:HookUp({}, nil, "GetMaxPlayerLevel", 0, nil, "GetCharacterMaxLevel")
API:HookUp({}, nil, "GetXPExhaustion", 0, nil, "GetCharacterRestedXp")
API:HookUp({}, nil, "IsResting", 0, nil, "IsCharacterResting")
API:HookUp({}, nil, "GetRestState", 0, nil, "GetCharacterRestedXpMultiplier", 3)

-----------------------------------------------
-- Supported API Calls: General (Profession) --
-----------------------------------------------

API:HookUp({}, nil, "GetProfessions", 0, nil, "GetCharacterFirstProfessionIndex", 1)
API:HookUp({}, nil, "GetProfessions", 0, nil, "GetCharacterSecondProfessionIndex", 2)
API:HookUp({}, nil, "GetProfessions", 0, nil, "GetCharacterFishingProfessionIndex", 3)
API:HookUp({}, nil, "GetProfessions", 0, nil, "GetCharacterCookingProfessionIndex", 4)
API:HookUp({}, nil, "GetProfessions", 0, nil, "GetCharacterFirstAidProfessionIndex", 5)

API:HookUp({}, nil, "GetProfessionInfo", 1, nil, "GetCharacterProfessionName", 1)
API:HookUp({}, nil, "GetProfessionInfo", 1, nil, "GetCharacterProfessionSkill", 3)
API:HookUp({}, nil, "GetProfessionInfo", 1, nil, "GetCharacterProfessionMaxSkill", 4)

------------------------------------------
-- Supported API Calls: General (Quest) --
------------------------------------------

API:HookUp({}, nil, "GetQuestLogRewardXP", 1, nil, "GetQuestXp")
API:HookUp({}, nil, "GetQuestLogRewardMoney", 1, nil, "GetQuestMoneyInCopper")

--------------------------------------
-- Supported API Calls: C_Container --
--------------------------------------

API:HookUp({}, "C_Container", "GetContainerNumSlots", 1, nil, "GetCharacterContainerSize")
API:HookUp({}, "C_Container", "GetContainerNumFreeSlots", 1, nil, "GetCharacterContainerAvailableSpace")

-------------------------------------
-- Supported API Calls: C_QuestLog --
-------------------------------------

API:HookUp({5}, "C_QuestLog", "GetQuestType", 1, nil, "GetQuestType")
API:HookUp({}, "C_QuestLog", "IsQuestFlaggedCompleted", 1, nil, "IsQuestCompletedForCharacter")
API:HookUp({5}, "C_QuestLog", "GetNumQuestLogEntries", 0, nil, "GetCharacterQuestLogSize")
API:HookUp({5}, "C_QuestLog", "GetInfo", 1, nil, "GetQuestInfo")
API:HookUp({5}, "C_QuestLog", "IsComplete", 1, nil, "IsQuestReadyForTurnInForCharacter")
API:HookUp({5}, "C_QuestLog", "GetQuestIDForQuestWatchIndex", 1, nil, "GetQuestIdAtCharacterWatchIndex")
