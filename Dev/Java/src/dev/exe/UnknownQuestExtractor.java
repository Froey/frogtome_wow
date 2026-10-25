package dev.exe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import dev.data.Data;
import dev.data.DataQuest;
import dev.misc.FileIO;

public class UnknownQuestExtractor {
	public static void main(String[] args) {
		// Get our current records of known and unknown quests.
		Map<String, DataQuest> knownQuestMap = Data.getKnownQuests();
		Map<String, DataQuest> unknownQuestMap = Data.getUnknownQuests();
		if (knownQuestMap == null || unknownQuestMap == null) {
			System.err.println("Failed to get data in some capacity - exiting.");
			return;
		}
		
		// Reconcile any unknown quests with their known counterparts, if they exist; something got updated if a counterpart exists.
		Map<String, DataQuest> reconciledQuestMap = new HashMap<>();
		for (DataQuest unknownQuest : unknownQuestMap.values()) {
			DataQuest knownCounterpartQuest = knownQuestMap.get(unknownQuest.getId());
			if (knownCounterpartQuest != null) {
				String newId = unknownQuest.getId();
				
				String newFactionRestriction = unknownQuest.getFactionRestriction();
				if (unknownQuest.getFactionRestriction() != null && !unknownQuest.getFactionRestriction().equals(knownCounterpartQuest.getFactionRestriction())) {
					// Basically, either we know there's no faction restriction or there are mismatched faction restrictions (which means there are none).
					newFactionRestriction = null;
				}
				
				String newName = unknownQuest.getName();
				
				String newZone = unknownQuest.getZone();
				if (knownCounterpartQuest.getZone() != null) {
					System.out.println(knownCounterpartQuest.getZone());
					newZone = knownCounterpartQuest.getZone();
				}
				
				String newLevel = unknownQuest.getLevel();
				String newXp = unknownQuest.getXp();
				Set<String> newPrereqQuests = knownCounterpartQuest.getPrereqQuestIds();
				Set<String> newLinkedQuests = knownCounterpartQuest.getLinkedQuestIds();
				
				DataQuest reconciledQuest = new DataQuest(newId, newFactionRestriction, newName, newZone, newLevel, newXp, newPrereqQuests, newLinkedQuests);
				reconciledQuestMap.put(reconciledQuest.getId(), reconciledQuest);
			} else {
				reconciledQuestMap.put(unknownQuest.getId(), unknownQuest);
			}
		}
		
		// Merge the old quests and new quests by overwriting any old ones with new ones.
		Map<String, DataQuest> mergedQuestMap = new HashMap<>(knownQuestMap);
		for (DataQuest reconciledQuest : reconciledQuestMap.values()) {
			mergedQuestMap.put(reconciledQuest.getId(), reconciledQuest);
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
}
