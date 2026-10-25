local _, Frogtome = ...
if not Frogtome.Data then
	Frogtome.Data = {}
end
Frogtome.Data.QuestData = {}

local QuestData = Frogtome.Data.QuestData

QuestData.Quests = {
	[2] = {
		["ID"] = 2,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sharptalon's Claw",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5] = {
		["ID"] = 5,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Jitters' Growling Gut",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6] = {
		["ID"] = 6,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bounty on Garrick Padfoot",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 340,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7] = {
		["ID"] = 7,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Kobold Camp Cleanup",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 170,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[9] = {
		["ID"] = 9,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Killing Fields",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[10] = {
		["ID"] = 10,
		["FactionRestriction"] = nil,
		["Name"] = "The Scrimshank Rdemption",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[11] = {
		["ID"] = 11,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Riverpaw Gnoll Bounty",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[12] = {
		["ID"] = 12,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The People's Militia",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[13] = {
		["ID"] = 13,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The People's Militia",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[14] = {
		["ID"] = 14,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The People's Militia",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[15] = {
		["ID"] = 15,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Investigate Echo Ridge",
		["Zone"] = nil,
		["Level"] = 3,
		["XP"] = 250,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[17] = {
		["ID"] = 17,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Uldaman Reagent Run",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2500
		},
		["LinkedQuests"] = {
		}
	},
	[18] = {
		["ID"] = 18,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Brotherhood of Thieves",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 360,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[19] = {
		["ID"] = 19,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tharil'zun",
		["Zone"] = nil,
		["Level"] = 25,
		["XP"] = 2550,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[20] = {
		["ID"] = 20,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Blackrock Menace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[21] = {
		["ID"] = 21,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Skirmish at Echo Ridge",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[22] = {
		["ID"] = 22,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Goretusk Liver Pie",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[23] = {
		["ID"] = 23,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ursangous's Paw",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[24] = {
		["ID"] = 24,
		["FactionRestriction"] = "Horde",
		["Name"] = "Shadumbra's Head",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[25] = {
		["ID"] = 25,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stonetalon Standstill",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[32] = {
		["ID"] = 32,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rise of the Silithid",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[33] = {
		["ID"] = 33,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Wolves Across the Border",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 170,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[34] = {
		["ID"] = 34,
		["FactionRestriction"] = "Alliance",
		["Name"] = "An Unwelcome Guest",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[35] = {
		["ID"] = 35,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Further Concerns",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 420,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[38] = {
		["ID"] = 38,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Westfall Stew",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[39] = {
		["ID"] = 39,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Deliver Thomas' Report",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[40] = {
		["ID"] = 40,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Fishy Peril",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 85,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[46] = {
		["ID"] = 46,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bounty on Murlocs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[47] = {
		["ID"] = 47,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gold Dust Exchange",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[52] = {
		["ID"] = 52,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Protect the Frontier",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[54] = {
		["ID"] = 54,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Report to Goldshire",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 230,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[55] = {
		["ID"] = 55,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Morbent Fel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[56] = {
		["ID"] = 56,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Night Watch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[57] = {
		["ID"] = 57,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Night Watch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[58] = {
		["ID"] = 58,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Night Watch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[60] = {
		["ID"] = 60,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Kobold Candles",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 480,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[62] = {
		["ID"] = 62,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Fargodeep Mine",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 480,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[64] = {
		["ID"] = 64,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Forgotten Heirloom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[65] = {
		["ID"] = 65,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Defias Brotherhood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[66] = {
		["ID"] = 66,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[67] = {
		["ID"] = 67,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			66
		},
		["LinkedQuests"] = {
		}
	},
	[68] = {
		["ID"] = 68,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			67
		},
		["LinkedQuests"] = {
		}
	},
	[69] = {
		["ID"] = 69,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			68
		},
		["LinkedQuests"] = {
		}
	},
	[70] = {
		["ID"] = 70,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			69
		},
		["LinkedQuests"] = {
		}
	},
	[72] = {
		["ID"] = 72,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			70
		},
		["LinkedQuests"] = {
		}
	},
	[74] = {
		["ID"] = 74,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			72
		},
		["LinkedQuests"] = {
		}
	},
	[75] = {
		["ID"] = 75,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			74
		},
		["LinkedQuests"] = {
		}
	},
	[76] = {
		["ID"] = 76,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Jasperlode Mine",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[77] = {
		["ID"] = 77,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Sticky Situation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[78] = {
		["ID"] = 78,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			75
		},
		["LinkedQuests"] = {
		}
	},
	[79] = {
		["ID"] = 79,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			78
		},
		["LinkedQuests"] = {
		}
	},
	[80] = {
		["ID"] = 80,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			79
		},
		["LinkedQuests"] = {
		}
	},
	[82] = {
		["ID"] = 82,
		["FactionRestriction"] = nil,
		["Name"] = "Noxious Lair Investigation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[83] = {
		["ID"] = 83,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Red Linen Goods",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86] = {
		["ID"] = 86,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Pie for Billy",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[87] = {
		["ID"] = 87,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Goldtooth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[88] = {
		["ID"] = 88,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Princess Must Die!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[89] = {
		["ID"] = 89,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Everstill Bridge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[90] = {
		["ID"] = 90,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Seasoned Wolf Kabobs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91] = {
		["ID"] = 91,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Solomon's Law",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92] = {
		["ID"] = 92,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Redridge Goulash",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93] = {
		["ID"] = 93,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Dusty Crab Cakes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94] = {
		["ID"] = 94,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Watchful Eye",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95] = {
		["ID"] = 95,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Sven's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97] = {
		["ID"] = 97,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			80
		},
		["LinkedQuests"] = {
		}
	},
	[98] = {
		["ID"] = 98,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Legend of Stalvan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			97
		},
		["LinkedQuests"] = {
		}
	},
	[99] = {
		["ID"] = 99,
		["FactionRestriction"] = "Horde",
		["Name"] = "Arugal's Folly",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[101] = {
		["ID"] = 101,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Totem of Infliction",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[102] = {
		["ID"] = 102,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Patrolling Westfall",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[103] = {
		["ID"] = 103,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Keeper of the Flame",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[104] = {
		["ID"] = 104,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Coastal Menace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[112] = {
		["ID"] = 112,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Collecting Kelp",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[115] = {
		["ID"] = 115,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Shadow Magic",
		["Zone"] = nil,
		["Level"] = 23,
		["XP"] = 2300,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[118] = {
		["ID"] = 118,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Price of Shoes",
		["Zone"] = nil,
		["Level"] = 18,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[120] = {
		["ID"] = 120,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Messenger to Stormwind",
		["Zone"] = nil,
		["Level"] = 14,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[122] = {
		["ID"] = 122,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Underbelly Scales",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[123] = {
		["ID"] = 123,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Collector",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[124] = {
		["ID"] = 124,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Baying of Gnolls",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[125] = {
		["ID"] = 125,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Lost Tools",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[126] = {
		["ID"] = 126,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Howling in the Hills",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[127] = {
		["ID"] = 127,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Selling Fish",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[128] = {
		["ID"] = 128,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Blackrock Bounty",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[129] = {
		["ID"] = 129,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Free Lunch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[132] = {
		["ID"] = 132,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Defias Brotherhood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			65
		},
		["LinkedQuests"] = {
		}
	},
	[133] = {
		["ID"] = 133,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ghoulish Effigy",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[134] = {
		["ID"] = 134,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Orge Thieves",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[135] = {
		["ID"] = 135,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Defias Brotherhood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			132
		},
		["LinkedQuests"] = {
		}
	},
	[136] = {
		["ID"] = 136,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Captain Sander's Hidden Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[138] = {
		["ID"] = 138,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Captain Sander's Hidden Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[139] = {
		["ID"] = 139,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Captain Sander's Hidden Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[140] = {
		["ID"] = 140,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Captain Sander's Hidden Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[141] = {
		["ID"] = 141,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Defias Brotherhood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			135
		},
		["LinkedQuests"] = {
		}
	},
	[142] = {
		["ID"] = 142,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Defias Brotherhood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			141
		},
		["LinkedQuests"] = {
		}
	},
	[147] = {
		["ID"] = 147,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Manhunt",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[149] = {
		["ID"] = 149,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ghost Hair Thread",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[150] = {
		["ID"] = 150,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Murloc Poachers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[151] = {
		["ID"] = 151,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Poor Old Blanchy",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[152] = {
		["ID"] = 152,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Coast Isn't Clear",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[153] = {
		["ID"] = 153,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Red Leather Bandanas",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[155] = {
		["ID"] = 155,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Defias Brotherhood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			142
		},
		["LinkedQuests"] = {
		}
	},
	[156] = {
		["ID"] = 156,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gather Rot Blossoms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[157] = {
		["ID"] = 157,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Deliver the Thread",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[159] = {
		["ID"] = 159,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Juice Delivery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[161] = {
		["ID"] = 161,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Dark Threat Looms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[162] = {
		["ID"] = 162,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rise of the Silithid",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[163] = {
		["ID"] = 163,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raven Hill",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[164] = {
		["ID"] = 164,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Deliveries to Sven",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[165] = {
		["ID"] = 165,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Hermit",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[166] = {
		["ID"] = 166,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Defias Brotherhood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			155
		},
		["LinkedQuests"] = {
		}
	},
	[167] = {
		["ID"] = 167,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Oh Brother...",
		["Zone"] = nil,
		["Level"] = 20,
		["XP"] = 1550,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[168] = {
		["ID"] = 168,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Collecting Memories",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[169] = {
		["ID"] = 169,
		["FactionRestriction"] = "Alliance",
		["Name"] = "WANTED: Gath'Ilzogg",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[170] = {
		["ID"] = 170,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A New Threat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[173] = {
		["ID"] = 173,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Worgen in the Woods",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[174] = {
		["ID"] = 174,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Look to the Stars",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[175] = {
		["ID"] = 175,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Look to the Stars",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[176] = {
		["ID"] = 176,
		["FactionRestriction"] = "Alliance",
		["Name"] = "WANTED: \"Hogger\"",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[177] = {
		["ID"] = 177,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Look to the Stars",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[178] = {
		["ID"] = 178,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Theicrutys' Retrieval",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[179] = {
		["ID"] = 179,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Dwarven Outfitters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[180] = {
		["ID"] = 180,
		["FactionRestriction"] = "Alliance",
		["Name"] = "WANTED: Lieutenant Fangore",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[181] = {
		["ID"] = 181,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Look to the Stars",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[184] = {
		["ID"] = 184,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Furlbrow's Deed",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[185] = {
		["ID"] = 185,
		["FactionRestriction"] = nil,
		["Name"] = "Tiger Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[186] = {
		["ID"] = 186,
		["FactionRestriction"] = nil,
		["Name"] = "Tiger Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[187] = {
		["ID"] = 187,
		["FactionRestriction"] = nil,
		["Name"] = "Tiger Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[188] = {
		["ID"] = 188,
		["FactionRestriction"] = nil,
		["Name"] = "Tiger Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[189] = {
		["ID"] = 189,
		["FactionRestriction"] = nil,
		["Name"] = "Bloodscalp Ears",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[190] = {
		["ID"] = 190,
		["FactionRestriction"] = nil,
		["Name"] = "Panther Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[191] = {
		["ID"] = 191,
		["FactionRestriction"] = nil,
		["Name"] = "Panther Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[192] = {
		["ID"] = 192,
		["FactionRestriction"] = nil,
		["Name"] = "Panther Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[193] = {
		["ID"] = 193,
		["FactionRestriction"] = nil,
		["Name"] = "Panther Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[194] = {
		["ID"] = 194,
		["FactionRestriction"] = nil,
		["Name"] = "Raptor Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[195] = {
		["ID"] = 195,
		["FactionRestriction"] = nil,
		["Name"] = "Raptor Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[196] = {
		["ID"] = 196,
		["FactionRestriction"] = nil,
		["Name"] = "Raptor Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[197] = {
		["ID"] = 197,
		["FactionRestriction"] = nil,
		["Name"] = "Raptor Mastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[198] = {
		["ID"] = 198,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Supplies to Private Thorsen",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[199] = {
		["ID"] = 199,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Dark Threat Looms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[200] = {
		["ID"] = 200,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bookie Herod",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[202] = {
		["ID"] = 202,
		["FactionRestriction"] = nil,
		["Name"] = "Colonel Kurzen",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[203] = {
		["ID"] = 203,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Second Rebellion",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[204] = {
		["ID"] = 204,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bad Medicine",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[205] = {
		["ID"] = 205,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Troll Witchery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[206] = {
		["ID"] = 206,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mai'Zoth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[207] = {
		["ID"] = 207,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Kurzen's Mystery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[208] = {
		["ID"] = 208,
		["FactionRestriction"] = nil,
		["Name"] = "Big Game Hunter",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[209] = {
		["ID"] = 209,
		["FactionRestriction"] = nil,
		["Name"] = "Skullsplitter Tusks",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[213] = {
		["ID"] = 213,
		["FactionRestriction"] = nil,
		["Name"] = "Hostile Takeover",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[214] = {
		["ID"] = 214,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Red Silk Bandanas",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			155
		},
		["LinkedQuests"] = {
		}
	},
	[215] = {
		["ID"] = 215,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Jungle Secrets",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[216] = {
		["ID"] = 216,
		["FactionRestriction"] = "Horde",
		["Name"] = "Between a Rock and a Thistlefur",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[217] = {
		["ID"] = 217,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In Defense of the King's Lands",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[218] = {
		["ID"] = 218,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Stolen Journal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[219] = {
		["ID"] = 219,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Missing in Action",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[221] = {
		["ID"] = 221,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Worgen in the Woods",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[222] = {
		["ID"] = 222,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Worgen in the Woods",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[223] = {
		["ID"] = 223,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Worgen in the Woods",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[224] = {
		["ID"] = 224,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In Defense of the King's Lands",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[226] = {
		["ID"] = 226,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Wolves at Our Heels",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[228] = {
		["ID"] = 228,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mor'Ladim",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[230] = {
		["ID"] = 230,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Sven's Camp",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[231] = {
		["ID"] = 231,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Daughter's Love",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[233] = {
		["ID"] = 233,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Coldridge Valley Mail Delivery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[234] = {
		["ID"] = 234,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Coldridge Valley Mail Delivery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[237] = {
		["ID"] = 237,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In Defense of the King's Lands",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[240] = {
		["ID"] = 240,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Jitters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[245] = {
		["ID"] = 245,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Eight-Legged Menaces",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[246] = {
		["ID"] = 246,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Assessing the Threat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[247] = {
		["ID"] = 247,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Hunt Completed",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[248] = {
		["ID"] = 248,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Looking Further",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[249] = {
		["ID"] = 249,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Morganth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[250] = {
		["ID"] = 250,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Dark Threat Looms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[253] = {
		["ID"] = 253,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bride of the Embalmer",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[255] = {
		["ID"] = 255,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mercenaries",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[256] = {
		["ID"] = 256,
		["FactionRestriction"] = "Alliance",
		["Name"] = "WANTED: Chok'sul",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[257] = {
		["ID"] = 257,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Hunter's Boast",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[258] = {
		["ID"] = 258,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Hunter's Challenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[261] = {
		["ID"] = 261,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Down the Scarlet Path",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			6141
		},
		["LinkedQuests"] = {
		}
	},
	[263] = {
		["ID"] = 263,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In Defense of the King's Lands",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[267] = {
		["ID"] = 267,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Trogg Threat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[271] = {
		["ID"] = 271,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Vyrin's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[274] = {
		["ID"] = 274,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Dark Threat Looms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[275] = {
		["ID"] = 275,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Blisters on the Land",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[276] = {
		["ID"] = 276,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tramping Paws",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[277] = {
		["ID"] = 277,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Fire Taboo",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[278] = {
		["ID"] = 278,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Dark Threat Looms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[279] = {
		["ID"] = 279,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Claws from the Deep",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[280] = {
		["ID"] = 280,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Dark Threat Looms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[281] = {
		["ID"] = 281,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reclaiming Goods",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[283] = {
		["ID"] = 283,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Dark Threat Looms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[284] = {
		["ID"] = 284,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Search Continues",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[285] = {
		["ID"] = 285,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Search More Hovels",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[286] = {
		["ID"] = 286,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return the Statuette",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[287] = {
		["ID"] = 287,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Frostmane Hold",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[289] = {
		["ID"] = 289,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Cursed Crew",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[290] = {
		["ID"] = 290,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Lifting the Curse",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[292] = {
		["ID"] = 292,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Eye of Paleth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[293] = {
		["ID"] = 293,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Cleansing the Eye",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[294] = {
		["ID"] = 294,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ormer's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[295] = {
		["ID"] = 295,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ormer's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[296] = {
		["ID"] = 296,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ormer's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[297] = {
		["ID"] = 297,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gathering Idols",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[299] = {
		["ID"] = 299,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Uncovering the Past",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[303] = {
		["ID"] = 303,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Dark Iron War",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[304] = {
		["ID"] = 304,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Grim Task",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[305] = {
		["ID"] = 305,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In Search of the Excavation Team",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[306] = {
		["ID"] = 306,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In Search of the Excavation Team",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[307] = {
		["ID"] = 307,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Filthy Paws",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[309] = {
		["ID"] = 309,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Protecting the Shipment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[310] = {
		["ID"] = 310,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bitter Rivals",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[311] = {
		["ID"] = 311,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Marleth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[312] = {
		["ID"] = 312,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tundra MacGrann's Stolen Stash",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[314] = {
		["ID"] = 314,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Protecting the Herd",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[317] = {
		["ID"] = 317,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Stocking Jetsteam",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[318] = {
		["ID"] = 318,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Evershine",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[319] = {
		["ID"] = 319,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Favor for Evershine",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[320] = {
		["ID"] = 320,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Bellowfiz",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[322] = {
		["ID"] = 322,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Blessed Arm",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[323] = {
		["ID"] = 323,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Proving Your Worth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[325] = {
		["ID"] = 325,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Armed and Ready",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[328] = {
		["ID"] = 328,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Hidden Key",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[329] = {
		["ID"] = 329,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Spy Revealed!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[331] = {
		["ID"] = 331,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Report to Dren",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[337] = {
		["ID"] = 337,
		["FactionRestriction"] = "Alliance",
		["Name"] = "An Old History Book",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[338] = {
		["ID"] = 338,
		["FactionRestriction"] = nil,
		["Name"] = "The Green Hills of Stranglethorn",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[339] = {
		["ID"] = 339,
		["FactionRestriction"] = nil,
		["Name"] = "Chapter I",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[340] = {
		["ID"] = 340,
		["FactionRestriction"] = nil,
		["Name"] = "Chapter II",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[341] = {
		["ID"] = 341,
		["FactionRestriction"] = nil,
		["Name"] = "Chapter III",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[342] = {
		["ID"] = 342,
		["FactionRestriction"] = nil,
		["Name"] = "Chapter IV",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[348] = {
		["ID"] = 348,
		["FactionRestriction"] = nil,
		["Name"] = "Strangletorn Fever",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[351] = {
		["ID"] = 351,
		["FactionRestriction"] = nil,
		["Name"] = "Find OOX-17/TN!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[354] = {
		["ID"] = 354,
		["FactionRestriction"] = "Horde",
		["Name"] = "Deaths in the Family",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[356] = {
		["ID"] = 356,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rear Guard Patrol",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[357] = {
		["ID"] = 357,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Lich's Identity",
		["Zone"] = nil,
		["Level"] = 8,
		["XP"] = 525,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[358] = {
		["ID"] = 358,
		["FactionRestriction"] = "Horde",
		["Name"] = "Graverobbers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[361] = {
		["ID"] = 361,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Letter Undelivered",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[362] = {
		["ID"] = 362,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Haunted Mills",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[364] = {
		["ID"] = 364,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Mindless Ones",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[365] = {
		["ID"] = 365,
		["FactionRestriction"] = "Horde",
		["Name"] = "Fields of Grief",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[366] = {
		["ID"] = 366,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return the Book",
		["Zone"] = nil,
		["Level"] = 8,
		["XP"] = 350,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[367] = {
		["ID"] = 367,
		["FactionRestriction"] = "Horde",
		["Name"] = "A New Plague",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[368] = {
		["ID"] = 368,
		["FactionRestriction"] = "Horde",
		["Name"] = "A New Plague",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[369] = {
		["ID"] = 369,
		["FactionRestriction"] = "Horde",
		["Name"] = "A New Plague",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[370] = {
		["ID"] = 370,
		["FactionRestriction"] = "Horde",
		["Name"] = "At War With The Scarlet Crusade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[371] = {
		["ID"] = 371,
		["FactionRestriction"] = "Horde",
		["Name"] = "At War With The Scarlet Crusade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[372] = {
		["ID"] = 372,
		["FactionRestriction"] = "Horde",
		["Name"] = "At War With The Scarlet Crusade",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[373] = {
		["ID"] = 373,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Unsent Letter",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[374] = {
		["ID"] = 374,
		["FactionRestriction"] = "Horde",
		["Name"] = "Proof of Demise",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[375] = {
		["ID"] = 375,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Chill of Death",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[376] = {
		["ID"] = 376,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Damned",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 170,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[377] = {
		["ID"] = 377,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crime and Punishment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[378] = {
		["ID"] = 378,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Fury Runs Deep",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			303
		},
		["LinkedQuests"] = {
		}
	},
	[379] = {
		["ID"] = 379,
		["FactionRestriction"] = "Horde",
		["Name"] = "Slake That Thirst",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[380] = {
		["ID"] = 380,
		["FactionRestriction"] = "Horde",
		["Name"] = "Night Web's Hollow",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[381] = {
		["ID"] = 381,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Scarlet Crusade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[382] = {
		["ID"] = 382,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Red Messenger",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[384] = {
		["ID"] = 384,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beer Basted Boar Ribs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[385] = {
		["ID"] = 385,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crocolisk Hunting",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[386] = {
		["ID"] = 386,
		["FactionRestriction"] = "Alliance",
		["Name"] = "What Comes Around...",
		["Zone"] = nil,
		["Level"] = 25,
		["XP"] = 4200,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[387] = {
		["ID"] = 387,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Quell the Uprising",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[388] = {
		["ID"] = 388,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Color of Blood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[389] = {
		["ID"] = 389,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bazil Thredd",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			373
		},
		["LinkedQuests"] = {
		}
	},
	[391] = {
		["ID"] = 391,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Stockade Riots",
		["Zone"] = nil,
		["Level"] = 29,
		["XP"] = 4950,
		["PrereqQuests"] = {
			389
		},
		["LinkedQuests"] = {
		}
	},
	[398] = {
		["ID"] = 398,
		["FactionRestriction"] = "Horde",
		["Name"] = "WANTED: Maggot Eye",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[404] = {
		["ID"] = 404,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Putrid Task",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[407] = {
		["ID"] = 407,
		["FactionRestriction"] = "Horde",
		["Name"] = "Fields of Grief",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[408] = {
		["ID"] = 408,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Family Crypt",
		["Zone"] = nil,
		["Level"] = 13,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[409] = {
		["ID"] = 409,
		["FactionRestriction"] = "Horde",
		["Name"] = "Proving Allegiance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[411] = {
		["ID"] = 411,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Prodigal Lich Returns",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[412] = {
		["ID"] = 412,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Operation Recombobulation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[413] = {
		["ID"] = 413,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Shimmer Stout",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[416] = {
		["ID"] = 416,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rat Catching",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[417] = {
		["ID"] = 417,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Pilot's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[418] = {
		["ID"] = 418,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Thelsamar Blood Sausages",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[420] = {
		["ID"] = 420,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Senir's Observations",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 340,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[421] = {
		["ID"] = 421,
		["FactionRestriction"] = "Horde",
		["Name"] = "Prove Your Worth",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 850,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[422] = {
		["ID"] = 422,
		["FactionRestriction"] = "Horde",
		["Name"] = "Arugal's Folly",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[423] = {
		["ID"] = 423,
		["FactionRestriction"] = "Horde",
		["Name"] = "Arugal's Folly",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[424] = {
		["ID"] = 424,
		["FactionRestriction"] = "Horde",
		["Name"] = "Arugal's Folly",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[425] = {
		["ID"] = 425,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ivar the Foul",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[426] = {
		["ID"] = 426,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Mills Overrun",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[427] = {
		["ID"] = 427,
		["FactionRestriction"] = "Horde",
		["Name"] = "At War With The Scarlet Crusade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[429] = {
		["ID"] = 429,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wild Hearts",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 440,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[430] = {
		["ID"] = 430,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return to Quinn",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[433] = {
		["ID"] = 433,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Public Servant",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[435] = {
		["ID"] = 435,
		["FactionRestriction"] = "Horde",
		["Name"] = "Escorting Erland",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[437] = {
		["ID"] = 437,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Dead Fields",
		["Zone"] = nil,
		["Level"] = 14,
		["XP"] = 975,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[438] = {
		["ID"] = 438,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Decrepit Ferry",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[440] = {
		["ID"] = 440,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Engraved Ring",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[442] = {
		["ID"] = 442,
		["FactionRestriction"] = "Horde",
		["Name"] = "Assault on Fenris Isle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[443] = {
		["ID"] = 443,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rot Hide Ichor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[445] = {
		["ID"] = 445,
		["FactionRestriction"] = "Horde",
		["Name"] = "Delivery to Silverpine Forest",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[447] = {
		["ID"] = 447,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Recipe For Death",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[450] = {
		["ID"] = 450,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Recipe For Death",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[451] = {
		["ID"] = 451,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Recipe For Death",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[452] = {
		["ID"] = 452,
		["FactionRestriction"] = "Horde",
		["Name"] = "Pyrewood Ambush",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[453] = {
		["ID"] = 453,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Finding the Shadowy Figure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[456] = {
		["ID"] = 456,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Balance of Nature",
		["Zone"] = "Teldrassil",
		["Level"] = 2,
		["XP"] = 170,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[457] = {
		["ID"] = 457,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Balance of Nature",
		["Zone"] = "Teldrassil",
		["Level"] = 3,
		["XP"] = 250,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[458] = {
		["ID"] = 458,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Woodland Protector",
		["Zone"] = "Teldrassil",
		["Level"] = 1,
		["XP"] = 40,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[459] = {
		["ID"] = 459,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Woodland Protector",
		["Zone"] = "Teldrassil",
		["Level"] = 3,
		["XP"] = 250,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[460] = {
		["ID"] = 460,
		["FactionRestriction"] = "Horde",
		["Name"] = "Resting in Pieces",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[461] = {
		["ID"] = 461,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Hidden Niche",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[463] = {
		["ID"] = 463,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Greenwarden",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[464] = {
		["ID"] = 464,
		["FactionRestriction"] = "Alliance",
		["Name"] = "War Banners",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[465] = {
		["ID"] = 465,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Nek'rosh's Gambit",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[469] = {
		["ID"] = 469,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Daily Delivery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[470] = {
		["ID"] = 470,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Digging Through the Ooze",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[471] = {
		["ID"] = 471,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Apprentice's Duties",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[472] = {
		["ID"] = 472,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Fall of Dun Modr",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[474] = {
		["ID"] = 474,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Defeat Nek'rosh",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[475] = {
		["ID"] = 475,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Troubling Breeze",
		["Zone"] = "Teldrassil",
		["Level"] = 6,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[476] = {
		["ID"] = 476,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gnarlpine Corruption",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[477] = {
		["ID"] = 477,
		["FactionRestriction"] = "Horde",
		["Name"] = "Border Crossings",
		["Zone"] = nil,
		["Level"] = 14,
		["XP"] = 975,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[478] = {
		["ID"] = 478,
		["FactionRestriction"] = "Horde",
		["Name"] = "Maps and Runes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[479] = {
		["ID"] = 479,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ambermill Investigations",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[483] = {
		["ID"] = 483,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Relics of Wakening",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 775,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[484] = {
		["ID"] = 484,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Young Crocolisk Skins",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[485] = {
		["ID"] = 485,
		["FactionRestriction"] = nil,
		["Name"] = "Find OOX-09/HL!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[486] = {
		["ID"] = 486,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ursal the Mauler",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[487] = {
		["ID"] = 487,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Road to Darnassus",
		["Zone"] = "Teldrassil",
		["Level"] = 8,
		["XP"] = 700,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[488] = {
		["ID"] = 488,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Zenn's Bidding",
		["Zone"] = "Teldrassil",
		["Level"] = 5,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[489] = {
		["ID"] = 489,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Seek Redemption!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[490] = {
		["ID"] = 490,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bounty: Gnarlpine Furbolg",
		["Zone"] = nil,
		["Level"] = 8,
		["XP"] = 700,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[491] = {
		["ID"] = 491,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wand to Bethor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[492] = {
		["ID"] = 492,
		["FactionRestriction"] = "Horde",
		["Name"] = "A New Plague",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[494] = {
		["ID"] = 494,
		["FactionRestriction"] = "Horde",
		["Name"] = "Time to Strike",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[496] = {
		["ID"] = 496,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elixir of Suffering",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[498] = {
		["ID"] = 498,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Rescue",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[499] = {
		["ID"] = 499,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elixir of Suffering",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[500] = {
		["ID"] = 500,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crushridge Bounty",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[501] = {
		["ID"] = 501,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elixir of Pain",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[502] = {
		["ID"] = 502,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elixir of Pain",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[503] = {
		["ID"] = 503,
		["FactionRestriction"] = "Horde",
		["Name"] = "Gol'dir",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[504] = {
		["ID"] = 504,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crushridge Warmongers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[506] = {
		["ID"] = 506,
		["FactionRestriction"] = "Horde",
		["Name"] = "Blackmoore's Legacy",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[507] = {
		["ID"] = 507,
		["FactionRestriction"] = "Horde",
		["Name"] = "Lord Aliden Perenolde",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[508] = {
		["ID"] = 508,
		["FactionRestriction"] = "Horde",
		["Name"] = "Taretha's Gift",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[509] = {
		["ID"] = 509,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elixir of Agony",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[510] = {
		["ID"] = 510,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Foreboding Plans",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[511] = {
		["ID"] = 511,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Encrypted Letter",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[512] = {
		["ID"] = 512,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Noble Deaths",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[513] = {
		["ID"] = 513,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elixir of Agony",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[515] = {
		["ID"] = 515,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elixir of Agony",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[516] = {
		["ID"] = 516,
		["FactionRestriction"] = "Horde",
		["Name"] = "Beren's Peril",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[517] = {
		["ID"] = 517,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elixir of Agony",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[518] = {
		["ID"] = 518,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Crown of Will",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[519] = {
		["ID"] = 519,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Crown of Will",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[520] = {
		["ID"] = 520,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Crown of Will",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[521] = {
		["ID"] = 521,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Crown of Will",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[522] = {
		["ID"] = 522,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Assassin's Contract",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[523] = {
		["ID"] = 523,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Baron's Demise",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[524] = {
		["ID"] = 524,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elixir of Agony",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[525] = {
		["ID"] = 525,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Further Mysteries",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[527] = {
		["ID"] = 527,
		["FactionRestriction"] = "Horde",
		["Name"] = "Battle of Hillsbrad",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[528] = {
		["ID"] = 528,
		["FactionRestriction"] = "Horde",
		["Name"] = "Battle of Hillsbrad",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[529] = {
		["ID"] = 529,
		["FactionRestriction"] = "Horde",
		["Name"] = "Battle of Hillsbrad",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[531] = {
		["ID"] = 531,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Vyrin's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[532] = {
		["ID"] = 532,
		["FactionRestriction"] = "Horde",
		["Name"] = "Battle of Hillsbrad",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[533] = {
		["ID"] = 533,
		["FactionRestriction"] = "Horde",
		["Name"] = "Infiltration",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[536] = {
		["ID"] = 536,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Down the Coast",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[537] = {
		["ID"] = 537,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Dark Council",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[539] = {
		["ID"] = 539,
		["FactionRestriction"] = "Horde",
		["Name"] = "Battle of Hillsbrad",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[540] = {
		["ID"] = 540,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Preserving Knowledge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[541] = {
		["ID"] = 541,
		["FactionRestriction"] = "Horde",
		["Name"] = "Battle of Hillsbrad",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[542] = {
		["ID"] = 542,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Milton",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[544] = {
		["ID"] = 544,
		["FactionRestriction"] = "Horde",
		["Name"] = "Prison Break In",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[545] = {
		["ID"] = 545,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dalaran Patrols",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[546] = {
		["ID"] = 546,
		["FactionRestriction"] = "Horde",
		["Name"] = "Souvenirs of Death",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[547] = {
		["ID"] = 547,
		["FactionRestriction"] = "Horde",
		["Name"] = "Humbert's Sword",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[549] = {
		["ID"] = 549,
		["FactionRestriction"] = "Horde",
		["Name"] = "WANTED: Syndicate Personnel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[550] = {
		["ID"] = 550,
		["FactionRestriction"] = "Horde",
		["Name"] = "Battle of Hillsbrad",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[552] = {
		["ID"] = 552,
		["FactionRestriction"] = "Horde",
		["Name"] = "Helcular's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[553] = {
		["ID"] = 553,
		["FactionRestriction"] = "Horde",
		["Name"] = "Helcular's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[555] = {
		["ID"] = 555,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Soothing Turtle Bisque",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[556] = {
		["ID"] = 556,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stone Tokens",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[557] = {
		["ID"] = 557,
		["FactionRestriction"] = "Horde",
		["Name"] = "Bracers of Binding",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[559] = {
		["ID"] = 559,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Farren's Proof",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[562] = {
		["ID"] = 562,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Stormwind Ho!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[563] = {
		["ID"] = 563,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reassignment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[564] = {
		["ID"] = 564,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Costly Menace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[565] = {
		["ID"] = 565,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bartolo's Yeti Fur Cloak",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[566] = {
		["ID"] = 566,
		["FactionRestriction"] = "Horde",
		["Name"] = "WANTED: Baron Vardus",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[567] = {
		["ID"] = 567,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dangerous!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[568] = {
		["ID"] = 568,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Defense of Grom'gol",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[569] = {
		["ID"] = 569,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Defense of Grom'gol",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[570] = {
		["ID"] = 570,
		["FactionRestriction"] = "Horde",
		["Name"] = "Mok'thardin's Enchantment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[571] = {
		["ID"] = 571,
		["FactionRestriction"] = "Horde",
		["Name"] = "Mok'thardin's Enchantment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[572] = {
		["ID"] = 572,
		["FactionRestriction"] = "Horde",
		["Name"] = "Mok'thardin's Enchantment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[573] = {
		["ID"] = 573,
		["FactionRestriction"] = "Horde",
		["Name"] = "Mok'thardin's Enchantment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[574] = {
		["ID"] = 574,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Special Forces",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[575] = {
		["ID"] = 575,
		["FactionRestriction"] = nil,
		["Name"] = "Supply and Demand",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[576] = {
		["ID"] = 576,
		["FactionRestriction"] = nil,
		["Name"] = "Keep An Eye Out",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[577] = {
		["ID"] = 577,
		["FactionRestriction"] = nil,
		["Name"] = "Some Assembly Required",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[578] = {
		["ID"] = 578,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Stone of the Tides",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[580] = {
		["ID"] = 580,
		["FactionRestriction"] = nil,
		["Name"] = "Whiskey Slim's Lost Grog",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[581] = {
		["ID"] = 581,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hunt for Yenniku",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[582] = {
		["ID"] = 582,
		["FactionRestriction"] = "Horde",
		["Name"] = "Headhunting",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[584] = {
		["ID"] = 584,
		["FactionRestriction"] = "Horde",
		["Name"] = "Bloodscalp Clan Heads",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[585] = {
		["ID"] = 585,
		["FactionRestriction"] = "Horde",
		["Name"] = "Speaking with Nezzliok",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[586] = {
		["ID"] = 586,
		["FactionRestriction"] = "Horde",
		["Name"] = "Speaking with Gan'zulah",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[587] = {
		["ID"] = 587,
		["FactionRestriction"] = nil,
		["Name"] = "Up to Snuff",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[589] = {
		["ID"] = 589,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Singing Crystals",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[591] = {
		["ID"] = 591,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Mind's Eye",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[592] = {
		["ID"] = 592,
		["FactionRestriction"] = "Horde",
		["Name"] = "Saving Yenniku",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[594] = {
		["ID"] = 594,
		["FactionRestriction"] = nil,
		["Name"] = "Message in a Bottle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[595] = {
		["ID"] = 595,
		["FactionRestriction"] = nil,
		["Name"] = "The Bloodsail Buccaneers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[596] = {
		["ID"] = 596,
		["FactionRestriction"] = "Horde",
		["Name"] = "Bloody Bone Necklaces",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[597] = {
		["ID"] = 597,
		["FactionRestriction"] = nil,
		["Name"] = "The Bloodsail Buccaneers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[598] = {
		["ID"] = 598,
		["FactionRestriction"] = "Horde",
		["Name"] = "Split Bone Necklace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[599] = {
		["ID"] = 599,
		["FactionRestriction"] = nil,
		["Name"] = "The Bloodsail Buccaneers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[600] = {
		["ID"] = 600,
		["FactionRestriction"] = nil,
		["Name"] = "Venture Company Mining",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[601] = {
		["ID"] = 601,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Water Elementals",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[604] = {
		["ID"] = 604,
		["FactionRestriction"] = nil,
		["Name"] = "The Bloodsail Buccaneers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[605] = {
		["ID"] = 605,
		["FactionRestriction"] = nil,
		["Name"] = "Singing Blue Shards",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[606] = {
		["ID"] = 606,
		["FactionRestriction"] = nil,
		["Name"] = "Scaring Shaky",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[607] = {
		["ID"] = 607,
		["FactionRestriction"] = nil,
		["Name"] = "Return to MacKinley",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[608] = {
		["ID"] = 608,
		["FactionRestriction"] = nil,
		["Name"] = "The Bloodsail Buccaneers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[609] = {
		["ID"] = 609,
		["FactionRestriction"] = nil,
		["Name"] = "Voodoo Dues",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[610] = {
		["ID"] = 610,
		["FactionRestriction"] = "Alliance",
		["Name"] = "\"Pretty Boy\" Duncan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[611] = {
		["ID"] = 611,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Curse of the Tides",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[613] = {
		["ID"] = 613,
		["FactionRestriction"] = nil,
		["Name"] = "Cracking Maury's Foot",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[614] = {
		["ID"] = 614,
		["FactionRestriction"] = nil,
		["Name"] = "The Captain's Chest",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[617] = {
		["ID"] = 617,
		["FactionRestriction"] = nil,
		["Name"] = "Akiris by the Bundle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[621] = {
		["ID"] = 621,
		["FactionRestriction"] = nil,
		["Name"] = "Zanzil's Secret",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[622] = {
		["ID"] = 622,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Corporal Kaleb",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[624] = {
		["ID"] = 624,
		["FactionRestriction"] = nil,
		["Name"] = "Cortello's Riddle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[625] = {
		["ID"] = 625,
		["FactionRestriction"] = nil,
		["Name"] = "Cortello's Riddle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[628] = {
		["ID"] = 628,
		["FactionRestriction"] = nil,
		["Name"] = "Excelsior",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[629] = {
		["ID"] = 629,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Vile Reef",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[630] = {
		["ID"] = 630,
		["FactionRestriction"] = nil,
		["Name"] = "Message in a Bottle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[631] = {
		["ID"] = 631,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Thandol Span",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[632] = {
		["ID"] = 632,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Thandol Span",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[633] = {
		["ID"] = 633,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Thandol Span",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[635] = {
		["ID"] = 635,
		["FactionRestriction"] = nil,
		["Name"] = "Crystal in the Mountains",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[639] = {
		["ID"] = 639,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sigil of Strom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[640] = {
		["ID"] = 640,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Broken Sigil",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[642] = {
		["ID"] = 642,
		["FactionRestriction"] = nil,
		["Name"] = "The Princess Trapped",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[643] = {
		["ID"] = 643,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sigil of Arathor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[644] = {
		["ID"] = 644,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sigil of Trollbane",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[645] = {
		["ID"] = 645,
		["FactionRestriction"] = "Horde",
		["Name"] = "Trol'kalar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[646] = {
		["ID"] = 646,
		["FactionRestriction"] = "Horde",
		["Name"] = "Trol'kalar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[647] = {
		["ID"] = 647,
		["FactionRestriction"] = "Alliance",
		["Name"] = "MacKreel's Moonshine",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[648] = {
		["ID"] = 648,
		["FactionRestriction"] = nil,
		["Name"] = "Rescue OOX-17/TN!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[651] = {
		["ID"] = 651,
		["FactionRestriction"] = nil,
		["Name"] = "Stones of Binding",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[652] = {
		["ID"] = 652,
		["FactionRestriction"] = nil,
		["Name"] = "Breaking the Keystone",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[654] = {
		["ID"] = 654,
		["FactionRestriction"] = "Horde",
		["Name"] = "Tanaris Field Sampling",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[656] = {
		["ID"] = 656,
		["FactionRestriction"] = nil,
		["Name"] = "Summoning the Princess",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[658] = {
		["ID"] = 658,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Hints of a New Plague?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[660] = {
		["ID"] = 660,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Hints of a New Plague?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[661] = {
		["ID"] = 661,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Hints of a New Plague?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[662] = {
		["ID"] = 662,
		["FactionRestriction"] = nil,
		["Name"] = "Deep Sea Salvage",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[664] = {
		["ID"] = 664,
		["FactionRestriction"] = nil,
		["Name"] = "Drowned Sorrowse",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[665] = {
		["ID"] = 665,
		["FactionRestriction"] = nil,
		["Name"] = "Sunken Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[666] = {
		["ID"] = 666,
		["FactionRestriction"] = nil,
		["Name"] = "Sunken Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[667] = {
		["ID"] = 667,
		["FactionRestriction"] = nil,
		["Name"] = "Death From Below",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[668] = {
		["ID"] = 668,
		["FactionRestriction"] = nil,
		["Name"] = "Sunken Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[669] = {
		["ID"] = 669,
		["FactionRestriction"] = nil,
		["Name"] = "Sunken Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[670] = {
		["ID"] = 670,
		["FactionRestriction"] = nil,
		["Name"] = "Sunken Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[671] = {
		["ID"] = 671,
		["FactionRestriction"] = "Horde",
		["Name"] = "Foul Magics",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[672] = {
		["ID"] = 672,
		["FactionRestriction"] = "Horde",
		["Name"] = "Raising Spirits",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[673] = {
		["ID"] = 673,
		["FactionRestriction"] = "Horde",
		["Name"] = "Foul Magics",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[676] = {
		["ID"] = 676,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Hammer May Fall",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[677] = {
		["ID"] = 677,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call to Arms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[678] = {
		["ID"] = 678,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call to Arms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[679] = {
		["ID"] = 679,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call to Arms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[680] = {
		["ID"] = 680,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Real Threat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[682] = {
		["ID"] = 682,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Stromgarde Badges",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[684] = {
		["ID"] = 684,
		["FactionRestriction"] = "Alliance",
		["Name"] = "WANTED: Marez Cowl",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[685] = {
		["ID"] = 685,
		["FactionRestriction"] = "Alliance",
		["Name"] = "WANTED: Otto and Falconrest",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[687] = {
		["ID"] = 687,
		["FactionRestriction"] = nil,
		["Name"] = "Theldurin the Lost",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[691] = {
		["ID"] = 691,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Worth Its Weight In Gold",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[692] = {
		["ID"] = 692,
		["FactionRestriction"] = nil,
		["Name"] = "The Lost Fragmente",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[693] = {
		["ID"] = 693,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Wand over Fist",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[694] = {
		["ID"] = 694,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Trelane's Defenses",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[696] = {
		["ID"] = 696,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Attack on the Tower",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[697] = {
		["ID"] = 697,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Malin's Request",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[699] = {
		["ID"] = 699,
		["FactionRestriction"] = "Horde",
		["Name"] = "Lack of Surplus",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[701] = {
		["ID"] = 701,
		["FactionRestriction"] = "Horde",
		["Name"] = "Guile of the Raptor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[702] = {
		["ID"] = 702,
		["FactionRestriction"] = "Horde",
		["Name"] = "Guile of the Raptor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[703] = {
		["ID"] = 703,
		["FactionRestriction"] = nil,
		["Name"] = "Barbecued Buzzard Wings",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[704] = {
		["ID"] = 704,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Agmond's Fate",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			739
		},
		["LinkedQuests"] = {
		}
	},
	[705] = {
		["ID"] = 705,
		["FactionRestriction"] = nil,
		["Name"] = "Pearl Diving",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[706] = {
		["ID"] = 706,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Fiery Blaze Enchantments",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[707] = {
		["ID"] = 707,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ironbrand Wants You!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[709] = {
		["ID"] = 709,
		["FactionRestriction"] = nil,
		["Name"] = "Solution to Doom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[710] = {
		["ID"] = 710,
		["FactionRestriction"] = nil,
		["Name"] = "Study of the Elements: Rock",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[711] = {
		["ID"] = 711,
		["FactionRestriction"] = nil,
		["Name"] = "Study of the Elements: Rock",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[712] = {
		["ID"] = 712,
		["FactionRestriction"] = nil,
		["Name"] = "Study of the Elements: Rock",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[713] = {
		["ID"] = 713,
		["FactionRestriction"] = nil,
		["Name"] = "Coolant Heads Prevail",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[714] = {
		["ID"] = 714,
		["FactionRestriction"] = nil,
		["Name"] = "Gyro... What?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[716] = {
		["ID"] = 716,
		["FactionRestriction"] = nil,
		["Name"] = "Stone Is Better than Cloth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[717] = {
		["ID"] = 717,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tremors of the Earth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[718] = {
		["ID"] = 718,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mirages",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[719] = {
		["ID"] = 719,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Dwarf and His Tools",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[720] = {
		["ID"] = 720,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Sign of Hope",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[721] = {
		["ID"] = 721,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Sign of Hope",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			720
		},
		["LinkedQuests"] = {
		}
	},
	[722] = {
		["ID"] = 722,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Amulet of Secrets",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			721
		},
		["LinkedQuests"] = {
		}
	},
	[723] = {
		["ID"] = 723,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Prospect of Faith",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			722
		},
		["LinkedQuests"] = {
		}
	},
	[724] = {
		["ID"] = 724,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Prospect of Faith",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			723
		},
		["LinkedQuests"] = {
		}
	},
	[725] = {
		["ID"] = 725,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Passing Word of a Threat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			724
		},
		["LinkedQuests"] = {
		}
	},
	[726] = {
		["ID"] = 726,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Passing Word of a Threat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			725
		},
		["LinkedQuests"] = {
		}
	},
	[729] = {
		["ID"] = 729,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Absent Minded Prospector",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[731] = {
		["ID"] = 731,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Absent Minded Prospector",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[732] = {
		["ID"] = 732,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tremors of the Earth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[733] = {
		["ID"] = 733,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Scrounging",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[735] = {
		["ID"] = 735,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Star, the Hand, and the Heart",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[737] = {
		["ID"] = 737,
		["FactionRestriction"] = nil,
		["Name"] = "Forbidden Knowledge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[738] = {
		["ID"] = 738,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Find Agmond",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			707
		},
		["LinkedQuests"] = {
		}
	},
	[739] = {
		["ID"] = 739,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Murdaloc",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			738
		},
		["LinkedQuests"] = {
		}
	},
	[741] = {
		["ID"] = 741,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Absent Minded Prospector",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[743] = {
		["ID"] = 743,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dangers of the Windfury",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[745] = {
		["ID"] = 745,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sharing the Land",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[746] = {
		["ID"] = 746,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dwarven Digging",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[747] = {
		["ID"] = 747,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Hunt Begins",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[748] = {
		["ID"] = 748,
		["FactionRestriction"] = "Horde",
		["Name"] = "Poison Water",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[749] = {
		["ID"] = 749,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Ravaged Caravan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[750] = {
		["ID"] = 750,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Hunt Continues",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[751] = {
		["ID"] = 751,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Ravaged Caravan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[753] = {
		["ID"] = 753,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Humble Task",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[754] = {
		["ID"] = 754,
		["FactionRestriction"] = "Horde",
		["Name"] = "Winterhoof Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[756] = {
		["ID"] = 756,
		["FactionRestriction"] = "Horde",
		["Name"] = "Thunderhorn Totem",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[757] = {
		["ID"] = 757,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rite of Strength",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[758] = {
		["ID"] = 758,
		["FactionRestriction"] = "Horde",
		["Name"] = "Thunderhorn Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[759] = {
		["ID"] = 759,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wildmane Totem",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[760] = {
		["ID"] = 760,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wildmane Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[761] = {
		["ID"] = 761,
		["FactionRestriction"] = "Horde",
		["Name"] = "Swoop Hunting",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[762] = {
		["ID"] = 762,
		["FactionRestriction"] = "Alliance",
		["Name"] = "An Ambassador of Evil",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			726
		},
		["LinkedQuests"] = {
		}
	},
	[764] = {
		["ID"] = 764,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Venture Co.",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[765] = {
		["ID"] = 765,
		["FactionRestriction"] = "Horde",
		["Name"] = "Supervisor Fizsprocket",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[766] = {
		["ID"] = 766,
		["FactionRestriction"] = "Horde",
		["Name"] = "Mazzranache",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[770] = {
		["ID"] = 770,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Demon Scarred Cloak",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[771] = {
		["ID"] = 771,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rite of Vision",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[772] = {
		["ID"] = 772,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rite of Vision",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[773] = {
		["ID"] = 773,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rite of Wisdom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[776] = {
		["ID"] = 776,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rites of the Earthmother",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[778] = {
		["ID"] = 778,
		["FactionRestriction"] = nil,
		["Name"] = "This Is Going to Be Hard",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[780] = {
		["ID"] = 780,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Battleboars",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[781] = {
		["ID"] = 781,
		["FactionRestriction"] = "Horde",
		["Name"] = "Attack on Camp Narache",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[782] = {
		["ID"] = 782,
		["FactionRestriction"] = "Horde",
		["Name"] = "Broken Alliances",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[783] = {
		["ID"] = 783,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Threat Within",
		["Zone"] = nil,
		["Level"] = 1,
		["XP"] = 40,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[784] = {
		["ID"] = 784,
		["FactionRestriction"] = "Horde",
		["Name"] = "Vanquish the Betrayers",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[786] = {
		["ID"] = 786,
		["FactionRestriction"] = "Horde",
		["Name"] = "Thwarting Kolkar Aggression",
		["Zone"] = nil,
		["Level"] = 8,
		["XP"] = 700,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[788] = {
		["ID"] = 788,
		["FactionRestriction"] = "Horde",
		["Name"] = "Cutting Teeth",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 170,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[789] = {
		["ID"] = 789,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sting of the Scorpid",
		["Zone"] = nil,
		["Level"] = 3,
		["XP"] = 250,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[790] = {
		["ID"] = 790,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sarkoth",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[791] = {
		["ID"] = 791,
		["FactionRestriction"] = "Horde",
		["Name"] = "Carry Your Weight",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[792] = {
		["ID"] = 792,
		["FactionRestriction"] = "Horde",
		["Name"] = "Vile Familiars",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
			1485
		}
	},
	[793] = {
		["ID"] = 793,
		["FactionRestriction"] = "Horde",
		["Name"] = "Broken Alliances",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[794] = {
		["ID"] = 794,
		["FactionRestriction"] = "Horde",
		["Name"] = "Burning Blade Medallion",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 675,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[804] = {
		["ID"] = 804,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sarkoth",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 110,
		["PrereqQuests"] = {
			790
		},
		["LinkedQuests"] = {
		}
	},
	[805] = {
		["ID"] = 805,
		["FactionRestriction"] = "Horde",
		["Name"] = "Report to Sen'jin Village",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 230,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[806] = {
		["ID"] = 806,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dark Storms",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[808] = {
		["ID"] = 808,
		["FactionRestriction"] = "Horde",
		["Name"] = "Minshina's Skull",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 775,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[809] = {
		["ID"] = 809,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ak'Zeloth",
		["Zone"] = nil,
		["Level"] = 13,
		["XP"] = 460,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[812] = {
		["ID"] = 812,
		["FactionRestriction"] = "Horde",
		["Name"] = "Need for a Cure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[815] = {
		["ID"] = 815,
		["FactionRestriction"] = "Horde",
		["Name"] = "Break a Few Eggs",
		["Zone"] = nil,
		["Level"] = 8,
		["XP"] = 700,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[816] = {
		["ID"] = 816,
		["FactionRestriction"] = "Horde",
		["Name"] = "Lost But Not Forgotten",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 875,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[817] = {
		["ID"] = 817,
		["FactionRestriction"] = "Horde",
		["Name"] = "Practical Prey",
		["Zone"] = nil,
		["Level"] = 8,
		["XP"] = 700,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[818] = {
		["ID"] = 818,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Solvent Spirit",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[819] = {
		["ID"] = 819,
		["FactionRestriction"] = "Horde",
		["Name"] = "Chen's Empty Keg",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 1050,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[821] = {
		["ID"] = 821,
		["FactionRestriction"] = "Horde",
		["Name"] = "Chen's Empty Keg",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 1350,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[822] = {
		["ID"] = 822,
		["FactionRestriction"] = "Horde",
		["Name"] = "Chen's Empty Keg",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[823] = {
		["ID"] = 823,
		["FactionRestriction"] = "Horde",
		["Name"] = "Report to Orgnil",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 320,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[824] = {
		["ID"] = 824,
		["FactionRestriction"] = "Horde",
		["Name"] = "Je'neu of the Earthen Ring",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[825] = {
		["ID"] = 825,
		["FactionRestriction"] = "Horde",
		["Name"] = "From The Wreckage....",
		["Zone"] = nil,
		["Level"] = 8,
		["XP"] = 700,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[826] = {
		["ID"] = 826,
		["FactionRestriction"] = "Horde",
		["Name"] = "Zalazane",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 850,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[827] = {
		["ID"] = 827,
		["FactionRestriction"] = "Horde",
		["Name"] = "Skull Rock",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[829] = {
		["ID"] = 829,
		["FactionRestriction"] = "Horde",
		["Name"] = "Neeru Fireblade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[830] = {
		["ID"] = 830,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Admiral's Orders",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[831] = {
		["ID"] = 831,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Admiral's Orders",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[832] = {
		["ID"] = 832,
		["FactionRestriction"] = "Horde",
		["Name"] = "Burning Shadows",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 675,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[833] = {
		["ID"] = 833,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Sacred Burial",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[834] = {
		["ID"] = 834,
		["FactionRestriction"] = "Horde",
		["Name"] = "Winds in the Desert",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 775,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[835] = {
		["ID"] = 835,
		["FactionRestriction"] = "Horde",
		["Name"] = "Securing the Lines",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 875,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[836] = {
		["ID"] = 836,
		["FactionRestriction"] = nil,
		["Name"] = "Rescue OOX-09/HL!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[837] = {
		["ID"] = 837,
		["FactionRestriction"] = "Horde",
		["Name"] = "Encroachment",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[840] = {
		["ID"] = 840,
		["FactionRestriction"] = "Horde",
		["Name"] = "Conscript of the Horde",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 460,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[842] = {
		["ID"] = 842,
		["FactionRestriction"] = "Horde",
		["Name"] = "Crossroads Conscription",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[843] = {
		["ID"] = 843,
		["FactionRestriction"] = "Horde",
		["Name"] = "Gann's Reclamation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[844] = {
		["ID"] = 844,
		["FactionRestriction"] = "Horde",
		["Name"] = "Plainstrider Menace",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[845] = {
		["ID"] = 845,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Zhevra",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[846] = {
		["ID"] = 846,
		["FactionRestriction"] = "Horde",
		["Name"] = "Revenge of Gann",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[847] = {
		["ID"] = 847,
		["FactionRestriction"] = "Horde",
		["Name"] = "Guile of the Raptor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[848] = {
		["ID"] = 848,
		["FactionRestriction"] = "Horde",
		["Name"] = "Fungal Spores",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 1050,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[849] = {
		["ID"] = 849,
		["FactionRestriction"] = "Horde",
		["Name"] = "Revenge of Gann",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[850] = {
		["ID"] = 850,
		["FactionRestriction"] = "Horde",
		["Name"] = "Kolkar Leaders",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[851] = {
		["ID"] = 851,
		["FactionRestriction"] = "Horde",
		["Name"] = "Verog the Dervish",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[852] = {
		["ID"] = 852,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hezrul Bloodmark",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[855] = {
		["ID"] = 855,
		["FactionRestriction"] = "Horde",
		["Name"] = "Centaur Bracers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[858] = {
		["ID"] = 858,
		["FactionRestriction"] = nil,
		["Name"] = "Ignition",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[861] = {
		["ID"] = 861,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Hunter's Way",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[862] = {
		["ID"] = 862,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dig Rat Stew",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[863] = {
		["ID"] = 863,
		["FactionRestriction"] = nil,
		["Name"] = "The Escape",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[865] = {
		["ID"] = 865,
		["FactionRestriction"] = nil,
		["Name"] = "Raptor Horns",
		["Zone"] = nil,
		["Level"] = 18,
		["XP"] = 1350,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[866] = {
		["ID"] = 866,
		["FactionRestriction"] = nil,
		["Name"] = "Root Samples",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[867] = {
		["ID"] = 867,
		["FactionRestriction"] = "Horde",
		["Name"] = "Harpy Raiders",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 1050,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[868] = {
		["ID"] = 868,
		["FactionRestriction"] = "Horde",
		["Name"] = "Egg Hunt",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[869] = {
		["ID"] = 869,
		["FactionRestriction"] = "Horde",
		["Name"] = "Raptor Thieves",
		["Zone"] = nil,
		["Level"] = 13,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[870] = {
		["ID"] = 870,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Forgotten Pools",
		["Zone"] = nil,
		["Level"] = 13,
		["XP"] = 675,
		["PrereqQuests"] = {
			886
		},
		["LinkedQuests"] = {
		}
	},
	[871] = {
		["ID"] = 871,
		["FactionRestriction"] = "Horde",
		["Name"] = "Disrupt the Attacks",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[872] = {
		["ID"] = 872,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Disruption Ends",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 1050,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[873] = {
		["ID"] = 873,
		["FactionRestriction"] = "Horde",
		["Name"] = "Isha Awak",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[875] = {
		["ID"] = 875,
		["FactionRestriction"] = "Horde",
		["Name"] = "Harpy Lieutenants",
		["Zone"] = nil,
		["Level"] = 16,
		["XP"] = 1150,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[876] = {
		["ID"] = 876,
		["FactionRestriction"] = "Horde",
		["Name"] = "Serena Bloodfeather",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[877] = {
		["ID"] = 877,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Stagnant Oasis",
		["Zone"] = nil,
		["Level"] = 16,
		["XP"] = 1150,
		["PrereqQuests"] = {
			870
		},
		["LinkedQuests"] = {
		}
	},
	[878] = {
		["ID"] = 878,
		["FactionRestriction"] = "Horde",
		["Name"] = "Tribes at War",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[879] = {
		["ID"] = 879,
		["FactionRestriction"] = "Horde",
		["Name"] = "Betrayal from Within",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[880] = {
		["ID"] = 880,
		["FactionRestriction"] = "Horde",
		["Name"] = "Altered Beings",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			877
		},
		["LinkedQuests"] = {
		}
	},
	[881] = {
		["ID"] = 881,
		["FactionRestriction"] = "Horde",
		["Name"] = "Echeyakee",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[882] = {
		["ID"] = 882,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ishamuhale",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[883] = {
		["ID"] = 883,
		["FactionRestriction"] = "Horde",
		["Name"] = "Lakota'mani",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[884] = {
		["ID"] = 884,
		["FactionRestriction"] = "Horde",
		["Name"] = "Owatanka",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[886] = {
		["ID"] = 886,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Barrens Oases",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[887] = {
		["ID"] = 887,
		["FactionRestriction"] = nil,
		["Name"] = "Southsea Freebooters",
		["Zone"] = nil,
		["Level"] = 14,
		["XP"] = 750,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[888] = {
		["ID"] = 888,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stolen Booty",
		["Zone"] = nil,
		["Level"] = 16,
		["XP"] = 1150,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[890] = {
		["ID"] = 890,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Missing Shipment",
		["Zone"] = nil,
		["Level"] = 14,
		["XP"] = 100,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[891] = {
		["ID"] = 891,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Guns of Northwatch",
		["Zone"] = nil,
		["Level"] = 20,
		["XP"] = 1550,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[892] = {
		["ID"] = 892,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Missing Shipment",
		["Zone"] = nil,
		["Level"] = 14,
		["XP"] = 100,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[893] = {
		["ID"] = 893,
		["FactionRestriction"] = "Horde",
		["Name"] = "Weapons of Choice",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[894] = {
		["ID"] = 894,
		["FactionRestriction"] = nil,
		["Name"] = "Samophlange",
		["Zone"] = nil,
		["Level"] = 14,
		["XP"] = 750,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[895] = {
		["ID"] = 895,
		["FactionRestriction"] = nil,
		["Name"] = "WANTED: Baron Longshore",
		["Zone"] = nil,
		["Level"] = 16,
		["XP"] = 1150,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[896] = {
		["ID"] = 896,
		["FactionRestriction"] = nil,
		["Name"] = "Miner's Fortune",
		["Zone"] = nil,
		["Level"] = 18,
		["XP"] = 1700,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[897] = {
		["ID"] = 897,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Harvester",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[898] = {
		["ID"] = 898,
		["FactionRestriction"] = "Horde",
		["Name"] = "Free From the Hold",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[899] = {
		["ID"] = 899,
		["FactionRestriction"] = "Horde",
		["Name"] = "Consumed by Hatred",
		["Zone"] = nil,
		["Level"] = 20,
		["XP"] = 1950,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[900] = {
		["ID"] = 900,
		["FactionRestriction"] = nil,
		["Name"] = "Samophlange",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[901] = {
		["ID"] = 901,
		["FactionRestriction"] = nil,
		["Name"] = "Samophlange",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[902] = {
		["ID"] = 902,
		["FactionRestriction"] = nil,
		["Name"] = "Samophlange",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[903] = {
		["ID"] = 903,
		["FactionRestriction"] = "Horde",
		["Name"] = "Prowlers of the Barrens",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[905] = {
		["ID"] = 905,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Angry Scytheclaws",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[906] = {
		["ID"] = 906,
		["FactionRestriction"] = "Horde",
		["Name"] = "Betrayal from Within",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[907] = {
		["ID"] = 907,
		["FactionRestriction"] = "Horde",
		["Name"] = "Enraged Thunder Lizards",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[913] = {
		["ID"] = 913,
		["FactionRestriction"] = "Horde",
		["Name"] = "Cry of the Thunderhawk",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[914] = {
		["ID"] = 914,
		["FactionRestriction"] = "Horde",
		["Name"] = "Leaders of the Fang",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1490
		},
		["LinkedQuests"] = {
		}
	},
	[916] = {
		["ID"] = 916,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Webwood Venom",
		["Zone"] = "Teldrassil",
		["Level"] = 4,
		["XP"] = 360,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[917] = {
		["ID"] = 917,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Webwood Egg",
		["Zone"] = "Teldrassil",
		["Level"] = 5,
		["XP"] = 550,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[918] = {
		["ID"] = 918,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Timberling Seeds",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[919] = {
		["ID"] = 919,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Timberling Sprouts",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[920] = {
		["ID"] = 920,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tenaron's Summons",
		["Zone"] = "Teldrassil",
		["Level"] = 5,
		["XP"] = 45,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[921] = {
		["ID"] = 921,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crown of the Earth",
		["Zone"] = "Teldrassil",
		["Level"] = 5,
		["XP"] = 340,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[922] = {
		["ID"] = 922,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rellian Greenspyre",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[923] = {
		["ID"] = 923,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tumors",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[927] = {
		["ID"] = 927,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Moss-twined Heart",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[928] = {
		["ID"] = 928,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crown of the Earth",
		["Zone"] = "Teldrassil",
		["Level"] = 5,
		["XP"] = 230,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[929] = {
		["ID"] = 929,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crown of the Earth",
		["Zone"] = "Teldrassil",
		["Level"] = 5,
		["XP"] = 340,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[930] = {
		["ID"] = 930,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Glowing Fruit",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[931] = {
		["ID"] = 931,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Shimmering Frond",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[932] = {
		["ID"] = 932,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Twisted Hatred",
		["Zone"] = "Teldrassil",
		["Level"] = 8,
		["XP"] = 700,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[933] = {
		["ID"] = 933,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crown of the Earth",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 775,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[934] = {
		["ID"] = 934,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crown of the Earth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[935] = {
		["ID"] = 935,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crown of the Earth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[937] = {
		["ID"] = 937,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Enchanted Glade",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 440,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[938] = {
		["ID"] = 938,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mist",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[939] = {
		["ID"] = 939,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Flute of Xavaric",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[940] = {
		["ID"] = 940,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Teldrassil",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[941] = {
		["ID"] = 941,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Planting the Heart",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[942] = {
		["ID"] = 942,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Absent Minded Prospector",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[943] = {
		["ID"] = 943,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Absent Minded Prospector",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[944] = {
		["ID"] = 944,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Master's Glaive",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[945] = {
		["ID"] = 945,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Therylune's Escape",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[947] = {
		["ID"] = 947,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Cave Mushrooms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[949] = {
		["ID"] = 949,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Twilight Camp",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[951] = {
		["ID"] = 951,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mathystra Relics",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[953] = {
		["ID"] = 953,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Fall of Ameth'Aran",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[955] = {
		["ID"] = 955,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bashal'Aran",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[956] = {
		["ID"] = 956,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bashal'Aran",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[957] = {
		["ID"] = 957,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bashal'Aran",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[958] = {
		["ID"] = 958,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tools of the Highborne",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[959] = {
		["ID"] = 959,
		["FactionRestriction"] = nil,
		["Name"] = "Trouble at the Docks",
		["Zone"] = nil,
		["Level"] = 18,
		["XP"] = 2650,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[962] = {
		["ID"] = 962,
		["FactionRestriction"] = "Horde",
		["Name"] = "Serpentbloom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[963] = {
		["ID"] = 963,
		["FactionRestriction"] = "Alliance",
		["Name"] = "For Love Eternal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[964] = {
		["ID"] = 964,
		["FactionRestriction"] = "Horde",
		["Name"] = "Skeletal Fragments",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[966] = {
		["ID"] = 966,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Tower of Althalaxx",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[967] = {
		["ID"] = 967,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Tower of Althalaxx",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[969] = {
		["ID"] = 969,
		["FactionRestriction"] = nil,
		["Name"] = "Luck Be With You",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[970] = {
		["ID"] = 970,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Tower of Althalaxx",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[971] = {
		["ID"] = 971,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Knowledge in the Deeps",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[973] = {
		["ID"] = 973,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Tower of Althalaxx",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[974] = {
		["ID"] = 974,
		["FactionRestriction"] = nil,
		["Name"] = "Finding the Source",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[976] = {
		["ID"] = 976,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Supplies to Auberdine",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[977] = {
		["ID"] = 977,
		["FactionRestriction"] = nil,
		["Name"] = "Are We There, Yeti?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[981] = {
		["ID"] = 981,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Tower of Althalaxx",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[982] = {
		["ID"] = 982,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Deep Ocean, Vast Sea",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[983] = {
		["ID"] = 983,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Buzzbox 827",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[984] = {
		["ID"] = 984,
		["FactionRestriction"] = "Alliance",
		["Name"] = "How Big a Threat?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[985] = {
		["ID"] = 985,
		["FactionRestriction"] = "Alliance",
		["Name"] = "How Big a Threat?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[986] = {
		["ID"] = 986,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Lost Master",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[991] = {
		["ID"] = 991,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[992] = {
		["ID"] = 992,
		["FactionRestriction"] = nil,
		["Name"] = "Gadgetzan Water Survey",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[993] = {
		["ID"] = 993,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Lost Master",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[994] = {
		["ID"] = 994,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Escape Through Force",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[995] = {
		["ID"] = 995,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Escape Through Stealth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[997] = {
		["ID"] = 997,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Denalan's Earth",
		["Zone"] = "Teldrassil",
		["Level"] = 5,
		["XP"] = 230,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1001] = {
		["ID"] = 1001,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Buzzbox 411",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1002] = {
		["ID"] = 1002,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Buzzbox 323",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1003] = {
		["ID"] = 1003,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Buzzbox 525",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1007] = {
		["ID"] = 1007,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Ancient Statuette",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1008] = {
		["ID"] = 1008,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Zoram Strand",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1009] = {
		["ID"] = 1009,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ruuzel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1010] = {
		["ID"] = 1010,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bathran's Hair",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1011] = {
		["ID"] = 1011,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Forsaken Diseases",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1012] = {
		["ID"] = 1012,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Insane Druids",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1013] = {
		["ID"] = 1013,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Book of Ur",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1014] = {
		["ID"] = 1014,
		["FactionRestriction"] = "Horde",
		["Name"] = "Arugal Must Die",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1016] = {
		["ID"] = 1016,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Elemental Bracers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1017] = {
		["ID"] = 1017,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mage Summoner",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1020] = {
		["ID"] = 1020,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Orendil's Cure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1021] = {
		["ID"] = 1021,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Vile Satyr! Dryads in Danger!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1022] = {
		["ID"] = 1022,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Howling Vale",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1023] = {
		["ID"] = 1023,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1024] = {
		["ID"] = 1024,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1025] = {
		["ID"] = 1025,
		["FactionRestriction"] = "Alliance",
		["Name"] = "An Aggressive Defense",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1026] = {
		["ID"] = 1026,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1027] = {
		["ID"] = 1027,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1028] = {
		["ID"] = 1028,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1029] = {
		["ID"] = 1029,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1030] = {
		["ID"] = 1030,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1031] = {
		["ID"] = 1031,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Branch of Cenarius",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1032] = {
		["ID"] = 1032,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Satyr Slaying!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1033] = {
		["ID"] = 1033,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Elune's Tear",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1034] = {
		["ID"] = 1034,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Ruins of Stardust",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1035] = {
		["ID"] = 1035,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Fallen Sky Lake",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1045] = {
		["ID"] = 1045,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1046] = {
		["ID"] = 1046,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1048] = {
		["ID"] = 1048,
		["FactionRestriction"] = "Horde",
		["Name"] = "Into The Scarlet Monastery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1049] = {
		["ID"] = 1049,
		["FactionRestriction"] = "Horde",
		["Name"] = "Compendium of the Fallen",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1050] = {
		["ID"] = 1050,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mythology of the Titans",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1051] = {
		["ID"] = 1051,
		["FactionRestriction"] = "Horde",
		["Name"] = "Vorrel's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1052] = {
		["ID"] = 1052,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Down the Scarlet Path",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			261
		},
		["LinkedQuests"] = {
		}
	},
	[1053] = {
		["ID"] = 1053,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In the Name of the Light",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1052
		},
		["LinkedQuests"] = {
		}
	},
	[1054] = {
		["ID"] = 1054,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Culling the Threat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1055] = {
		["ID"] = 1055,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raene's Cleansing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1057] = {
		["ID"] = 1057,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reclaiming the Charred Vale",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1058] = {
		["ID"] = 1058,
		["FactionRestriction"] = "Horde",
		["Name"] = "Jin'Zil's Forest Magic",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1060] = {
		["ID"] = 1060,
		["FactionRestriction"] = "Horde",
		["Name"] = "Letter to Jin'Zil",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1061] = {
		["ID"] = 1061,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Spirits of Stonetalon",
		["Zone"] = nil,
		["Level"] = 17,
		["XP"] = 320,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1062] = {
		["ID"] = 1062,
		["FactionRestriction"] = "Horde",
		["Name"] = "Goblin Invaders",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1066] = {
		["ID"] = 1066,
		["FactionRestriction"] = "Horde",
		["Name"] = "Blood of Innocents",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1068] = {
		["ID"] = 1068,
		["FactionRestriction"] = "Horde",
		["Name"] = "Shredding Machines",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1069] = {
		["ID"] = 1069,
		["FactionRestriction"] = nil,
		["Name"] = "Deepmoss Spider Eggs",
		["Zone"] = nil,
		["Level"] = 20,
		["XP"] = 1950,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1071] = {
		["ID"] = 1071,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Gnome's Respite",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1078] = {
		["ID"] = 1078,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Retrieval for Mauren",
		["Zone"] = nil,
		["Level"] = 26,
		["XP"] = 2100,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1080] = {
		["ID"] = 1080,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Covert Ops - Beta",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1081] = {
		["ID"] = 1081,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reception from Tyrande",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1083] = {
		["ID"] = 1083,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Enraged Spirits",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1084] = {
		["ID"] = 1084,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Wounded Ancients",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1087] = {
		["ID"] = 1087,
		["FactionRestriction"] = "Horde",
		["Name"] = "Cenarius' Legacy",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1088] = {
		["ID"] = 1088,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ordanus",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1089] = {
		["ID"] = 1089,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Den",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1090] = {
		["ID"] = 1090,
		["FactionRestriction"] = nil,
		["Name"] = "Gerenzo's Orders",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1092] = {
		["ID"] = 1092,
		["FactionRestriction"] = nil,
		["Name"] = "Gerenzo's Orders",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1093] = {
		["ID"] = 1093,
		["FactionRestriction"] = nil,
		["Name"] = "Super Reaver 6000",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1095] = {
		["ID"] = 1095,
		["FactionRestriction"] = nil,
		["Name"] = "Further Instructions",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1096] = {
		["ID"] = 1096,
		["FactionRestriction"] = nil,
		["Name"] = "Gerenzo Wrenchwhistle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1098] = {
		["ID"] = 1098,
		["FactionRestriction"] = "Horde",
		["Name"] = "Deathstalkers in Shadowfang",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1100] = {
		["ID"] = 1100,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Lonebrow's Journal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1101] = {
		["ID"] = 1101,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Crown of the Kraul",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1100
		},
		["LinkedQuests"] = {
		}
	},
	[1102] = {
		["ID"] = 1102,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Vengeful Fate",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1104] = {
		["ID"] = 1104,
		["FactionRestriction"] = nil,
		["Name"] = "Salt Flat Venom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1105] = {
		["ID"] = 1105,
		["FactionRestriction"] = nil,
		["Name"] = "Hardened Shells",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1107] = {
		["ID"] = 1107,
		["FactionRestriction"] = nil,
		["Name"] = "Encrusted Tail Fins",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1109] = {
		["ID"] = 1109,
		["FactionRestriction"] = "Horde",
		["Name"] = "Going, Going, Guano!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1110] = {
		["ID"] = 1110,
		["FactionRestriction"] = nil,
		["Name"] = "Rocket Car Parts",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1113] = {
		["ID"] = 1113,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hearts of Zeal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1109
		},
		["LinkedQuests"] = {
		}
	},
	[1119] = {
		["ID"] = 1119,
		["FactionRestriction"] = nil,
		["Name"] = "Zanzil's Mixture and a Fool's Stout",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1125] = {
		["ID"] = 1125,
		["FactionRestriction"] = nil,
		["Name"] = "The Spirits of Southwind",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1126] = {
		["ID"] = 1126,
		["FactionRestriction"] = nil,
		["Name"] = "Hive in the Tower",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1134] = {
		["ID"] = 1134,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Pridewings of Stonetalon",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1135] = {
		["ID"] = 1135,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Highperch Venom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1137] = {
		["ID"] = 1137,
		["FactionRestriction"] = nil,
		["Name"] = "News for Fizzle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1138] = {
		["ID"] = 1138,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Fruit of the Sea",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1139] = {
		["ID"] = 1139,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Lost Tablets of Will",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			762
		},
		["LinkedQuests"] = {
		}
	},
	[1142] = {
		["ID"] = 1142,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mortality Wanes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1143] = {
		["ID"] = 1143,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Tower of Althalaxx",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1144] = {
		["ID"] = 1144,
		["FactionRestriction"] = nil,
		["Name"] = "Willix the Importer",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1147] = {
		["ID"] = 1147,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Swarm Grows",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1148] = {
		["ID"] = 1148,
		["FactionRestriction"] = "Horde",
		["Name"] = "Parts of the Swarm",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1149] = {
		["ID"] = 1149,
		["FactionRestriction"] = "Horde",
		["Name"] = "Test of Faith",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1150] = {
		["ID"] = 1150,
		["FactionRestriction"] = "Horde",
		["Name"] = "Test of Endurance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1149
		},
		["LinkedQuests"] = {
		}
	},
	[1151] = {
		["ID"] = 1151,
		["FactionRestriction"] = "Horde",
		["Name"] = "Test of Faith",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1150
		},
		["LinkedQuests"] = {
		}
	},
	[1152] = {
		["ID"] = 1152,
		["FactionRestriction"] = "Horde",
		["Name"] = "Test of Lore",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1151
		},
		["LinkedQuests"] = {
		}
	},
	[1153] = {
		["ID"] = 1153,
		["FactionRestriction"] = "Horde",
		["Name"] = "A New Ore Sample",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1154] = {
		["ID"] = 1154,
		["FactionRestriction"] = "Horde",
		["Name"] = "Test of Lore",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1152
		},
		["LinkedQuests"] = {
		}
	},
	[1159] = {
		["ID"] = 1159,
		["FactionRestriction"] = "Horde",
		["Name"] = "Test of Lore",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			6627
		},
		["LinkedQuests"] = {
		}
	},
	[1160] = {
		["ID"] = 1160,
		["FactionRestriction"] = "Horde",
		["Name"] = "Test of Lore",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1159
		},
		["LinkedQuests"] = {
		}
	},
	[1166] = {
		["ID"] = 1166,
		["FactionRestriction"] = "Horde",
		["Name"] = "Overlord Mok'Morokk's Concern",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1168] = {
		["ID"] = 1168,
		["FactionRestriction"] = "Horde",
		["Name"] = "Army of the Black Dragon",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1169] = {
		["ID"] = 1169,
		["FactionRestriction"] = "Horde",
		["Name"] = "Identifying the Brood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1172] = {
		["ID"] = 1172,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Brood of Onyxia",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1173] = {
		["ID"] = 1173,
		["FactionRestriction"] = "Horde",
		["Name"] = "Challenge Overlord Mok'Morokk",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1175] = {
		["ID"] = 1175,
		["FactionRestriction"] = nil,
		["Name"] = "A Bump in the Road",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1176] = {
		["ID"] = 1176,
		["FactionRestriction"] = nil,
		["Name"] = "Load Lightening",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1178] = {
		["ID"] = 1178,
		["FactionRestriction"] = nil,
		["Name"] = "Goblin Sponsorship",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1176
		},
		["LinkedQuests"] = {
		}
	},
	[1179] = {
		["ID"] = 1179,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Brassbolts Brothers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1180] = {
		["ID"] = 1180,
		["FactionRestriction"] = nil,
		["Name"] = "Goblin Sponsorship",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1178
		},
		["LinkedQuests"] = {
		}
	},
	[1181] = {
		["ID"] = 1181,
		["FactionRestriction"] = nil,
		["Name"] = "Goblin Sponsorship",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1180
		},
		["LinkedQuests"] = {
		}
	},
	[1182] = {
		["ID"] = 1182,
		["FactionRestriction"] = nil,
		["Name"] = "Goblin Sponsorship",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1181
		},
		["LinkedQuests"] = {
		}
	},
	[1183] = {
		["ID"] = 1183,
		["FactionRestriction"] = nil,
		["Name"] = "Goblin Sponsorship",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1182
		},
		["LinkedQuests"] = {
		}
	},
	[1186] = {
		["ID"] = 1186,
		["FactionRestriction"] = nil,
		["Name"] = "The Eighteenth Pilot",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1183
		},
		["LinkedQuests"] = {
		}
	},
	[1187] = {
		["ID"] = 1187,
		["FactionRestriction"] = nil,
		["Name"] = "Razzeric's Tweaking",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1186
		},
		["LinkedQuests"] = {
		}
	},
	[1188] = {
		["ID"] = 1188,
		["FactionRestriction"] = nil,
		["Name"] = "Safety First",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1187
		},
		["LinkedQuests"] = {
		}
	},
	[1189] = {
		["ID"] = 1189,
		["FactionRestriction"] = nil,
		["Name"] = "Safety First",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1188
		},
		["LinkedQuests"] = {
		}
	},
	[1190] = {
		["ID"] = 1190,
		["FactionRestriction"] = nil,
		["Name"] = "Keeping Pace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1194] = {
		["ID"] = 1194,
		["FactionRestriction"] = nil,
		["Name"] = "Rizzle's Schematics",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1198] = {
		["ID"] = 1198,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In Search of Thaelrid",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1199] = {
		["ID"] = 1199,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Twilight Falls",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1200] = {
		["ID"] = 1200,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Blackfathom Villainy",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1198
		},
		["LinkedQuests"] = {
		}
	},
	[1201] = {
		["ID"] = 1201,
		["FactionRestriction"] = "Horde",
		["Name"] = "Theramore Spies",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1202] = {
		["ID"] = 1202,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Theramore Docks",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1203] = {
		["ID"] = 1203,
		["FactionRestriction"] = nil,
		["Name"] = "Jarl Needs a Blade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1204] = {
		["ID"] = 1204,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mudrock Soup and Bugs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1205] = {
		["ID"] = 1205,
		["FactionRestriction"] = "Horde",
		["Name"] = "Deadmire",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1206] = {
		["ID"] = 1206,
		["FactionRestriction"] = nil,
		["Name"] = "Jarl Needs Eyes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1218] = {
		["ID"] = 1218,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Soothing Spices",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1220] = {
		["ID"] = 1220,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Captain Vimes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1221] = {
		["ID"] = 1221,
		["FactionRestriction"] = nil,
		["Name"] = "Blueleaf Tubers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1222] = {
		["ID"] = 1222,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Stinky's Escape",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1238] = {
		["ID"] = 1238,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Lost Report",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1239] = {
		["ID"] = 1239,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Severed Head",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1240] = {
		["ID"] = 1240,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Troll Witchdoctor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1258] = {
		["ID"] = 1258,
		["FactionRestriction"] = "Alliance",
		["Name"] = "... and Bugs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1261] = {
		["ID"] = 1261,
		["FactionRestriction"] = "Horde",
		["Name"] = "Marg Speaks",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1262] = {
		["ID"] = 1262,
		["FactionRestriction"] = "Horde",
		["Name"] = "Report to Zor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1270] = {
		["ID"] = 1270,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stinky's Escape",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1273] = {
		["ID"] = 1273,
		["FactionRestriction"] = "Horde",
		["Name"] = "Questioning Reethe",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1275] = {
		["ID"] = 1275,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Researching the Corruption",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1286] = {
		["ID"] = 1286,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Deserters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1287] = {
		["ID"] = 1287,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Deserters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1322] = {
		["ID"] = 1322,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Black Shield",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1360] = {
		["ID"] = 1360,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reclaimed Treasures",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1365] = {
		["ID"] = 1365,
		["FactionRestriction"] = "Horde",
		["Name"] = "Khan Dez'hepah",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1366] = {
		["ID"] = 1366,
		["FactionRestriction"] = "Horde",
		["Name"] = "Centaur Bounty",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1369] = {
		["ID"] = 1369,
		["FactionRestriction"] = "Horde",
		["Name"] = "Broken Tears",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1382] = {
		["ID"] = 1382,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Strange Alliance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1384] = {
		["ID"] = 1384,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Raid on the Kolkar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1385] = {
		["ID"] = 1385,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Brutal Politics",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1386] = {
		["ID"] = 1386,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Assault on the Kolkar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1387] = {
		["ID"] = 1387,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Centaur Bounty",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1389] = {
		["ID"] = 1389,
		["FactionRestriction"] = nil,
		["Name"] = "Draenethyst Crystals",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1391] = {
		["ID"] = 1391,
		["FactionRestriction"] = "Horde",
		["Name"] = "Nothing But The Truth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1392] = {
		["ID"] = 1392,
		["FactionRestriction"] = nil,
		["Name"] = "Noboru the Cudgel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1393] = {
		["ID"] = 1393,
		["FactionRestriction"] = nil,
		["Name"] = "Galen's Escape",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1396] = {
		["ID"] = 1396,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Encroaching Wildlife",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1419] = {
		["ID"] = 1419,
		["FactionRestriction"] = "Horde",
		["Name"] = "Coyote Thieves",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1421] = {
		["ID"] = 1421,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Lost Caravan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1424] = {
		["ID"] = 1424,
		["FactionRestriction"] = "Horde",
		["Name"] = "Pool of Tears",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1426] = {
		["ID"] = 1426,
		["FactionRestriction"] = "Horde",
		["Name"] = "Threat From the Sea",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1427] = {
		["ID"] = 1427,
		["FactionRestriction"] = "Horde",
		["Name"] = "Threat From the Sea",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1428] = {
		["ID"] = 1428,
		["FactionRestriction"] = "Horde",
		["Name"] = "Continued Threat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1429] = {
		["ID"] = 1429,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Atal'ai Exile",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1424
		},
		["LinkedQuests"] = {
		}
	},
	[1430] = {
		["ID"] = 1430,
		["FactionRestriction"] = "Horde",
		["Name"] = "Fresh Meat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1434] = {
		["ID"] = 1434,
		["FactionRestriction"] = "Horde",
		["Name"] = "Befouled by Satyr",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1435] = {
		["ID"] = 1435,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Burning of Spirits",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1437] = {
		["ID"] = 1437,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Vahlarriel's Search",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1438] = {
		["ID"] = 1438,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Vahlarriel's Search",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1439] = {
		["ID"] = 1439,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Search for Tyranis",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1440] = {
		["ID"] = 1440,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Vahlarriel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1444] = {
		["ID"] = 1444,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return to Fel'Zerul",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1429
		},
		["LinkedQuests"] = {
		}
	},
	[1445] = {
		["ID"] = 1445,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Temple of Atal'Hakkar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1444
		},
		["LinkedQuests"] = {
		}
	},
	[1446] = {
		["ID"] = 1446,
		["FactionRestriction"] = nil,
		["Name"] = "Jammal'an the Prophet",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1452] = {
		["ID"] = 1452,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rhapsody's Kalimdor Kocktail",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1454] = {
		["ID"] = 1454,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Karnitol Shipwreck",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1455] = {
		["ID"] = 1455,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Karnitol Shipwreck",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1456] = {
		["ID"] = 1456,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Karnitol Shipwreck",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1457] = {
		["ID"] = 1457,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Karnitol Shipwreck",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1458] = {
		["ID"] = 1458,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reagents for Reclaimers Inc.",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1459] = {
		["ID"] = 1459,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reagents for Reclaimers Inc.",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1465] = {
		["ID"] = 1465,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Vahlarriel's Search",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1466] = {
		["ID"] = 1466,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reagents for Reclaimers Inc.",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1467] = {
		["ID"] = 1467,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reagents for Reclaimers Inc.",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1469] = {
		["ID"] = 1469,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rhapsody's Tale",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1475] = {
		["ID"] = 1475,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Into The Temple of Atal'Hakkar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1469
		},
		["LinkedQuests"] = {
		}
	},
	[1480] = {
		["ID"] = 1480,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Corrupter",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1481] = {
		["ID"] = 1481,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Corrupter",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1482] = {
		["ID"] = 1482,
		["FactionRestriction"] = "Horde",
		["Name"] = "Brutal Politics",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1483] = {
		["ID"] = 1483,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ziz Fizziks",
		["Zone"] = nil,
		["Level"] = 21,
		["XP"] = 420,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1485] = {
		["ID"] = 1485,
		["FactionRestriction"] = "Horde",
		["Name"] = "Vile Familiars",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
			792
		}
	},
	[1486] = {
		["ID"] = 1486,
		["FactionRestriction"] = nil,
		["Name"] = "Deviate Hides",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1487] = {
		["ID"] = 1487,
		["FactionRestriction"] = nil,
		["Name"] = "Deviate Eradication",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1488] = {
		["ID"] = 1488,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Corrupter",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1489] = {
		["ID"] = 1489,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hamuul Runetotem",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			880
		},
		["LinkedQuests"] = {
		}
	},
	[1490] = {
		["ID"] = 1490,
		["FactionRestriction"] = "Horde",
		["Name"] = "Nara Wildmane",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1489
		},
		["LinkedQuests"] = {
		}
	},
	[1491] = {
		["ID"] = 1491,
		["FactionRestriction"] = nil,
		["Name"] = "Smart Drinks",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			865
		},
		["LinkedQuests"] = {
		}
	},
	[1492] = {
		["ID"] = 1492,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wharfmaster Dizzywig",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 440,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1516] = {
		["ID"] = 1516,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Earth",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1517] = {
		["ID"] = 1517,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Earth",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1518] = {
		["ID"] = 1518,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Earth",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1519] = {
		["ID"] = 1519,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Earth",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1524] = {
		["ID"] = 1524,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Fire",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 650,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1525] = {
		["ID"] = 1525,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Fire",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1526] = {
		["ID"] = 1526,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Fire",
		["Zone"] = nil,
		["Level"] = 13,
		["XP"] = 1150,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1527] = {
		["ID"] = 1527,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Fire",
		["Zone"] = nil,
		["Level"] = 13,
		["XP"] = 1150,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1560] = {
		["ID"] = 1560,
		["FactionRestriction"] = nil,
		["Name"] = "Tooga's Quest",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1579] = {
		["ID"] = 1579,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gaffer Jacks",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1580] = {
		["ID"] = 1580,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Electropellers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1690] = {
		["ID"] = 1690,
		["FactionRestriction"] = nil,
		["Name"] = "Wastewander Justice",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1691] = {
		["ID"] = 1691,
		["FactionRestriction"] = nil,
		["Name"] = "More Wastewander Justice",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1882] = {
		["ID"] = 1882,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Balnir Farmstead",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 850,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[1883] = {
		["ID"] = 1883,
		["FactionRestriction"] = "Horde",
		["Name"] = "Speak with Un'thuwa",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 85,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2038] = {
		["ID"] = 2038,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bingle's Missing Supplies",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2040] = {
		["ID"] = 2040,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Underground Assault",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2078] = {
		["ID"] = 2078,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gyromast's Revenge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2098] = {
		["ID"] = 2098,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gyromast's Retrieval",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2118] = {
		["ID"] = 2118,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Plagued Lands",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2138] = {
		["ID"] = 2138,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Cleansing of the Infected",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2139] = {
		["ID"] = 2139,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tharnariun's Hope",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2158] = {
		["ID"] = 2158,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rest and Relaxation",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 110,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2159] = {
		["ID"] = 2159,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Dolanaar Delivery",
		["Zone"] = "Teldrassil",
		["Level"] = 5,
		["XP"] = 110,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2161] = {
		["ID"] = 2161,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Peon's Burden",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 110,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2178] = {
		["ID"] = 2178,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Easy Strider Living",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2198] = {
		["ID"] = 2198,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Shattered Necklace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2199] = {
		["ID"] = 2199,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Lore for a Price",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2198
		},
		["LinkedQuests"] = {
		}
	},
	[2200] = {
		["ID"] = 2200,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Back to Uldaman",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2199
		},
		["LinkedQuests"] = {
		}
	},
	[2201] = {
		["ID"] = 2201,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Restoring the Necklace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2200
		},
		["LinkedQuests"] = {
		}
	},
	[2202] = {
		["ID"] = 2202,
		["FactionRestriction"] = "Horde",
		["Name"] = "Uldaman Reagent Run",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2258
		},
		["LinkedQuests"] = {
		}
	},
	[2203] = {
		["ID"] = 2203,
		["FactionRestriction"] = "Horde",
		["Name"] = "Badlands Reagent Run II",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2204] = {
		["ID"] = 2204,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Restoring the Necklace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2201
		},
		["LinkedQuests"] = {
		}
	},
	[2240] = {
		["ID"] = 2240,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Hidden Chamber",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2398
		},
		["LinkedQuests"] = {
		}
	},
	[2258] = {
		["ID"] = 2258,
		["FactionRestriction"] = "Horde",
		["Name"] = "Badlands Reagent Run",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2278] = {
		["ID"] = 2278,
		["FactionRestriction"] = nil,
		["Name"] = "The Platinum Discs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2283] = {
		["ID"] = 2283,
		["FactionRestriction"] = "Horde",
		["Name"] = "Necklace Recovery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2284] = {
		["ID"] = 2284,
		["FactionRestriction"] = "Horde",
		["Name"] = "Necklace Recovery, Take 2",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2283
		},
		["LinkedQuests"] = {
		}
	},
	[2318] = {
		["ID"] = 2318,
		["FactionRestriction"] = "Horde",
		["Name"] = "Translating the Journal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2284
		},
		["LinkedQuests"] = {
		}
	},
	[2338] = {
		["ID"] = 2338,
		["FactionRestriction"] = "Horde",
		["Name"] = "Translating the Journal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2318
		},
		["LinkedQuests"] = {
		}
	},
	[2340] = {
		["ID"] = 2340,
		["FactionRestriction"] = "Horde",
		["Name"] = "Deliver the Gems",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2338
		},
		["LinkedQuests"] = {
		}
	},
	[2341] = {
		["ID"] = 2341,
		["FactionRestriction"] = "Horde",
		["Name"] = "Necklace Recovery, Take 3",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2340
		},
		["LinkedQuests"] = {
		}
	},
	[2342] = {
		["ID"] = 2342,
		["FactionRestriction"] = "Horde",
		["Name"] = "Reclaimed Treasures",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2398] = {
		["ID"] = 2398,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Lost Dwarves",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2418] = {
		["ID"] = 2418,
		["FactionRestriction"] = nil,
		["Name"] = "Power Stones",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2438] = {
		["ID"] = 2438,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Emerald Dreamcatcher",
		["Zone"] = "Teldrassil",
		["Level"] = 6,
		["XP"] = 410,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2459] = {
		["ID"] = 2459,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ferocitas the Dream Eater",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2499] = {
		["ID"] = 2499,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Oakenscowl",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2500] = {
		["ID"] = 2500,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Badlands Reagent Run",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2518] = {
		["ID"] = 2518,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tears of the Moon",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 1150,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2522] = {
		["ID"] = 2522,
		["FactionRestriction"] = nil,
		["Name"] = "Kum'isha's Endeavors",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2541] = {
		["ID"] = 2541,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Sleeping Druid",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2561] = {
		["ID"] = 2561,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Druid of the Claw",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2581] = {
		["ID"] = 2581,
		["FactionRestriction"] = nil,
		["Name"] = "Snickerfang Jowls",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2583] = {
		["ID"] = 2583,
		["FactionRestriction"] = nil,
		["Name"] = "A Boar's Vitality",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2585] = {
		["ID"] = 2585,
		["FactionRestriction"] = nil,
		["Name"] = "The Decisive Striker",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2601] = {
		["ID"] = 2601,
		["FactionRestriction"] = nil,
		["Name"] = "The Basilisk's Bite",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2603] = {
		["ID"] = 2603,
		["FactionRestriction"] = nil,
		["Name"] = "Vulture's Vigor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2605] = {
		["ID"] = 2605,
		["FactionRestriction"] = nil,
		["Name"] = "The Thirsty Goblin",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2641] = {
		["ID"] = 2641,
		["FactionRestriction"] = nil,
		["Name"] = "Sprinkle's Secret Ingredient",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2681] = {
		["ID"] = 2681,
		["FactionRestriction"] = nil,
		["Name"] = "The Stones that Bind Us",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2701] = {
		["ID"] = 2701,
		["FactionRestriction"] = nil,
		["Name"] = "Heroes of Old",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2721] = {
		["ID"] = 2721,
		["FactionRestriction"] = nil,
		["Name"] = "Kirith",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2742] = {
		["ID"] = 2742,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rin'ji is Trapped!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2766] = {
		["ID"] = 2766,
		["FactionRestriction"] = nil,
		["Name"] = "Find OOX-22/FE!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2767] = {
		["ID"] = 2767,
		["FactionRestriction"] = nil,
		["Name"] = "Find OOX-22/FE!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2770] = {
		["ID"] = 2770,
		["FactionRestriction"] = nil,
		["Name"] = "Ghaz'rilla",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2781] = {
		["ID"] = 2781,
		["FactionRestriction"] = nil,
		["Name"] = "WANTED: Caliph Scorpidsting",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2782] = {
		["ID"] = 2782,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rin'ji's Secret",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2821] = {
		["ID"] = 2821,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Mark of Quality",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2822] = {
		["ID"] = 2822,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Mark of Quality",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2841] = {
		["ID"] = 2841,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rig Wars",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2842] = {
		["ID"] = 2842,
		["FactionRestriction"] = "Horde",
		["Name"] = "Chief Engineer Scooty",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2843] = {
		["ID"] = 2843,
		["FactionRestriction"] = "Horde",
		["Name"] = "Gnomer-gooooone!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2842
		},
		["LinkedQuests"] = {
		}
	},
	[2844] = {
		["ID"] = 2844,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Giant Guardian",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2845] = {
		["ID"] = 2845,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Wandering Shay",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2846] = {
		["ID"] = 2846,
		["FactionRestriction"] = nil,
		["Name"] = "Tiara of the Deep",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2861
		},
		["LinkedQuests"] = {
		}
	},
	[2861] = {
		["ID"] = 2861,
		["FactionRestriction"] = nil,
		["Name"] = "Tabetha's Task",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2862] = {
		["ID"] = 2862,
		["FactionRestriction"] = "Horde",
		["Name"] = "War on the Woodpaw",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2863] = {
		["ID"] = 2863,
		["FactionRestriction"] = "Horde",
		["Name"] = "Alpha Strike",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2865] = {
		["ID"] = 2865,
		["FactionRestriction"] = nil,
		["Name"] = "Scarab Shells",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2866] = {
		["ID"] = 2866,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Ruins of Solarsal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2867] = {
		["ID"] = 2867,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Feathermoon Stronghold",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2869] = {
		["ID"] = 2869,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Against the Hatecrest",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2870] = {
		["ID"] = 2870,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Against Lord Shalzaru",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2871] = {
		["ID"] = 2871,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Delivering the Relic",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2873] = {
		["ID"] = 2873,
		["FactionRestriction"] = nil,
		["Name"] = "Stoley's Shipment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2874] = {
		["ID"] = 2874,
		["FactionRestriction"] = nil,
		["Name"] = "Delivery to MacKinley",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2875] = {
		["ID"] = 2875,
		["FactionRestriction"] = nil,
		["Name"] = "WANTED: Andre Firebeard",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2876] = {
		["ID"] = 2876,
		["FactionRestriction"] = nil,
		["Name"] = "Ship Schedules",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2877] = {
		["ID"] = 2877,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Skulk Rock Clean-Up",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2879] = {
		["ID"] = 2879,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Stave of Equinex",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2880] = {
		["ID"] = 2880,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Troll Necklace Bounty",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2902] = {
		["ID"] = 2902,
		["FactionRestriction"] = "Horde",
		["Name"] = "Woodpaw Investigation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2903] = {
		["ID"] = 2903,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Battle Plans",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2904] = {
		["ID"] = 2904,
		["FactionRestriction"] = nil,
		["Name"] = "A Fine Mess",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2922] = {
		["ID"] = 2922,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Save Techbot's Brain!",
		["Zone"] = nil,
		["Level"] = 26,
		["XP"] = 4750,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2924] = {
		["ID"] = 2924,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Essential Artifacts",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2926] = {
		["ID"] = 2926,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gnogaine",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2927
		},
		["LinkedQuests"] = {
		}
	},
	[2927] = {
		["ID"] = 2927,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Day After",
		["Zone"] = nil,
		["Level"] = 27,
		["XP"] = 220,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2928] = {
		["ID"] = 2928,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gyrodrillmatic Excavationators",
		["Zone"] = nil,
		["Level"] = 30,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2929] = {
		["ID"] = 2929,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Grand Betrayal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2930] = {
		["ID"] = 2930,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Data Rescue",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2933] = {
		["ID"] = 2933,
		["FactionRestriction"] = "Horde",
		["Name"] = "Venom Bottles",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2934] = {
		["ID"] = 2934,
		["FactionRestriction"] = "Horde",
		["Name"] = "Undamaged Venom Sac",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2933
		},
		["LinkedQuests"] = {
		}
	},
	[2935] = {
		["ID"] = 2935,
		["FactionRestriction"] = "Horde",
		["Name"] = "Consult Master Gadrin",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2934
		},
		["LinkedQuests"] = {
		}
	},
	[2936] = {
		["ID"] = 2936,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Spider God",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2935
		},
		["LinkedQuests"] = {
		}
	},
	[2937] = {
		["ID"] = 2937,
		["FactionRestriction"] = "Horde",
		["Name"] = "Summoning Shadra",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2936
		},
		["LinkedQuests"] = {
		}
	},
	[2942] = {
		["ID"] = 2942,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Morrow Stone",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2943] = {
		["ID"] = 2943,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Troyas",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2944] = {
		["ID"] = 2944,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Super Snapper FX",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2945] = {
		["ID"] = 2945,
		["FactionRestriction"] = nil,
		["Name"] = "Grime-Encrusted Ring",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2954] = {
		["ID"] = 2954,
		["FactionRestriction"] = nil,
		["Name"] = "The Stone Watcher",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2962] = {
		["ID"] = 2962,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Only Cure is More Green Glow",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2926
		},
		["LinkedQuests"] = {
		}
	},
	[2969] = {
		["ID"] = 2969,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Freedom for All Creatures",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2970] = {
		["ID"] = 2970,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Doling Justice",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2972] = {
		["ID"] = 2972,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Doling Justice",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2973] = {
		["ID"] = 2973,
		["FactionRestriction"] = "Horde",
		["Name"] = "A New Cloak's Sheen",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2974] = {
		["ID"] = 2974,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Grim Discovery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2975] = {
		["ID"] = 2975,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Ogres of Feralas",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2976] = {
		["ID"] = 2976,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Grim Discovery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2978] = {
		["ID"] = 2978,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Gordunni Scroll",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2979] = {
		["ID"] = 2979,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dark Ceremony",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2980] = {
		["ID"] = 2980,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Ogres of Feralas",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2982] = {
		["ID"] = 2982,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The High Wilderness",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2983] = {
		["ID"] = 2983,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Fire",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 420,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2987] = {
		["ID"] = 2987,
		["FactionRestriction"] = "Horde",
		["Name"] = "Gordunni Cobalt",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2988] = {
		["ID"] = 2988,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Witherbark Cages",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2989] = {
		["ID"] = 2989,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Altar of Zul",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2988
		},
		["LinkedQuests"] = {
		}
	},
	[2990] = {
		["ID"] = 2990,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Thadius Grimshade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2989
		},
		["LinkedQuests"] = {
		}
	},
	[2991] = {
		["ID"] = 2991,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Nekrum's Medallion",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			2990
		},
		["LinkedQuests"] = {
		}
	},
	[2992] = {
		["ID"] = 2992,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Divination",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[2994] = {
		["ID"] = 2994,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Saving Sharpbeak",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3042] = {
		["ID"] = 3042,
		["FactionRestriction"] = nil,
		["Name"] = "Troll Temper",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3062] = {
		["ID"] = 3062,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dark Heart",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3063] = {
		["ID"] = 3063,
		["FactionRestriction"] = "Horde",
		["Name"] = "Vengeance on the Northspring",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3084] = {
		["ID"] = 3084,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rune-Inscribed Tablet",
		["Zone"] = nil,
		["Level"] = 1,
		["XP"] = 40,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3086] = {
		["ID"] = 3086,
		["FactionRestriction"] = "Horde",
		["Name"] = "Glyphic Tablet",
		["Zone"] = nil,
		["Level"] = 1,
		["XP"] = 40,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3090] = {
		["ID"] = 3090,
		["FactionRestriction"] = "Horde",
		["Name"] = "Tainted Parchment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3103] = {
		["ID"] = 3103,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Hallowed Letter",
		["Zone"] = nil,
		["Level"] = 1,
		["XP"] = 40,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3118] = {
		["ID"] = 3118,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Encrypted Sigil",
		["Zone"] = "Teldrassil",
		["Level"] = 1,
		["XP"] = 40,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3123] = {
		["ID"] = 3123,
		["FactionRestriction"] = "Horde",
		["Name"] = "Testing the Vessel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3124] = {
		["ID"] = 3124,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hippogryph Muisek",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3125] = {
		["ID"] = 3125,
		["FactionRestriction"] = "Horde",
		["Name"] = "Faerie Dragon Muisek",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3126] = {
		["ID"] = 3126,
		["FactionRestriction"] = "Horde",
		["Name"] = "Treant Muisek",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3127] = {
		["ID"] = 3127,
		["FactionRestriction"] = "Horde",
		["Name"] = "Mountain Giant Muisek",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3128] = {
		["ID"] = 3128,
		["FactionRestriction"] = "Horde",
		["Name"] = "Natural Materials",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3129] = {
		["ID"] = 3129,
		["FactionRestriction"] = "Horde",
		["Name"] = "Weapons of Spirit",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3161] = {
		["ID"] = 3161,
		["FactionRestriction"] = nil,
		["Name"] = "Ghaz'ridian",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3181] = {
		["ID"] = 3181,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Horn of the Beast",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3281] = {
		["ID"] = 3281,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stolen Silver",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3341] = {
		["ID"] = 3341,
		["FactionRestriction"] = "Horde",
		["Name"] = "Bring the End",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3361] = {
		["ID"] = 3361,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Refugee's Quandry",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3362] = {
		["ID"] = 3362,
		["FactionRestriction"] = nil,
		["Name"] = "Thistleshrub Valley",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3364] = {
		["ID"] = 3364,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Scalding Mornbrew Delivery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3365] = {
		["ID"] = 3365,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bring Back the Bug",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3367] = {
		["ID"] = 3367,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Suntara Stones",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3368] = {
		["ID"] = 3368,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Suntara Stones",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3372] = {
		["ID"] = 3372,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Release Them",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3373] = {
		["ID"] = 3373,
		["FactionRestriction"] = nil,
		["Name"] = "The Essence of Eranikus",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3376] = {
		["ID"] = 3376,
		["FactionRestriction"] = "Horde",
		["Name"] = "Break Sharptusk!",
		["Zone"] = nil,
		["Level"] = 5,
		["XP"] = 675,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3378] = {
		["ID"] = 3378,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Prayer to Elune",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3380] = {
		["ID"] = 3380,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Sunken Temple",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
			3445
		}
	},
	[3381] = {
		["ID"] = 3381,
		["FactionRestriction"] = nil,
		["Name"] = "A Meeting with the Master",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3442] = {
		["ID"] = 3442,
		["FactionRestriction"] = nil,
		["Name"] = "The Flawless Flame",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3443] = {
		["ID"] = 3443,
		["FactionRestriction"] = nil,
		["Name"] = "Forging the Shaft",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3444] = {
		["ID"] = 3444,
		["FactionRestriction"] = nil,
		["Name"] = "The Stone Circle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			3445
		},
		["LinkedQuests"] = {
		}
	},
	[3445] = {
		["ID"] = 3445,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Sunken Temple",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
			3380
		}
	},
	[3446] = {
		["ID"] = 3446,
		["FactionRestriction"] = nil,
		["Name"] = "Into the Depths",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			3444
		},
		["LinkedQuests"] = {
		}
	},
	[3447] = {
		["ID"] = 3447,
		["FactionRestriction"] = nil,
		["Name"] = "Secret of the Circle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			3444
		},
		["LinkedQuests"] = {
		}
	},
	[3452] = {
		["ID"] = 3452,
		["FactionRestriction"] = nil,
		["Name"] = "The Flame's Casing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3454] = {
		["ID"] = 3454,
		["FactionRestriction"] = nil,
		["Name"] = "The Torch of Retribution",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3463] = {
		["ID"] = 3463,
		["FactionRestriction"] = nil,
		["Name"] = "Set Them Ablaze!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3481] = {
		["ID"] = 3481,
		["FactionRestriction"] = nil,
		["Name"] = "Trinkets...",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3509] = {
		["ID"] = 3509,
		["FactionRestriction"] = nil,
		["Name"] = "The Name of the Beast",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3510] = {
		["ID"] = 3510,
		["FactionRestriction"] = nil,
		["Name"] = "The Name of the Beast",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3513] = {
		["ID"] = 3513,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Runed Scroll",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3514] = {
		["ID"] = 3514,
		["FactionRestriction"] = "Horde",
		["Name"] = "Horde Presence",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3517] = {
		["ID"] = 3517,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stealing Knowledge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3519] = {
		["ID"] = 3519,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Friend in Need",
		["Zone"] = "Teldrassil",
		["Level"] = 4,
		["XP"] = 90,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3520] = {
		["ID"] = 3520,
		["FactionRestriction"] = nil,
		["Name"] = "Screecher Spirits",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3521] = {
		["ID"] = 3521,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Iverron's Antidote",
		["Zone"] = "Teldrassil",
		["Level"] = 4,
		["XP"] = 360,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3522] = {
		["ID"] = 3522,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Iverron's Antidote",
		["Zone"] = "Teldrassil",
		["Level"] = 4,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3523] = {
		["ID"] = 3523,
		["FactionRestriction"] = nil,
		["Name"] = "Scourge of the Downs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3524] = {
		["ID"] = 3524,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Washed Ashore",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3525] = {
		["ID"] = 3525,
		["FactionRestriction"] = nil,
		["Name"] = "Extinguishing the Idol",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			3523
		},
		["LinkedQuests"] = {
		}
	},
	[3527] = {
		["ID"] = 3527,
		["FactionRestriction"] = nil,
		["Name"] = "The Prophecy of Mosh'aru",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			3520
		},
		["LinkedQuests"] = {
		}
	},
	[3528] = {
		["ID"] = 3528,
		["FactionRestriction"] = nil,
		["Name"] = "The God Hakkar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			4787
		},
		["LinkedQuests"] = {
		}
	},
	[3556] = {
		["ID"] = 3556,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rise, Obsidion!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3601] = {
		["ID"] = 3601,
		["FactionRestriction"] = nil,
		["Name"] = "Kim'jael Indeed!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3602] = {
		["ID"] = 3602,
		["FactionRestriction"] = nil,
		["Name"] = "Azsharite",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3636] = {
		["ID"] = 3636,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bring the Light",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3741] = {
		["ID"] = 3741,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Hilary's Necklace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3783] = {
		["ID"] = 3783,
		["FactionRestriction"] = nil,
		["Name"] = "Are We There, Yeti?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3791] = {
		["ID"] = 3791,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Mystery of Morrowgrain",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3822] = {
		["ID"] = 3822,
		["FactionRestriction"] = "Horde",
		["Name"] = "Krom'Grul",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3823] = {
		["ID"] = 3823,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Extinguish the Firegut",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3824] = {
		["ID"] = 3824,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gor'tesh the Brute Lord",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3825] = {
		["ID"] = 3825,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ogre Head On A Stick = Party",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3845] = {
		["ID"] = 3845,
		["FactionRestriction"] = nil,
		["Name"] = "It's a Secret to Everybody",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3881] = {
		["ID"] = 3881,
		["FactionRestriction"] = nil,
		["Name"] = "Expedition Salvation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3882] = {
		["ID"] = 3882,
		["FactionRestriction"] = nil,
		["Name"] = "Roll the Bones",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3883] = {
		["ID"] = 3883,
		["FactionRestriction"] = nil,
		["Name"] = "Alien Ecology",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3884] = {
		["ID"] = 3884,
		["FactionRestriction"] = nil,
		["Name"] = "Williden's Journal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3901] = {
		["ID"] = 3901,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rattling the Rattlecages",
		["Zone"] = nil,
		["Level"] = 3,
		["XP"] = 250,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3902] = {
		["ID"] = 3902,
		["FactionRestriction"] = "Horde",
		["Name"] = "Scavenging Deathknell",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3903] = {
		["ID"] = 3903,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Milly Osworth",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 35,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3904] = {
		["ID"] = 3904,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Milly's Harvest",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 180,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3905] = {
		["ID"] = 3905,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Grape Manifest",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 360,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3908] = {
		["ID"] = 3908,
		["FactionRestriction"] = nil,
		["Name"] = "It's a Secret to Everybody",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3909] = {
		["ID"] = 3909,
		["FactionRestriction"] = nil,
		["Name"] = "The Videre Elixir",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3913] = {
		["ID"] = 3913,
		["FactionRestriction"] = nil,
		["Name"] = "A Gave Situation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3914] = {
		["ID"] = 3914,
		["FactionRestriction"] = nil,
		["Name"] = "Linken's Sword",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3921] = {
		["ID"] = 3921,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wenikee Boltbucket",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3922] = {
		["ID"] = 3922,
		["FactionRestriction"] = "Horde",
		["Name"] = "Nugget Slugs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3924] = {
		["ID"] = 3924,
		["FactionRestriction"] = "Horde",
		["Name"] = "Chen's Empty Keg",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3942] = {
		["ID"] = 3942,
		["FactionRestriction"] = nil,
		["Name"] = "Linken's Memory",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3961] = {
		["ID"] = 3961,
		["FactionRestriction"] = nil,
		["Name"] = "Linken's Adventure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[3962] = {
		["ID"] = 3962,
		["FactionRestriction"] = nil,
		["Name"] = "It's Dangerous to Go Alone",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4005] = {
		["ID"] = 4005,
		["FactionRestriction"] = nil,
		["Name"] = "Aquementas",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4021] = {
		["ID"] = 4021,
		["FactionRestriction"] = "Horde",
		["Name"] = "Counterattack",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4022] = {
		["ID"] = 4022,
		["FactionRestriction"] = nil,
		["Name"] = "A Taste of Flame",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4023] = {
		["ID"] = 4023,
		["FactionRestriction"] = nil,
		["Name"] = "A Taste of Flame",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4061] = {
		["ID"] = 4061,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Rise of the Machines",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4084] = {
		["ID"] = 4084,
		["FactionRestriction"] = nil,
		["Name"] = "Silver Heart",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4101] = {
		["ID"] = 4101,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Cleansing Felwood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4102] = {
		["ID"] = 4102,
		["FactionRestriction"] = "Horde",
		["Name"] = "Cleansing Felwood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4125] = {
		["ID"] = 4125,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Missing Courier",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4131] = {
		["ID"] = 4131,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Woodpaw Gnolls",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4135] = {
		["ID"] = 4135,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Writhing Deep",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4141] = {
		["ID"] = 4141,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mulgin and Larion",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4142] = {
		["ID"] = 4142,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Visit to Gregan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			4141
		},
		["LinkedQuests"] = {
		}
	},
	[4143] = {
		["ID"] = 4143,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Haze of Evil",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			4142
		},
		["LinkedQuests"] = {
		}
	},
	[4144] = {
		["ID"] = 4144,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bloodpetal Sprouts",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4145] = {
		["ID"] = 4145,
		["FactionRestriction"] = "Horde",
		["Name"] = "Larion and Muigin",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4146] = {
		["ID"] = 4146,
		["FactionRestriction"] = nil,
		["Name"] = "Zapper Fuel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			4147
		},
		["LinkedQuests"] = {
		}
	},
	[4147] = {
		["ID"] = 4147,
		["FactionRestriction"] = "Horde",
		["Name"] = "Marvon's Workshop",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			4145
		},
		["LinkedQuests"] = {
		}
	},
	[4161] = {
		["ID"] = 4161,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Recipe of the Kaldorei",
		["Zone"] = "Teldrassil",
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4182] = {
		["ID"] = 4182,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Dragonkin Menace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4183] = {
		["ID"] = 4183,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The True Masters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4184] = {
		["ID"] = 4184,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The True Masters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4185] = {
		["ID"] = 4185,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The True Masters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4186] = {
		["ID"] = 4186,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The True Masters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4223] = {
		["ID"] = 4223,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The True Masters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4224] = {
		["ID"] = 4224,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The True Masters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4243] = {
		["ID"] = 4243,
		["FactionRestriction"] = nil,
		["Name"] = "Chasing A-Me 01",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4244] = {
		["ID"] = 4244,
		["FactionRestriction"] = nil,
		["Name"] = "Chasing A-Me 01",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4245] = {
		["ID"] = 4245,
		["FactionRestriction"] = nil,
		["Name"] = "Chasing A-Me 01",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4261] = {
		["ID"] = 4261,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ancient Spirit",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4265] = {
		["ID"] = 4265,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Freed from the Hive",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4266] = {
		["ID"] = 4266,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Hero's Welcome",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4281] = {
		["ID"] = 4281,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Thalanaar Delivery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4284] = {
		["ID"] = 4284,
		["FactionRestriction"] = nil,
		["Name"] = "Crystals of Power",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4285] = {
		["ID"] = 4285,
		["FactionRestriction"] = nil,
		["Name"] = "The Northern Pylon",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4287] = {
		["ID"] = 4287,
		["FactionRestriction"] = nil,
		["Name"] = "The Eastern Pylon",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4288] = {
		["ID"] = 4288,
		["FactionRestriction"] = nil,
		["Name"] = "The Western Pylon",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4289] = {
		["ID"] = 4289,
		["FactionRestriction"] = nil,
		["Name"] = "The Apes of Un'Goro",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4290] = {
		["ID"] = 4290,
		["FactionRestriction"] = nil,
		["Name"] = "The Fare of Lar'korwi",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4291] = {
		["ID"] = 4291,
		["FactionRestriction"] = nil,
		["Name"] = "The Scent of Lar'korwi",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4292] = {
		["ID"] = 4292,
		["FactionRestriction"] = nil,
		["Name"] = "The Bait for Lar'korwi",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4296] = {
		["ID"] = 4296,
		["FactionRestriction"] = nil,
		["Name"] = "Tablet of the Seven",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4301] = {
		["ID"] = 4301,
		["FactionRestriction"] = nil,
		["Name"] = "The Mighty U'cha",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4402] = {
		["ID"] = 4402,
		["FactionRestriction"] = "Horde",
		["Name"] = "Galgar's Cactus Apple Surprise",
		["Zone"] = nil,
		["Level"] = 3,
		["XP"] = 380,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4421] = {
		["ID"] = 4421,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Corruption of the Jadefire",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4441] = {
		["ID"] = 4441,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Felbound Ancients",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4442] = {
		["ID"] = 4442,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Purified!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4449] = {
		["ID"] = 4449,
		["FactionRestriction"] = nil,
		["Name"] = "Caught!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4451] = {
		["ID"] = 4451,
		["FactionRestriction"] = nil,
		["Name"] = "The Key to Freedom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4491] = {
		["ID"] = 4491,
		["FactionRestriction"] = nil,
		["Name"] = "A Little Help From My Friends",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4492] = {
		["ID"] = 4492,
		["FactionRestriction"] = nil,
		["Name"] = "Lost!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4495] = {
		["ID"] = 4495,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Good Friend",
		["Zone"] = "Teldrassil",
		["Level"] = 4,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4501] = {
		["ID"] = 4501,
		["FactionRestriction"] = nil,
		["Name"] = "Beware of Pterrordax",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4503] = {
		["ID"] = 4503,
		["FactionRestriction"] = nil,
		["Name"] = "Shizzle's Flyer",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4505] = {
		["ID"] = 4505,
		["FactionRestriction"] = "Horde",
		["Name"] = "Well of Corruption",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4506] = {
		["ID"] = 4506,
		["FactionRestriction"] = "Horde",
		["Name"] = "Corrupted Sabers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4521] = {
		["ID"] = 4521,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wild Guardians",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4641] = {
		["ID"] = 4641,
		["FactionRestriction"] = "Horde",
		["Name"] = "Your Place in the World",
		["Zone"] = nil,
		["Level"] = 1,
		["XP"] = 40,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4681] = {
		["ID"] = 4681,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Washed Ashore",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4721] = {
		["ID"] = 4721,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wild Guardians",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4722] = {
		["ID"] = 4722,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beached Sea Turtle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4723] = {
		["ID"] = 4723,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beached Sea Creature",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4725] = {
		["ID"] = 4725,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beached Sea Turtle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4726] = {
		["ID"] = 4726,
		["FactionRestriction"] = nil,
		["Name"] = "Broodling Essence",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4727] = {
		["ID"] = 4727,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beached Sea Turtle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4728] = {
		["ID"] = 4728,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beached Sea Creature",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4730] = {
		["ID"] = 4730,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beached Sea Creature",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4731] = {
		["ID"] = 4731,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beached Sea Turtle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4732] = {
		["ID"] = 4732,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beached Sea Turtle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4740] = {
		["ID"] = 4740,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Beached Sea Creature",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4741] = {
		["ID"] = 4741,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wild Guardians",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4746] = {
		["ID"] = 4746,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wind Rider",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4762] = {
		["ID"] = 4762,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Cliffspring River",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4763] = {
		["ID"] = 4763,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Blackwood Corrupted",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4770] = {
		["ID"] = 4770,
		["FactionRestriction"] = "Horde",
		["Name"] = "Homeward Bound",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4787] = {
		["ID"] = 4787,
		["FactionRestriction"] = nil,
		["Name"] = "The Ancient Egg",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			3527
		},
		["LinkedQuests"] = {
		}
	},
	[4808] = {
		["ID"] = 4808,
		["FactionRestriction"] = nil,
		["Name"] = "Felnok Steelspring",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4810] = {
		["ID"] = 4810,
		["FactionRestriction"] = nil,
		["Name"] = "Return to Tinkee",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4811] = {
		["ID"] = 4811,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Red Crystal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4812] = {
		["ID"] = 4812,
		["FactionRestriction"] = "Alliance",
		["Name"] = "As Water Cascades",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4813] = {
		["ID"] = 4813,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Fragments Within",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4821] = {
		["ID"] = 4821,
		["FactionRestriction"] = "Horde",
		["Name"] = "Alien Egg",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4841] = {
		["ID"] = 4841,
		["FactionRestriction"] = "Horde",
		["Name"] = "Pacify the Centaur",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4842] = {
		["ID"] = 4842,
		["FactionRestriction"] = nil,
		["Name"] = "Strange Sources",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4861] = {
		["ID"] = 4861,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Enraged Wildkin",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4863] = {
		["ID"] = 4863,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Enraged Wildkin",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4864] = {
		["ID"] = 4864,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Enraged Wildkin",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4865] = {
		["ID"] = 4865,
		["FactionRestriction"] = "Horde",
		["Name"] = "Serpent Wild",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4881] = {
		["ID"] = 4881,
		["FactionRestriction"] = "Horde",
		["Name"] = "Assassination Plot",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4882] = {
		["ID"] = 4882,
		["FactionRestriction"] = "Horde",
		["Name"] = "Guarding Secrets",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4883] = {
		["ID"] = 4883,
		["FactionRestriction"] = "Horde",
		["Name"] = "Guarding Secrets",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4904] = {
		["ID"] = 4904,
		["FactionRestriction"] = "Horde",
		["Name"] = "Free at Last",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4906] = {
		["ID"] = 4906,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Further Corruption",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4921] = {
		["ID"] = 4921,
		["FactionRestriction"] = "Horde",
		["Name"] = "Lost in Battle",
		["Zone"] = nil,
		["Level"] = 20,
		["XP"] = 1150,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4966] = {
		["ID"] = 4966,
		["FactionRestriction"] = "Horde",
		["Name"] = "Protect Kanati Greycloud",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4971] = {
		["ID"] = 4971,
		["FactionRestriction"] = nil,
		["Name"] = "A Matter of Time",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4972] = {
		["ID"] = 4972,
		["FactionRestriction"] = nil,
		["Name"] = "Counting Out Time",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4984] = {
		["ID"] = 4984,
		["FactionRestriction"] = nil,
		["Name"] = "The Wildlife Suffers Too",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4985] = {
		["ID"] = 4985,
		["FactionRestriction"] = nil,
		["Name"] = "The Wildlife Suffers Too",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4986] = {
		["ID"] = 4986,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Glyphed Oaken Branch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[4987] = {
		["ID"] = 4987,
		["FactionRestriction"] = "Horde",
		["Name"] = "Glyphed Oaken Branch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5041] = {
		["ID"] = 5041,
		["FactionRestriction"] = "Horde",
		["Name"] = "Supplies for the Crossroads",
		["Zone"] = nil,
		["Level"] = 14,
		["XP"] = 975,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5045] = {
		["ID"] = 5045,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ursius of the Shardtooth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5050] = {
		["ID"] = 5050,
		["FactionRestriction"] = nil,
		["Name"] = "Good Luck Charm",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5051] = {
		["ID"] = 5051,
		["FactionRestriction"] = nil,
		["Name"] = "Two Halves Become One",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5052] = {
		["ID"] = 5052,
		["FactionRestriction"] = "Horde",
		["Name"] = "Blood Shards of Agamaggan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5055] = {
		["ID"] = 5055,
		["FactionRestriction"] = "Horde",
		["Name"] = "Brumeran of the Chillwind",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5056] = {
		["ID"] = 5056,
		["FactionRestriction"] = "Horde",
		["Name"] = "Shy-Rotam",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5060] = {
		["ID"] = 5060,
		["FactionRestriction"] = nil,
		["Name"] = "Locked Away",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5062] = {
		["ID"] = 5062,
		["FactionRestriction"] = "Horde",
		["Name"] = "Pacify the Centaur",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5064] = {
		["ID"] = 5064,
		["FactionRestriction"] = "Horde",
		["Name"] = "Grimtotem Spying",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5082] = {
		["ID"] = 5082,
		["FactionRestriction"] = nil,
		["Name"] = "Threat of the Winterfall",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5083] = {
		["ID"] = 5083,
		["FactionRestriction"] = nil,
		["Name"] = "Winterfall Firewater",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5084] = {
		["ID"] = 5084,
		["FactionRestriction"] = nil,
		["Name"] = "Falling to Corruption",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5085] = {
		["ID"] = 5085,
		["FactionRestriction"] = nil,
		["Name"] = "Mystery Goo",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5086] = {
		["ID"] = 5086,
		["FactionRestriction"] = nil,
		["Name"] = "Toxic Horrors",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5087] = {
		["ID"] = 5087,
		["FactionRestriction"] = nil,
		["Name"] = "Winterfall Runners",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5088] = {
		["ID"] = 5088,
		["FactionRestriction"] = "Horde",
		["Name"] = "Arikara",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5092] = {
		["ID"] = 5092,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Clear the Way",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5096] = {
		["ID"] = 5096,
		["FactionRestriction"] = "Horde",
		["Name"] = "Scarlet Diversions",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5097] = {
		["ID"] = 5097,
		["FactionRestriction"] = "Alliance",
		["Name"] = "All Along the Watchtowers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5098] = {
		["ID"] = 5098,
		["FactionRestriction"] = "Horde",
		["Name"] = "All Along the Watchtowers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5121] = {
		["ID"] = 5121,
		["FactionRestriction"] = nil,
		["Name"] = "High Chief Winterfall",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5123] = {
		["ID"] = 5123,
		["FactionRestriction"] = nil,
		["Name"] = "The Final Piece",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5128] = {
		["ID"] = 5128,
		["FactionRestriction"] = nil,
		["Name"] = "Words of the High Chief",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5142] = {
		["ID"] = 5142,
		["FactionRestriction"] = nil,
		["Name"] = "Little Pamela",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5147] = {
		["ID"] = 5147,
		["FactionRestriction"] = "Horde",
		["Name"] = "WANTED: Arnak Grimtotem",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5151] = {
		["ID"] = 5151,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hypercapacitor Gizmo",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5153] = {
		["ID"] = 5153,
		["FactionRestriction"] = nil,
		["Name"] = "A Strange Historian",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5154] = {
		["ID"] = 5154,
		["FactionRestriction"] = nil,
		["Name"] = "The Annals of Darrowshire",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5155] = {
		["ID"] = 5155,
		["FactionRestriction"] = nil,
		["Name"] = "Forces of Jaedenar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5156] = {
		["ID"] = 5156,
		["FactionRestriction"] = nil,
		["Name"] = "Verifying the Corruption",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5157] = {
		["ID"] = 5157,
		["FactionRestriction"] = nil,
		["Name"] = "Collection of the Corrupt Water",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5163] = {
		["ID"] = 5163,
		["FactionRestriction"] = nil,
		["Name"] = "Are We There, Yeti?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5168] = {
		["ID"] = 5168,
		["FactionRestriction"] = nil,
		["Name"] = "Heroes of Darrowshire",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5181] = {
		["ID"] = 5181,
		["FactionRestriction"] = nil,
		["Name"] = "Villains of Darrowshire",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5202] = {
		["ID"] = 5202,
		["FactionRestriction"] = nil,
		["Name"] = "A Strage Red Key",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5203] = {
		["ID"] = 5203,
		["FactionRestriction"] = nil,
		["Name"] = "Rescue From Jaedenar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5204] = {
		["ID"] = 5204,
		["FactionRestriction"] = nil,
		["Name"] = "Retribution of the Light",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5211] = {
		["ID"] = 5211,
		["FactionRestriction"] = nil,
		["Name"] = "Defenders of Darrowshire",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5216] = {
		["ID"] = 5216,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Target: Felstone Field",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5217] = {
		["ID"] = 5217,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Chillwind Camp",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5219] = {
		["ID"] = 5219,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Target: Dalson's Tears",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5220] = {
		["ID"] = 5220,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Chillwind Camp",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5222] = {
		["ID"] = 5222,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Target: Writhing Haunt",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5223] = {
		["ID"] = 5223,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Return to Chillwind Camp",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5225] = {
		["ID"] = 5225,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Target: Gahrron's Withering",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5226] = {
		["ID"] = 5226,
		["FactionRestriction"] = nil,
		["Name"] = "Return to Chillwind Camp",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5229] = {
		["ID"] = 5229,
		["FactionRestriction"] = "Horde",
		["Name"] = "Target: Felstone Field",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5230] = {
		["ID"] = 5230,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return to the Bulwark",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5231] = {
		["ID"] = 5231,
		["FactionRestriction"] = "Horde",
		["Name"] = "Target: Dalson's Tears",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5232] = {
		["ID"] = 5232,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return to the Bulwark",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5233] = {
		["ID"] = 5233,
		["FactionRestriction"] = "Horde",
		["Name"] = "Target: Writhing Haunt",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5234] = {
		["ID"] = 5234,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return to the Bulwark",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5235] = {
		["ID"] = 5235,
		["FactionRestriction"] = "Horde",
		["Name"] = "Target: Gahrron's Withering",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5236] = {
		["ID"] = 5236,
		["FactionRestriction"] = nil,
		["Name"] = "Return to the Bulwark",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5237] = {
		["ID"] = 5237,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mission Accomplished!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5238] = {
		["ID"] = 5238,
		["FactionRestriction"] = "Horde",
		["Name"] = "Mission Accomplished!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5242] = {
		["ID"] = 5242,
		["FactionRestriction"] = nil,
		["Name"] = "A Final Blow",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5245] = {
		["ID"] = 5245,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Troubled Spirits of Ke'Theril",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5246] = {
		["ID"] = 5246,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Fragments of the Past",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5247] = {
		["ID"] = 5247,
		["FactionRestriction"] = nil,
		["Name"] = "Fragments of the Past",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5248] = {
		["ID"] = 5248,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Tormented By the Past",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5252] = {
		["ID"] = 5252,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Remorseful Highborne",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5253] = {
		["ID"] = 5253,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Crystal of Zin-Malor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5261] = {
		["ID"] = 5261,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Eagan Peltskinner",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 85,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5264] = {
		["ID"] = 5264,
		["FactionRestriction"] = nil,
		["Name"] = "Lord Maxwell Tyrosus",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5321] = {
		["ID"] = 5321,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Sleeper Has Awakened",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5381] = {
		["ID"] = 5381,
		["FactionRestriction"] = nil,
		["Name"] = "Hand of Iruxos",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5385] = {
		["ID"] = 5385,
		["FactionRestriction"] = nil,
		["Name"] = "The Remains of Trey Lightforge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5386] = {
		["ID"] = 5386,
		["FactionRestriction"] = "Horde",
		["Name"] = "Catch of the Day",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5441] = {
		["ID"] = 5441,
		["FactionRestriction"] = "Horde",
		["Name"] = "Lazy Peons",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5464] = {
		["ID"] = 5464,
		["FactionRestriction"] = nil,
		["Name"] = "Menethil's Gift",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5481] = {
		["ID"] = 5481,
		["FactionRestriction"] = "Horde",
		["Name"] = "Gordo's Task",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5482] = {
		["ID"] = 5482,
		["FactionRestriction"] = "Horde",
		["Name"] = "Doom Weed",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5501] = {
		["ID"] = 5501,
		["FactionRestriction"] = nil,
		["Name"] = "Bone Collector",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5515] = {
		["ID"] = 5515,
		["FactionRestriction"] = "Horde",
		["Name"] = "Test of Strength",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5527] = {
		["ID"] = 5527,
		["FactionRestriction"] = nil,
		["Name"] = "A Reliquary of Purity",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5534] = {
		["ID"] = 5534,
		["FactionRestriction"] = nil,
		["Name"] = "Kim'jael's \"Missing\" Equipment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5535] = {
		["ID"] = 5535,
		["FactionRestriction"] = nil,
		["Name"] = "Spiritual Unrest",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5536] = {
		["ID"] = 5536,
		["FactionRestriction"] = nil,
		["Name"] = "A Land Filled with Hatred",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5537] = {
		["ID"] = 5537,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Skeletal Fragments",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5541] = {
		["ID"] = 5541,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ammo for Rumbleshot",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5542] = {
		["ID"] = 5542,
		["FactionRestriction"] = nil,
		["Name"] = "Demon Dogs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5543] = {
		["ID"] = 5543,
		["FactionRestriction"] = nil,
		["Name"] = "Blood Tinged Skies",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5544] = {
		["ID"] = 5544,
		["FactionRestriction"] = nil,
		["Name"] = "Carrion Grubbage",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5545] = {
		["ID"] = 5545,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Bundle of Trouble",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5561] = {
		["ID"] = 5561,
		["FactionRestriction"] = nil,
		["Name"] = "Kodo Roundup",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5581] = {
		["ID"] = 5581,
		["FactionRestriction"] = nil,
		["Name"] = "Portals of the Legion",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5623] = {
		["ID"] = 5623,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In Favor of the Light",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 90,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5624] = {
		["ID"] = 5624,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Garments of the Light",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5713] = {
		["ID"] = 5713,
		["FactionRestriction"] = "Alliance",
		["Name"] = "One Shot. One Kill.",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5722] = {
		["ID"] = 5722,
		["FactionRestriction"] = "Horde",
		["Name"] = "Searching for the Lost Satchel",
		["Zone"] = nil,
		["Level"] = 16,
		["XP"] = 1800,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5723] = {
		["ID"] = 5723,
		["FactionRestriction"] = "Horde",
		["Name"] = "Testing an Enemy's Strength",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 2150,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5724] = {
		["ID"] = 5724,
		["FactionRestriction"] = "Horde",
		["Name"] = "Returning the Lost Satchel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			5722
		},
		["LinkedQuests"] = {
		}
	},
	[5725] = {
		["ID"] = 5725,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Power to Destroy...",
		["Zone"] = nil,
		["Level"] = 16,
		["XP"] = 2950,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5726] = {
		["ID"] = 5726,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hidden Enemies",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5727] = {
		["ID"] = 5727,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hidden Enemies",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			5726
		},
		["LinkedQuests"] = {
		}
	},
	[5728] = {
		["ID"] = 5728,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hidden Enemies",
		["Zone"] = nil,
		["Level"] = 16,
		["XP"] = 2350,
		["PrereqQuests"] = {
			5727
		},
		["LinkedQuests"] = {
		}
	},
	[5741] = {
		["ID"] = 5741,
		["FactionRestriction"] = nil,
		["Name"] = "Sceptre of Light",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5761] = {
		["ID"] = 5761,
		["FactionRestriction"] = "Horde",
		["Name"] = "Slaying the Beast",
		["Zone"] = nil,
		["Level"] = 16,
		["XP"] = 2350,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5781] = {
		["ID"] = 5781,
		["FactionRestriction"] = nil,
		["Name"] = "Of Forgotten Memories",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5821] = {
		["ID"] = 5821,
		["FactionRestriction"] = nil,
		["Name"] = "Bodyguard for Hire",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5845] = {
		["ID"] = 5845,
		["FactionRestriction"] = nil,
		["Name"] = "Of Lost Honor",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5846] = {
		["ID"] = 5846,
		["FactionRestriction"] = nil,
		["Name"] = "Of Love and Family",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5863] = {
		["ID"] = 5863,
		["FactionRestriction"] = nil,
		["Name"] = "The Dunemaul Compound",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5902] = {
		["ID"] = 5902,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Plague Upon Thee",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5903] = {
		["ID"] = 5903,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Plague Upon Thee",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5904] = {
		["ID"] = 5904,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Plague Upon Thee",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[5943] = {
		["ID"] = 5943,
		["FactionRestriction"] = nil,
		["Name"] = "Gizelton Caravan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6004] = {
		["ID"] = 6004,
		["FactionRestriction"] = nil,
		["Name"] = "Unfinished Business",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6021] = {
		["ID"] = 6021,
		["FactionRestriction"] = nil,
		["Name"] = "Zaeldarr the Outcast",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6022] = {
		["ID"] = 6022,
		["FactionRestriction"] = "Horde",
		["Name"] = "To Kill With Purpose",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6023] = {
		["ID"] = 6023,
		["FactionRestriction"] = nil,
		["Name"] = "Unfinished Business",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6025] = {
		["ID"] = 6025,
		["FactionRestriction"] = nil,
		["Name"] = "Unfinished Business",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6026] = {
		["ID"] = 6026,
		["FactionRestriction"] = nil,
		["Name"] = "Book of the Ancients",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6031] = {
		["ID"] = 6031,
		["FactionRestriction"] = nil,
		["Name"] = "Runecloth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6032] = {
		["ID"] = 6032,
		["FactionRestriction"] = nil,
		["Name"] = "Sacred Cloth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6041] = {
		["ID"] = 6041,
		["FactionRestriction"] = nil,
		["Name"] = "When Smokey Sings, I Get Violent",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6042] = {
		["ID"] = 6042,
		["FactionRestriction"] = "Horde",
		["Name"] = "Un-Life's Little Annoyances",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6132] = {
		["ID"] = 6132,
		["FactionRestriction"] = nil,
		["Name"] = "Get Me Out of Here!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6133] = {
		["ID"] = 6133,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Ranger Lord's Behest",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6134] = {
		["ID"] = 6134,
		["FactionRestriction"] = nil,
		["Name"] = "Ghost-o-plasm Round Up",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6135] = {
		["ID"] = 6135,
		["FactionRestriction"] = "Horde",
		["Name"] = "Duskwing, Oh How I Hate Thee...",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6136] = {
		["ID"] = 6136,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Corpulent One",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6141] = {
		["ID"] = 6141,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Brother Anton",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6142] = {
		["ID"] = 6142,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Clam Bait",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6143] = {
		["ID"] = 6143,
		["FactionRestriction"] = "Horde",
		["Name"] = "Other Fish to Fry",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6146] = {
		["ID"] = 6146,
		["FactionRestriction"] = "Horde",
		["Name"] = "Nathanos' Ruse",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6147] = {
		["ID"] = 6147,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return to Nathanos",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6148] = {
		["ID"] = 6148,
		["FactionRestriction"] = "Horde",
		["Name"] = "Demetria",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6161] = {
		["ID"] = 6161,
		["FactionRestriction"] = nil,
		["Name"] = "Claim Rackmore's Treasure",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6162] = {
		["ID"] = 6162,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Husband's Last Battle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6164] = {
		["ID"] = 6164,
		["FactionRestriction"] = nil,
		["Name"] = "Augustus' Receipt Book",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6282] = {
		["ID"] = 6282,
		["FactionRestriction"] = "Horde",
		["Name"] = "Harpies Threaten",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6283] = {
		["ID"] = 6283,
		["FactionRestriction"] = "Horde",
		["Name"] = "Bloodfury Bloodline",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6284] = {
		["ID"] = 6284,
		["FactionRestriction"] = "Horde",
		["Name"] = "Arachnophobia",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6323] = {
		["ID"] = 6323,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ride to the Undercity",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 420,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6365] = {
		["ID"] = 6365,
		["FactionRestriction"] = "Horde",
		["Name"] = "Meats to Orgrimmar",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 210,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6381] = {
		["ID"] = 6381,
		["FactionRestriction"] = "Horde",
		["Name"] = "New Life",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6384] = {
		["ID"] = 6384,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ride to Orgrimmar",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 420,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6385] = {
		["ID"] = 6385,
		["FactionRestriction"] = "Horde",
		["Name"] = "Doras the Wind Rider Master",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 210,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6386] = {
		["ID"] = 6386,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return to the Crossroads",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 1050,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6389] = {
		["ID"] = 6389,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Plague Upon Thee",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6390] = {
		["ID"] = 6390,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Plague Upon Thee",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6393] = {
		["ID"] = 6393,
		["FactionRestriction"] = "Horde",
		["Name"] = "Elemental War",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6394] = {
		["ID"] = 6394,
		["FactionRestriction"] = "Horde",
		["Name"] = "Thazz'ril's Pick",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 450,
		["PrereqQuests"] = {
			5441
		},
		["LinkedQuests"] = {
		}
	},
	[6395] = {
		["ID"] = 6395,
		["FactionRestriction"] = "Horde",
		["Name"] = "Marla's Last Wish",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6401] = {
		["ID"] = 6401,
		["FactionRestriction"] = "Horde",
		["Name"] = "Kaya's Alive",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6421] = {
		["ID"] = 6421,
		["FactionRestriction"] = "Horde",
		["Name"] = "Boulderslide Ravine",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6441] = {
		["ID"] = 6441,
		["FactionRestriction"] = "Horde",
		["Name"] = "Satyr Horns",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6442] = {
		["ID"] = 6442,
		["FactionRestriction"] = "Horde",
		["Name"] = "Naga at the Zoram Strand",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6461] = {
		["ID"] = 6461,
		["FactionRestriction"] = "Horde",
		["Name"] = "Blood Feathers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6462] = {
		["ID"] = 6462,
		["FactionRestriction"] = "Horde",
		["Name"] = "Troll Charm",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6481] = {
		["ID"] = 6481,
		["FactionRestriction"] = "Horde",
		["Name"] = "Earthen Arise",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6482] = {
		["ID"] = 6482,
		["FactionRestriction"] = "Horde",
		["Name"] = "Freedom to Ruul",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6503] = {
		["ID"] = 6503,
		["FactionRestriction"] = "Horde",
		["Name"] = "ashenvale Outrunners",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6504] = {
		["ID"] = 6504,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Lost Pages",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6521] = {
		["ID"] = 6521,
		["FactionRestriction"] = "Horde",
		["Name"] = "An Unholy Alliance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			6522
		},
		["LinkedQuests"] = {
		}
	},
	[6522] = {
		["ID"] = 6522,
		["FactionRestriction"] = "Horde",
		["Name"] = "An Unholy Alliance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6523] = {
		["ID"] = 6523,
		["FactionRestriction"] = "Horde",
		["Name"] = "Protect Kaya",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6543] = {
		["ID"] = 6543,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Warsong Reports",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6544] = {
		["ID"] = 6544,
		["FactionRestriction"] = "Horde",
		["Name"] = "Torek's Assault",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6548] = {
		["ID"] = 6548,
		["FactionRestriction"] = "Horde",
		["Name"] = "Avenge My Village",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6561] = {
		["ID"] = 6561,
		["FactionRestriction"] = "Horde",
		["Name"] = "Blackfathom Villainy",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6563] = {
		["ID"] = 6563,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Essence of Aku'Mai",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6565] = {
		["ID"] = 6565,
		["FactionRestriction"] = "Horde",
		["Name"] = "Allegiance to the Old Gods",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6571] = {
		["ID"] = 6571,
		["FactionRestriction"] = "Horde",
		["Name"] = "Warsong Supplies",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6604] = {
		["ID"] = 6604,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Guardians of the Altar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6610] = {
		["ID"] = 6610,
		["FactionRestriction"] = nil,
		["Name"] = "Clamlette Surprise",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6621] = {
		["ID"] = 6621,
		["FactionRestriction"] = "Horde",
		["Name"] = "King of the Foulweald",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6626] = {
		["ID"] = 6626,
		["FactionRestriction"] = nil,
		["Name"] = "A Host of Evil",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6627] = {
		["ID"] = 6627,
		["FactionRestriction"] = "Horde",
		["Name"] = "Test of Lore",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			1154
		},
		["LinkedQuests"] = {
		}
	},
	[6629] = {
		["ID"] = 6629,
		["FactionRestriction"] = "Horde",
		["Name"] = "Kill Grundig Darkcloud",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6641] = {
		["ID"] = 6641,
		["FactionRestriction"] = "Horde",
		["Name"] = "Vorsha the Lasher",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6805] = {
		["ID"] = 6805,
		["FactionRestriction"] = nil,
		["Name"] = "Stormers and Rumblers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6845] = {
		["ID"] = 6845,
		["FactionRestriction"] = nil,
		["Name"] = "Uncovering Past Secrets",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6921] = {
		["ID"] = 6921,
		["FactionRestriction"] = "Horde",
		["Name"] = "Amongst the Ruins",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6922] = {
		["ID"] = 6922,
		["FactionRestriction"] = "Horde",
		["Name"] = "Baron Aquanis",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[6981] = {
		["ID"] = 6981,
		["FactionRestriction"] = nil,
		["Name"] = "The Glowing Shard",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7003] = {
		["ID"] = 7003,
		["FactionRestriction"] = nil,
		["Name"] = "Zapped Giants",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7028] = {
		["ID"] = 7028,
		["FactionRestriction"] = nil,
		["Name"] = "Twisted Evils",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7029] = {
		["ID"] = 7029,
		["FactionRestriction"] = "Horde",
		["Name"] = "Vyletongue Corruption",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7041] = {
		["ID"] = 7041,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Vyletongue Corruption",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7044] = {
		["ID"] = 7044,
		["FactionRestriction"] = nil,
		["Name"] = "Legends of Maraudon",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7046] = {
		["ID"] = 7046,
		["FactionRestriction"] = nil,
		["Name"] = "The Scepter of Celebras",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			7044
		},
		["LinkedQuests"] = {
		}
	},
	[7064] = {
		["ID"] = 7064,
		["FactionRestriction"] = "Horde",
		["Name"] = "Corruption of Earth and Seed",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7065] = {
		["ID"] = 7065,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Corruption of Earth and Seed",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7066] = {
		["ID"] = 7066,
		["FactionRestriction"] = nil,
		["Name"] = "Seed of Life",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7067] = {
		["ID"] = 7067,
		["FactionRestriction"] = nil,
		["Name"] = "The Pariah's Instructions",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7068] = {
		["ID"] = 7068,
		["FactionRestriction"] = "Horde",
		["Name"] = "Shadowshard Fragments",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7070] = {
		["ID"] = 7070,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Shadowshard Fragments",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7321] = {
		["ID"] = 7321,
		["FactionRestriction"] = "Horde",
		["Name"] = "Soothing Turtle Bisque",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7383] = {
		["ID"] = 7383,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crown of the Earth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7541] = {
		["ID"] = 7541,
		["FactionRestriction"] = "Horde",
		["Name"] = "Service to the Horde",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7701] = {
		["ID"] = 7701,
		["FactionRestriction"] = nil,
		["Name"] = "WANTED: Overseer Maltorius",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7704] = {
		["ID"] = 7704,
		["FactionRestriction"] = nil,
		["Name"] = "Look at the Size of It!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7721] = {
		["ID"] = 7721,
		["FactionRestriction"] = nil,
		["Name"] = "Fuel for the Zapping",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7722] = {
		["ID"] = 7722,
		["FactionRestriction"] = nil,
		["Name"] = "What the Flux?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7723] = {
		["ID"] = 7723,
		["FactionRestriction"] = nil,
		["Name"] = "Curse These Fat Fingers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7724] = {
		["ID"] = 7724,
		["FactionRestriction"] = nil,
		["Name"] = "Fiery Menace!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7727] = {
		["ID"] = 7727,
		["FactionRestriction"] = nil,
		["Name"] = "Incendosaurs? Whateverosaur is More Like It",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7728] = {
		["ID"] = 7728,
		["FactionRestriction"] = nil,
		["Name"] = "STOLEN: Smithing Tuyere and Lookout's Spyglass",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7729] = {
		["ID"] = 7729,
		["FactionRestriction"] = nil,
		["Name"] = "JOB OPPORTUNITY: Culling the Competition",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7730] = {
		["ID"] = 7730,
		["FactionRestriction"] = "Horde",
		["Name"] = "Zukk'ash Infestation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7731] = {
		["ID"] = 7731,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stinglasher",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7732] = {
		["ID"] = 7732,
		["FactionRestriction"] = "Horde",
		["Name"] = "Zukk'ash Report",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7733] = {
		["ID"] = 7733,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Improved Quality",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7734] = {
		["ID"] = 7734,
		["FactionRestriction"] = "Horde",
		["Name"] = "Improved Quality",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7735] = {
		["ID"] = 7735,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Pristine Yeti Hide",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7738] = {
		["ID"] = 7738,
		["FactionRestriction"] = "Horde",
		["Name"] = "Perfect Yeti Hide",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7815] = {
		["ID"] = 7815,
		["FactionRestriction"] = "Horde",
		["Name"] = "Snapjaws, Mon!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7816] = {
		["ID"] = 7816,
		["FactionRestriction"] = "Horde",
		["Name"] = "Gammerita, Mon!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7828] = {
		["ID"] = 7828,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stalking the Stalkers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7829] = {
		["ID"] = 7829,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hunt the Savages",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7830] = {
		["ID"] = 7830,
		["FactionRestriction"] = "Horde",
		["Name"] = "Avenging the Fallen",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7839] = {
		["ID"] = 7839,
		["FactionRestriction"] = "Horde",
		["Name"] = "Vilebranch Hooligans",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7840] = {
		["ID"] = 7840,
		["FactionRestriction"] = "Horde",
		["Name"] = "Lard Lost His Lunch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7844] = {
		["ID"] = 7844,
		["FactionRestriction"] = "Horde",
		["Name"] = "Cannibalistic Cousins",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7845] = {
		["ID"] = 7845,
		["FactionRestriction"] = "Horde",
		["Name"] = "Kidnapped Elder Torntusk!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7846] = {
		["ID"] = 7846,
		["FactionRestriction"] = "Horde",
		["Name"] = "Recover the Key!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7847] = {
		["ID"] = 7847,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return to Primal Torntusk",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7849] = {
		["ID"] = 7849,
		["FactionRestriction"] = "Horde",
		["Name"] = "Separation Anxiety",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7850] = {
		["ID"] = 7850,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dark Vessels",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7861] = {
		["ID"] = 7861,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wanted: Vile Priestess Hexx and Her Minions",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[7862] = {
		["ID"] = 7862,
		["FactionRestriction"] = "Horde",
		["Name"] = "Job Opening: Guard Captain of Revantusk Village",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8273] = {
		["ID"] = 8273,
		["FactionRestriction"] = "Horde",
		["Name"] = "Oran's Gratitude",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8277] = {
		["ID"] = 8277,
		["FactionRestriction"] = nil,
		["Name"] = "Deadly Desert Venom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8278] = {
		["ID"] = 8278,
		["FactionRestriction"] = nil,
		["Name"] = "Noggle's Last Hope",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8279] = {
		["ID"] = 8279,
		["FactionRestriction"] = nil,
		["Name"] = "The Twilight Lexicon",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8280] = {
		["ID"] = 8280,
		["FactionRestriction"] = nil,
		["Name"] = "Securing the Supply Lines",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8281] = {
		["ID"] = 8281,
		["FactionRestriction"] = nil,
		["Name"] = "Stepping Up Security",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8282] = {
		["ID"] = 8282,
		["FactionRestriction"] = nil,
		["Name"] = "Noggle's Lost Satchel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8283] = {
		["ID"] = 8283,
		["FactionRestriction"] = nil,
		["Name"] = "Wanted - Deatclasp, Terror of the Sands",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8284] = {
		["ID"] = 8284,
		["FactionRestriction"] = nil,
		["Name"] = "The Twilight Mystery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8287] = {
		["ID"] = 8287,
		["FactionRestriction"] = nil,
		["Name"] = "A Terrible Purpose",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8306] = {
		["ID"] = 8306,
		["FactionRestriction"] = nil,
		["Name"] = "Into The Maw of Madness",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8308] = {
		["ID"] = 8308,
		["FactionRestriction"] = nil,
		["Name"] = "Brann Bronzebeard's Lost Letter",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8309] = {
		["ID"] = 8309,
		["FactionRestriction"] = nil,
		["Name"] = "Glyph Chasing",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8310] = {
		["ID"] = 8310,
		["FactionRestriction"] = nil,
		["Name"] = "Breaking the Code",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8313] = {
		["ID"] = 8313,
		["FactionRestriction"] = nil,
		["Name"] = "Sharing the Knowledge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8314] = {
		["ID"] = 8314,
		["FactionRestriction"] = nil,
		["Name"] = "Unraveling the Mystery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8317] = {
		["ID"] = 8317,
		["FactionRestriction"] = nil,
		["Name"] = "Kitchen Assistance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8318] = {
		["ID"] = 8318,
		["FactionRestriction"] = nil,
		["Name"] = "Secret Communication",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8323] = {
		["ID"] = 8323,
		["FactionRestriction"] = nil,
		["Name"] = "True Believers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8365] = {
		["ID"] = 8365,
		["FactionRestriction"] = nil,
		["Name"] = "Pirate Hats Ahoy!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8366] = {
		["ID"] = 8366,
		["FactionRestriction"] = nil,
		["Name"] = "Southsea Shakedown",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8460] = {
		["ID"] = 8460,
		["FactionRestriction"] = nil,
		["Name"] = "Timbermaw Ally",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8461] = {
		["ID"] = 8461,
		["FactionRestriction"] = nil,
		["Name"] = "Deadwood of the North",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8464] = {
		["ID"] = 8464,
		["FactionRestriction"] = nil,
		["Name"] = "Winterfall Activity",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8470] = {
		["ID"] = 8470,
		["FactionRestriction"] = nil,
		["Name"] = "Deadwood Ritual Totem",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8741] = {
		["ID"] = 8741,
		["FactionRestriction"] = nil,
		["Name"] = "Winterfall Ritual Totem",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8929] = {
		["ID"] = 8929,
		["FactionRestriction"] = "Alliance",
		["Name"] = "In Search of Anthion",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8930] = {
		["ID"] = 8930,
		["FactionRestriction"] = "Horde",
		["Name"] = "In Search of Anthion",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[8946] = {
		["ID"] = 8946,
		["FactionRestriction"] = nil,
		["Name"] = "Proof of Life",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[9261] = {
		["ID"] = 9261,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Investigate the Scourge of Ironforge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[76156] = {
		["ID"] = 76156,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stalk With The Earthmother",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[76160] = {
		["ID"] = 76160,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stalk With The Earthmother",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[78132] = {
		["ID"] = 78132,
		["FactionRestriction"] = nil,
		["Name"] = "Dragonslayer's Helm",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[78133] = {
		["ID"] = 78133,
		["FactionRestriction"] = nil,
		["Name"] = "Dragonslayer's Shield",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[78134] = {
		["ID"] = 78134,
		["FactionRestriction"] = nil,
		["Name"] = "Dragonslayer's Lance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[79008] = {
		["ID"] = 79008,
		["FactionRestriction"] = "Alliance",
		["Name"] = "... and that note you found",
		["Zone"] = nil,
		["Level"] = 22,
		["XP"] = 1750,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[79229] = {
		["ID"] = 79229,
		["FactionRestriction"] = nil,
		["Name"] = "Highway Robbery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[79236] = {
		["ID"] = 79236,
		["FactionRestriction"] = nil,
		["Name"] = "Cherry for Your Thoughts?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[79242] = {
		["ID"] = 79242,
		["FactionRestriction"] = nil,
		["Name"] = "No Honor Among Thieves",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[79624] = {
		["ID"] = 79624,
		["FactionRestriction"] = nil,
		["Name"] = "Anyone Can Cook",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[81570] = {
		["ID"] = 81570,
		["FactionRestriction"] = nil,
		["Name"] = "Jarl Needs a Blade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86574] = {
		["ID"] = 86574,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Stonetalon Supply Run",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86576] = {
		["ID"] = 86576,
		["FactionRestriction"] = "Horde",
		["Name"] = "Bloodfury Trinkets",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86585] = {
		["ID"] = 86585,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Banner of the Fallen",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86613] = {
		["ID"] = 86613,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Excavation Tools",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86614] = {
		["ID"] = 86614,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Silver of the Waves",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86667] = {
		["ID"] = 86667,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Snowbound",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86757] = {
		["ID"] = 86757,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Slowing the Orc Advance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86758] = {
		["ID"] = 86758,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Twisting the Knife",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[86784] = {
		["ID"] = 86784,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sticks and Bones",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[87288] = {
		["ID"] = 87288,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Soft Saber Pelts",
		["Zone"] = "Teldrassil",
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[87318] = {
		["ID"] = 87318,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Hearts of the Lost",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[87491] = {
		["ID"] = 87491,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Spark of Freedom",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[87760] = {
		["ID"] = 87760,
		["FactionRestriction"] = "Alliance",
		["Name"] = "holy Diver",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[88756] = {
		["ID"] = 88756,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bring Back a Bang",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[88757] = {
		["ID"] = 88757,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Accessories of the Lost",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[88758] = {
		["ID"] = 88758,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Sentiments of the Lost",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[90902] = {
		["ID"] = 90902,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rediscovering the Light",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 85,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91723] = {
		["ID"] = 91723,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Delicate Instruments",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91724] = {
		["ID"] = 91724,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Delicate Instruments",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91725] = {
		["ID"] = 91725,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Stolen Enchanting Supplies",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91732] = {
		["ID"] = 91732,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Good Steel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91733] = {
		["ID"] = 91733,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Downstream",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91738] = {
		["ID"] = 91738,
		["FactionRestriction"] = "Alliance",
		["Name"] = "An Apple Treat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91740] = {
		["ID"] = 91740,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Croaky's Head",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91741] = {
		["ID"] = 91741,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Nibbled-On Book",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 85,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91743] = {
		["ID"] = 91743,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rascally Rodents",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 170,
		["PrereqQuests"] = {
			92124
		},
		["LinkedQuests"] = {
		}
	},
	[91745] = {
		["ID"] = 91745,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Mining Consultant",
		["Zone"] = nil,
		["Level"] = 3,
		["XP"] = 25,
		["PrereqQuests"] = {
			91743
		},
		["LinkedQuests"] = {
		}
	},
	[91746] = {
		["ID"] = 91746,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Elmpaw's Head",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91751] = {
		["ID"] = 91751,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rough Wolf Pelts",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91752] = {
		["ID"] = 91752,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Big Picture",
		["Zone"] = nil,
		["Level"] = 3,
		["XP"] = 320,
		["PrereqQuests"] = {
			91745
		},
		["LinkedQuests"] = {
		}
	},
	[91753] = {
		["ID"] = 91753,
		["FactionRestriction"] = "Alliance",
		["Name"] = "An Enchanting Lesson",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91758] = {
		["ID"] = 91758,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Follow That Kobold!",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 35,
		["PrereqQuests"] = {
			91752
		},
		["LinkedQuests"] = {
		}
	},
	[91772] = {
		["ID"] = 91772,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Shhh! We're Hunting Kobolds",
		["Zone"] = nil,
		["Level"] = 4,
		["XP"] = 360,
		["PrereqQuests"] = {
			91752
		},
		["LinkedQuests"] = {
		}
	},
	[91775] = {
		["ID"] = 91775,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Book Return",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 675,
		["PrereqQuests"] = {
			91772
		},
		["LinkedQuests"] = {
		}
	},
	[91920] = {
		["ID"] = 91920,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wild Eyes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[91921] = {
		["ID"] = 91921,
		["FactionRestriction"] = "Horde",
		["Name"] = "Return to Quinn (Again)",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92124] = {
		["ID"] = 92124,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Book Inventory",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 15,
		["PrereqQuests"] = {
			91741
		},
		["LinkedQuests"] = {
		}
	},
	[92335] = {
		["ID"] = 92335,
		["FactionRestriction"] = "Horde",
		["Name"] = "Carved Centaur Totems",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92401] = {
		["ID"] = 92401,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Frightened Request",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92415] = {
		["ID"] = 92415,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Remember That I Love You",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92421] = {
		["ID"] = 92421,
		["FactionRestriction"] = "Horde",
		["Name"] = "Light's Justice",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92422] = {
		["ID"] = 92422,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Wrath of Rath'mael",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92460] = {
		["ID"] = 92460,
		["FactionRestriction"] = nil,
		["Name"] = "Coming of Age",
		["Zone"] = nil,
		["Level"] = 1,
		["XP"] = 40,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92461] = {
		["ID"] = 92461,
		["FactionRestriction"] = nil,
		["Name"] = "Harmony in Balance",
		["Zone"] = nil,
		["Level"] = 1,
		["XP"] = 80,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92462] = {
		["ID"] = 92462,
		["FactionRestriction"] = nil,
		["Name"] = "Infestation Investigation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92463] = {
		["ID"] = 92463,
		["FactionRestriction"] = nil,
		["Name"] = "The Cirrusfly Queen",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92465] = {
		["ID"] = 92465,
		["FactionRestriction"] = nil,
		["Name"] = "Agitators",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92466] = {
		["ID"] = 92466,
		["FactionRestriction"] = "Horde",
		["Name"] = "Call of Earth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92470] = {
		["ID"] = 92470,
		["FactionRestriction"] = nil,
		["Name"] = "Foul Matriarch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92473] = {
		["ID"] = 92473,
		["FactionRestriction"] = nil,
		["Name"] = "Aggressive Encroachment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92515] = {
		["ID"] = 92515,
		["FactionRestriction"] = nil,
		["Name"] = "The Problem With Prideclaws",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92516] = {
		["ID"] = 92516,
		["FactionRestriction"] = nil,
		["Name"] = "Hippogryph Harassment",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92517] = {
		["ID"] = 92517,
		["FactionRestriction"] = nil,
		["Name"] = "The Criminal Element",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92519] = {
		["ID"] = 92519,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ward Restocking",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92528] = {
		["ID"] = 92528,
		["FactionRestriction"] = nil,
		["Name"] = "Among the Faithful",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92529] = {
		["ID"] = 92529,
		["FactionRestriction"] = nil,
		["Name"] = "Falaath Village",
		["Zone"] = nil,
		["Level"] = 8,
		["XP"] = 350,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92544] = {
		["ID"] = 92544,
		["FactionRestriction"] = nil,
		["Name"] = "Al'Aketh Thugs",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92550] = {
		["ID"] = 92550,
		["FactionRestriction"] = nil,
		["Name"] = "Havoc in the Highlands",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92551] = {
		["ID"] = 92551,
		["FactionRestriction"] = nil,
		["Name"] = "Stolen Supplies",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92553] = {
		["ID"] = 92553,
		["FactionRestriction"] = nil,
		["Name"] = "Restocking the Larders",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 410,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92640] = {
		["ID"] = 92640,
		["FactionRestriction"] = nil,
		["Name"] = "Desperate Times",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92642] = {
		["ID"] = 92642,
		["FactionRestriction"] = nil,
		["Name"] = "Disrupting Logistics",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92643] = {
		["ID"] = 92643,
		["FactionRestriction"] = nil,
		["Name"] = "The Turncoat",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92644] = {
		["ID"] = 92644,
		["FactionRestriction"] = nil,
		["Name"] = "Unfortunate News",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92645] = {
		["ID"] = 92645,
		["FactionRestriction"] = nil,
		["Name"] = "Breaking the Barrier",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92646] = {
		["ID"] = 92646,
		["FactionRestriction"] = "Horde",
		["Name"] = "Confront Lorthuna",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92679] = {
		["ID"] = 92679,
		["FactionRestriction"] = nil,
		["Name"] = "Blood Tithe",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92682] = {
		["ID"] = 92682,
		["FactionRestriction"] = nil,
		["Name"] = "Make Yourself Useful",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92683] = {
		["ID"] = 92683,
		["FactionRestriction"] = nil,
		["Name"] = "Flutterfly Dust",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92684] = {
		["ID"] = 92684,
		["FactionRestriction"] = nil,
		["Name"] = "Ornery Ornery Galestriders",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92685] = {
		["ID"] = 92685,
		["FactionRestriction"] = nil,
		["Name"] = "The Hills Have Eyes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92693] = {
		["ID"] = 92693,
		["FactionRestriction"] = nil,
		["Name"] = "Standing Our Ground",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92703] = {
		["ID"] = 92703,
		["FactionRestriction"] = nil,
		["Name"] = "Deliver the News",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92706] = {
		["ID"] = 92706,
		["FactionRestriction"] = nil,
		["Name"] = "WANTED: Bruuz",
		["Zone"] = nil,
		["Level"] = 20,
		["XP"] = 1950,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92707] = {
		["ID"] = 92707,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Giant in the Den",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92741] = {
		["ID"] = 92741,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Unwelcome Visitors",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92742] = {
		["ID"] = 92742,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Testing the Wells",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92744] = {
		["ID"] = 92744,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Murloc Gills",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			92742
		},
		["LinkedQuests"] = {
		}
	},
	[92745] = {
		["ID"] = 92745,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The State of the Mines",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			92744
		},
		["LinkedQuests"] = {
		}
	},
	[92747] = {
		["ID"] = 92747,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Moonbrook Espionage",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			92745
		},
		["LinkedQuests"] = {
		}
	},
	[92748] = {
		["ID"] = 92748,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Explosive Consultation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			92747
		},
		["LinkedQuests"] = {
		}
	},
	[92749] = {
		["ID"] = 92749,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Dynamite Plan",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			92748
		},
		["LinkedQuests"] = {
		}
	},
	[92750] = {
		["ID"] = 92750,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Detonation at a Distance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			92748
		},
		["LinkedQuests"] = {
		}
	},
	[92751] = {
		["ID"] = 92751,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Detonation at a Distance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			92750
		},
		["LinkedQuests"] = {
		}
	},
	[92752] = {
		["ID"] = 92752,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Explosive Consultation",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			92749,
			92751
		},
		["LinkedQuests"] = {
		}
	},
	[92753] = {
		["ID"] = 92753,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Destruction in Deadmines",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			92752
		},
		["LinkedQuests"] = {
		}
	},
	[92834] = {
		["ID"] = 92834,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Avenged Tenfold",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92840] = {
		["ID"] = 92840,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Catching Wind",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92849] = {
		["ID"] = 92849,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Missing Scholar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92850] = {
		["ID"] = 92850,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Missing Scholar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92867] = {
		["ID"] = 92867,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ground to Keep",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92872] = {
		["ID"] = 92872,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Dutiful Steps",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92880] = {
		["ID"] = 92880,
		["FactionRestriction"] = nil,
		["Name"] = "Return to Valanaar",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92909] = {
		["ID"] = 92909,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Harvesting the Harvesters",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[92947] = {
		["ID"] = 92947,
		["FactionRestriction"] = nil,
		["Name"] = "Making Our Move",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93065] = {
		["ID"] = 93065,
		["FactionRestriction"] = nil,
		["Name"] = "Preparing for Battle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93160] = {
		["ID"] = 93160,
		["FactionRestriction"] = nil,
		["Name"] = "The Forest's Bountry",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93165] = {
		["ID"] = 93165,
		["FactionRestriction"] = nil,
		["Name"] = "Mercy Falls on Deaf Ears",
		["Zone"] = nil,
		["Level"] = 13,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93172] = {
		["ID"] = 93172,
		["FactionRestriction"] = nil,
		["Name"] = "Free the Hollows",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93176] = {
		["ID"] = 93176,
		["FactionRestriction"] = "Alliance",
		["Name"] = "My Little Friends",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93224] = {
		["ID"] = 93224,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Carved Centaur Totems",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93317] = {
		["ID"] = 93317,
		["FactionRestriction"] = nil,
		["Name"] = "Crab Season",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93318] = {
		["ID"] = 93318,
		["FactionRestriction"] = nil,
		["Name"] = "WANTED: Vulgara the Insatiable",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 775,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93319] = {
		["ID"] = 93319,
		["FactionRestriction"] = nil,
		["Name"] = "Pilfered Windstones",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93320] = {
		["ID"] = 93320,
		["FactionRestriction"] = nil,
		["Name"] = "Tower Defense",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93429] = {
		["ID"] = 93429,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Blood of My Blood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93430] = {
		["ID"] = 93430,
		["FactionRestriction"] = nil,
		["Name"] = "Taking the Bait Back",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93465] = {
		["ID"] = 93465,
		["FactionRestriction"] = nil,
		["Name"] = "Notes on Draenethyst",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93552] = {
		["ID"] = 93552,
		["FactionRestriction"] = nil,
		["Name"] = "Harvesting Windstones",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93585] = {
		["ID"] = 93585,
		["FactionRestriction"] = "Alliance",
		["Name"] = "This Light of Mine",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93663] = {
		["ID"] = 93663,
		["FactionRestriction"] = "Horde",
		["Name"] = "Lost in Transit",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93735] = {
		["ID"] = 93735,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Broken Construct",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93736] = {
		["ID"] = 93736,
		["FactionRestriction"] = "Horde",
		["Name"] = "Unwelcome Spirits",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93737] = {
		["ID"] = 93737,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Broken Construct",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93738] = {
		["ID"] = 93738,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Broken Construct",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93740] = {
		["ID"] = 93740,
		["FactionRestriction"] = "Horde",
		["Name"] = "Blood for Blood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93746] = {
		["ID"] = 93746,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Firm Response",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93797] = {
		["ID"] = 93797,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Boughs in the Wild",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93835] = {
		["ID"] = 93835,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Confront Lorthuna",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93926] = {
		["ID"] = 93926,
		["FactionRestriction"] = nil,
		["Name"] = "The Western Watch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93927] = {
		["ID"] = 93927,
		["FactionRestriction"] = nil,
		["Name"] = "A Last Request",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93949] = {
		["ID"] = 93949,
		["FactionRestriction"] = nil,
		["Name"] = "Bugged",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93951] = {
		["ID"] = 93951,
		["FactionRestriction"] = nil,
		["Name"] = "A Little Beauty",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 480,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[93958] = {
		["ID"] = 93958,
		["FactionRestriction"] = nil,
		["Name"] = "The Inner Sanctum",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94411] = {
		["ID"] = 94411,
		["FactionRestriction"] = "Horde",
		["Name"] = "Meddlesome Mages",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94413] = {
		["ID"] = 94413,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Magical Affront",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 550,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94486] = {
		["ID"] = 94486,
		["FactionRestriction"] = nil,
		["Name"] = "Feathers for Binding",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94488] = {
		["ID"] = 94488,
		["FactionRestriction"] = nil,
		["Name"] = "The Ties That Bind",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94489] = {
		["ID"] = 94489,
		["FactionRestriction"] = nil,
		["Name"] = "The Wounds of Betrayal",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94490] = {
		["ID"] = 94490,
		["FactionRestriction"] = nil,
		["Name"] = "Ripped Missive",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94568] = {
		["ID"] = 94568,
		["FactionRestriction"] = nil,
		["Name"] = "The Cult's True Plans",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94896] = {
		["ID"] = 94896,
		["FactionRestriction"] = nil,
		["Name"] = "Aid For The Refugees",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[94897] = {
		["ID"] = 94897,
		["FactionRestriction"] = nil,
		["Name"] = "The Fate of a Loved One",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95041] = {
		["ID"] = 95041,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Data Hoarders",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95189] = {
		["ID"] = 95189,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crest of Lordaeron",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95195] = {
		["ID"] = 95195,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bloodied Insignia",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95204] = {
		["ID"] = 95204,
		["FactionRestriction"] = "Horde",
		["Name"] = "Crest of Lordaeron",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95212] = {
		["ID"] = 95212,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Never Saddle on Quality",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95214] = {
		["ID"] = 95214,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Stolen Blasting Powder",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95216] = {
		["ID"] = 95216,
		["FactionRestriction"] = "Horde",
		["Name"] = "The New Plague",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95250] = {
		["ID"] = 95250,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Abominable Creatures",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95314] = {
		["ID"] = 95314,
		["FactionRestriction"] = "Horde",
		["Name"] = "That Shadowvale Green Elixir",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 850,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95328] = {
		["ID"] = 95328,
		["FactionRestriction"] = "Horde",
		["Name"] = "Whispering Horror Residue",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95350] = {
		["ID"] = 95350,
		["FactionRestriction"] = "Horde",
		["Name"] = "Welcome to Azeroth",
		["Zone"] = nil,
		["Level"] = 13,
		["XP"] = 675,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95384] = {
		["ID"] = 95384,
		["FactionRestriction"] = nil,
		["Name"] = "Partial Mystical Notes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95494] = {
		["ID"] = 95494,
		["FactionRestriction"] = "Horde",
		["Name"] = "Bruised Pride and Lion Hides",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95495] = {
		["ID"] = 95495,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Hermit Tanner",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95507] = {
		["ID"] = 95507,
		["FactionRestriction"] = "Horde",
		["Name"] = "Vrang's Game",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95508] = {
		["ID"] = 95508,
		["FactionRestriction"] = "Horde",
		["Name"] = "Unwelcome Guests",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95534] = {
		["ID"] = 95534,
		["FactionRestriction"] = "Horde",
		["Name"] = "Strahnbrad Mystery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95621] = {
		["ID"] = 95621,
		["FactionRestriction"] = "Horde",
		["Name"] = "Trouble in the Valley",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95748] = {
		["ID"] = 95748,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Gurubashi Legends of Old",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95770] = {
		["ID"] = 95770,
		["FactionRestriction"] = "Horde",
		["Name"] = "Locating the Lost City",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95773] = {
		["ID"] = 95773,
		["FactionRestriction"] = "Horde",
		["Name"] = "Enemies in the Water",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95774] = {
		["ID"] = 95774,
		["FactionRestriction"] = "Horde",
		["Name"] = "Her Name Is Olgra",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95805] = {
		["ID"] = 95805,
		["FactionRestriction"] = "Horde",
		["Name"] = "Grace of An'she and Mu'sha",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95883] = {
		["ID"] = 95883,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Tortured Soul",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95885] = {
		["ID"] = 95885,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Offering of Blood",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95981] = {
		["ID"] = 95981,
		["FactionRestriction"] = "Horde",
		["Name"] = "Watching the Roads",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95998] = {
		["ID"] = 95998,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Great Outdoors",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 410,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[95999] = {
		["ID"] = 95999,
		["FactionRestriction"] = "Alliance",
		["Name"] = "WANTED: Incinerator Gar'im",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96137] = {
		["ID"] = 96137,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Ira's Dagger",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96138] = {
		["ID"] = 96138,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Merrick's Bow",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96139] = {
		["ID"] = 96139,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Valor Family",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96222] = {
		["ID"] = 96222,
		["FactionRestriction"] = nil,
		["Name"] = "Kran Hratha",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96390] = {
		["ID"] = 96390,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Nip 'Em in the Bud",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96391] = {
		["ID"] = 96391,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Underground Map",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96392] = {
		["ID"] = 96392,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Farsen's Watch",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96393] = {
		["ID"] = 96393,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Old Ironforge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
			96391
		},
		["LinkedQuests"] = {
		}
	},
	[96394] = {
		["ID"] = 96394,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Restless Dead",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96395] = {
		["ID"] = 96395,
		["FactionRestriction"] = "Alliance",
		["Name"] = "An Ancient Grudge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96403] = {
		["ID"] = 96403,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Important Heirlooms",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96408] = {
		["ID"] = 96408,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Visitor to Dun Morogh",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96604] = {
		["ID"] = 96604,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Great Outdoors",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 410,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96606] = {
		["ID"] = 96606,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Great Outdoors",
		["Zone"] = "Teldrassil",
		["Level"] = 6,
		["XP"] = 410,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96626] = {
		["ID"] = 96626,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Camping 101: Cooking",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96627] = {
		["ID"] = 96627,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Adventurer",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 410,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96630] = {
		["ID"] = 96630,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Adventurer",
		["Zone"] = "Teldrassil",
		["Level"] = 6,
		["XP"] = 410,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96634] = {
		["ID"] = 96634,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Camping 101: Cooking",
		["Zone"] = "Teldrassil",
		["Level"] = 6,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96652] = {
		["ID"] = 96652,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Adventurer",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 410,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96655] = {
		["ID"] = 96655,
		["FactionRestriction"] = "Horde",
		["Name"] = "Camping 101: Cooking",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96821] = {
		["ID"] = 96821,
		["FactionRestriction"] = "Horde",
		["Name"] = "Legging It",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 550,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96822] = {
		["ID"] = 96822,
		["FactionRestriction"] = "Horde",
		["Name"] = "For Honor",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 480,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96825] = {
		["ID"] = 96825,
		["FactionRestriction"] = "Horde",
		["Name"] = "This Fruit Could Bite Back",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 550,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96876] = {
		["ID"] = 96876,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ukor's Lost Pack",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96877] = {
		["ID"] = 96877,
		["FactionRestriction"] = "Horde",
		["Name"] = "Halikor's Hoof",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96897] = {
		["ID"] = 96897,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Cult of the Damned",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96898] = {
		["ID"] = 96898,
		["FactionRestriction"] = "Horde",
		["Name"] = "Remnants of War",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[96899] = {
		["ID"] = 96899,
		["FactionRestriction"] = "Horde",
		["Name"] = "Bandarion Keep",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 460,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97003] = {
		["ID"] = 97003,
		["FactionRestriction"] = "Horde",
		["Name"] = "Chol'aruk the Ravener",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97005] = {
		["ID"] = 97005,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Chol'aruk the Ravener",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97047] = {
		["ID"] = 97047,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Cook in the Cage",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97048] = {
		["ID"] = 97048,
		["FactionRestriction"] = nil,
		["Name"] = "Returning to Port",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97223] = {
		["ID"] = 97223,
		["FactionRestriction"] = "Horde",
		["Name"] = "Bloodtalon Matriarch",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 775,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97225] = {
		["ID"] = 97225,
		["FactionRestriction"] = "Horde",
		["Name"] = "Forgotten Loa Idols",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 775,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97236] = {
		["ID"] = 97236,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Fang of Githyiss",
		["Zone"] = "Teldrassil",
		["Level"] = 5,
		["XP"] = 450,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97242] = {
		["ID"] = 97242,
		["FactionRestriction"] = "Horde",
		["Name"] = "Yelmak's Medley",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 110,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97246] = {
		["ID"] = 97246,
		["FactionRestriction"] = "Horde",
		["Name"] = "Meal Appeal",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 110,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97249] = {
		["ID"] = 97249,
		["FactionRestriction"] = "Horde",
		["Name"] = "Favorite Food",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 110,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97250] = {
		["ID"] = 97250,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wrongly Blamed, Justly Corrected",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97253] = {
		["ID"] = 97253,
		["FactionRestriction"] = nil,
		["Name"] = "Parts and Pieces",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 1050,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97265] = {
		["ID"] = 97265,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hate the Hatefury",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97275] = {
		["ID"] = 97275,
		["FactionRestriction"] = "Horde",
		["Name"] = "Whuut's the Rush",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 800,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97277] = {
		["ID"] = 97277,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Grund and Gozwin",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97279] = {
		["ID"] = 97279,
		["FactionRestriction"] = "Horde",
		["Name"] = "Wayward Weapons",
		["Zone"] = nil,
		["Level"] = 2,
		["XP"] = 170,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97281] = {
		["ID"] = 97281,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Simmering Storm",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 875,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97282] = {
		["ID"] = 97282,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stormy Potential",
		["Zone"] = nil,
		["Level"] = 10,
		["XP"] = 850,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97284] = {
		["ID"] = 97284,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Vahlarriel's Vengeance",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97288] = {
		["ID"] = 97288,
		["FactionRestriction"] = "Horde",
		["Name"] = "Abominable Creatures",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97326] = {
		["ID"] = 97326,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rocks to Rests",
		["Zone"] = nil,
		["Level"] = 15,
		["XP"] = 550,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97328] = {
		["ID"] = 97328,
		["FactionRestriction"] = nil,
		["Name"] = "Anything of Value",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97329] = {
		["ID"] = 97329,
		["FactionRestriction"] = nil,
		["Name"] = "Where's the Key?",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97331] = {
		["ID"] = 97331,
		["FactionRestriction"] = nil,
		["Name"] = "Zimmix's Great Escape",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97359] = {
		["ID"] = 97359,
		["FactionRestriction"] = "Horde",
		["Name"] = "Silky Sutures",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97420] = {
		["ID"] = 97420,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Reduce, Reuse, Reconcile",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97538] = {
		["ID"] = 97538,
		["FactionRestriction"] = "Horde",
		["Name"] = "Pigments for Paints",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97558] = {
		["ID"] = 97558,
		["FactionRestriction"] = "Horde",
		["Name"] = "Hides for the Forsaken",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97905] = {
		["ID"] = 97905,
		["FactionRestriction"] = "Horde",
		["Name"] = "Camping 101: Herbalism",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97908] = {
		["ID"] = 97908,
		["FactionRestriction"] = "Horde",
		["Name"] = "Camping 101: Skinning",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97921] = {
		["ID"] = 97921,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Camping 101: Herbalism",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97935] = {
		["ID"] = 97935,
		["FactionRestriction"] = "Horde",
		["Name"] = "Camping 101: Mining",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97948] = {
		["ID"] = 97948,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Camping 101: Mining",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97953] = {
		["ID"] = 97953,
		["FactionRestriction"] = "Horde",
		["Name"] = "Camping 101: Enchanting",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97971] = {
		["ID"] = 97971,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Camping 101: Skinning",
		["Zone"] = nil,
		["Level"] = 6,
		["XP"] = 270,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97977] = {
		["ID"] = 97977,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Nature's Call",
		["Zone"] = "Teldrassil",
		["Level"] = 3,
		["XP"] = 250,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[97979] = {
		["ID"] = 97979,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Goddess Provides",
		["Zone"] = "Teldrassil",
		["Level"] = 1,
		["XP"] = 40,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98013] = {
		["ID"] = 98013,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Swelling Forces",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98025] = {
		["ID"] = 98025,
		["FactionRestriction"] = "Alliance",
		["Name"] = "WANTED: Jai'vhanel",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98027] = {
		["ID"] = 98027,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gleaming Crescent Necklace",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98028] = {
		["ID"] = 98028,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Baron Marinous",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98042] = {
		["ID"] = 98042,
		["FactionRestriction"] = "Alliance",
		["Name"] = "It's All Fun and Games Until...",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98059] = {
		["ID"] = 98059,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Hillsbread's Hoard",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98067] = {
		["ID"] = 98067,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Eyes of the Sentinels",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 650,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98069] = {
		["ID"] = 98069,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stolen Freewind Supplies",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98070] = {
		["ID"] = 98070,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stop the Screeching",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98071] = {
		["ID"] = 98071,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Brewer's Trade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98072] = {
		["ID"] = 98072,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crocs of the Sky",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98093] = {
		["ID"] = 98093,
		["FactionRestriction"] = "Horde",
		["Name"] = "Field to Clear",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98094] = {
		["ID"] = 98094,
		["FactionRestriction"] = "Horde",
		["Name"] = "Scout Support",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98095] = {
		["ID"] = 98095,
		["FactionRestriction"] = "Horde",
		["Name"] = "Valuable Vantages",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98155] = {
		["ID"] = 98155,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Pristine Pesterhide Pelts",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98156] = {
		["ID"] = 98156,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Packaged Pristine Pelts",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98197] = {
		["ID"] = 98197,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Spoils of War",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98208] = {
		["ID"] = 98208,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bloom of the Heavens",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98209] = {
		["ID"] = 98209,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bloom of the Heavens",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98216] = {
		["ID"] = 98216,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Understanding Our Present",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98221] = {
		["ID"] = 98221,
		["FactionRestriction"] = "Alliance",
		["Name"] = "From the Ashes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98223] = {
		["ID"] = 98223,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Old Habits",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98230] = {
		["ID"] = 98230,
		["FactionRestriction"] = "Alliance",
		["Name"] = "This Land Was Their Land",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98240] = {
		["ID"] = 98240,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Crimson Crate Delivery",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98245] = {
		["ID"] = 98245,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Razormaw Needling",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98246] = {
		["ID"] = 98246,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Trying Times",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98282] = {
		["ID"] = 98282,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Alchemical Hazards",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98283] = {
		["ID"] = 98283,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Carnage",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98291] = {
		["ID"] = 98291,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Death to the Dragonmaw",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98293] = {
		["ID"] = 98293,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Forced Disarmament",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98297] = {
		["ID"] = 98297,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Stopping the Cycle",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98298] = {
		["ID"] = 98298,
		["FactionRestriction"] = "Horde",
		["Name"] = "Arugal's Folly",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98299] = {
		["ID"] = 98299,
		["FactionRestriction"] = "Horde",
		["Name"] = "Stop the Spread",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98300] = {
		["ID"] = 98300,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Word to Ironforge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98310] = {
		["ID"] = 98310,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Gleaning Our Future",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98321] = {
		["ID"] = 98321,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Flintfire's Shipment",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98326] = {
		["ID"] = 98326,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Frosthowl",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98386] = {
		["ID"] = 98386,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Alther's Mill",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98387] = {
		["ID"] = 98387,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Blackrock Blockade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98389] = {
		["ID"] = 98389,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Light in the Darkness",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98391] = {
		["ID"] = 98391,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Sisterhood of Elune",
		["Zone"] = "Teldrassil",
		["Level"] = 10,
		["XP"] = 85,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98392] = {
		["ID"] = 98392,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Darkness in the Glade",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98403] = {
		["ID"] = 98403,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Twisted Hatred",
		["Zone"] = nil,
		["Level"] = 12,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98407] = {
		["ID"] = 98407,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Show of Force",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98417] = {
		["ID"] = 98417,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Vengeful Trail",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98418] = {
		["ID"] = 98418,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Shared Fury",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98423] = {
		["ID"] = 98423,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Treaty of Understanding",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98424] = {
		["ID"] = 98424,
		["FactionRestriction"] = "Horde",
		["Name"] = "Fizsprocket's Notes",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98427] = {
		["ID"] = 98427,
		["FactionRestriction"] = "Horde",
		["Name"] = "Ceasing Operations",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98430] = {
		["ID"] = 98430,
		["FactionRestriction"] = "Horde",
		["Name"] = "The Longwalkers",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98447] = {
		["ID"] = 98447,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Valor Family",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[98512] = {
		["ID"] = 98512,
		["FactionRestriction"] = nil,
		["Name"] = "Al'Aketh Assassins",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99046] = {
		["ID"] = 99046,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Lost Runner",
		["Zone"] = "Teldrassil",
		["Level"] = 9,
		["XP"] = 80,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99047] = {
		["ID"] = 99047,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Not Dead Yet",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 80,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99048] = {
		["ID"] = 99048,
		["FactionRestriction"] = "Horde",
		["Name"] = "A Missing Hand",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 80,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99049] = {
		["ID"] = 99049,
		["FactionRestriction"] = "Horde",
		["Name"] = "Threat from Below",
		["Zone"] = nil,
		["Level"] = 9,
		["XP"] = 390,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99050] = {
		["ID"] = 99050,
		["FactionRestriction"] = "Alliance",
		["Name"] = "The Great Tree Provides",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99051] = {
		["ID"] = 99051,
		["FactionRestriction"] = "Horde",
		["Name"] = "Threat from Below",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 875,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99052] = {
		["ID"] = 99052,
		["FactionRestriction"] = "Horde",
		["Name"] = "Threat from Below",
		["Zone"] = nil,
		["Level"] = 11,
		["XP"] = 1100,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99053] = {
		["ID"] = 99053,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Escaping Ban'ethil",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99080] = {
		["ID"] = 99080,
		["FactionRestriction"] = "Horde",
		["Name"] = "Drive Them Out",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99108] = {
		["ID"] = 99108,
		["FactionRestriction"] = "Horde",
		["Name"] = "Sparring Match",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99123] = {
		["ID"] = 99123,
		["FactionRestriction"] = "Horde",
		["Name"] = "Lost in the Shadows",
		["Zone"] = nil,
		["Level"] = 8,
		["XP"] = 700,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99127] = {
		["ID"] = 99127,
		["FactionRestriction"] = "Alliance",
		["Name"] = "A Net Disaster",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 480,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99128] = {
		["ID"] = 99128,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Slimy Menace",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 625,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99130] = {
		["ID"] = 99130,
		["FactionRestriction"] = "Alliance",
		["Name"] = "An Enticing Offer",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99134] = {
		["ID"] = 99134,
		["FactionRestriction"] = "Horde",
		["Name"] = "Dscipline",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99141] = {
		["ID"] = 99141,
		["FactionRestriction"] = "Horde",
		["Name"] = "Patience",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99142] = {
		["ID"] = 99142,
		["FactionRestriction"] = "Horde",
		["Name"] = "Tomb Weed",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99143] = {
		["ID"] = 99143,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Bottles and Baubles",
		["Zone"] = nil,
		["Level"] = 7,
		["XP"] = 480,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99144] = {
		["ID"] = 99144,
		["FactionRestriction"] = "Horde",
		["Name"] = "Seeking Refuge",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99152] = {
		["ID"] = 99152,
		["FactionRestriction"] = "Horde",
		["Name"] = "As Above, So Below",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99153] = {
		["ID"] = 99153,
		["FactionRestriction"] = "Horde",
		["Name"] = "The One That Got Away",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99156] = {
		["ID"] = 99156,
		["FactionRestriction"] = "Horde",
		["Name"] = "Rear Guard Patrol",
		["Zone"] = nil,
		["Level"] = 13,
		["XP"] = 900,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99159] = {
		["ID"] = 99159,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Finding Warmth",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99160] = {
		["ID"] = 99160,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rime's Wrath",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99161] = {
		["ID"] = 99161,
		["FactionRestriction"] = "Alliance",
		["Name"] = "Rime's Wrath",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	},
	[99411] = {
		["ID"] = 99411,
		["FactionRestriction"] = "Horde",
		["Name"] = "Kyle's Gone Missing!",
		["Zone"] = nil,
		["Level"] = -1,
		["XP"] = 0,
		["PrereqQuests"] = {
		},
		["LinkedQuests"] = {
		}
	}
}
