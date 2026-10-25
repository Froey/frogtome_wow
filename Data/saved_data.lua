local _, Frogtome = ...
if not Frogtome.Data then
	Frogtome.Data = {}
end
Frogtome.Data.SavedData = {}

local SavedData = Frogtome.Data.SavedData

-- Returns whether or not saved data is loaded (either because the addon has loaded before it or because it simply does not exist).
function SavedData:IsSavedDataLoaded()
	return not FrogtomeSavedData or not FrogtomeCharSpecificSavedData
end

-- If necessary, initializes the saved data to new, blank states.
function SavedData:InitializeSavedData()
	if not FrogtomeSavedData then
		FrogtomeSavedData = {}
	end
	if not FrogtomeCharSpecificSavedData then
		FrogtomeCharSpecificSavedData = {}
	end
end

-- Returns the addon-wide saved data dictonary.
function SavedData:GetGlobalSavedData()
	return FrogtomeSavedData
end

-- Returns the character-specific saved data dictionary.
function SavedData:GetCharacterSavedData()
	return FrogtomeCharSpecificSavedData
end
