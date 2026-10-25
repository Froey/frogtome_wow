package dev.data;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.misc.FileIO;
import dev.misc.lua.LuaAttribute;
import dev.misc.lua.LuaDict;
import dev.misc.lua.LuaValueParser;

public class Data {
	private static String ADDON_MAIN_FILE_NAME = "frogtome_wow.lua";
	private static String ADDON_QUEST_DATA_FILE_NAME = "quest_data.lua";
	
	private static String ADDON_ROOT_DIR_NAME = "frogtome_wow";
	private static String ADDON_DATA_DIR_NAME = "Data";
	
	private static String GAME_VERSION_ROOT_DIR_NAME = "_classic_beta_";
	private static String WTF_DIR_NAME = "WTF";
	private static String ACCOUNT_DIR_NAME = "Account";
	private static String SAVED_VARIABLES_DIR_NAME = "SavedVariables";
	
	public static Path getGameVersionRootDirPath() {
		// Specific to these scripts running within the addon folder.
		Path path = Paths.get("").toAbsolutePath();
		while (!path.getFileName().toString().equals(GAME_VERSION_ROOT_DIR_NAME) && path.getParent() != null && path.getParent().getFileName() != null) {
			path = path.getParent();
		}
		
		if (path.getParent() != null && path.getParent().getFileName() != null) {
			return path;
		}
		
		return null;
	}
	
	public static Path getAddonRootDirPath() {
		// Specific to these scripts running within the addon folder.
		Path path = Paths.get("").toAbsolutePath();
		while (!path.getFileName().toString().equals(ADDON_ROOT_DIR_NAME) && path.getParent() != null && path.getParent().getFileName() != null) {
			path = path.getParent();
		}
		
		if (path.getParent() != null && path.getParent().getFileName() != null) {
			return path;
		}
		
		return null;
	}
	
	public static File getQuestDataFile() {
		Path addonRootDirPath = getAddonRootDirPath();
		if (addonRootDirPath == null) {
			return null;
		}
		
		File addonDataDir = new File(addonRootDirPath.toFile(), ADDON_DATA_DIR_NAME);
		if (!addonDataDir.exists()) {
			return null;
		}
		
		File questDataFile = new File(addonDataDir, ADDON_QUEST_DATA_FILE_NAME);
		if (!questDataFile.exists()) {
			return null;
		}
		
		return questDataFile;
	}
	
	public static Map<String, DataQuest> getKnownQuests() {
		Map<String, DataQuest> knownQuestMap = new HashMap<>();
		
		LuaDict questDataDict = getQuestData();
		if (questDataDict == null) {
			return knownQuestMap;
		}
		
		for (LuaAttribute knownQuestAttribute : questDataDict.getValues()) {
			if (knownQuestAttribute.getValue() instanceof LuaDict knownQuestDict) {
				DataQuest knownQuest = new DataQuest(knownQuestDict);
				knownQuestMap.put(knownQuest.getId(), knownQuest);
			}
		}
		
		return knownQuestMap;
	}
	
	public static Map<String, DataQuest> getUnknownQuests() {
		Map<String, DataQuest> unknownQuestMap = new HashMap<>();
		
		List<LuaDict> savedDataDicts = getSavedData();
		if (savedDataDicts == null) {
			return unknownQuestMap;
		}
		
		for (LuaDict savedDataDict : savedDataDicts) {
			LuaAttribute devData = savedDataDict.getEntry("Dev");
			if (devData != null && devData.getValue() instanceof LuaDict devDataDict) {
				LuaAttribute unknownQuestData = devDataDict.getEntry("UnknownQuests");
				if (unknownQuestData != null && unknownQuestData.getValue() instanceof LuaDict unknownQuestDataDict) {
					for (LuaAttribute unknownQuestAttribute : unknownQuestDataDict.getValues()) {
						if (unknownQuestAttribute.getValue() instanceof LuaDict unknownQuestDict) {
							DataQuest unknownQuest = new DataQuest(unknownQuestDict);
							unknownQuestMap.put(unknownQuest.getId(), unknownQuest);
						}
					}
				}
			}
		}
		
		return unknownQuestMap;
	}
	
	private static List<File> getAccountSavedVariablesFiles() {
		Path gameVersionRootDirPath = getGameVersionRootDirPath();
		if (gameVersionRootDirPath == null) {
			return null;
		}
		
		File wtfDir = new File(gameVersionRootDirPath.toFile(), WTF_DIR_NAME);
		if (!wtfDir.exists()) {
			return null;
		}
		
		File accountDir = new File(wtfDir, ACCOUNT_DIR_NAME);
		if (!accountDir.exists()) {
			return null;
		}
		
		// Discover all accounts - not the "SavedVariables" folder right under this directory, but all other directories that contain one.
		List<File> accountSavedVariablesFiles = new ArrayList<>();
		for (File possibleAccountDir : accountDir.listFiles()) {
			if (possibleAccountDir.isDirectory() && !possibleAccountDir.getName().equals(SAVED_VARIABLES_DIR_NAME)) {
				File possibleAccountSavedVariablesFolder = new File(possibleAccountDir, SAVED_VARIABLES_DIR_NAME);
				if (!possibleAccountSavedVariablesFolder.exists()) {
					continue;
				}
				
				File accountSavedVariablesFile = new File(possibleAccountSavedVariablesFolder, ADDON_MAIN_FILE_NAME);
				if (accountSavedVariablesFile.exists()) {
					accountSavedVariablesFiles.add(accountSavedVariablesFile);
				}
			}
		}
		
		return accountSavedVariablesFiles;
	}
	
	private static List<LuaDict> getSavedData() {
		List<File> savedDataFiles = getAccountSavedVariablesFiles();
		if (savedDataFiles == null) {
			return null;
		}
		
		List<LuaDict> savedDataDicts = new ArrayList<>();
		for (File savedDataFile : savedDataFiles) {
			String rawSavedDataDict = FileIO.readFile(savedDataFile);
			if (rawSavedDataDict == null) {
				continue;
			}
			
			LuaAttribute savedDataAttribute = LuaValueParser.parse(rawSavedDataDict);
			if (savedDataAttribute == null) {
				continue;
			}
			
			if (savedDataAttribute.getValue() instanceof LuaDict savedDataDict) {
				savedDataDicts.add(savedDataDict);
			}
		}
		
		return savedDataDicts;
	}
	
	private static LuaDict getQuestData() {
		File questDataFile = getQuestDataFile();
		if (questDataFile == null) {
			return null;
		}
		
		String rawQuestDataDict = FileIO.readFile(questDataFile);
		if (rawQuestDataDict == null) {
			return null;
		}
		
		int dictStartIndex = rawQuestDataDict.indexOf("QuestData.Quests");
		if (dictStartIndex == -1) {
			return null;
		}
		
		rawQuestDataDict = rawQuestDataDict.substring(dictStartIndex);
		LuaAttribute questDataAttribute = LuaValueParser.parse(rawQuestDataDict);
		if (questDataAttribute == null) {
			return null;
		}
		
		if (questDataAttribute.getValue() instanceof LuaDict questDataDict) {
			return questDataDict;
		}
		
		return null;
	}
}
