local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Session = {}

local Core = Frogtome.Core.Core
local LevelData = Frogtome.Data.LevelData
local Log = Frogtome.Misc.Log
local Session = Frogtome.Core.Session
local Utils = Frogtome.Misc.Utils

------------------------
-- Session Management --
------------------------

-- Creates or recreates the session from scratch.
function Session:InitializeSession()
	Session.Lock = false
	Session.LoadComplete = false
	
	Session:ResetSession()
end

-- Causes the session to lock itself from other (internal) processes trying to update it.
function Session:ClaimLock()
	if Session.Lock then
		Log:Error("Failed to claim session process lock.")
		return false
	end
	
	Session.Lock = true
	return true
end

-- Unlocks the session, allowing other (internal) processes to update it again.
function Session:RelinquishLock()
	if not Session.Lock then
		Log:Warn("Tried to relinquish session process lock while it's unclaimed.")
		return false
	end
	
	Session.Lock = false
	return true
end

-- Resets the session to its starting values, including a reset session timer.
function Session:ResetSession()
	if not Session:ClaimLock() then
		Log.Error("Cannot reset the session!")
		return
	end
	
	local session = {}
	Session.Session = session
	
	session.StartTimeSeconds = GetTime()
	session.PauseTimeSeconds = nil
	
	session.SessionLevels = 0
	session.SessionXp = 0
	session.SessionXpFromQuests = 0
	session.SessionXpFromQuestsCount = 0
	session.SessionXpFromElsewhere = 0
	session.SessionXpFromElsewhereCount = 0
	
	session.QuestXpReady = 0
	session.QuestXpPossible = 0
	
	session.SessionNetCopper = 0
	session.SessionEarnedCopper = 0
	session.SessionEarnedCopperFromQuests = 0
	session.SessionEarnedCopperFromElsewhere = 0
	session.SessionSpentCopper = 0
	
	session.QuestCopperReady = 0
	session.QuestCopperPossible = 0
	
	-- The session update process will handle cases where the character may not yet be fully loaded
	
	session.LastKnownLevel = Core:GetCurrentLevel()
	
	session.LastKnownCurrentXp = Core:GetCurrentXp()
	session.LastKnownNeededXp = Core:GetNeededXp()
	session.LastKnownRemainingXp = Core:GetRemainingXp()
	
	session.LastKnownTurnInAbleQuestXp = Core:GetQuestLogTurnInAbleXpReward()
	session.LastKnownTotalQuestXp = Core:GetQuestLogTotalXpReward()
	
	session.LastKnownCopper = Core:GetMoneyInWholeCopper()
	
	session.LastKnownTurnInAbleQuestCopper = Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper()
	session.LastKnownTotalQuestCopper = Core:GetQuestLogTotalMonetaryRewardInWholeCopper()
	
	Session:RelinquishLock()
end

-- Returns whether or not the session is currently paused.
function Session:IsSessionPaused()
	return Session.Session and Session.Session.PauseTimeSeconds ~= nil
end

-- Toggles the paused status of the session.
function Session:TogglePausedSession()
	local session = Session.Session
	
	if Session:IsSessionPaused() then
		-- Resume the session (with the original elapsed time)
		local elapsedSessionTimeSeconds = session.PauseTimeSeconds - session.StartTimeSeconds
		session.StartTimeSeconds = GetTime() - elapsedSessionTimeSeconds
		session.PauseTimeSeconds = nil
	else
		-- Pause the session
		session.PauseTimeSeconds = GetTime()
	end
end

-- Updates the session's timer as well as all session metrics.
function Session:UpdateSession()
	if not Session:ClaimLock() then
		Log.Error("Cannot update the session!")
		return
	end
	
	local session = Session.Session
	
	-- First, snapshot before-and-after information that we can derive other information out of.
	
	local oldLevel = session.LastKnownLevel
	local newLevel = Core:GetCurrentLevel()
	session.LastKnownLevel = newLevel
	
	local oldCurrentXp = session.LastKnownCurrentXp
	local newCurrentXp = Core:GetCurrentXp()
	session.LastKnownCurrentXp = newCurrentXp
	
	local oldNeededXp = session.LastKnownNeededXp
	local newNeededXp = Core:GetNeededXp()
	session.LastKnownNeededXp = newNeededXp
	
	local oldRemainingXp = session.LastKnownRemainingXp
	local newRemainingXp = Core:GetRemainingXp()
	session.LastKnownRemainingXp = newRemainingXp
	
	local oldTurnInAbleQuestXp = session.LastKnownTurnInAbleQuestXp
	local newTurnInAbleQuestXp = Core:GetQuestLogTurnInAbleXpReward()
	session.LastKnownTurnInAbleQuestXp = newTurnInAbleQuestXp
	
	local oldTotalQuestXp = session.LastKnownTotalQuestXp
	local newTotalQuestXp = Core:GetQuestLogTotalXpReward()
	session.LastKnownTotalQuestXp = newTotalQuestXp
	
	local oldCopper = session.LastKnownCopper
	local newCopper = Core:GetMoneyInWholeCopper()
	session.LastKnownCopper = newCopper
	
	local oldTurnInAbleQuestCopper = session.LastKnownTurnInAbleQuestCopper
	local newTurnInAbleQuestCopper = Core:GetQuestLogTurnInAbleMonetaryRewardInWholeCopper()
	session.LastKnownTurnInAbleQuestCopper = newTurnInAbleQuestCopper
	
	local oldTotalQuestCopper = session.LastKnownTotalQuestCopper
	local newTotalQuestCopper = Core:GetQuestLogTotalMonetaryRewardInWholeCopper()
	session.LastKnownTotalQuestCopper = newTotalQuestCopper
	
	-- Check if we're mid load or something of the sort - if so, let it do its thing and don't try to check for changes
	
	local missingSnapshot = false
	missingSnapshot = missingSnapshot or not oldLevel or not newLevel
	missingSnapshot = missingSnapshot or not oldCurrentXp or not newCurrentXp
	missingSnapshot = missingSnapshot or not oldNeededXp or not newNeededXp
	missingSnapshot = missingSnapshot or not oldRemainingXp or not newRemainingXp
	missingSnapshot = missingSnapshot or not oldTurnInAbleQuestXp or not newTurnInAbleQuestXp
	missingSnapshot = missingSnapshot or not oldTotalQuestXp or not newTotalQuestXp
	missingSnapshot = missingSnapshot or not oldCopper or not newCopper
	missingSnapshot = missingSnapshot or not oldTurnInAbleQuestCopper or not newTurnInAbleQuestCopper
	missingSnapshot = missingSnapshot or not oldTotalQuestCopper or not newTotalQuestCopper
	
	if missingSnapshot then
		-- Evidently something is trying to load - shouldn't be missing data otherwise
		Session.LoadComplete = false
		
		Log:Debug("Could not update session - missing info from being mid-load?")
		Session:RelinquishLock()
		return
	end
	
	if Session:IsSessionPaused() then
		Log:Debug("Skipping rest of session update - session is paused.")
		Session:RelinquishLock()
		return
	end
	
	if not Session.LoadComplete then
		-- All the info we want is now available, but this update means nothing since we were missing info before.
		-- Pass on this update - more are coming, and all snapshots following this update are now accurate...
		-- ... though if this is quite a bit into the new session, some sort of load event was probably missed altogether.
		if Session:GetSessionTimeSeconds() >= 5 then
			Log:Dev("Load took longer than expected - session-related metrics may be inaccurate.")
		end
		Session.LoadComplete = true
		Session:RelinquishLock()
		return
	end
	
	-- Derive general information we want out of the snapshotted information, and track it
	
	local changedLevel = false
	if newLevel > oldLevel then
		session.SessionLevels = session.SessionLevels + (newLevel - oldLevel)
		changedLevel = true
	end
	
	local xpDelta = 0
	local changedXp = false
	if newCurrentXp ~= oldCurrentXp or newNeededXp ~= oldNeededXp or changedLevel then
		-- Any one of these signify that XP has been gained(/lost), depending on what kind of leveling-up happened or not.
		
		if changedLevel then
			-- It's possible (though ridiculously improbable) multiple level-ups were experienced at once, so make sure ALL XP progress is tracked.
			for completedLevel = oldLevel, newLevel - 1 do
				newCurrentXp = newCurrentXp + LevelData.NeededLevelXps[completedLevel]
			end
		end
		
		xpDelta = newCurrentXp - oldCurrentXp
		
		session.SessionXp = session.SessionXp + xpDelta
		changedXp = true
	end
	
	local changedQuestXpReady = false
	if newTurnInAbleQuestXp ~= oldTurnInAbleQuestXp then
		session.QuestXpReady = newTurnInAbleQuestXp
		changedQuestXpReady = true
	end
	
	local changedQuestXpTotal = false
	if newTotalQuestXp ~= oldTotalQuestXp then
		session.QuestXpPossible = newTotalQuestXp
		changedQuestXpTotal = true
	end
	
	local copperDelta = 0
	local changedMoney = false
	if newCopper ~= oldCopper then
		copperDelta = newCopper - oldCopper
		if copperDelta > 0 then
			session.SessionEarnedCopper = session.SessionEarnedCopper + copperDelta
		else
			-- Double negatives means this tracked number goes up
			session.SessionSpentCopper = session.SessionSpentCopper - copperDelta
		end
		
		session.SessionNetCopper = session.SessionNetCopper + copperDelta
		changedMoney = true
	end
	
	local changedQuestMoneyReady = false
	if newTurnInAbleQuestCopper ~= oldTurnInAbleQuestCopper then
		session.QuestCopperReady = newTurnInAbleQuestCopper
		changedQuestMoneyReady = true
	end
	
	local changedQuestMoneyTotal = false
	if newTotalQuestCopper ~= oldTotalQuestCopper then
		session.QuestCopperPossible = newTotalQuestCopper
		changedQuestMoneyTotal = true
	end
	
	-- Derive some final auxilliary information.
	
	local justTurnedInXpQuest = changedXp and changedQuestXpReady and newTurnInAbleQuestXp < oldTurnInAbleQuestXp
	local justTurnedInMoneyQuest = changedMoney and changedQuestMoneyReady and newTurnInAbleQuestCopper < oldTurnInAbleQuestCopper
	local justTurnedInQuest = justTurnedInXpQuest or justTurnedInMoneyQuest
	
	if changedXp and xpDelta > 0 then
		if justTurnedInXpQuest then
			session.SessionXpFromQuests = session.SessionXpFromQuests + xpDelta
			session.SessionXpFromQuestsCount = session.SessionXpFromQuestsCount + 1
		else
			session.SessionXpFromElsewhere = session.SessionXpFromElsewhere + xpDelta
			session.SessionXpFromElsewhereCount = session.SessionXpFromElsewhereCount + 1
		end
	end
	
	if changedMoney and copperDelta > 0 then
		if justTurnedInMoneyQuest then
			session.SessionEarnedCopperFromQuests = session.SessionEarnedCopperFromQuests + copperDelta
		else
			session.SessionEarnedCopperFromElsewhere = session.SessionEarnedCopperFromElsewhere + copperDelta
		end
	end
	
	-- Fire appropriate listeners depending on what all has changed.
	
	local xpRelatedChange = changedXp or changedQuestXpReady or changedQuestXpTotal
	local moneyRelatedChange = changedMoney or changedQuestMoneyReady or changedQuestMoneyTotal
	
	for _, listener in ipairs(Session.SessionListeners) do
		listener(xpRelatedChange, moneyRelatedChange, true)
	end
	
	-- Finally, release the lock.
	
	Session:RelinquishLock()
end

Session.SessionListeners = {}

-- Adds a listener to the session, firing off whenever the session receives an update that changes its tracked total values.
function Session:RegisterListener(listener)
	table.insert(Session.SessionListeners, listener)
end

-----------------------------------
-- Session Information Functions --
-----------------------------------

-- Returns the time, in seconds, the session has been active.
function Session:GetSessionTimeSeconds()
	local session = Session.Session
	
	if not session.StartTimeSeconds then
		return nil
	end
	
	if Session:IsSessionPaused() then
		return session.PauseTimeSeconds - session.StartTimeSeconds
	else
		return GetTime() - session.StartTimeSeconds
	end
end

-- Returns the pace, per second, of the provided metric, to be determined using the provided session time in seconds or the session's current time if one isn't provided.
function Session:GetPacePerSecond(metric, sessionTimeSeconds, decimals)
	if not sessionTimeSeconds then
		sessionTimeSeconds = Session:GetSessionTimeSeconds()
	end
	if not sessionTimeSeconds then
		return nil
	end
	
	if sessionTimeSeconds == 0 then
		return nil
	end
	
	local metricPerSecond = metric / sessionTimeSeconds
	if decimals then
		metricPerSecond = Utils:Round(metricPerSecond, decimals)
	end
	
	return metricPerSecond
end

-- Returns the pace, per minute, of the provided metric, to be determined using the provided session time in seconds or the session's current time if one isn't provided.
function Session:GetPacePerMinute(metric, sessionTimeSeconds, decimals)
	local metricPerSecond = Session:GetPacePerSecond(metric, sessionTimeSeconds)
	if not metricPerSecond then
		return nil
	end
	
	local metricPerMinute = metricPerSecond * 60
	if decimals then
		metricPerMinute = Utils:Round(metricPerMinute, decimals)
	end
	
	return metricPerMinute
end

-- Returns the pace, per hour, of the provided metric, to be determined using the provided session time in seconds or the session's current time if one isn't provided.
function Session:GetPacePerHour(metric, sessionTimeSeconds, decimals)
	local metricPerMinute = Session:GetPacePerMinute(metric, sessionTimeSeconds)
	if not metricPerMinute then
		return nil
	end
	
	local metricPerHour = metricPerMinute * 60
	if decimals then
		metricPerHour = Utils:Round(metricPerHour, decimals)
	end
	
	return metricPerHour
end

-- Returns the total XP the current character has accumulated this session.
function Session:GetXp()
	return Session.Session.SessionXp
end

-- Returns the pace, per second, of XP the current character has accumulated this session.
function Session:GetXpPerSecond(sessionTimeSeconds, decimals)
	return Session:GetPacePerSecond(Session.Session.SessionXp, sessionTimeSeconds, decimals)
end

-- Returns the pace, per minute, of XP the current character has accumulated this session.
function Session:GetXpPerMinute(sessionTimeSeconds, decimals)
	return Session:GetPacePerMinute(Session.Session.SessionXp, sessionTimeSeconds, decimals)
end

-- Returns the pace, per hour, of XP the current character has accumulated this session.
function Session:GetXpPerHour(sessionTimeSeconds, decimals)
	return Session:GetPacePerHour(Session.Session.SessionXp, sessionTimeSeconds, decimals)
end

-- Returns the total XP the current character has accumulated from quests this session.
function Session:GetQuestXp()
	return Session.Session.SessionXpFromQuests
end

-- Returns the average XP the current character has accumulated from quests this session.
function Session:GetAverageQuestXp(decimals)
	if Session.Session.SessionXpFromQuestsCount == 0 then
		return "N/A"
	end
	
	return Utils:Round(Session.Session.SessionXpFromQuests / Session.Session.SessionXpFromQuestsCount, decimals)
end

-- Returns the pace, per second, of XP the current character has accumulated from quests this session.
function Session:GetQuestXpPerSecond(sessionTimeSeconds, decimals)
	return Session:GetPacePerSecond(Session.Session.SessionXpFromQuests, sessionTimeSeconds, decimals)
end

-- Returns the pace, per minute, of XP the current character has accumulated from quests this session.
function Session:GetQuestXpPerMinute(sessionTimeSeconds, decimals)
	return Session:GetPacePerMinute(Session.Session.SessionXpFromQuests, sessionTimeSeconds, decimals)
end

-- Returns the pace, per hour, of XP the current character has accumulated from quests this session.
function Session:GetQuestXpPerHour(sessionTimeSeconds, decimals)
	return Session:GetPacePerHour(Session.Session.SessionXpFromQuests, sessionTimeSeconds, decimals)
end

-- Returns the total XP the current character has accumulated from non-quests this session.
function Session:GetOtherXp()
	return Session.Session.SessionXpFromElsewhere
end

-- Returns the average XP the current character has accumulated from non-quests this session.
function Session:GetAverageOtherXp(decimals)
	if Session.Session.SessionXpFromElsewhereCount == 0 then
		return "N/A"
	end
	
	return Utils:Round(Session.Session.SessionXpFromElsewhere / Session.Session.SessionXpFromElsewhereCount, decimals)
end

-- Returns the pace, per second, of XP the current character has accumulated from non-quests this session.
function Session:GetOtherXpPerSecond(sessionTimeSeconds, decimals)
	return Session:GetPacePerSecond(Session.Session.SessionXpFromElsewhere, sessionTimeSeconds, decimals)
end

-- Returns the pace, per minute, of XP the current character has accumulated from non-quests this session.
function Session:GetOtherXpPerMinute(sessionTimeSeconds, decimals)
	return Session:GetPacePerMinute(Session.Session.SessionXpFromElsewhere, sessionTimeSeconds, decimals)
end

-- Returns the pace, per hour, of XP the current character has accumulated from non-quests this session.
function Session:GetOtherXpPerHour(sessionTimeSeconds, decimals)
	return Session:GetPacePerHour(Session.Session.SessionXpFromElsewhere, sessionTimeSeconds, decimals)
end

-- Returns the net total copper the current character has accumulated this session.
function Session:GetNetMoneyInCopper()
	return Session.Session.SessionNetCopper
end

-- Returns the pace, per second, of net copper the current character has accumulated this session.
function Session:GetNetMoneyPerSecondInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerSecond(Session.Session.SessionNetCopper, sessionTimeSeconds, decimals)
end

-- Returns the pace, per minute, of net copper the current character has accumulated this session.
function Session:GetNetMoneyPerMinuteInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerMinute(Session.Session.SessionNetCopper, sessionTimeSeconds, decimals)
end

-- Returns the pace, per hour, of net copper the current character has accumulated this session.
function Session:GetNetMoneyPerHourInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerHour(Session.Session.SessionNetCopper, sessionTimeSeconds, decimals)
end

-- Returns the total copper the current character has earned this session.
function Session:GetEarnedMoneyInCopper()
	return Session.Session.SessionEarnedCopper
end

-- Returns the pace, per second, of copper the current character has earned this session.
function Session:GetEarnedMoneyPerSecondInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerSecond(Session.Session.SessionEarnedCopper, sessionTimeSeconds, decimals)
end

-- Returns the pace, per minute, of copper the current character has earned this session.
function Session:GetEarnedMoneyPerMinuteInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerMinute(Session.Session.SessionEarnedCopper, sessionTimeSeconds, decimals)
end

-- Returns the pace, per hour, of copper the current character has earned this session.
function Session:GetEarnedMoneyPerHourInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerHour(Session.Session.SessionEarnedCopper, sessionTimeSeconds, decimals)
end

-- Returns the total copper the current character has earned from quests this session.
function Session:GetQuestMoneyInCopper()
	return Session.Session.SessionEarnedCopperFromQuests
end

-- Returns the pace, per second, of copper the current character has earned from quests this session.
function Session:GetQuestMoneyPerSecondInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerSecond(Session.Session.SessionEarnedCopperFromQuests, sessionTimeSeconds, decimals)
end

-- Returns the pace, per minute, of copper the current character has earned from quests this session.
function Session:GetQuestMoneyPerMinuteInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerMinute(Session.Session.SessionEarnedCopperFromQuests, sessionTimeSeconds, decimals)
end

-- Returns the pace, per hour, of copper the current character has earned from quests this session.
function Session:GetQuestMoneyPerHourInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerHour(Session.Session.SessionEarnedCopperFromQuests, sessionTimeSeconds, decimals)
end

-- Returns the total copper the current character has earned from non-quests this session.
function Session:GetOtherMoneyInCopper()
	return Session.Session.SessionEarnedCopperFromElsewhere
end

-- Returns the pace, per second, of copper the current character has earned from non-quests this session.
function Session:GetOtherMoneyPerSecondInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerSecond(Session.Session.SessionEarnedCopperFromElsewhere, sessionTimeSeconds, decimals)
end

-- Returns the pace, per minute, of copper the current character has earned from non-quests this session.
function Session:GetOtherMoneyPerMinuteInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerMinute(Session.Session.SessionEarnedCopperFromElsewhere, sessionTimeSeconds, decimals)
end

-- Returns the pace, per hour, of copper the current character has earned from non-quests this session.
function Session:GetOtherMoneyPerHourInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerHour(Session.Session.SessionEarnedCopperFromElsewhere, sessionTimeSeconds, decimals)
end

-- Returns the total copper the current character has spent this session.
function Session:GetSpentMoneyInCopper()
	return Session.Session.SessionSpentCopper
end

-- Returns the pace, per second, of copper the current character has spent this session.
function Session:GetSpentMoneyPerSecondInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerSecond(Session.Session.SessionSpentCopper, sessionTimeSeconds, decimals)
end

-- Returns the pace, per minute, of copper the current character has spent this session.
function Session:GetSpentMoneyPerMinuteInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerMinute(Session.Session.SessionSpentCopper, sessionTimeSeconds, decimals)
end

-- Returns the pace, per hour, of copper the current character has spent this session.
function Session:GetSpentMoneyPerHourInCopper(sessionTimeSeconds, decimals)
	return Session:GetPacePerHour(Session.Session.SessionSpentCopper, sessionTimeSeconds, decimals)
end

-------------------------------------------
-- Derived Session Information Functions --
-------------------------------------------

-- Returns the estimated time, in seconds, until the current character levels up given the current rate of earned XP.
function Session:GetTimeUntilNextLevelSeconds(sessionTimeSeconds)
	if not sessionTimeSeconds then
		sessionTimeSeconds = Session:GetSessionTimeSeconds()
	end
	if not sessionTimeSeconds then
		return nil
	end
	
	local xpRate = Session:GetXpPerSecond(sessionTimeSeconds)
	if not xpRate then
		return nil
	end
	if xpRate == 0 then
		return nil
	end
	
	local timeUntilNextLevelSeconds = Session.Session.LastKnownRemainingXp / xpRate
	if timeUntilNextLevelSeconds % 1 > 0 then
		timeUntilNextLevelSeconds = math.floor(timeUntilNextLevelSeconds) + 1
	end
	
	return timeUntilNextLevelSeconds
end
