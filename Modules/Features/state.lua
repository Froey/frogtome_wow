local _, Frogtome = ...
if not Frogtome.Features then
	Frogtome.Features = {}
end
Frogtome.Features.State = {}

local QuestLog = Frogtome.Features.QuestLog
local Session = Frogtome.Features.Session
local State = Frogtome.Features.State

----------------------
-- State Management --
----------------------

function State:Initialize()
    QuestLog:InitializeQuestLog()
    Session:InitializeSession()
end

function State:Update(event, arg1, arg2, arg3)
    QuestLog:UpdateQuestLog()
	
	local questTurnedIn = event == "QUEST_TURNED_IN"
	local questXp = arg2
	local questMoney = arg3
	
	if questTurnedIn then
    	Session:UpdateSession(true, questXp, questMoney)
	else
		Session:UpdateSession(false)
	end
end