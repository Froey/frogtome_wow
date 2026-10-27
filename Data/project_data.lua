local _, Frogtome = ...
if not Frogtome.Data then
	Frogtome.Data = {}
end
Frogtome.Data.ProjectData = {}

local ProjectData = Frogtome.Data.ProjectData

ProjectData.ProjectNames = {
	[1] = "Retail",
	[2] = "Classic",
	[5] = "BCC Anniversary",
	[18] = "Forever"
}

ProjectData.ProjectSupport = {
	[1] = false,
	[2] = false,
	[5] = false,
	[18] = true
}
