local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.XP = {}

local API = Frogtome.Core.API
local Context = Frogtome.Version.Context
local Log = Frogtome.Misc.Log
local Trait = Frogtome.Core.Trait
local Utils = Frogtome.Misc.Utils
local XP = Frogtome.Core.XP
local XpData = Frogtome.Data.XpData

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

XP.CONTEXT_MODULE = "Frogtome.Core.XP"

XP.MinLevel = 1

XP.BaseRestedCapFraction = 1.5
XP.AdditionalRestedCapFractionPerRank = XP.BaseRestedCapFraction * 0.04
XP.BaseRestedCapTimeWhenRestingInHours = 24 * 10
XP.BaseRestedCapTimeWhenNotRestingInHours = XP.BaseRestedCapTimeWhenRestingInHours * 4

-------------------------
-- Core Data Functions --
-------------------------

Context:SetDependencies(
	XP.CONTEXT_MODULE,
	"GetCurrentLevel",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCharacterLevel" }
)
function XP:GetCurrentLevel()
	if not Context:CheckDependencies(XP.CONTEXT_MODULE, "GetCurrentLevel") then
		return 1
	end
	
	return API.GetCharacterLevel()
end

function XP:GetMinLevel()
	return XP.MinLevel
end

Context:SetDependencies(
	XP.CONTEXT_MODULE,
	"GetMaxLevel",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCharacterMaxLevel" }
)
function XP:GetMaxLevel()
	if not Context:CheckDependencies(XP.CONTEXT_MODULE, "GetMaxLevel") then
		return 60
	end
	
	return API.GetCharacterMaxLevel()
end

function XP:ClampLevel(level)
	if level < XP.MinLevel then
		return XP.MinLevel
	end
	
	local maxLevel = XP:GetMaxLevel()
	if level > maxLevel then
		return maxLevel
	end
	
	return level
end

function XP:IsMaxLevel(level)
	if not level then
		level = XP:GetCurrentLevel()
	end
	level = XP:ClampLevel(level)
	
	return level >= XP:GetMaxLevel()
end

Context:SetDependencies(
	XP.CONTEXT_MODULE,
	"GetCurrentXp",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCharacterXp" }
)
function XP:GetCurrentXp()
	if not Context:CheckDependencies(XP.CONTEXT_MODULE, "GetCurrentXp") then
		return 0
	end
	
	if XP:IsMaxLevel() then
		return 0
	end
	
	return API.GetCharacterXp()
end

Context:SetDependencies(
	XP.CONTEXT_MODULE,
	"GetNeededXp",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCharacterNeededXp" }
)
function XP:GetNeededXp(level)
	if not Context:CheckDependencies(XP.CONTEXT_MODULE, "GetNeededXp") then
		return 1
	end
	
	if not level then
		level = XP:GetCurrentLevel()
	end
	level = XP:ClampLevel(level)
	
	if XP:IsMaxLevel(level) then
		return 0
	end
	
	if level == XP:GetCurrentLevel() then
		-- Try to go right to the source of truth when possible
		return API.GetCharacterNeededXp()
	else
		return XpData.NeededLevelXps[level]
	end
end

function XP:GetRemainingXp()
	return XP:GetNeededXp() - XP:GetCurrentXp()
end

Context:SetDependencies(
	XP.CONTEXT_MODULE,
	"GetCurrentLifetimeXp",
	{ Context.FOREVER_ID }, 
	{}
)
function XP:GetCurrentLifetimeXp(currentLevel, currentXp)
	if not Context:CheckDependencies(XP.CONTEXT_MODULE, "GetCurrentLifetimeXp") then
		return 0
	end
	
	if not currentLevel then
		currentLevel = XP:GetCurrentLevel()
	end
	currentLevel = XP:ClampLevel(currentLevel)
	
	if not currentXp then
		currentXp = XP:GetCurrentXp()
	end
	-- TODO: do local level-up if currentXp is really high?
	
	local lifetimeXp = currentLevel
	for completedLevel = XP.MinLevel, level - 1 do
		lifetimeXp = lifetimeXp + XpData.NeededLevelXps[completedLevel]
	end
	
	return lifetimeXp
end

Context:SetDependencies(
	XP.CONTEXT_MODULE,
	"GetNeededLifetimeXp",
	{ Context.FOREVER_ID }, 
	{}
)
function XP:GetNeededLifetimeXp()
	if not Context:CheckDependencies(XP.CONTEXT_MODULE, "GetNeededLifetimeXp") then
		return 1
	end
	
	local lifetimeXpNeeded = 0
	for level = XP.MinLevel, XP.MaxLevel do
		lifetimeXpNeeded = lifetimeXpNeeded + XpData.NeededLevelXps[level]
	end
	
	return lifetimeXpNeeded
end

function XP:GetRemainingLifetimeXp(currentLevel, currentXp)
	return XP:GetNeededLifetimeXp() - XP:GetCurrentLifetimeXp(currentLevel, currentXp)
end

Context:SetDependencies(
	XP.CONTEXT_MODULE,
	"IsResting",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "IsCharacterResting" }
)
function XP:IsResting()
	if not Context:CheckDependencies(XP.CONTEXT_MODULE, "IsResting") then
		return false
	end
	
	return API.IsCharacterResting()
end

Context:SetDependencies(
	XP.CONTEXT_MODULE,
	"GetRestedXp",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCharacterRestedXp" }
)
function XP:GetRestedXp()
	if not Context:CheckDependencies(XP.CONTEXT_MODULE, "GetRestedXp") then
		return 0
	end
	
	local restedXp = API.GetCharacterRestedXp()
	if restedXp == nil then
		return 0
	end
	
	return restedXp
end

function XP:HasRestedXp()
	return XP:GetRestedXp() > 0
end

Context:SetDependencies(
	XP.CONTEXT_MODULE,
	"GetXpMultiplier",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCharacterRestedXpMultiplier" }
)
function XP:GetXpMultiplier()
	if not Context:CheckDependencies(XP.CONTEXT_MODULE, "GetXpMultiplier") then
		return 0
	end
	
	local multiplier = API.GetCharacterRestedXpMultiplier()
	if multipler == nul then
		multiplier = 1
	end
	
	return multiplier
end

function XP:GetCurrentRestedCapFraction(restedXp, neededXp, wellRestedRank)
	if not restedXp then
		restedXp = XP:GetRestedXp()
	end
	
	if not neededXp then
		neededXp = XP:GetNeededXp()
	end
	
	if not wellRestedRank then
		wellRestedRank = Trait:GetWellRestedRank()
	end
	
	-- For a character loaded in right after creation, neededXp can be zero. Default to zero here in that case.
	if not neededXp or neededXp == 0 then
		return 0
	end
	
	local restedXpCapFraction = XP.BaseRestedCapFraction + (XP.AdditionalRestedCapFractionPerRank * wellRestedRank)
	local restedXpCapAmount = neededXp * restedXpCapFraction
	
	return Utils:Fraction(restedXp, restedXpCapAmount)
end

function XP:GetRemainingRestedCapFraction(restedXp, neededXp, wellRestedRank)
	return 1 - XP:GetCurrentRestedCapFraction(restedXp, neededXp, wellRestedRank)
end

function XP:GetTotalRestedCapTimeInHours(isResting)
	if isResting == nil then
		isResting = XP:IsResting()
	end
	
	if isResting then
		return XP.BaseRestedCapTimeWhenRestingInHours
	else
		return XP.BaseRestedCapTimeWhenNotRestingInHours
	end
end

function XP:GetRemainingRestedCapTimeInHours(lastKnownRestedXp, neededXp, wellRestedRank, isResting, timeSinceLastKnownRestedXpInHours)
	if isResting == nil then
		isResting = XP:IsResting()
	end
	
	if not timeSinceLastKnownRestedXpInHours then
		timeSinceLastKnownRestedXpInHours = 0
	end
	
	local remainingRestedCapFraction = XP:GetRemainingRestedCapFraction(lastKnownRestedXp, neededXp, wellRestedRank)
	local totalRestedCapTimeInHours = XP:GetTotalRestedCapTimeInHours(isResting)
	
	local remainingRestedCapTimeInHours = (totalRestedCapTimeInHours * remainingRestedCapFraction) - timeSinceLastKnownRestedXpInHours
	if remainingRestedCapTimeInHours < 0 then
		remainingRestedCapTimeInHours = 0
	end
	
	return remainingRestedCapTimeInHours
end

function XP:GetRemainingRestedCapTimeInDaysPlusHours(lastKnownRestedXp, neededXp, wellRestedRank, isResting, timeSinceLastKnownRestedXpInHours)
	local remainingRestedCapTimeInHours = XP:GetRemainingRestedCapTimeInHours(lastKnownRestedXp, neededXp, wellRestedRank, isResting, timeSinceLastKnownRestedXpInHours)
	if remainingRestedCapTimeInHours % 1 ~= 0 then
		remainingRestedCapTimeInHours = math.floor(remainingRestedCapTimeInHours + 1)
	end
	
	local remainingRestedCapTimeInDays = math.floor(remainingRestedCapTimeInHours / 24)
	remainingRestedCapTimeInHours = remainingRestedCapTimeInHours % 24
	
	return remainingRestedCapTimeInDays, remainingRestedCapTimeInHours
end
