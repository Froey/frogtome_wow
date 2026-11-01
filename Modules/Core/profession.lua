local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Profession = {}

local API = Frogtome.Core.API
local Context = Frogtome.Version.Context
local Profession = Frogtome.Core.Profession

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

Profession.CONTEXT_MODULE = "Frogtome.Core.Profession"

-------------------------
-- Core Data Functions --
-------------------------

-- Returns the index of the "first" profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetFirstProfessionIndex",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterFirstProfessionIndex" }
)
function Profession:GetFirstProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetFirstProfessionIndex") then
		return nil
	end
	
	return API.GetCharacterFirstProfessionIndex()
end

-- Returns the index of the "second" profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetSecondProfessionIndex",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterSecondProfessionIndex" }
)
function Profession:GetSecondProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetSecondProfessionIndex") then
		return nil
	end
	
	return API.GetCharacterSecondProfessionIndex()
end

-- Returns the index of the first secondary profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetFirstSecondaryProfessionIndex",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterFirstSecondaryProfessionIndex" }
)
function Profession:GetFirstSecondaryProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetFirstSecondaryProfessionIndex") then
		return nil
	end
	
	return API.GetCharacterFirstSecondaryProfessionIndex()
end

-- Returns the index of the second secondary profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetSecondSecondaryProfessionIndex",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterSecondSecondaryProfessionIndex" }
)
function Profession:GetSecondSecondaryProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetSecondSecondaryProfessionIndex") then
		return nil
	end
	
	return API.GetCharacterSecondSecondaryProfessionIndex()
end

-- Returns the index of the third secondary profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetThirdSecondaryProfessionIndex",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterThirdSecondaryProfessionIndex" }
)
function Profession:GetThirdSecondaryProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetThirdSecondaryProfessionIndex") then
		return nil
	end
	
	return API.GetCharacterThirdSecondaryProfessionIndex()
end

-- Returns the index of the fourth secondary profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetFourthSecondaryProfessionIndex",
	{}, 
	{ "GetCharacterFourthSecondaryProfessionIndex" }
)
function Profession:GetFourthSecondaryProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetFourthSecondaryProfessionIndex") then
		return nil
	end
	
	return API.GetCharacterFourthSecondaryProfessionIndex()
end

-- Returns the index of the cooking profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetCookingProfessionIndex",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{}
)
function Profession:GetCookingProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetCookingProfessionIndex") then
		return nil
	end
	
	if Context:IsRetailProject() then
		return Profession:GetThirdSecondaryProfessionIndex()
	elseif Context:IsForeverProject() then
		return Profession:GetSecondSecondaryProfessionIndex()
	end
	
	return nil
end

-- Returns the index of the fishing profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetFishingProfessionIndex",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{}
)
function Profession:GetFishingProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetFishingProfessionIndex") then
		return nil
	end
	
	if Context:IsRetailProject() then
		return Profession:GetSecondSecondaryProfessionIndex()
	elseif Context:IsForeverProject() then
		return Profession:GetFirstSecondaryProfessionIndex()
	end
	
	return nil
end

-- Returns the index of the first aid profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetFirstAidProfessionIndex",
	{ Context.FOREVER_ID }, 
	{}
)
function Profession:GetFirstAidProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetFirstAidProfessionIndex") then
		return nil
	end
	
	return Profession:GetThirdProfessionIndex()
end

-- Returns the index of the archaeology profession for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetArchaeologyProfessionIndex",
	{ Context.RETAIL_ID }, 
	{}
)
function Profession:GetArchaeologyProfessionIndex()
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetArchaeologyProfessionIndex") then
		return nil
	end
	
	return Profession:GetFirstProfessionIndex()
end

-- Returns whether or not the "first" profession has been learned by the current player.
function Profession:IsFirstProfessionLearned()
	return Profession:GetFirstProfessionIndex() ~= nil
end

-- Returns whether or not the "second" profession has been learned by the current player.
function Profession:IsSecondProfessionLearned()
	return Profession:GetSecondProfessionIndex() ~= nil
end

-- Returns whether or not the cooking profession has been learned by the current player.
function Profession:IsCookingProfessionLearned()
	return Profession:GetCookingProfessionIndex() ~= nil
end

-- Returns whether or not the fishing profession has been learned by the current player.
function Profession:IsFishingProfessionLearned()
	return Profession:GetFishingProfessionIndex() ~= nil
end

-- Returns whether or not the first aid profession has been learned by the current player.
function Profession:IsFirstAidProfessionLearned()
	return Profession:GetFirstAidProfessionIndex() ~= nil
end

-- Returns whether or not the archaeology profession has been learned by the current player.
function Profession:IsArchaeologyProfessionLearned()
	return Profession:GetArchaeologyProfessionIndex() ~= nil
end

-- Returns the name of the profession at the specified index for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetProfessionName",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterProfessionName" }
)
function Profession:GetProfessionName(professionIndex)
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetProfessionName") then
		return "???"
	end
	
	if not professionIndex then
		return "???"
	end
	
	return API.GetCharacterProfessionName(professionIndex)
end

-- Returns the current skill of the profession at the specified index for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetProfessionCurrentSkill",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterProfessionSkill" }
)
function Profession:GetProfessionCurrentSkill(professionIndex)
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetProfessionCurrentSkill") then
		return nil
	end
	
	if not professionIndex then
		return nil
	end
	
	return API.GetCharacterProfessionSkill(professionIndex)
end

-- Returns the (dependent on learned rank) current max skill of the profession at the specified index for the current player.
Context:SetDependencies(
	Profession.CONTEXT_MODULE,
	"GetProfessionMaxSkill",
	{ Context.RETAIL_ID, Context.FOREVER_ID }, 
	{ "GetCharacterProfessionMaxSkill" }
)
function Profession:GetProfessionMaxSkill(professionIndex)
	if not Context:CheckDependencies(Profession.CONTEXT_MODULE, "GetProfessionMaxSkill") then
		-- XXX: This hardcoded value probably does not matter
		return 300
	end
	
	if not professionIndex then
		-- XXX: This hardcoded value probably does not matter
		return 300
	end
	
	return API.GetCharacterProfessionMaxSkill(professionIndex)
end

-- Returns the name of the "first" profession for the current player.
function Profession:GetFirstProfessionName()
	if not Profession:IsFirstProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionName(Profession:GetFirstProfessionIndex())
end

-- Returns the current skill of the "first" profession for the current player.
function Profession:GetFirstProfessionCurrentSkill()
	if not Profession:IsFirstProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionCurrentSkill(Profession:GetFirstProfessionIndex())
end

-- Returns the (dependent on learned rank) current max skill of the "first" profession for the current player.
function Profession:GetFirstProfessionMaxSkill()
	if not Profession:IsFirstProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionMaxSkill(Profession:GetFirstProfessionIndex())
end

-- Returns the name of the "second" profession for the current player.
function Profession:GetSecondProfessionName()
	if not Profession:IsSecondProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionName(Profession:GetSecondProfessionIndex())
end

-- Returns the current skill of the "second" profession for the current player.
function Profession:GetSecondProfessionCurrentSkill()
	if not Profession:IsSecondProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionCurrentSkill(Profession:GetSecondProfessionIndex())
end

-- Returns the (dependent on learned rank) current max skill of the "second" profession for the current player.
function Profession:GetSecondProfessionMaxSkill()
	if not Profession:IsSecondProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionMaxSkill(Profession:GetSecondProfessionIndex())
end

-- Returns the name of the cooking profession for the current player.
function Profession:GetCookingProfessionName()
	if not Profession:IsCookingProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionName(Profession:GetCookingProfessionIndex())
end

-- Returns the current skill of the cooking profession for the current player.
function Profession:GetCookingProfessionCurrentSkill()
	if not Profession:IsCookingProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionCurrentSkill(Profession:GetCookingProfessionIndex())
end

-- Returns the (dependent on learned rank) current max skill of the cooking profession for the current player.
function Profession:GetCookingProfessionMaxSkill()
	if not Profession:IsCookingProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionMaxSkill(Profession:GetCookingProfessionIndex())
end

-- Returns the name of the fishing profession for the current player.
function Profession:GetFishingProfessionName()
	if not Profession:IsFishingProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionName(Profession:GetFishingProfessionIndex())
end

-- Returns the current skill of the fishing profession for the current player.
function Profession:GetFishingProfessionCurrentSkill()
	if not Profession:IsFishingProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionCurrentSkill(Profession:GetFishingProfessionIndex())
end

-- Returns the (dependent on learned rank) current max skill of the fishing profession for the current player.
function Profession:GetFishingProfessionMaxSkill()
	if not Profession:IsFishingProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionMaxSkill(Profession:GetFishingProfessionIndex())
end

-- Returns the name of the first aid profession for the current player.
function Profession:GetFirstAidProfessionName()
	if not Profession:IsFirstAidProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionName(Profession:GetFirstAidProfessionIndex())
end

-- Returns the current skill of the first aid profession for the current player.
function Profession:GetFirstAidProfessionCurrentSkill()
	if not Profession:IsFirstAidProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionCurrentSkill(Profession:GetFirstAidProfessionIndex())
end

-- Returns the (dependent on learned rank) current max skill of the first aid profession for the current player.
function Profession:GetFirstAidProfessionMaxSkill()
	if not Profession:IsFirstAidProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionMaxSkill(Profession:GetFirstAidProfessionIndex())
end

-- Returns the name of the first aid profession for the current player.
function Profession:GetArchaeologyProfessionName()
	if not Profession:IsArchaeologyProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionName(Profession:GetArchaeologyProfessionIndex())
end

-- Returns the current skill of the first aid profession for the current player.
function Profession:GetArchaeologyProfessionCurrentSkill()
	if not Profession:IsArchaeologyProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionCurrentSkill(Profession:GetArchaeologyProfessionIndex())
end

-- Returns the (dependent on learned rank) current max skill of the first aid profession for the current player.
function Profession:GetArchaeologyProfessionMaxSkill()
	if not Profession:IsArchaeologyProfessionLearned() then
		return nil
	end
	
	return Profession:GetProfessionMaxSkill(Profession:GetArchaeologyProfessionIndex())
end
