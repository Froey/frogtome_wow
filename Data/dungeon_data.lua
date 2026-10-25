local _, Frogtome = ...
if not Frogtome.Data then
	Frogtome.Data = {}
end
Frogtome.Data.DungeonData = {}

local DungeonData = Frogtome.Data.DungeonData

-- A dictionary of dungeons, including IDs for quests associated with them.
DungeonData.Dungeons = {
	{
		["Zone"] = "Ironforge",
		["Name"] = "The Hall of Thanes",
		["MinLevel"] = 13,
		["MaxLevel"] = 20,
		["Quests"] = {
			96393,
			96394,
			96403
		},
		["MidQuests"] = {
			96395,
			98423
		}
	},
	{
		["Zone"] = "Orgrimmar",
		["Name"] = "Ragefire Chasm",
		["MinLevel"] = 13,
		["MaxLevel"] = 18,
		["Quests"] = {
			5722,
			5723,
			5725,
			5728,
			5761
		},
		["MidQuests"] = {
			5724
		}
	},
	{
		["Zone"] = "Orgrimmar",
		["Name"] = "Ruins of Lordaeron",
		["MinLevel"] = 15,
		["MaxLevel"] = 22,
		["Quests"] = {
			92401,
			92421,
			92422,
			95216
		},
		["MidQuests"] = {
			92415,
			95189,
			95195,
			95204,
			95250
		}
	},
	{
		["Zone"] = "The Barrens",
		["Name"] = "Wailing Caverns",
		["MinLevel"] = 15,
		["MaxLevel"] = 24,
		["Quests"] = {
			914,
			959,
			962,
			1486,
			1487,
			1491
		},
		["MidQuests"] = {
			6981
		}
	},
	{
		["Zone"] = "Westfall",
		["Name"] = "The Deadmines",
		["MinLevel"] = 17,
		["MaxLevel"] = 26,
		["Quests"] = {
			166,
			167,
			168,
			214,
			2040,
			92753
		},
		["MidQuests"] = {
			373
		}
	},
	{
		["Zone"] = "Silverpine Forest",
		["Name"] = "Shadowfang Keep",
		["MinLevel"] = 20,
		["MaxLevel"] = 30,
		["Quests"] = {
			1013,
			1014,
			1098
		},
		["MidQuests"] = {
		}
	},
	{
		["Zone"] = "Stormwind City",
		["IntendedFor"] = "Alliance",
		["Name"] = "The Stockade",
		["MinLevel"] = 22, -- TODO: Needs Verifying
		["MaxLevel"] = 30, -- TODO: Needs Verifying
		["Quests"] = {
			377,
			378,
			386,
			387,
			388,
			391
		},
		["MidQuests"] = {
		}
	},
	{
		["Zone"] = "Wetlands",
		["Name"] = "Excavation Site: Wetlands",
		["MinLevel"] = 24, -- TODO: Needs Verifying
		["MaxLevel"] = 29, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO
		},
		["MidQuests"] = {
			-- TODO
		}
	},
	{
		["Zone"] = "Ashenvale",
		["Name"] = "Blackfathom Deeps",
		["MinLevel"] = 24, -- TODO: Needs Verifying
		["MaxLevel"] = 32, -- TODO: Needs Verifying
		["Quests"] = {
			971,
			1198,
			1199,
			1275,
			6563,
			6921
		},
		["MidQuests"] = {
			1200,
			6561,
			6565,
			6922
		}
	},
	{
		["Zone"] = "Alterac Mountains",
		["Name"] = "City of Dalaran",
		["MinLevel"] = 28, -- TODO: Needs Verifying
		["MaxLevel"] = 33, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO
		},
		["MidQuests"] = {
			-- TODO
		}
	},
	{
		["Zone"] = "Tirisfal Glades",
		["Name"] = "Scarlet Monastery: Graveyard",
		["MinLevel"] = 28, -- TODO: Needs Verifying
		["MaxLevel"] = 38, -- TODO: Needs Verifying
		["Quests"] = {
			1113
		},
		["MidQuests"] = {
			1051
		}
	},
	{
		["Zone"] = "Dun Morogh",
		["Name"] = "Gnomeregan",
		["MinLevel"] = 29, -- TODO: Needs Verifying
		["MaxLevel"] = 38, -- TODO: Needs Verifying
		["Quests"] = {
			2841,
			2843,
			2922,
			2924,
			2928,
			2929,
			2930
		},
		["MidQuests"] = {
			2904,
			2945,
			2962
		}
	},
	{
		["Zone"] = "Tirisfal Glades",
		["Name"] = "Scarlet Monastery: Library",
		["MinLevel"] = 29, -- TODO: Needs Verifying
		["MaxLevel"] = 39, -- TODO: Needs Verifying
		["Quests"] = {
			1048,
			1049,
			1050,
			1053,
			1113,
			1160
		},
		["MidQuests"] = {
		}
	},
	{
		["Zone"] = "The Barrens",
		["Name"] = "Razorfen Kraul",
		["MinLevel"] = 30, -- TODO: Needs Verifying
		["MaxLevel"] = 40, -- TODO: Needs Verifying
		["Quests"] = {
			1101,
			1102,
			1109,
			1221
		},
		["MidQuests"] = {
			1142,
			1144,
			6522
		}
	},
	{
		["Zone"] = "Tirisfal Glades",
		["Name"] = "Scarlet Monastery: Armory",
		["MinLevel"] = 32, -- TODO: Needs Verifying
		["MaxLevel"] = 42, -- TODO: Needs Verifying
		["Quests"] = {
			1048,
			1053,
			1113
		},
		["MidQuests"] = {
		}
	},
	{
		["Zone"] = "???",
		["Name"] = "The Drowned City",
		["MinLevel"] = 35, -- TODO: Needs Verifying
		["MaxLevel"] = 40, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO
		},
		["MidQuests"] = {
			-- TODO
		}
	},
	{
		["Zone"] = "Tirisfal Glades",
		["Name"] = "Scarlet Monastery: Cathedral",
		["MinLevel"] = 35, -- TODO: Needs Verifying
		["MaxLevel"] = 45, -- TODO: Needs Verifying
		["Quests"] = {
			1048,
			1053,
			1113
		},
		["MidQuests"] = {
		}
	},
	{
		["Zone"] = "Riverglades",
		["Name"] = "Krol'dok Stronghold",
		["MinLevel"] = 40, -- TODO: Needs Verifying
		["MaxLevel"] = 45, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO
		},
		["MidQuests"] = {
			-- TODO
		}
	},
	{
		["Zone"] = "The Barrens",
		["Name"] = "Razorfen Downs",
		["MinLevel"] = 40, -- TODO: Needs Verifying
		["MaxLevel"] = 50, -- TODO: Needs Verifying
		["Quests"] = {
			3341,
			3636,
			6522,
			6626
		},
		["MidQuests"] = {
			3523,
			3525
		}
	},
	{
		["Zone"] = "Badlands",
		["Name"] = "Uldaman",
		["MinLevel"] = 42, -- TODO: Needs Verifying
		["MaxLevel"] = 52, -- TODO: Needs Verifying
		["Quests"] = {
			17,
			704,
			709,
			721,
			1139,
			1360,
			2200,
			2202,
			2283,
			2284,
			2340,
			2342,
			2398,
			2418
		},
		["MidQuests"] = {
			722,
			723,
			2198,
			2201,
			2204,
			2240,
			2278
		}
	},
	{
		["Zone"] = "Tanaris",
		["Name"] = "Zul'Farrak",
		["MinLevel"] = 44, -- TODO: Needs Verifying
		["MaxLevel"] = 54, -- TODO: Needs Verifying
		["Quests"] = {
			2770,
			2846,
			2865,
			2937,
			2991,
			3042,
			3527
		},
		["MidQuests"] = {
		}
	},
	{
		["Zone"] = "Desolace",
		["Name"] = "Maraudon",
		["MinLevel"] = 45, -- TODO: Needs Verifying
		["MaxLevel"] = 57, -- TODO: Needs Verifying
		["Quests"] = {
			7028,
			7029,
			7041,
			7064,
			7065,
			7067,
			7068,
			7070
		},
		["MidQuests"] = {
			7044,
			7046,
			7066
		}
	},
	{
		["Zone"] = "Dustwallow Marsh",
		["Name"] = "Alcaz Prison",
		["MinLevel"] = 48, -- TODO: Needs Verifying
		["MaxLevel"] = 53, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO
		},
		["MidQuests"] = {
			-- TODO
		}
	},
	{
		["Zone"] = "Swamp of Sorrows",
		["Name"] = "The Temple of Atal'Hakkar",
		["MinLevel"] = 50, -- TODO: Needs Verifying
		["MaxLevel"] = 59, -- TODO: Needs Verifying
		["Quests"] = {
			1445,
			1446,
			1475,
			3446,
			3447,
			3528,
			4143,
			4146
		},
		["MidQuests"] = {
			3373
		}
	},
	{
		["Zone"] = "Searing Gorge",
		["Name"] = "Blackrock Depths",
		["MinLevel"] = 52, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	},
	{
		["Zone"] = "Searing Gorge",
		["Name"] = "Lower Blackrock Spire",
		["MinLevel"] = 55, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	},
	{
		["Zone"] = "???",
		["Name"] = "Blackmaw Hold",
		["MinLevel"] = 55, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	},
	{
		["Zone"] = "Feralas",
		["Name"] = "Dire Maul: East Gate",
		["MinLevel"] = 58, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	},
	{
		["Zone"] = "Feralas",
		["Name"] = "Dire Maul: West Gate",
		["MinLevel"] = 58, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	},
	{
		["Zone"] = "Feralas",
		["Name"] = "Dire Maul: North Gate",
		["MinLevel"] = 58, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	},
	{
		["Zone"] = "Western Plaguelands",
		["Name"] = "Scholomance",
		["MinLevel"] = 58, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	},
	{
		["Zone"] = "Eastern Plaguelands",
		["Name"] = "Stratholme: Living Quarter",
		["MinLevel"] = 58, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	},
	{
		["Zone"] = "Eastern Plaguelands",
		["Name"] = "Stratholme: Dead Quarter",
		["MinLevel"] = 58, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO
		},
		["MidQuests"] = {
			-- TODO
		}
	},
	{
		["Zone"] = "Un'Goro Crater",
		["Name"] = "Shaper's Terrace",
		["MinLevel"] = 58, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	},
	{
		["Zone"] = "Searing Gorge",
		["Name"] = "Upper Blackrock Spire",
		["MinLevel"] = 58, -- TODO: Needs Verifying
		["MaxLevel"] = 60, -- TODO: Needs Verifying
		["Quests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		},
		["MidQuests"] = {
			-- TODO: Do we care about quests for endgame dungeons?
		}
	}
}
