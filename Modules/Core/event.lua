local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Event = {}

local Event = Frogtome.Core.Event

----------------------------------
-- Event Registration Functions --
----------------------------------

-- Registers the provided widget to listen to login events. The widget must sill set its own "OnEvent" listener.
function Event:RegisterWidgetForLoginEvents(widget)
	widget:RegisterEvent("PLAYER_ENTERING_WORLD")
end

-- Registers the provided widget to listen to money events. The widget must sill set its own "OnEvent" listener.
function Event:RegisterWidgetForMoneyEvents(widget)
	widget:RegisterEvent("PLAYER_MONEY")
	widget:RegisterEvent("PLAYER_TRADE_MONEY")
	widget:RegisterEvent("SEND_MAIL_MONEY_CHANGED")
end

-- Registers the provided widget to listen to quest events. The widget must sill set its own "OnEvent" listener.
function Event:RegisterWidgetForQuestEvents(widget)
	widget:RegisterEvent("QUEST_ACCEPTED")
	widget:RegisterEvent("QUEST_TURNED_IN")
	widget:RegisterEvent("QUEST_POI_UPDATE")
	widget:RegisterEvent("QUEST_ITEM_UPDATE")
	widget:RegisterEvent("QUEST_LOG_UPDATE")
	widget:RegisterEvent("QUEST_WATCH_UPDATE")
	widget:RegisterEvent("QUEST_WATCH_LIST_CHANGED")
end

-- Registers the provided widget to listen to XP events. The widget must sill set its own "OnEvent" listener.
function Event:RegisterWidgetForXpEvents(widget)
	widget:RegisterEvent("ENABLE_XP_GAIN")
	widget:RegisterEvent("DISABLE_XP_GAIN")
	widget:RegisterEvent("PLAYER_LEVEL_UP")
	widget:RegisterEvent("PLAYER_XP_UPDATE")
end

-- Registers the provided widget to listen to rested-XP-related events. The widget must sill set its own "OnEvent" listener.
function Event:RegisterWidgetForRestedXpEvents(widget)
	Event:RegisterWidgetForXpEvents(widget)
	widget:RegisterEvent("PLAYER_UPDATE_RESTING")
	widget:RegisterEvent("UPDATE_EXHAUSTION")
end

-- Registers the provided widget to listen to profession events. The widget must sill set its own "OnEvent" listener.
function Event:RegisterWidgetForProfessionEvents(widget)
	widget:RegisterEvent("SKILL_LINES_CHANGED")
	widget:RegisterEvent("CHAT_MSG_SKILL")
end

-- Registers the provided widget to listen to inventory events. The widget must sill set its own "OnEvent" listener.
function Event:RegisterWidgetForInventoryEvents(widget)
	widget:RegisterEvent("BAG_CLOSED")
	widget:RegisterEvent("BAG_UPDATE")
end

-- Registers the provided widget to listen to bank events. The widget must sill set its own "OnEvent" listener.
function Event:RegisterWidgetForBankEvents(widget)
	widget:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
end

-- Registers the provided widget to listen to guild events. The widget must sill set its own "OnEvent" listener.
function Event:RegisterWidgetForGuildEvents(widget)
	widget:RegisterEvent("PLAYER_GUILD_UPDATE")
end

----------------------------
-- Event Listener Hookups --
----------------------------

-- Creates a timer that fires the provided listener every period of provided milliseconds.
function Event:RegisterTickUpdateListener(millis, listener)
	return C_Timer.NewTicker(millis / 1000, listener)
end

-- Sets the provided widget to respond to character-related events with the provided listener.
function Event:SetCharacterEventListenerForWidget(widget, listener)
	Event:RegisterWidgetForLoginEvents(widget)
	Event:RegisterWidgetForMoneyEvents(widget)
	Event:RegisterWidgetForQuestEvents(widget)
	Event:RegisterWidgetForXpEvents(widget)
	Event:RegisterWidgetForRestedXpEvents(widget)
	Event:RegisterWidgetForProfessionEvents(widget)
	Event:RegisterWidgetForInventoryEvents(widget)
	Event:RegisterWidgetForBankEvents(widget)
	Event:RegisterWidgetForGuildEvents(widget)
	
	widget:SetScript("OnEvent", listener)
end

-- Sets the provided widget to respond to session-related events with the provided listener.
function Event:SetSessionEventListenerForWidget(widget, listener)
	Event:RegisterWidgetForLoginEvents(widget)
	Event:RegisterWidgetForMoneyEvents(widget)
	Event:RegisterWidgetForQuestEvents(widget)
	Event:RegisterWidgetForXpEvents(widget)
	Event:RegisterWidgetForRestedXpEvents(widget)
	
	widget:SetScript("OnEvent", listener)
end
