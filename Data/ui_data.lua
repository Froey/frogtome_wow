local _, Frogtome = ...
if not Frogtome.Data then
	Frogtome.Data = {}
end
Frogtome.Data.UIData = {}

local UIData = Frogtome.Data.UIData

-- A dictionary of class colors by class ID.
UIData.ClassColors = {
	[1] = 0xFFC69B6D, -- Warrior
	[2] = 0xFFF48CBA, -- Paladin
	[3] = 0xFFAAD372, -- Hunter
	[4] = 0xFFFFF468, -- Rogue
	[5] = 0xFFFFFFFF, -- Priest
	[7] = 0xFF0070DD, -- Shaman
	[8] = 0xFF3FC7EB, -- Mage
	[9] = 0xFF8788EE, -- Warlock
	[11] = 0xFFFF7C0A -- Druid
}

-- A dictionary of file paths to profession icons by the profession name.
UIData.ProfessionIcons = {
	["Unknown"] = "Interface\\Icons\\inv_misc_questionmark",
	["Herbalism"] = "Interface\\Icons\\spell_nature_naturetouchgrow",
	["Alchemy"] = "Interface\\Icons\\trade_alchemy",
	["Skinning"] = "Interface\\Icons\\inv_misc_pelt_wolf_01",
	["Leatherworking"] = "Interface\\Icons\\trade_leatherworking",
	["Mining"] = "Interface\\Icons\\trade_mining",
	["Blacksmithing"] = "Interface\\Icons\\trade_blacksmithing",
	["Engineering"] = "Interface\\Icons\\trade_engineering",
	["Tailoring"] = "Interface\\Icons\\trade_tailoring",
	["Enchanting"] = "Interface\\Icons\\trade_engraving",
	["Cooking"] = "Interface\\Icons\\inv_misc_food_15",
	["Fishing"] = "Interface\\Icons\\trade_fishing",
	["First Aid"] = "Interface\\Icons\\spell_holy_sealofsacrifice"
}

-- TODO: Can this be configurable in some way?
-- A dictionary, by profession name, of the order in which we want to display professions in the UI.
UIData.ProfessionDisplayOrders = {
	["Herbalism"] = 1,
	["Mining"] = 2,
	["Enchanting"] = 3,
	["Skinning"] = 4,
	["Alchemy"] = 5,
	["Leatherworking"] = 6,
	["Blacksmithing"] = 7,
	["Engineering"] = 8,
	["Tailoring"] = 9,
	["Cooking"] = 10,
	["Fishing"] = 11,
	["First Aid"] = 12
}
