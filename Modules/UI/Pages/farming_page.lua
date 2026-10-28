local _, Frogtome = ...
if not Frogtome.UI then
	Frogtome.UI = {}
end
if not Frogtome.UI.Pages then
	Frogtome.UI.Pages = {}
end
Frogtome.UI.Pages.Farming = {}

local Core = Frogtome.Core.Core
local Event = Frogtome.Core.Event
local FarmingPage = Frogtome.UI.Pages.Farming
local GoldData = Frogtome.Data.GoldData
local HiddenSettings = Frogtome.Settings.HiddenSettings
local Log = Frogtome.Misc.Log
local Session = Frogtome.Core.Session
local Settings = Frogtome.Settings.Settings
local Strings = Frogtome.UI.Strings
local UI = Frogtome.UI.UI
local UIConfig = Frogtome.UI.UIConfig
local Utils = Frogtome.Misc.Utils

----------------------------------
-- Display Update Functionality --
----------------------------------

function FarmingPage:CreatePercentageString(numerator, denominator)
	return Utils:PercentageString(numerator, denominator, 1)
end

function FarmingPage:CreateRoundedValueString(value)
	return AbbreviateNumbers(Utils:Round(value, 0))
end

function FarmingPage:CalculateResultingLevelAndXps(xp)
	local level = Core:GetCurrentLevel()
	if level >= Core:GetMaxLevel() then
		return level, 0, 0
	end
	
	local currentXp = Core:GetCurrentXp() + xp
	if currentXp == nil then
		currentXp = 0
	end
	
	local neededXp = Core:GetNeededXp()
	if neededXp == nil then
		neededXp = 0
	end
	
	while not neededXp == 0 and currentXp >= neededXp do
		level = level + 1
		if level >= Core:GetMaxLevel() then
			currentXp = 0
			neededXp = 0
		else
			currentXp = currentXp - neededXp
			neededXp = Core:GetNeededXpForLevel(level)
		end
	end
	
	local color = UIConfig.GLOBAL_DATA_TEXT_COLOR
	if level > Core:GetCurrentLevel() then
		color = UIConfig.GLOBAL_POSITIVE_VALUE_COLOR
	end
	
	return level, currentXp, neededXp, color
end

function FarmingPage:CalculateResultingMoney(copper)
	return Core:GetMoneyInWholeCopper() + copper
end

function FarmingPage:CreateTimeUntilNextLevelString(sessionTimeSeconds)
	if not sessionTimeSeconds then
		return Strings:Get("FARMING_PAGE_UNKNOWN_TIME")
	end
	
	local timeUntilNextLevelSeconds = Session:GetTimeUntilNextLevelSeconds(sessionTimeSeconds)
	if not timeUntilNextLevelSeconds then
		return Strings:Get("FARMING_PAGE_UNKNOWN_TIME")
	end
	
	local timeUntilNextLevelString = SecondsToTime(timeUntilNextLevelSeconds, true)
	if string.match(timeUntilNextLevelString, "^%s*$") then
		-- Probably because there's very little time remaining
		timeUntilNextLevelString = Strings:Get("FARMING_PAGE_LESS_THAN_ONE_MINUTE_TIME")
	end
	
	return timeUntilNextLevelString
end

function FarmingPage:CreateSessionTimeString(sessionTimeSeconds)
	if not sessionTimeSeconds or Session:IsSessionPaused() then
		sessionTimeSeconds = Session:GetSessionTimeSeconds()
	end
	if not sessionTimeSeconds then
		return "N/A"
	end
	
	local sessionTimeString = SecondsToTime(sessionTimeSeconds, false)
	if string.match(sessionTimeString, "^%s*$") then
		-- Probably because there's very little time remaining
		sessionTimeString = Strings:Get("FARMING_PAGE_LESS_THAN_ONE_SECOND_TIME")
	end
	
	return sessionTimeString
end

----------------------------
-- Display Update Process --
----------------------------

function FarmingPage:UpdateExpandedFrameView(xpChanged, moneyChanged, miscellaneousChange, rateUpdate)
	-- Update every metric that is based on time
	local sessionTimeSeconds = Session:GetSessionTimeSeconds()
	if sessionTimeSeconds and sessionTimeSeconds > 0 then
		-- Experience View
		
		if xpChanged or rateUpdate then
			local totalXpRate = FarmingPage:CreateRoundedValueString(Session:GetXpPerHour(sessionTimeSeconds))
			FarmingPage.Page.ExpandedFrameView.XpView.TotalXpRateText:SetText(totalXpRate)
			local questXpRate = FarmingPage:CreateRoundedValueString(Session:GetQuestXpPerHour(sessionTimeSeconds))
			FarmingPage.Page.ExpandedFrameView.XpView.QuestXpRateText:SetText(questXpRate)
			local otherXpRate = FarmingPage:CreateRoundedValueString(Session:GetOtherXpPerHour(sessionTimeSeconds))
			FarmingPage.Page.ExpandedFrameView.XpView.OtherXpRateText:SetText(otherXpRate)
			
			local timeUntilNextLevelString = FarmingPage:CreateTimeUntilNextLevelString(sessionTimeSeconds)
			FarmingPage.Page.ExpandedFrameView.XpView.TimeUntilNextLevelText:SetText(timeUntilNextLevelString)
		end
		
		-- Gold View
		
		if moneyChanged or rateUpdate then
			local totalGoldEarnedRate = Utils:CopperToCoinString(Session:GetEarnedMoneyPerHourInCopper(sessionTimeSeconds, 0), UIConfig.FARMING_PAGE_COIN_ICON_RES)
			FarmingPage.Page.ExpandedFrameView.GoldView.TotalGoldEarnedRateText:SetText(totalGoldEarnedRate)
			
			local questGoldEarnedRate = Utils:CopperToCoinString(Session:GetQuestMoneyPerHourInCopper(sessionTimeSeconds, 0), UIConfig.FARMING_PAGE_COIN_ICON_RES)
			FarmingPage.Page.ExpandedFrameView.GoldView.QuestGoldEarnedRateText:SetText(questGoldEarnedRate)
			
			local otherGoldEarnedRate = Utils:CopperToCoinString(Session:GetOtherMoneyPerHourInCopper(sessionTimeSeconds, 0), UIConfig.FARMING_PAGE_COIN_ICON_RES)
			FarmingPage.Page.ExpandedFrameView.GoldView.OtherGoldEarnedRateText:SetText(otherGoldEarnedRate)
			
			local totalGoldSpentRate = Utils:CopperToCoinString(Session:GetSpentMoneyPerHourInCopper(sessionTimeSeconds, 0), UIConfig.FARMING_PAGE_COIN_ICON_RES)
			FarmingPage.Page.ExpandedFrameView.GoldView.TotalGoldSpentRateText:SetText(totalGoldSpentRate)
		end
		
		-- Both Views
		
		if rateUpdate then
			local sessionTimeString = FarmingPage:CreateSessionTimeString(sessionTimeSeconds)
			FarmingPage.Page.ExpandedFrameView.SessionTimeText:SetText(sessionTimeString)
			if Session:IsSessionPaused() then
				UI:ApplyTextWidgetFont(FarmingPage.Page.ExpandedFrameView.SessionTimeText, UIConfig.FARMING_PAGE_SESSION_TIME_PAUSED_COLOR)
			else
				UI:ApplyTextWidgetFont(FarmingPage.Page.ExpandedFrameView.SessionTimeText, UIConfig.FARMING_PAGE_SESSION_TIME_COLOR)
			end
		end
	else
		-- Experience View
		
		if xpChanged or rateUpdate then
			FarmingPage.Page.ExpandedFrameView.XpView.TotalXpRateText:SetText(Strings:Get("FARMING_PAGE_UNKNOWN_RATE"))
			FarmingPage.Page.ExpandedFrameView.XpView.QuestXpRateText:SetText(Strings:Get("FARMING_PAGE_UNKNOWN_RATE"))
			FarmingPage.Page.ExpandedFrameView.XpView.OtherXpRateText:SetText(Strings:Get("FARMING_PAGE_UNKNOWN_RATE"))
			
			FarmingPage.Page.ExpandedFrameView.XpView.TimeUntilNextLevelText:SetText(Strings:Get("FARMING_PAGE_UNKNOWN_TIME"))
		end
		
		-- Gold View
		
		if moneyChanged or rateUpdate then
			FarmingPage.Page.ExpandedFrameView.GoldView.TotalGoldEarnedRateText:SetText(Utils:CopperToCoinString(0, UIConfig.FARMING_PAGE_COIN_ICON_RES))
			FarmingPage.Page.ExpandedFrameView.GoldView.QuestGoldEarnedRateText:SetText(Utils:CopperToCoinString(0, UIConfig.FARMING_PAGE_COIN_ICON_RES))
			FarmingPage.Page.ExpandedFrameView.GoldView.OtherGoldEarnedRateText:SetText(Utils:CopperToCoinString(0, UIConfig.FARMING_PAGE_COIN_ICON_RES))
			FarmingPage.Page.ExpandedFrameView.GoldView.TotalGoldSpentRateText:SetText(Utils:CopperToCoinString(0, UIConfig.FARMING_PAGE_COIN_ICON_RES))
		end
		
		-- Both Views
		
		if rateUpdate then
			FarmingPage.Page.ExpandedFrameView.SessionTimeText:SetText(Strings:Get("FARMING_PAGE_LESS_THAN_ONE_SECOND_TIME"))
			if Session:IsSessionPaused() then
				UI:ApplyTextWidgetFont(FarmingPage.Page.ExpandedFrameView.SessionTimeText, UIConfig.FARMING_PAGE_SESSION_TIME_PAUSED_COLOR)
			else
				UI:ApplyTextWidgetFont(FarmingPage.Page.ExpandedFrameView.SessionTimeText, UIConfig.FARMING_PAGE_SESSION_TIME_COLOR)
			end
		end
	end
	
	-- Update every metric that is based on time-agnostic session data
	
	-- Experience View
	
	if xpChanged then
		local totalXpValue = AbbreviateNumbers(Session:GetXp())
		FarmingPage.Page.ExpandedFrameView.XpView.TotalXpValueText:SetText(totalXpValue)
		
		local questXpValue = AbbreviateNumbers(Session:GetQuestXp())
		FarmingPage.Page.ExpandedFrameView.XpView.QuestXpValueText:SetText(questXpValue)
		local questXpPercentage = FarmingPage:CreatePercentageString(Session:GetQuestXp(), Session:GetXp())
		FarmingPage.Page.ExpandedFrameView.XpView.QuestXpPercentageText:SetText(questXpPercentage)
		
		local otherXpValue = AbbreviateNumbers(Session:GetOtherXp())
		FarmingPage.Page.ExpandedFrameView.XpView.OtherXpValueText:SetText(otherXpValue)
		local otherXpPercentage = FarmingPage:CreatePercentageString(Session:GetOtherXp(), Session:GetXp())
		FarmingPage.Page.ExpandedFrameView.XpView.OtherXpPercentageText:SetText(otherXpPercentage)
		
		local averageQuestXpValue = Session:GetAverageQuestXp(0)
		if averageQuestXpValue == "N/A" then
			averageQuestXpValue = Strings:Get("FARMING_PAGE_UNKNOWN_AVERAGE")
		else
			averageQuestXpValue = AbbreviateNumbers(averageQuestXpValue)
		end
		FarmingPage.Page.ExpandedFrameView.XpView.AverageQuestXpValueText:SetText(averageQuestXpValue)
		local averageQuestXpNeeded = Strings:Get("FARMING_PAGE_UNKNOWN_VALUE")
		if Session:GetQuestXp() > 0 then
			averageQuestXpNeeded = AbbreviateNumbers(math.ceil(Core:GetRemainingXp() / Session:GetAverageQuestXp()))
		end
		FarmingPage.Page.ExpandedFrameView.XpView.AverageQuestXpNeededText:SetText(averageQuestXpNeeded)
		
		local averageOtherXpValue = Session:GetAverageOtherXp(0)
		if averageOtherXpValue == "N/A" then
			averageOtherXpValue = Strings:Get("FARMING_PAGE_UNKNOWN_AVERAGE")
		else
			averageOtherXpValue = AbbreviateNumbers(averageOtherXpValue)
		end
		FarmingPage.Page.ExpandedFrameView.XpView.AverageOtherXpValueText:SetText(averageOtherXpValue)
		local averageOtherXpNeeded = Strings:Get("FARMING_PAGE_UNKNOWN_VALUE")
		if Session:GetOtherXp() > 0 then
			averageOtherXpNeeded = AbbreviateNumbers(math.ceil(Core:GetRemainingXp() / Session:GetAverageOtherXp()))
		end
		FarmingPage.Page.ExpandedFrameView.XpView.AverageOtherXpNeededText:SetText(averageOtherXpNeeded)
	end
	
	-- Gold View
	
	if moneyChanged then
		local totalGoldEarnedValue = Utils:CopperToCoinString(Session:GetEarnedMoneyInCopper(), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.ExpandedFrameView.GoldView.TotalGoldEarnedValueText:SetText(totalGoldEarnedValue)
		
		local questGoldEarnedValue = Utils:CopperToCoinString(Session:GetQuestMoneyInCopper(), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.ExpandedFrameView.GoldView.QuestGoldEarnedValueText:SetText(questGoldEarnedValue)
		
		local questGoldEarnedPercentage = FarmingPage:CreatePercentageString(Session:GetQuestMoneyInCopper(), Session:GetEarnedMoneyInCopper())
		FarmingPage.Page.ExpandedFrameView.GoldView.QuestGoldEarnedPercentageText:SetText(questGoldEarnedPercentage)
		
		local otherGoldEarnedValue = Utils:CopperToCoinString(Session:GetOtherMoneyInCopper(), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.ExpandedFrameView.GoldView.OtherGoldEarnedValueText:SetText(otherGoldEarnedValue)
		
		local otherGoldEarnedPercentage = FarmingPage:CreatePercentageString(Session:GetOtherMoneyInCopper(), Session:GetEarnedMoneyInCopper())
		FarmingPage.Page.ExpandedFrameView.GoldView.OtherGoldEarnedPercentageText:SetText(otherGoldEarnedPercentage)
		
		local totalGoldSpentValue = Utils:CopperToCoinString(Session:GetSpentMoneyInCopper(), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.ExpandedFrameView.GoldView.TotalGoldSpentValueText:SetText(totalGoldSpentValue)
		
		local netGoldValue = Session:GetNetMoneyInCopper()
		local netGoldValueString = ""
		local netGoldColor = UIConfig.GLOBAL_NEUTRAL_VALUE_COLOR
		if netGoldValue > 0 then
			netGoldColor = UIConfig.GLOBAL_POSITIVE_VALUE_COLOR
		elseif netGoldValue < 0 then
			netGoldValueString = "- "
			netGoldColor = UIConfig.GLOBAL_NEGATIVE_VALUE_COLOR
		end
		netGoldValueString = netGoldValueString .. Utils:CopperToCoinString(math.abs(Session:GetNetMoneyInCopper()), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.ExpandedFrameView.GoldView.NetGoldText:SetText(netGoldValueString)
		UI:ApplyTextWidgetFont(FarmingPage.Page.ExpandedFrameView.GoldView.NetGoldText, netGoldColor)
	end
	
	-- Update every metric that doesn't care about sessions
	
	-- Experience View
	
	if miscellaneousChange then
		local trackedOnly = Settings:IsShowingDataForTrackedQuestOnlyInFarmingPage()
		
		local questLogCompletedXpValue = AbbreviateNumbers(Core:GetQuestLogTurnInAbleXpReward(trackedOnly))
		FarmingPage.Page.ExpandedFrameView.XpView.QuestLogCurrentXpValueText:SetText(questLogCompletedXpValue)
		local questLogPendingLevel, questLogPendingCurrentXp, questLogPendingNeededXp, questLogPendingXpColor = FarmingPage:CalculateResultingLevelAndXps(Core:GetQuestLogTurnInAbleXpReward(trackedOnly))
		local questLogPendingXpTurnIn = Strings:Get("FARMING_PAGE_TURN_IN_RESULT_MAX_LEVEL")
		if questLogPendingLevel < Core:GetMaxLevel() then
			questLogPendingXpTurnIn = Strings:Get("FARMING_PAGE_TURN_IN_RESULT_LEVEL_LABEL") .. " " .. questLogPendingLevel .. " (" .. Utils:PercentageString(questLogPendingCurrentXp, questLogPendingNeededXp, 0) .. ")"
		end
		FarmingPage.Page.ExpandedFrameView.XpView.QuestLogCurrentXpTurnInText:SetText(questLogPendingXpTurnIn)
		UI:ApplyTextWidgetFont(FarmingPage.Page.ExpandedFrameView.XpView.QuestLogCurrentXpTurnInText, questLogPendingXpColor)
		
		local questLogTotalXpValue = AbbreviateNumbers(Core:GetQuestLogTotalXpReward(trackedOnly))
		FarmingPage.Page.ExpandedFrameView.XpView.QuestLogTotalXpValueText:SetText(questLogTotalXpValue)
		local questLogPossibleLevel, questLogPossibleCurrentXp, questLogPossibleNeededXp, questLogPossibleXpColor = FarmingPage:CalculateResultingLevelAndXps(Core:GetQuestLogTotalXpReward(trackedOnly))
		local questLogPossibleXpTurnIn = Strings:Get("FARMING_PAGE_TURN_IN_RESULT_MAX_LEVEL")
		if questLogPossibleLevel < Core:GetMaxLevel() then
			questLogPossibleXpTurnIn = Strings:Get("FARMING_PAGE_TURN_IN_RESULT_LEVEL_LABEL") .. " " .. questLogPossibleLevel .. " (" .. Utils:PercentageString(questLogPossibleCurrentXp, questLogPossibleNeededXp, 0) .. ")"
		end
		FarmingPage.Page.ExpandedFrameView.XpView.QuestLogTotalXpTurnInText:SetText(questLogPossibleXpTurnIn)
		UI:ApplyTextWidgetFont(FarmingPage.Page.ExpandedFrameView.XpView.QuestLogTotalXpTurnInText, questLogPossibleXpColor)
	end
	
	-- Gold View
	
	local goldGoalName = GoldData.GoldGoals[FarmingPage.GoldGoalIndex].Name
	FarmingPage.Page.ExpandedFrameView.GoldView.GoldGoalNameText:SetText(goldGoalName)
	
	local goldGoalValue = Utils:CopperToCoinString(GoldData.GoldGoals[FarmingPage.GoldGoalIndex].Value, UIConfig.FARMING_PAGE_COIN_ICON_RES)
	FarmingPage.Page.ExpandedFrameView.GoldView.GoldGoalValueText:SetText(goldGoalValue)
	
	if moneyChanged then
		local goldGoalProgress = Utils:PercentageString(Core:GetMoneyInWholeCopper(), GoldData.GoldGoals[FarmingPage.GoldGoalIndex].Value, 1)
		FarmingPage.Page.ExpandedFrameView.GoldView.GoldGoalProgressText:SetText(goldGoalProgress)
	end
	
	if miscellaneousChange then
		local trackedOnly = Settings:IsShowingDataForTrackedQuestOnlyInFarmingPage()
		
		local questLogCompletedGoldValue = Utils:CopperToCoinString(Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.ExpandedFrameView.GoldView.QuestLogCurrentGoldValueText:SetText(questLogCompletedGoldValue)
		local questLogPendingGoldTurnIn = Utils:CopperToCoinString(FarmingPage:CalculateResultingMoney(Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.ExpandedFrameView.GoldView.QuestLogCurrentGoldTurnInText:SetText(questLogPendingGoldTurnIn)
		
		local questLogTotalGoldValue = Utils:CopperToCoinString(Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.ExpandedFrameView.GoldView.QuestLogTotalGoldValueText:SetText(questLogTotalGoldValue)
		local questLogPossibleGoldTurnIn = Utils:CopperToCoinString(FarmingPage:CalculateResultingMoney(Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.ExpandedFrameView.GoldView.QuestLogTotalGoldTurnInText:SetText(questLogPossibleGoldTurnIn)
	end
end

function FarmingPage:UpdateCondensedFrameView(xpChanged, moneyChanged, miscellaneousChange, rateUpdate)
	-- Update every metric that is based on time
	local sessionTimeSeconds = Session:GetSessionTimeSeconds()
	if sessionTimeSeconds and sessionTimeSeconds > 0 then
		-- Experience View
		
		if xpChanged or rateUpdate then
			local timeUntilNextLevelString = FarmingPage:CreateTimeUntilNextLevelString(sessionTimeSeconds)
			FarmingPage.Page.CondensedFrameView.XpView.TimeUntilNextLevelText:SetText(timeUntilNextLevelString)
		end
		
		-- Both Views
		
		if rateUpdate then
			local sessionTimeString = FarmingPage:CreateSessionTimeString(sessionTimeSeconds)
			FarmingPage.Page.CondensedFrameView.SessionTimeText:SetText(sessionTimeString)
			if Session:IsSessionPaused() then
				UI:ApplyTextWidgetFont(FarmingPage.Page.CondensedFrameView.SessionTimeText, UIConfig.FARMING_PAGE_SESSION_TIME_PAUSED_COLOR)
			else
				UI:ApplyTextWidgetFont(FarmingPage.Page.CondensedFrameView.SessionTimeText, UIConfig.FARMING_PAGE_SESSION_TIME_COLOR)
			end
		end
	else
		if xpChanged or rateUpdate then
			FarmingPage.Page.CondensedFrameView.XpView.TimeUntilNextLevelText:SetText(Strings:Get("FARMING_PAGE_UNKNOWN_TIME"))
		end
		
		-- Both Views
		
		if rateUpdate then
			FarmingPage.Page.CondensedFrameView.SessionTimeText:SetText(Strings:Get("FARMING_PAGE_LESS_THAN_ONE_SECOND_TIME"))
			if Session:IsSessionPaused() then
				UI:ApplyTextWidgetFont(FarmingPage.Page.CondensedFrameView.SessionTimeText, UIConfig.FARMING_PAGE_SESSION_TIME_PAUSED_COLOR)
			else
				UI:ApplyTextWidgetFont(FarmingPage.Page.CondensedFrameView.SessionTimeText, UIConfig.FARMING_PAGE_SESSION_TIME_COLOR)
			end
		end
	end
	
	-- Update every metric that is based on time-agnostic session data
	
	-- Experience View
	
	if xpChanged then
		local averageQuestXpNeeded = Strings:Get("FARMING_PAGE_CONDENSED_AVERAGE_QUEST_LABEL") .. " " .. Strings:Get("FARMING_PAGE_UNKNOWN_AVERAGE")
		if Session:GetQuestXp() > 0 then
			averageQuestXpNeeded = Strings:Get("FARMING_PAGE_CONDENSED_AVERAGE_QUEST_LABEL") .. " " .. AbbreviateNumbers(math.ceil(Core:GetRemainingXp() / Session:GetAverageQuestXp()))
		end
		FarmingPage.Page.CondensedFrameView.XpView.AverageQuestXpNeededText:SetText(averageQuestXpNeeded)
		
		local averageOtherXpNeeded = Strings:Get("FARMING_PAGE_CONDENSED_AVERAGE_OTHER_LABEL") .. " " .. Strings:Get("FARMING_PAGE_UNKNOWN_AVERAGE")
		if Session:GetOtherXp() > 0 then
			averageOtherXpNeeded = Strings:Get("FARMING_PAGE_CONDENSED_AVERAGE_OTHER_LABEL") .. " " .. AbbreviateNumbers(math.ceil(Core:GetRemainingXp() / Session:GetAverageOtherXp()))
		end
		FarmingPage.Page.CondensedFrameView.XpView.AverageOtherXpNeededText:SetText(averageOtherXpNeeded)
	end
	
	-- Gold View
	
	if moneyChanged then
		local netGoldValue = Session:GetNetMoneyInCopper()
		local netGoldValueString = ""
		local netGoldColor = UIConfig.GLOBAL_NEUTRAL_VALUE_COLOR
		if netGoldValue > 0 then
			netGoldColor = UIConfig.GLOBAL_POSITIVE_VALUE_COLOR
		elseif netGoldValue < 0 then
			netGoldValueString = "- "
			netGoldColor = UIConfig.GLOBAL_NEGATIVE_VALUE_COLOR
		end
		netGoldValueString = netGoldValueString .. Utils:CopperToCoinString(math.abs(Session:GetNetMoneyInCopper()), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.CondensedFrameView.GoldView.NetGoldText:SetText(netGoldValueString)
		UI:ApplyTextWidgetFont(FarmingPage.Page.CondensedFrameView.GoldView.NetGoldText, netGoldColor)
	end
	
	-- Update every metric that doesn't care about sessions
	
	-- Experience View
	
	if miscellaneousChange then
		local trackedOnly = Settings:IsShowingDataForTrackedQuestOnlyInFarmingPage()
		
		local questLogPendingLevel, questLogPendingCurrentXp, questLogPendingNeededXp, questLogPendingXpColor = FarmingPage:CalculateResultingLevelAndXps(Core:GetQuestLogTurnInAbleXpReward(trackedOnly))
		local questLogPendingXpTurnIn = Strings:Get("FARMING_PAGE_CONDENSED_TURN_IN_RESULT_COMPLETED_LABEL") .. " " .. Strings:Get("FARMING_PAGE_TURN_IN_RESULT_MAX_LEVEL")
		if questLogPendingLevel < Core:GetMaxLevel() then
			questLogPendingXpTurnIn = Strings:Get("FARMING_PAGE_CONDENSED_TURN_IN_RESULT_COMPLETED_LABEL") .. " " .. Strings:Get("FARMING_PAGE_TURN_IN_RESULT_LEVEL_LABEL") .. " " .. questLogPendingLevel .. " (" .. Utils:PercentageString(questLogPendingCurrentXp, questLogPendingNeededXp, 1) .. ")"
		end
		FarmingPage.Page.CondensedFrameView.XpView.QuestLogCurrentXpTurnInText:SetText(questLogPendingXpTurnIn)
		UI:ApplyTextWidgetFont(FarmingPage.Page.CondensedFrameView.XpView.QuestLogCurrentXpTurnInText, questLogPendingXpColor)
		
		local questLogPossibleLevel, questLogPossibleCurrentXp, questLogPossibleNeededXp, questLogPossibleXpColor = FarmingPage:CalculateResultingLevelAndXps(Core:GetQuestLogTotalXpReward(trackedOnly))
		local questLogPossibleXpTurnIn = Strings:Get("FARMING_PAGE_CONDENSED_TURN_IN_RESULT_TOTAL_LABEL") .. " " .. Strings:Get("FARMING_PAGE_TURN_IN_RESULT_MAX_LEVEL")
		if questLogPossibleLevel < Core:GetMaxLevel() then
			questLogPossibleXpTurnIn = Strings:Get("FARMING_PAGE_CONDENSED_TURN_IN_RESULT_TOTAL_LABEL") .. " " .. Strings:Get("FARMING_PAGE_TURN_IN_RESULT_LEVEL_LABEL") .. " " .. questLogPossibleLevel .. " (" .. Utils:PercentageString(questLogPossibleCurrentXp, questLogPossibleNeededXp, 1) .. ")"
		end
		FarmingPage.Page.CondensedFrameView.XpView.QuestLogTotalXpTurnInText:SetText(questLogPossibleXpTurnIn)
		UI:ApplyTextWidgetFont(FarmingPage.Page.CondensedFrameView.XpView.QuestLogTotalXpTurnInText, questLogPossibleXpColor)
	end
	
	-- Gold View
	
	if miscellaneousChange then
		local trackedOnly = Settings:IsShowingDataForTrackedQuestOnlyInFarmingPage()
		
		local questLogPendingGoldTurnIn = Utils:CopperToCoinString(FarmingPage:CalculateResultingMoney(Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper(trackedOnly)), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.CondensedFrameView.GoldView.QuestLogCurrentGoldTurnInText:SetText(questLogPendingGoldTurnIn)
		
		local questLogPossibleGoldTurnIn = Utils:CopperToCoinString(FarmingPage:CalculateResultingMoney(Core:GetQuestLogTotalMonetaryRewardInWholeCopper(trackedOnly)), UIConfig.FARMING_PAGE_COIN_ICON_RES)
		FarmingPage.Page.CondensedFrameView.GoldView.QuestLogTotalGoldTurnInText:SetText(questLogPossibleGoldTurnIn)
	end
end

function FarmingPage:UpdateDisplay(force, xpChanged, moneyChanged, miscellaneousChange, rateUpdate)
	if not force and not FarmingPage.Page:IsVisible() then
		return
	end
	
	if force or FarmingPage.Page.ExpandedFrameView:IsVisible() then
		FarmingPage:UpdateExpandedFrameView(xpChanged, moneyChanged, miscellaneousChange, rateUpdate)
	end
	if force or FarmingPage.Page.CondensedFrameView:IsVisible() then
		FarmingPage:UpdateCondensedFrameView(xpChanged, moneyChanged, miscellaneousChange, rateUpdate)
	end
end

function FarmingPage:UpdateShownView()
	if FarmingPage.ShowingXpView then
		FarmingPage.Page.ExpandedFrameView.GoldView:Hide()
		FarmingPage.Page.ExpandedFrameView.XpView:Show()
		FarmingPage.Page.ExpandedFrameView.SwitchViewButton:SetText(Strings:Get("FARMING_PAGE_SWITCH_VIEW_BUTTON_GOLD_TEXT"))
		
		FarmingPage.Page.CondensedFrameView.GoldView:Hide()
		FarmingPage.Page.CondensedFrameView.XpView:Show()
		FarmingPage.Page.CondensedFrameView.SwitchViewButton:SetText(Strings:Get("FARMING_PAGE_SWITCH_VIEW_BUTTON_GOLD_TEXT"))
	else
		FarmingPage.Page.ExpandedFrameView.XpView:Hide()
		FarmingPage.Page.ExpandedFrameView.GoldView:Show()
		FarmingPage.Page.ExpandedFrameView.SwitchViewButton:SetText(Strings:Get("FARMING_PAGE_SWITCH_VIEW_BUTTON_XP_TEXT"))
		
		FarmingPage.Page.CondensedFrameView.XpView:Hide()
		FarmingPage.Page.CondensedFrameView.GoldView:Show()
		FarmingPage.Page.CondensedFrameView.SwitchViewButton:SetText(Strings:Get("FARMING_PAGE_SWITCH_VIEW_BUTTON_XP_TEXT"))
	end
end

------------------------
-- Listener Functions --
------------------------

function FarmingPage:OnExpandedFrameViewShown()
	FarmingPage:UpdateDisplay(true, true, true, true, true)
end

function FarmingPage:OnCondensedFrameViewShown()
	FarmingPage:UpdateDisplay(true, true, true, true, true)
end

function FarmingPage:OnPageShown()
	FarmingPage.ShowingXpView = HiddenSettings:GetFarmingPageLastShownViewIsXp()
	FarmingPage.GoldGoalIndex = HiddenSettings:GetFarmingPageLastShownGoldGoal()
	
	FarmingPage:UpdateShownView()
	FarmingPage:UpdateDisplay(true, true, true, true, true)
end

function FarmingPage:OnPageHidden()
	-- TODO
end

function FarmingPage:OnChangeGoldGoalButtonClicked()
	FarmingPage.GoldGoalIndex = FarmingPage.GoldGoalIndex + 1
	if FarmingPage.GoldGoalIndex > #GoldData.GoldGoals then
		FarmingPage.GoldGoalIndex = 1
	end
	
	HiddenSettings:SetFarmingPageLastShownGoldGoal(FarmingPage.GoldGoalIndex)
	
	FarmingPage:UpdateDisplay(false, false, true, false, true)
end

function FarmingPage:OnSwitchViewButtonClicked()
	FarmingPage.ShowingXpView = not FarmingPage.ShowingXpView
	
	HiddenSettings:SetFarmingPageLastShownViewIsXp(FarmingPage.ShowingXpView)
	
	FarmingPage:UpdateShownView()
	FarmingPage:UpdateDisplay(true, true, true, false, true)
end

function FarmingPage:OnPauseButtonClicked()
	Session:TogglePausedSession()
	if Session:IsSessionPaused() then
		FarmingPage.Page.ExpandedFrameView.SessionPauseButton:SetText(Strings:Get("FARMING_PAGE_PAUSE_BUTTON_RESUME_TEXT"))
		FarmingPage.Page.CondensedFrameView.SessionPauseButton:SetText(Strings:Get("FARMING_PAGE_PAUSE_BUTTON_RESUME_TEXT"))
	else
		FarmingPage.Page.ExpandedFrameView.SessionPauseButton:SetText(Strings:Get("FARMING_PAGE_PAUSE_BUTTON_PAUSE_TEXT"))
		FarmingPage.Page.CondensedFrameView.SessionPauseButton:SetText(Strings:Get("FARMING_PAGE_PAUSE_BUTTON_PAUSE_TEXT"))
	end
	
	Session:UpdateSession()
	FarmingPage:UpdateDisplay(true, false, false, false, true)
end

function FarmingPage:OnResetButtonClicked()
	Session:ResetSession()
	if Session:IsSessionPaused() then
		FarmingPage.Page.ExpandedFrameView.SessionPauseButton:SetText(Strings:Get("FARMING_PAGE_PAUSE_BUTTON_RESUME_TEXT"))
		FarmingPage.Page.CondensedFrameView.SessionPauseButton:SetText(Strings:Get("FARMING_PAGE_PAUSE_BUTTON_RESUME_TEXT"))
	else
		FarmingPage.Page.ExpandedFrameView.SessionPauseButton:SetText(Strings:Get("FARMING_PAGE_PAUSE_BUTTON_PAUSE_TEXT"))
		FarmingPage.Page.CondensedFrameView.SessionPauseButton:SetText(Strings:Get("FARMING_PAGE_PAUSE_BUTTON_PAUSE_TEXT"))
	end
	
	Session:UpdateSession()
	FarmingPage:UpdateDisplay(true, false, false, false, true)
end

-----------------------
-- Page Construction --
-----------------------

function FarmingPage:BuildExpandedFrameView(page)
	local view = UI:CreateExpandedView(page)
	
	-- XP View Construction
	
	local xpView = UI:CreateFrame(view, UIConfig.MAIN_FRAME_CONTENT_WIDTH, UIConfig.MAIN_FRAME_CONTENT_EXPANDED_HEIGHT, "TOP", "TOP", 0, 0)
	xpView:SetShown(FarmingPage.ShowingXpView)
	view.XpView = xpView
	
	local y = UIConfig.FARMING_PAGE_TABLE_START_OFFSET_Y
	
	-- XP View Table Params
	
	local experienceMetricsTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(experienceMetricsTableParams, 1, UIConfig.FARMING_PAGE_TABLE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(experienceMetricsTableParams, 2, UIConfig.FARMING_PAGE_LINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(experienceMetricsTableParams, 3, UIConfig.FARMING_PAGE_SUBLINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(experienceMetricsTableParams, 4, UIConfig.FARMING_PAGE_EXP_VIEW_METRIC_VALUE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(experienceMetricsTableParams, 5, UIConfig.FARMING_PAGE_EXP_VIEW_METRIC_PERCENTAGE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(experienceMetricsTableParams, 6, UIConfig.FARMING_PAGE_EXP_VIEW_METRIC_RATE_COL_X, "TOP", nil)
	UI:SetTableRowParameters(experienceMetricsTableParams, 1, y, nil, UIConfig.FARMING_PAGE_SECTION_FONT_SIZE)
	UI:SetTableRowParameters(experienceMetricsTableParams, 2, y, nil, UIConfig.FARMING_PAGE_COLUMN_HEADER_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_SECTION_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_START_SPACING
	UI:SetTableRowParameters(experienceMetricsTableParams, 3, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_GROUP_SPACING
	UI:SetTableRowParameters(experienceMetricsTableParams, 4, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER
	UI:SetTableRowParameters(experienceMetricsTableParams, 5, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_END_SPACING
	
	local experienceAveragesTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(experienceAveragesTableParams, 1, UIConfig.FARMING_PAGE_TABLE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(experienceAveragesTableParams, 2, UIConfig.FARMING_PAGE_LINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(experienceAveragesTableParams, 3, UIConfig.FARMING_PAGE_EXP_VIEW_AVERAGES_VALUE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(experienceAveragesTableParams, 4, UIConfig.FARMING_PAGE_EXP_VIEW_AVERAGES_NEEDED_COL_X, "TOP", nil)
	UI:SetTableRowParameters(experienceAveragesTableParams, 1, y, nil, UIConfig.FARMING_PAGE_SECTION_FONT_SIZE)
	UI:SetTableRowParameters(experienceAveragesTableParams, 2, y, nil, UIConfig.FARMING_PAGE_COLUMN_HEADER_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_SECTION_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_START_SPACING
	UI:SetTableRowParameters(experienceAveragesTableParams, 3, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER
	UI:SetTableRowParameters(experienceAveragesTableParams, 4, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_END_SPACING
	
	local questLogExperienceTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(questLogExperienceTableParams, 1, UIConfig.FARMING_PAGE_TABLE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(questLogExperienceTableParams, 2, UIConfig.FARMING_PAGE_LINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(questLogExperienceTableParams, 3, UIConfig.FARMING_PAGE_EXP_VIEW_QUEST_LOG_VALUE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(questLogExperienceTableParams, 4, UIConfig.FARMING_PAGE_EXP_VIEW_QUEST_LOG_RESULT_COL_X, "TOP", nil)
	UI:SetTableRowParameters(questLogExperienceTableParams, 1, y, nil, UIConfig.FARMING_PAGE_SECTION_FONT_SIZE)
	UI:SetTableRowParameters(questLogExperienceTableParams, 2, y, nil, UIConfig.FARMING_PAGE_COLUMN_HEADER_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_SECTION_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_START_SPACING
	UI:SetTableRowParameters(questLogExperienceTableParams, 3, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER
	UI:SetTableRowParameters(questLogExperienceTableParams, 4, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	
	-- XP View: Metrics Table
	
	UI:CreateTableText(experienceMetricsTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_METRIC_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, 1)
	
	UI:CreateTableText(experienceMetricsTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_METRIC_TOTAL_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 4, 2)
	UI:CreateTableText(experienceMetricsTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_METRIC_PERCENTAGE_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, 2)
	UI:CreateTableText(experienceMetricsTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_METRIC_RATE_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 6, 2)
	
	UI:CreateTableText(experienceMetricsTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_METRIC_TOTAL_LABEL"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 3)
	xpView.TotalXpValueText = UI:CreateTableText(experienceMetricsTableParams, xpView, "", UIConfig.GLOBAL_EXP_COLOR, 4, 3)
	xpView.TotalXpRateText = UI:CreateTableText(experienceMetricsTableParams, xpView, "", UIConfig.GLOBAL_EXP_COLOR, 6, 3)
	
	UI:CreateTableText(experienceMetricsTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_METRIC_QUEST_LABEL"), UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 4)
	xpView.QuestXpValueText = UI:CreateTableText(experienceMetricsTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 4)
	xpView.QuestXpPercentageText = UI:CreateTableText(experienceMetricsTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 5, 4)
	xpView.QuestXpRateText = UI:CreateTableText(experienceMetricsTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, 4)
	
	UI:CreateTableText(experienceMetricsTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_METRIC_OTHER_LABEL"), UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 5)
	xpView.OtherXpValueText = UI:CreateTableText(experienceMetricsTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 5)
	xpView.OtherXpPercentageText = UI:CreateTableText(experienceMetricsTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 5, 5)
	xpView.OtherXpRateText = UI:CreateTableText(experienceMetricsTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, 5)
	
	-- XP View: Averages Table
	
	UI:CreateTableText(experienceAveragesTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_AVERAGE_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, 1)
	
	UI:CreateTableText(experienceAveragesTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_AVERAGE_TOTAL_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, 2)
	UI:CreateTableText(experienceAveragesTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_AVERAGE_COUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 4, 2)
	
	UI:CreateTableText(experienceAveragesTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_AVERAGE_QUEST_LABEL"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 3)
	xpView.AverageQuestXpValueText = UI:CreateTableText(experienceAveragesTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 3)
	xpView.AverageQuestXpNeededText = UI:CreateTableText(experienceAveragesTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 3)
	
	UI:CreateTableText(experienceAveragesTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_AVERAGE_OTHER_LABEL"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 4)
	xpView.AverageOtherXpValueText = UI:CreateTableText(experienceAveragesTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 4)
	xpView.AverageOtherXpNeededText = UI:CreateTableText(experienceAveragesTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 4)
	
	-- XP View: Quest Log Table
	
	UI:CreateTableText(questLogExperienceTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_QUEST_LOG_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, 1)
	
	UI:CreateTableText(questLogExperienceTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_QUEST_LOG_TOTAL_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, 2)
	UI:CreateTableText(questLogExperienceTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_QUEST_LOG_TURN_IN_RESULT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 4, 2)
	
	UI:CreateTableText(questLogExperienceTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_QUEST_LOG_COMPLETED_LABEL"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 3)
	xpView.QuestLogCurrentXpValueText = UI:CreateTableText(questLogExperienceTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 3)
	xpView.QuestLogCurrentXpTurnInText = UI:CreateTableText(questLogExperienceTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 3)
	
	UI:CreateTableText(questLogExperienceTableParams, xpView, Strings:Get("FARMING_PAGE_XP_VIEW_QUEST_LOG_TOTAL_LABEL"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 4)
	xpView.QuestLogTotalXpValueText = UI:CreateTableText(questLogExperienceTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 4)
	xpView.QuestLogTotalXpTurnInText = UI:CreateTableText(questLogExperienceTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 4)
	
	UI:CreateText(xpView, Strings:Get("FARMING_PAGE_TIME_TO_LEVEL_LABEL"), "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_LABEL_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y + UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE + UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_BUFFER, UIConfig.GLOBAL_SECTION_TEXT_COLOR, UIConfig.FARMING_PAGE_CAPSTONE_METRIC_FONT_SIZE)
	xpView.TimeUntilNextLevelText = UI:CreateText(xpView, "", "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_VALUE_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y + UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE + UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_BUFFER, UIConfig.GLOBAL_EXP_COLOR, UIConfig.FARMING_PAGE_CAPSTONE_METRIC_FONT_SIZE)
	
	-- Gold View Construction
	
	local goldView = UI:CreateFrame(view, UIConfig.MAIN_FRAME_CONTENT_WIDTH, UIConfig.MAIN_FRAME_CONTENT_EXPANDED_HEIGHT, "TOP", "TOP", 0, 0)
	goldView:SetShown(not FarmingPage.ShowingXpView)
	view.GoldView = goldView
	
	y = UIConfig.FARMING_PAGE_TABLE_START_OFFSET_Y
	
	-- Gold View Table Params
	
	local goldMetricsTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(goldMetricsTableParams, 1, UIConfig.FARMING_PAGE_TABLE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(goldMetricsTableParams, 2, UIConfig.FARMING_PAGE_LINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(goldMetricsTableParams, 3, UIConfig.FARMING_PAGE_SUBLINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(goldMetricsTableParams, 4, UIConfig.FARMING_PAGE_GOLD_VIEW_METRIC_VALUE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(goldMetricsTableParams, 5, UIConfig.FARMING_PAGE_GOLD_VIEW_METRIC_PERCENTAGE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(goldMetricsTableParams, 6, UIConfig.FARMING_PAGE_GOLD_VIEW_METRIC_RATE_COL_X, "TOP", nil)
	UI:SetTableRowParameters(goldMetricsTableParams, 1, y, nil, UIConfig.FARMING_PAGE_SECTION_FONT_SIZE)
	UI:SetTableRowParameters(goldMetricsTableParams, 2, y, nil, UIConfig.FARMING_PAGE_COLUMN_HEADER_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_SECTION_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_START_SPACING
	UI:SetTableRowParameters(goldMetricsTableParams, 3, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_GROUP_SPACING
	UI:SetTableRowParameters(goldMetricsTableParams, 4, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER
	UI:SetTableRowParameters(goldMetricsTableParams, 5, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_GROUP_SPACING
	UI:SetTableRowParameters(goldMetricsTableParams, 6, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_END_SPACING
	
	local goldGoalTableParameters = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(goldGoalTableParameters, 1, UIConfig.FARMING_PAGE_TABLE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(goldGoalTableParameters, 2, UIConfig.FARMING_PAGE_LINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(goldGoalTableParameters, 3, UIConfig.FARMING_PAGE_GOLD_VIEW_GOAL_VALUE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(goldGoalTableParameters, 4, UIConfig.FARMING_PAGE_GOLD_VIEW_GOAL_PERCENTAGE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(goldGoalTableParameters, 5, UIConfig.FARMING_PAGE_GOLD_VIEW_GOAL_CHANGE_BUTTON_COL_X, "TOP", nil)
	UI:SetTableRowParameters(goldGoalTableParameters, 1, y, nil, UIConfig.FARMING_PAGE_SECTION_FONT_SIZE)
	UI:SetTableRowParameters(goldGoalTableParameters, 2, y, nil, UIConfig.FARMING_PAGE_COLUMN_HEADER_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_SECTION_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_START_SPACING
	UI:SetTableRowParameters(goldGoalTableParameters, 3, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_END_SPACING
	
	local questLogGoldTableParams = UI:CreateTableParameters("TOPLEFT")
	UI:SetTableColumnParameters(questLogGoldTableParams, 1, UIConfig.FARMING_PAGE_TABLE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(questLogGoldTableParams, 2, UIConfig.FARMING_PAGE_LINE_START_OFFSET_X, "TOPLEFT", nil)
	UI:SetTableColumnParameters(questLogGoldTableParams, 3, UIConfig.FARMING_PAGE_GOLD_VIEW_QUEST_LOG_VALUE_COL_X, "TOP", nil)
	UI:SetTableColumnParameters(questLogGoldTableParams, 4, UIConfig.FARMING_PAGE_GOLD_VIEW_QUEST_LOG_RESULT_COL_X, "TOP", nil)
	UI:SetTableRowParameters(questLogGoldTableParams, 1, y, nil, UIConfig.FARMING_PAGE_SECTION_FONT_SIZE)
	UI:SetTableRowParameters(questLogGoldTableParams, 2, y, nil, UIConfig.FARMING_PAGE_COLUMN_HEADER_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_SECTION_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER - UIConfig.FARMING_PAGE_LINE_SECTION_START_SPACING
	UI:SetTableRowParameters(questLogGoldTableParams, 3, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	y = y - UIConfig.FARMING_PAGE_DATA_FONT_SIZE - UIConfig.FARMING_PAGE_LINE_BUFFER
	UI:SetTableRowParameters(questLogGoldTableParams, 4, y, nil, UIConfig.FARMING_PAGE_DATA_FONT_SIZE)
	
	-- Gold View: Metrics Table
	
	UI:CreateTableText(goldMetricsTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_METRIC_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, 1)
	
	UI:CreateTableText(goldMetricsTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_METRIC_TOTAL_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 4, 2)
	UI:CreateTableText(goldMetricsTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_METRIC_PERCENTAGE_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 5, 2)
	UI:CreateTableText(goldMetricsTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_METRIC_RATE_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 6, 2)
	
	UI:CreateTableText(goldMetricsTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_METRIC_EARNED_TOTAL_LABEL"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 3)
	goldView.TotalGoldEarnedValueText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 3)
	goldView.TotalGoldEarnedRateText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, 3)
	
	UI:CreateTableText(goldMetricsTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_METRIC_EARNED_QUEST_LABEL"), UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 4)
	goldView.QuestGoldEarnedValueText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 4)
	goldView.QuestGoldEarnedPercentageText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 5, 4)
	goldView.QuestGoldEarnedRateText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, 4)
	
	UI:CreateTableText(goldMetricsTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_METRIC_EARNED_OTHER_LABEL"), UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 5)
	goldView.OtherGoldEarnedValueText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 5)
	goldView.OtherGoldEarnedPercentageText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 5, 5)
	goldView.OtherGoldEarnedRateText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, 5)
	
	UI:CreateTableText(goldMetricsTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_METRIC_SPENT_LABEL"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 6)
	goldView.TotalGoldSpentValueText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 6)
	goldView.TotalGoldSpentRateText = UI:CreateTableText(goldMetricsTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 6, 6)
	
	-- Gold View: Goal Table
	
	UI:CreateTableText(goldGoalTableParameters, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_GOAL_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, 1)
	
	UI:CreateTableText(goldGoalTableParameters, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_GOAL_VALUE_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, 2)
	UI:CreateTableText(goldGoalTableParameters, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_GOAL_PROGRESS_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 4, 2)
	
	goldView.GoldGoalNameText = UI:CreateTableText(goldGoalTableParameters, goldView, "", UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 3)
	goldView.GoldGoalValueText = UI:CreateTableText(goldGoalTableParameters, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 3)
	goldView.GoldGoalProgressText = UI:CreateTableText(goldGoalTableParameters, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 3)
	goldView.GoldGoalChangeButton = UI:CreateTableButton(goldGoalTableParameters, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_GOAL_CHANGE_BUTTON"), UIConfig.FARMING_PAGE_GOLD_VIEW_GOAL_CHANGE_BUTTON_WIDTH, UIConfig.FARMING_PAGE_GOLD_VIEW_GOAL_CHANGE_BUTTON_HEIGHT, FarmingPage.OnChangeGoldGoalButtonClicked, 5, 3, 0, UIConfig.FARMING_PAGE_GOLD_VIEW_GOAL_CHANGE_BUTTON_OFFSET_Y)
	
	-- Gold View: Quest Log Table
	
	UI:CreateTableText(questLogGoldTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_QUEST_LOG_SECTION"), UIConfig.GLOBAL_SECTION_TEXT_COLOR, 1, 1)
	
	UI:CreateTableText(questLogGoldTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_QUEST_LOG_TOTAL_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 3, 2)
	UI:CreateTableText(questLogGoldTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_QUEST_LOG_TURN_IN_RESULT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 4, 2)
	
	UI:CreateTableText(questLogGoldTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_QUEST_LOG_COMPLETED_LABEL"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 3)
	goldView.QuestLogCurrentGoldValueText = UI:CreateTableText(questLogGoldTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 3)
	goldView.QuestLogCurrentGoldTurnInText = UI:CreateTableText(questLogGoldTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 3)
	
	UI:CreateTableText(questLogGoldTableParams, goldView, Strings:Get("FARMING_PAGE_GOLD_VIEW_QUEST_LOG_TOTAL_LABEL"), UIConfig.GLOBAL_LABEL_TEXT_COLOR, 2, 4)
	goldView.QuestLogTotalGoldValueText = UI:CreateTableText(questLogGoldTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 3, 4)
	goldView.QuestLogTotalGoldTurnInText = UI:CreateTableText(questLogGoldTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 4, 4)
	
	UI:CreateText(goldView, Strings:Get("FARMING_PAGE_NET_GOLD_LABEL"), "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_LABEL_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y + UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE + UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_BUFFER, UIConfig.GLOBAL_SECTION_TEXT_COLOR, UIConfig.FARMING_PAGE_CAPSTONE_METRIC_FONT_SIZE)
	goldView.NetGoldText = UI:CreateText(goldView, "", "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_VALUE_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y + UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE + UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_BUFFER, UIConfig.GLOBAL_DATA_TEXT_COLOR, UIConfig.FARMING_PAGE_CAPSTONE_METRIC_FONT_SIZE)
	
	-- Control-Related Widgets
	
	UI:CreateText(view, Strings:Get("FARMING_PAGE_SESSION_TIME_LABEL"), "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_LABEL_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y, UIConfig.GLOBAL_SECTION_TEXT_COLOR, UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE)
	view.SessionTimeText = UI:CreateText(view, "", "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_VALUE_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y, UIConfig.FARMING_PAGE_SESSION_TIME_COLOR, UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE)
	
	view.SwitchViewButton = UI:CreateButton(view, Strings:Get("FARMING_PAGE_SWITCH_VIEW_BUTTON_GOLD_TEXT"), (UIConfig.FARMING_PAGE_CONTROL_BUTTON_WIDTH * 2) + UIConfig.FARMING_PAGE_CONTROL_BUTTON_BUFFER, UIConfig.FARMING_PAGE_CONTROL_BUTTON_HEIGHT, "BOTTOMRIGHT", "BOTTOMRIGHT", UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_X, UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_Y + UIConfig.FARMING_PAGE_CONTROL_BUTTON_HEIGHT + UIConfig.FARMING_PAGE_CONTROL_BUTTON_BUFFER, FarmingPage.OnSwitchViewButtonClicked, UIConfig.FARMING_PAGE_CONTROL_BUTTON_FONT_SIZE)
	view.SessionPauseButton = UI:CreateButton(view, Strings:Get("FARMING_PAGE_PAUSE_BUTTON_PAUSE_TEXT"), UIConfig.FARMING_PAGE_CONTROL_BUTTON_WIDTH, UIConfig.FARMING_PAGE_CONTROL_BUTTON_HEIGHT, "BOTTOMRIGHT", "BOTTOMRIGHT", UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_X - UIConfig.FARMING_PAGE_CONTROL_BUTTON_WIDTH - UIConfig.FARMING_PAGE_CONTROL_BUTTON_BUFFER, UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_Y, FarmingPage.OnPauseButtonClicked, UIConfig.FARMING_PAGE_CONTROL_BUTTON_FONT_SIZE)
	view.SessionResetButton = UI:CreateButton(view, Strings:Get("FARMING_PAGE_RESET_BUTTON"), UIConfig.FARMING_PAGE_CONTROL_BUTTON_WIDTH, UIConfig.FARMING_PAGE_CONTROL_BUTTON_HEIGHT, "BOTTOMRIGHT", "BOTTOMRIGHT", UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_X, UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_Y, FarmingPage.OnResetButtonClicked, UIConfig.FARMING_PAGE_CONTROL_BUTTON_FONT_SIZE)
	
	return view
end

function FarmingPage:BuildCondensedFrameView(page)
	local view = UI:CreateCondensedView(page)
	
	-- Constructing the XP view
	
	local xpView = UI:CreateFrame(view, UIConfig.MAIN_FRAME_CONTENT_WIDTH, UIConfig.MAIN_FRAME_CONTENT_CONDENSED_HEIGHT, "TOP", "TOP", 0, 0)
	xpView:SetShown(FarmingPage.ShowingXpView)
	view.XpView = xpView
	
	local condensedXpViewTableParams = UI:CreateTableParameters("BOTTOMRIGHT")
	UI:SetTableColumnParameters(condensedXpViewTableParams, 1, UIConfig.FARMING_PAGE_CONDENSED_EXP_TABLE_COLUMN_1_X, "BOTTOM", nil)
	UI:SetTableColumnParameters(condensedXpViewTableParams, 2, UIConfig.FARMING_PAGE_CONDENSED_EXP_TABLE_COLUMN_2_X, "BOTTOM", nil)
	UI:SetTableRowParameters(condensedXpViewTableParams, 1, UIConfig.FARMING_PAGE_CONDENSED_TABLE_ROW_1_Y, nil, UIConfig.FARMING_PAGE_CONDENSED_TABLE_FONT_SIZE)
	UI:SetTableRowParameters(condensedXpViewTableParams, 2, UIConfig.FARMING_PAGE_CONDENSED_TABLE_ROW_2_Y, nil, UIConfig.FARMING_PAGE_CONDENSED_TABLE_FONT_SIZE)
	UI:SetTableRowParameters(condensedXpViewTableParams, 3, UIConfig.FARMING_PAGE_CONDENSED_TABLE_ROW_3_Y, nil, UIConfig.FARMING_PAGE_CONDENSED_TABLE_FONT_SIZE)
	
	UI:CreateTableText(condensedXpViewTableParams, xpView, Strings:Get("FARMING_PAGE_CONDENSED_XP_VIEW_AVERAGE_COUNT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 1, 1)
	xpView.AverageQuestXpNeededText = UI:CreateTableText(condensedXpViewTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, 2)
	xpView.AverageOtherXpNeededText = UI:CreateTableText(condensedXpViewTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, 3)
	
	UI:CreateTableText(condensedXpViewTableParams, xpView, Strings:Get("FARMING_PAGE_CONDENSED_XP_VIEW_QUEST_LOG_TURN_IN_RESULT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 2, 1)
	xpView.QuestLogCurrentXpTurnInText = UI:CreateTableText(condensedXpViewTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, 2)
	xpView.QuestLogTotalXpTurnInText = UI:CreateTableText(condensedXpViewTableParams, xpView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 2, 3)
	
	UI:CreateText(xpView, Strings:Get("FARMING_PAGE_TIME_TO_LEVEL_CONDENSED_LABEL"), "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_LABEL_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y + UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE + UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_BUFFER, UIConfig.GLOBAL_SECTION_TEXT_COLOR, UIConfig.FARMING_PAGE_CAPSTONE_METRIC_FONT_SIZE)
	xpView.TimeUntilNextLevelText = UI:CreateText(xpView, "", "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_CONDENSED_VALUE_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y + UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE + UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_BUFFER, UIConfig.GLOBAL_EXP_COLOR, UIConfig.FARMING_PAGE_CAPSTONE_METRIC_FONT_SIZE)
	
	-- Constructing the Gold view
	
	local goldView = UI:CreateFrame(view, UIConfig.MAIN_FRAME_CONTENT_WIDTH, UIConfig.MAIN_FRAME_CONTENT_CONDENSED_HEIGHT, "TOP", "TOP", 0, 0)
	goldView:SetShown(not FarmingPage.ShowingXpView)
	view.GoldView = goldView
	
	local condensedGoldViewTableParams = UI:CreateTableParameters("BOTTOMRIGHT")
	UI:SetTableColumnParameters(condensedGoldViewTableParams, 1, UIConfig.FARMING_PAGE_CONDENSED_GOLD_TABLE_COLUMN_1_X, "BOTTOM", nil)
	UI:SetTableRowParameters(condensedGoldViewTableParams, 1, UIConfig.FARMING_PAGE_CONDENSED_TABLE_ROW_1_Y, nil, UIConfig.FARMING_PAGE_CONDENSED_TABLE_FONT_SIZE)
	UI:SetTableRowParameters(condensedGoldViewTableParams, 2, UIConfig.FARMING_PAGE_CONDENSED_TABLE_ROW_2_Y, nil, UIConfig.FARMING_PAGE_CONDENSED_TABLE_FONT_SIZE)
	UI:SetTableRowParameters(condensedGoldViewTableParams, 3, UIConfig.FARMING_PAGE_CONDENSED_TABLE_ROW_3_Y, nil, UIConfig.FARMING_PAGE_CONDENSED_TABLE_FONT_SIZE)
	
	UI:CreateTableText(condensedGoldViewTableParams, goldView, Strings:Get("FARMING_PAGE_CONDENSED_GOLD_VIEW_QUEST_LOG_TURN_IN_RESULT_HEADER"), UIConfig.GLOBAL_COLUMN_HEADER_COLOR, 1, 1)
	goldView.QuestLogCurrentGoldTurnInText = UI:CreateTableText(condensedGoldViewTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, 2)
	goldView.QuestLogTotalGoldTurnInText = UI:CreateTableText(condensedGoldViewTableParams, goldView, "", UIConfig.GLOBAL_DATA_TEXT_COLOR, 1, 3)
	
	UI:CreateText(goldView, Strings:Get("FARMING_PAGE_NET_GOLD_CONDENSED_LABEL"), "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_LABEL_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y + UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE + UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_BUFFER, UIConfig.GLOBAL_SECTION_TEXT_COLOR, UIConfig.FARMING_PAGE_CAPSTONE_METRIC_FONT_SIZE)
	goldView.NetGoldText = UI:CreateText(goldView, "", "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_CONDENSED_VALUE_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y + UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE + UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_BUFFER, UIConfig.GLOBAL_DATA_TEXT_COLOR, UIConfig.FARMING_PAGE_CAPSTONE_METRIC_FONT_SIZE)
	
	-- Contructing the control-related widgets
	
	UI:CreateText(view, Strings:Get("FARMING_PAGE_SESSION_TIME_CONDENSED_LABEL"), "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_LABEL_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y, UIConfig.GLOBAL_SECTION_TEXT_COLOR, UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE)
	view.SessionTimeText = UI:CreateText(view, "", "BOTTOMLEFT", "BOTTOMLEFT", UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_CONDENSED_VALUE_OFFSET_X, UIConfig.FARMING_PAGE_IMPORTANT_ITEMS_OFFSET_Y, UIConfig.FARMING_PAGE_SESSION_TIME_COLOR, UIConfig.FARMING_PAGE_SESSION_TIME_FONT_SIZE)
	
	view.SwitchViewButton = UI:CreateButton(view, Strings:Get("FARMING_PAGE_SWITCH_VIEW_BUTTON_GOLD_TEXT"), (UIConfig.FARMING_PAGE_CONTROL_BUTTON_WIDTH * 2) + UIConfig.FARMING_PAGE_CONTROL_BUTTON_BUFFER, UIConfig.FARMING_PAGE_CONTROL_BUTTON_HEIGHT, "BOTTOMRIGHT", "BOTTOMRIGHT", UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_X, UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_Y + UIConfig.FARMING_PAGE_CONTROL_BUTTON_HEIGHT + UIConfig.FARMING_PAGE_CONTROL_BUTTON_BUFFER, FarmingPage.OnSwitchViewButtonClicked, UIConfig.FARMING_PAGE_CONTROL_BUTTON_FONT_SIZE)
	view.SessionPauseButton = UI:CreateButton(view, Strings:Get("FARMING_PAGE_PAUSE_BUTTON_PAUSE_TEXT"), UIConfig.FARMING_PAGE_CONTROL_BUTTON_WIDTH, UIConfig.FARMING_PAGE_CONTROL_BUTTON_HEIGHT, "BOTTOMRIGHT", "BOTTOMRIGHT", UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_X - UIConfig.FARMING_PAGE_CONTROL_BUTTON_WIDTH - UIConfig.FARMING_PAGE_CONTROL_BUTTON_BUFFER, UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_Y, FarmingPage.OnPauseButtonClicked, UIConfig.FARMING_PAGE_CONTROL_BUTTON_FONT_SIZE)
	view.SessionResetButton = UI:CreateButton(view, Strings:Get("FARMING_PAGE_RESET_BUTTON"), UIConfig.FARMING_PAGE_CONTROL_BUTTON_WIDTH, UIConfig.FARMING_PAGE_CONTROL_BUTTON_HEIGHT, "BOTTOMRIGHT", "BOTTOMRIGHT", UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_X, UIConfig.FARMING_PAGE_CONTROL_BUTTON_OFFSET_Y, FarmingPage.OnResetButtonClicked, UIConfig.FARMING_PAGE_CONTROL_BUTTON_FONT_SIZE)
	
	return view
end

function FarmingPage:Build(parent)
	Log:Debug("Creating Farming page...")
	
	FarmingPage.ShowingXpView = HiddenSettings:GetFarmingPageLastShownViewIsXp()
	FarmingPage.GoldGoalIndex = HiddenSettings:GetFarmingPageLastShownGoldGoal()
	
	local page = UI:CreatePage(parent, "Session")
	FarmingPage.Page = page
	
	local expandedView = FarmingPage:BuildExpandedFrameView(page)
	page.ExpandedFrameView = expandedView
	
	local condensedView = FarmingPage:BuildCondensedFrameView(page)
	page.CondensedFrameView = condensedView
	
	-- Event Listeners
	
	Session:RegisterListener(function(xpChanged, moneyChanged, miscellaneousChange)
		FarmingPage:UpdateDisplay(false, xpChanged, moneyChanged, miscellaneousChange, false)
	end)
	
	Event:SetSessionEventListenerForWidget(page, Session.UpdateSession)
	
	local ticker = Event:RegisterTickUpdateListener(250, function()
		FarmingPage:UpdateDisplay(false, false, false, false, true)
	end)
	page.Ticker = ticker
	
	return page
end
