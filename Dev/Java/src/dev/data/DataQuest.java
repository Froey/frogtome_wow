package dev.data;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import dev.misc.lua.LuaDict;
import dev.misc.lua.LuaList;
import dev.misc.lua.LuaLiteral;
import dev.misc.lua.LuaValue;

public class DataQuest implements Comparable<DataQuest> {
	private final String id;
	private final String factionRestriction;
	private final String name;
	
	private final String zone;
	private final String level;
	
	private final String xp;
	
	private final Set<String> prereqQuestIds;
	private final Set<String> linkedQuestIds;
	
	public DataQuest(String id, String factionRestriction, String name, String zone, String level, String xp, Set<String> prereqQuestIds, Set<String> linkedQuestIds) {
		this.id = id;
		this.factionRestriction = factionRestriction;
		this.name = name;
		
		this.zone = zone;
		this.level = level;
		
		this.xp = xp;
		
		this.prereqQuestIds = new HashSet<>(prereqQuestIds);
		this.linkedQuestIds = new HashSet<>(linkedQuestIds);
	}
	
	public DataQuest(LuaDict questDict) {
		this.id = questDict.getLiteralValue("ID");
		this.factionRestriction = !questDict.getLiteralValue("FactionRestriction").equals("nil") ? questDict.getLiteralValue("FactionRestriction") : null;
		this.name = questDict.getLiteralValue("Name");
		
		this.zone = !questDict.getLiteralValue("Zone").equals("nil") ? questDict.getLiteralValue("Zone") : null;
		this.level = questDict.getLiteralValue("Level");
		
		this.xp = questDict.getLiteralValue("XP");
		
		this.prereqQuestIds = new HashSet<>();
		LuaList prereqQuestIdList = questDict.getList("PrereqQuests");
		if (prereqQuestIdList != null) {
			for (LuaValue prereqQuestIdItem : prereqQuestIdList.getItems()) {
				if (prereqQuestIdItem instanceof LuaLiteral prereqQuestIdLiteral) {
					prereqQuestIds.add(prereqQuestIdLiteral.getValue());
				}
			}
		}
		
		this.linkedQuestIds = new HashSet<>();
		LuaList linkedQuestIdList = questDict.getList("LinkedQuests");
		if (linkedQuestIdList != null) {
			for (LuaValue linkedQuestIdItem : linkedQuestIdList.getItems()) {
				if (linkedQuestIdItem instanceof LuaLiteral linkedQuestIdLiteral) {
					linkedQuestIds.add(linkedQuestIdLiteral.getValue());
				}
			}
		}
	}
	
	public String getId() {
		return id;
	}
	
	public String getFactionRestriction() {
		return factionRestriction;
	}
	
	public String getName() {
		return name;
	}
	
	public String getLevel() {
		return level;
	}
	
	public String getZone() {
		return zone;
	}
	
	public String getXp() {
		return xp;
	}
	
	public Set<String> getPrereqQuestIds() {
		return prereqQuestIds;
	}
	
	public Set<String> getLinkedQuestIds() {
		return linkedQuestIds;
	}
	
	public String getLuaCodeString(int indents) {
		List<String> lines = new ArrayList<>();
		
		lines.add("[" + Utils.getLuaStringValue(id) + "] = {");
		
		lines.add("\t[\"ID\"] = " + Utils.getLuaStringValue(id) + ",");
		lines.add("\t[\"FactionRestriction\"] = " + Utils.getLuaStringValue(factionRestriction) + ",");
		lines.add("\t[\"Name\"] = " + Utils.getLuaStringValue(name) + ",");
		
		lines.add("\t[\"Zone\"] = " + Utils.getLuaStringValue(zone) + ",");
		lines.add("\t[\"Level\"] = " + Utils.getLuaStringValue(level) + ",");
		
		lines.add("\t[\"XP\"] = " + Utils.getLuaStringValue(xp) + ",");
		
		lines.add("\t[\"PrereqQuests\"] = {");
		List<String> sortedPrereqQuestIds = prereqQuestIds.stream().sorted(Utils::compareStringsLikeIntegers).toList();
		for (int sortedIndex = 0; sortedIndex < sortedPrereqQuestIds.size(); sortedIndex++) {
			String lineToAdd = "\t\t" + sortedPrereqQuestIds.get(sortedIndex);
			if (sortedIndex < sortedPrereqQuestIds.size() - 1) {
				lineToAdd += ",";
			}
			lines.add(lineToAdd);
		}
		lines.add("\t},");
		
		lines.add("\t[\"LinkedQuests\"] = {");
		List<String> sortedLinkedQuestIds = linkedQuestIds.stream().sorted(Utils::compareStringsLikeIntegers).toList();
		for (int sortedIndex = 0; sortedIndex < sortedLinkedQuestIds.size(); sortedIndex++) {
			String lineToAdd = "\t\t" + sortedLinkedQuestIds.get(sortedIndex);
			if (sortedIndex < sortedLinkedQuestIds.size() - 1) {
				lineToAdd += ",";
			}
			lines.add(lineToAdd);
		}
		lines.add("\t}");
		
		lines.add("}");
		
		String printableString = "";
		for (int lineIndex = 0; lineIndex < lines.size(); lineIndex++) {
			String lineToAdd = lines.get(lineIndex);
			
			int indentsToAdd = indents;
			while (indentsToAdd-- > 0) {
				lineToAdd = "\t" + lineToAdd;
			}
			
			printableString += lineToAdd;
			if (lineIndex < lines.size() - 1) {
				printableString += "\n";
			}
		}
		
		return printableString;
	}

	@Override
	public int compareTo(DataQuest o) {
		return Utils.compareStringsLikeIntegers(id, o.id);
	}
}
