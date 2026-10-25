local _, Frogtome = ...
if not Frogtome.Data then
	Frogtome.Data = {}
end
Frogtome.Data.InfoData = {}

local InfoData = Frogtome.Data.InfoData

-- A dictionary of body types (or sexes, if you prefer) based on their associated ID.
InfoData.BodyTypes = {
	[1] = "Unknown",
	[2] = "Male",
	[3] = "Female"
}
