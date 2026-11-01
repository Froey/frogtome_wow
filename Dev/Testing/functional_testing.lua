local _, Frogtome = ...
if not Frogtome.Dev then
	Frogtome.Dev = {}
end
if not Frogtome.Dev.Testing then
	Frogtome.Dev.Testing = {}
end
Frogtome.Dev.Testing.FunctionalTesting = {}

local FunctionalTesting = Frogtome.Dev.Testing.FunctionalTesting
local Log = Frogtome.Root.Log

---------------------------
-- Individual Test Cases --
---------------------------

function FunctionalTesting:TestCoreBasicInfo()
	-- TODO: Figure out how to do future testing
end

function FunctionalTesting:TestCoreMoney()
	-- TODO: Figure out how to do future testing
end

function FunctionalTesting:TestCoreInventory()
	-- TODO: Figure out how to do future testing
end

function FunctionalTesting:TestCoreQuestInfo()
	-- TODO: Figure out how to do future testing
end

function FunctionalTesting:TestCoreQuestLog()
	-- TODO: Figure out how to do future testing
end

function FunctionalTesting:TestCoreLevelsAndXp()
	-- TODO: Figure out how to do future testing
end

--------------------------
-- Test Suite Execution --
--------------------------

function FunctionalTesting:Run(corebasicinfo, coremoney, coreinventory, corequestinfo, corequestlog, corelevelsandxp)
	if not corebasicinfo and not coremoney and not coreinventory and not corequestinfo and not corequestlog and not corelevelsandxp then
		return true
	end
	
	local passed = true
	if corebasicinfo then
		passed = passed and FunctionalTesting:TestCoreBasicInfo()
	end
	if coremoney then
		passed = passed and FunctionalTesting:TestCoreMoney()
	end
	if coreinventory then
		passed = passed and FunctionalTesting:TestCoreInventory()
	end
	if corequestinfo then
		passed = passed and FunctionalTesting:TestCoreQuestInfo()
	end
	if corequestlog then
		passed = passed and FunctionalTesting:TestCoreQuestLog()
	end
	if corelevelsandxp then
		passed = passed and FunctionalTesting:TestCoreLevelsAndXp()
	end
	
	return passed
end

function FunctionalTesting:TestLimited()
	local corebasicinfo = false
	local coremoney = false
	local coreinventory = false
	local corequestinfo = false
	local corequestlog = false
	local corelevelsandxp = false
	
	return FunctionalTesting:Run(corebasicinfo, coremoney, coreinventory, corequestinfo, corequestlog, corelevelsandxp)
end

function FunctionalTesting:TestAll()
	return FunctionalTesting:Run(true, true, true, true, true, true)
end
