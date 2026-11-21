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

function State:Update()
    QuestLog:UpdateQuestLog()
    Session:UpdateSession()
end