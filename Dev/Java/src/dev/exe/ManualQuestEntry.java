package dev.exe;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import dev.data.Data;
import dev.data.DataQuest;
import dev.misc.FileIO;

public class ManualQuestEntry {
	public static void main(String[] args) {
		// Get our current records of known and unknown quests.
		Map<String, DataQuest> knownQuestMap = Data.getKnownQuests();
		if (knownQuestMap == null) {
			System.err.println("Failed to get data in some capacity - exiting.");
			return;
		}
		
		// Get the quests we're manually entering.
		Map<String, DataQuest> manualQuests = readInManualQuests();
		
		// Print the sorted list of IDs to add to the corresponding zone in ZoneData
		System.out.println("\t\t{");
		List<DataQuest> sortedManualQuests = manualQuests.values().stream().sorted().toList();
		for (int sortedManualQuestIndex = 0; sortedManualQuestIndex < sortedManualQuests.size(); sortedManualQuestIndex++) {
			String zoneDataLine = "\t\t\t" + sortedManualQuests.get(sortedManualQuestIndex).getId();
			if (sortedManualQuestIndex < sortedManualQuests.size() - 1) {
				zoneDataLine += ",";
			}
			
			System.out.println(zoneDataLine);
		}
		System.out.println("\t\t},");
		
		// Merge the old quests and new quests by overwriting any old ones with new ones.
		Map<String, DataQuest> mergedQuestMap = new HashMap<>(knownQuestMap);
		for (DataQuest manualQuest : sortedManualQuests) {
			if (!mergedQuestMap.containsKey(manualQuest.getId())) {
				mergedQuestMap.put(manualQuest.getId(), manualQuest);
			}
		}
		
		// Sort the quests for printing order.
		List<DataQuest> sortedMergedQuests = mergedQuestMap.values().stream().sorted().toList();
		
		// Create the Lua code to write out.
		String luaCode = "local _, Frogtome = ...\nif not Frogtome.Data then\n\tFrogtome.Data = {}\nend\nFrogtome.Data.QuestData = {}\n\nlocal QuestData = Frogtome.Data.QuestData\n\nQuestData.Quests = {\n";
		for (int questIndex = 0; questIndex < sortedMergedQuests.size(); questIndex++) {
			luaCode += sortedMergedQuests.get(questIndex).getLuaCodeString(1);
			if (questIndex < sortedMergedQuests.size() - 1) {
				luaCode += ",";
			}
			luaCode += "\n";
		}
		luaCode += "}\n";
		
		FileIO.writeFile(Data.getQuestDataFile(), luaCode);
	}
	
	private static Map<String, DataQuest> readInManualQuests() {
		String zone = "Winterspring";
		
		String alliance = "Alliance";
		String horde = "Horde";
		String nil = null;
		
		Map<String, DataQuest> manualQuests = new HashMap<>();
		
		addManualQuest(manualQuests, "The Hinterlands", alliance, 1469, "Rhapsody's Tale");
		addManualQuest(manualQuests, "Dustwallow Marsh", alliance, 1475, "Into The Temple of Atal'Hakkar", 1469);
		
		addManualQuest(manualQuests, "Feralas", alliance, 4141, "Muigin and Larion");
		addManualQuest(manualQuests, "Feralas", alliance, 4142, "A Visit to Gregan", 4141);
		addManualQuest(manualQuests, "Feralas", alliance, 4143, "Haze of Evil", 4142);
		
		addManualQuest(manualQuests, "Swamp of Sorrows", horde, 1424, "Pool of Tears");
		addManualQuest(manualQuests, "Swamp of Sorrows", horde, 1429, "The Atal'ai Exile", 1424);
		addManualQuest(manualQuests, "Swamp of Sorrows", horde, 1444, "Return to Fel'Zerul", 1429);
		addManualQuest(manualQuests, "Swamp of Sorrows", horde, 1445, "The Temple of Atal'Hakkar", 1444);
		
		addManualQuest(manualQuests, "Feralas", horde, 4145, "Larion and Muigin");
		addManualQuest(manualQuests, "Feralas", horde, 4147, "Marvon's Workshop", 4145);
		addManualQuest(manualQuests, "The Barrens", horde, 4146, "Zapper Fuel", 4147);
		
		addManualQuest(manualQuests, "Feralas", alliance, 3445, "The Sunken Temple"); // link
		addManualQuest(manualQuests, "Feralas", horde, 3380, "The Sunken Temple"); // link
		addManualQuest(manualQuests, "Tanaris", nil, 3444, "The Stone Circle", 3445);
		addManualQuest(manualQuests, "Tanaris", nil, 3446, "Into the Depths", 3444);
		addManualQuest(manualQuests, "Tanaris", nil, 3447, "Secret of the Circle", 3444);
		
		addManualQuest(manualQuests, "The Hinterlands", nil, 1446, "Jammal'an the Prophet");
		
		addManualQuest(manualQuests, "The Temple of Atal'Hakkar", nil, 3373, "The Essence of Eranikus");
		
		addManualQuest(manualQuests, "The Interlands", nil, 4787, "The Ancient Egg", 3527);
		addManualQuest(manualQuests, "The Interlands", nil, 3528, "The God Hakkar", 4787);
		
		return manualQuests;
	}
	
	private static void addManualQuest(Map<String, DataQuest> manualQuests, String zone, String faction, int id, String name, int... prereqIds) {
		if (faction != null) {
			faction = "\"" + faction + "\"";
		}
		name = "\"" + name + "\"";
		if (zone != null) {
			zone = "\"" + zone + "\"";
		}
		
		Set<String> prereqQuestIds = new HashSet<>();
		for (int prereqId : prereqIds) {
			prereqQuestIds.add(Integer.toString(prereqId));
		}
		
		DataQuest manualQuest = new DataQuest(Integer.toString(id), faction, name, zone, "-1", "0", prereqQuestIds, new HashSet<>());
		if (!manualQuests.containsKey(manualQuest.getId())) {
			manualQuests.put(manualQuest.getId(), manualQuest);
		} else {
			System.err.println("COLLISION: [" + id + "] " + name);
		}
	}
}
