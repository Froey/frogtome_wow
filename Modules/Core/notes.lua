local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Notes = {}

local Notes = Frogtome.Core.Notes
local SavedData = Frogtome.Data.SavedData

-----------------------------
-- Saved Data Interactions --
-----------------------------

-- Initialized the saved notes if necessary.
function Notes:InitializeNotes()
	SavedData:InitializeSavedData()
	
	local globalData = SavedData:GetGlobalSavedData()
	if not globalData.Notes then
		globalData.Notes = ""
	end
	
	local characterData = SaveDdata:GetCharacterSavedData()
	if not characterData.Notes then
		characterData.Notes = ""
	end
end

-- Gets the account-wide notes from saved data.
function Notes:GetAccountNotes()
	SavedData:InitializeSavedData()
	return SavedData:GetGlobalSavedData().Notes
end

-- Saves account-wide notes to saved data.
function Notes:SetAccountNotes(notes)
	SavedData:InitializeSavedData()
	SavedData:GetGlobalSavedData().Notes = notes
end

-- Gets the character-specific notes from saved data.
function Notes:GetCharacterNotes()
	SavedData:InitializeSavedData()
	return SavedData:GetCharacterSavedData().Notes
end

-- Saves character-specific notes to saved data.
function Notes:SetCharacterNotes(notes)
	SavedData:InitializeSavedData()
	SavedData:GetCharacterSavedData().Notes = notes
end
