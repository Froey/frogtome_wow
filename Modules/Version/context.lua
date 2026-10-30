local _, Frogtome = ...
if not Frogtome.Version then
	Frogtome.Version = {}
end
Frogtome.Version.Context = {}

local API = Frogtome.Core.API
local Context = Frogtome.Version.Context

---------------------------------
-- Context-Related Definitions --
---------------------------------

Context.RETAIL_ID = 1
Context.CLASSIC_ID = 2
Context.BCC_ID = 5
Context.FOREVER_ID = 18

Context.CONTEXT_DEFS = {
	[Context.RETAIL_ID] = {
		["ID"] = Context.RETAIL_ID,
		["Label"] = "Retail",
		["Supported"] = false
	},
	[Context.CLASSIC_ID] = {
		["ID"] = Context.CLASSIC_ID,
		["Label"] = "Classic",
		["Supported"] = false
	},
	[Context.BCC_ID] = {
		["ID"] = Context.BCC_ID,
		["Label"] = "BCC Anniversary",
		["Supported"] = false
	},
	[Context.FOREVER_ID] = {
		["ID"] = Context.FOREVER_ID,
		["Label"] = "Forever",
		["Supported"] = true
	}
}

-------------------------------------------
-- Established Context for This Instance --
-------------------------------------------

Context.Context = Context.CONTEXT_DEFS[WOW_PROJECT_ID]

-----------------------------
-- Basic Context Functions --
-----------------------------

function Context:IsProjectSupported()
	if not Context.Context then
		return false
	end
	
	return Context.Context.Supported
end

function Context:IsRetailProject()
	if not Context.Context then
		return false
	end
	
	return Context.Context.ID == Context.RETAIL_ID
end

function Context:IsClassic()
	if not Context.Context then
		return false
	end
	
	return Context.Context.ID == Context.CLASSIC_ID
end

function Context:IsBCC()
	if not Context.Context then
		return false
	end
	
	return Context.Context.ID == Context.BCC_ID
end

function Context:IsForever()
	if not Context.Context then
		return false
	end
	
	return Context.Context.ID == Context.FOREVER_ID
end

----------------------------------
-- Context Dependency Functions --
----------------------------------

function Context:CreateDependencyBundle(permittedProjects, ...)
	return {
		PermittedProjects = permittedProjects,
		ApiDependencies = { ... },
		DependenciesChecked = false,
		DependenciesVerified = false
	}
end

function Context:CheckDependencies(dependencyBundle)
	if not dependencyBundle then
		return true
	end
	
	if not dependencyBundle.DependenciesChecked then
		local verifiedDependencies = true
		
		-- Any permitted project may be our current context, but one must be
		local foundPermittedProject = false
		if dependencyBundle.PermittedProjects then
			for _, permittedProjectId in ipairs(dependencyBundle.PermittedProjects) do
				if permittedProjectId == Context.Context.ID then
					foundPermittedProject = true
				end
			end
		end
		verifiedDependencies = verifiedDependencies and foundPermittedProject
		
		-- Every dependent API call must be supported
		local foundAllApiDependencies = true
		if dependencyBundle.ApiDependencies then
			for _, apiHookupFunctionName in ipairs(dependencyBundle.ApiDependencies) do
				if not API:IsSupported(apiHookupFunctionName) then
					if API:IsIncluded(apiHookupFunctionName) then
						-- Unit testing should catch this anyways, but ABSOLUTELY report this, as it means either something was missed or something weird is up
						Log:Error("Bad attempted API hookup: " .. apiHookupFunctionName .. "()")
					end
					
					foundAllApiDependencies = false
				end
			end
		end
		verifiedDependencies = verifiedDependencies and foundAllApiDependencies
		
		dependencyBundle.DependenciesChecked = true
		dependencyBundle.DependenciesVerified = verifiedDependencies
	end
	
	return dependencyBundle.DependenciesVerified
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
API:HookUp({Context.RETAIL_ID, Context.BCC_ID}, nil, "UnitName", 1, { "player" }, "GetCharacterLastName", 2)
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
API:HookUp({}, nil, "UnitXP", 1, { "player" }, "GetCharacterXp")
API:HookUp({}, nil, "UnitXPMax", 1, { "player" }, "GetCharacterNeededXp")
API:HookUp({}, nil, "IsResting", 0, nil, "IsCharacterResting")
API:HookUp({}, nil, "GetXPExhaustion", 0, nil, "GetCharacterRestedXp")
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

API:HookUp({Context.BCC_ID}, "C_QuestLog", "GetQuestType", 1, nil, "GetQuestType")
API:HookUp({}, "C_QuestLog", "IsQuestFlaggedCompleted", 1, nil, "IsQuestCompletedForCharacter")
API:HookUp({Context.BCC_ID}, "C_QuestLog", "GetNumQuestLogEntries", 0, nil, "GetCharacterQuestLogSize")
API:HookUp({Context.BCC_ID}, "C_QuestLog", "GetInfo", 1, nil, "GetQuestInfo")
API:HookUp({Context.BCC_ID}, "C_QuestLog", "IsComplete", 1, nil, "IsQuestReadyForTurnInForCharacter")
API:HookUp({Context.BCC_ID}, "C_QuestLog", "GetQuestIDForQuestWatchIndex", 1, nil, "GetQuestIdAtCharacterWatchIndex")

-----------------------------------
-- Supported API Calls: C_Traits --
-----------------------------------

API:HookUp({Context.RETAIL_ID, Context.BCC_ID}, "C_Traits", "GetConfigIDsByType", 1, nil, "GetTraitConfigIdsFromTypeId")
API:HookUp({}, "C_Traits", "GetConfigIDBySystemID", 1, nil, "GetTraitConfigIdFromSystemId")
API:HookUp({}, "C_Traits", "GetConfigInfo", 1, nil, "GetTraitConfigInfo")
API:HookUp({}, "C_Traits", "GetTreeNodes", 1, nil, "GetTraitTreeNodeIds")
API:HookUp({}, "C_Traits", "GetNodeInfo", 2, nil, "GetTraitTreeNodeInfo")
API:HookUp({}, "C_Traits", "GetEntryInfo", 2, nil, "GetTraitTreeNodeEntryInfo")
API:HookUp({}, "C_Traits", "GetDefinitionInfo", 1, nil, "GetTraitTreeNodeEntryDefinitionInfo")

----------------------------------
-- Supported API Calls: C_Spell --
----------------------------------

API:HookUp({}, "C_Spell", "GetSpellName", 1, nil, "GetSpellName")
