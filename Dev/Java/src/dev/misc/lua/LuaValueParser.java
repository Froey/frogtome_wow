package dev.misc.lua;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LuaValueParser {
	private static final Pattern LITERAL_NAME_AND_VALUE_PATTERN = Pattern.compile("\\s*[\\[]?\\s*[\\\"]?([A-Za-z0-9\\.\\-_]*)[\\\"]?\\s*[\\]]?\\s*=\\s*(.*)\\s*");
	private static final Pattern EMPTY_LIST_NAME_AND_ITEMS_PATTERN = Pattern.compile("\\s*[\\[]?\\s*[\\\"]?([A-Za-z0-9\\.\\-_]*)[\\\"]?\\s*[\\]]?\\s*=\\s*\\{\\s*\\}\\s*");
	private static final Pattern POULATED_LIST_NAME_AND_ITEMS_PATTERN = Pattern.compile("\\s*[\\[]?\\s*[\\\"]?([A-Za-z0-9\\.\\-_]*)[\\\"]?\\s*[\\]]?\\s*=\\s*\\{\\s*([^\\[].*)\\s*\\}\\s*");
	private static final Pattern DICT_NAME_AND_ENTRIES_PATTERN = Pattern.compile("\\s*[\\[]?\\s*[\\\"]?([A-Za-z0-9\\.\\-_]*)[\\\"]?\\s*[\\]]?\\s*=\\s*\\{\\s*([\\[].*)\\s*\\}\\s*");
	
	public static LuaAttribute parse(String rawLuaValue) {
		// STEP 1: Attempt to parse this as a dictionary, first and foremost.
		Matcher dictMatcher = DICT_NAME_AND_ENTRIES_PATTERN.matcher(rawLuaValue);
		if (dictMatcher.matches()) {
			String dictKey = dictMatcher.group(1);
			if (dictKey == null) {
				return null;
			}
			
			String dictEntries = dictMatcher.group(2);
			if (dictEntries == null) {
				return null;
			}
			
			LuaDict dict = parseDict(dictEntries);
			if (dict == null) {
				return null;
			}
			
			return new LuaAttribute(dictKey, dict);
		}
		
		// STEP 2: If not a dictionary, see if this is instead a (populated) list.
		Matcher populatedlistMatcher = POULATED_LIST_NAME_AND_ITEMS_PATTERN.matcher(rawLuaValue);
		if (populatedlistMatcher.matches()) {
			String listKey = populatedlistMatcher.group(1);
			if (listKey == null) {
				return null;
			}
			
			String listItems = populatedlistMatcher.group(2);
			if (listItems == null) {
				return null;
			}
			
			return new LuaAttribute(listKey, parseList(listItems));
		}
		
		// STEP 2.5: Also check for a possible empty list instead of a populated list.
		Matcher emptylistMatcher = EMPTY_LIST_NAME_AND_ITEMS_PATTERN.matcher(rawLuaValue);
		if (emptylistMatcher.matches()) {
			String listKey = emptylistMatcher.group(1);
			if (listKey == null) {
				return null;
			}
			
			return new LuaAttribute(listKey, new LuaList());
		}
		
		// STEP 3: If neither a dictionary nor a list, hopefully this can be parsed as a literal value.
		Matcher literMatcher = LITERAL_NAME_AND_VALUE_PATTERN.matcher(rawLuaValue);
		if (literMatcher.matches()) {
			String literalKey = literMatcher.group(1);
			if (literalKey == null) {
				return null;
			}
			
			String literalValue = literMatcher.group(2);
			if (literalValue == null) {
				return null;
			}
			
			return new LuaAttribute(literalKey, parseLiteral(literalValue));
		}
		
		System.err.println("FAILED TO PARSE: " + rawLuaValue);
		return null;
	}
	
	private static LuaLiteral parseLiteral(String literalValue) {
		return new LuaLiteral(literalValue);
	}  	
	
	private static LuaList parseList(String listItems) {
		LuaList list = new LuaList();
		
		for (String piece : parseLineIntoPieces(listItems)) {
			if (piece.isEmpty() || piece.isBlank()) {
				continue;
			}
			
			LuaAttribute wrappedItem = parse("[\"item\"] = " + piece.trim());
			if (wrappedItem == null) {
				continue;
			}
			
			LuaValue item = wrappedItem.getValue();
			list.addItem(item);
		}
		
		return list;
	}
	
	private static LuaDict parseDict(String dictEntries) {
		LuaDict dict = new LuaDict();
		
		for (String piece : parseLineIntoPieces(dictEntries)) {
			LuaAttribute entry = parse(piece);
			dict.addEntry(entry);
		}
		
		return dict;
	}
	
	private static List<String> parseLineIntoPieces(String line) {
		List<String> pieces = new ArrayList<>();
		
		boolean escaped = false;
		boolean withinQuotes = false;
		
		int curlyBracketsDepth = 0;
		
		int currentCharIndex = -1;
		int currentEntryStartIndex = -1;
		while (++currentCharIndex < line.length()) {
			char currentChar = line.charAt(currentCharIndex);
			
			if (currentEntryStartIndex == -1) {
				currentEntryStartIndex = currentCharIndex;
			}
			
			if (currentChar == '\\') {
				if (!escaped) {
					escaped = true;
					continue;
				}
			}
			
			if (escaped) {
				escaped = false;
				continue;
			}
			
			if (currentChar == '"') {
				if (withinQuotes) {
					withinQuotes = false;
				} else {
					withinQuotes = true;
				}
				continue;
			}
			
			if (withinQuotes) {
				continue;
			}
			
			if (currentChar == '{') {
				curlyBracketsDepth += 1;
				continue;
			}
			if (currentChar == '}') {
				curlyBracketsDepth -= 1;
				continue;
			}
			
			if (curlyBracketsDepth > 0) {
				continue;
			}
			
			if (curlyBracketsDepth < 0 || currentChar == ',') {
				if (currentCharIndex > currentEntryStartIndex) {
					pieces.add(line.substring(currentEntryStartIndex, currentCharIndex));
				}
				currentEntryStartIndex = -1;
			}
		}
		
		if (currentEntryStartIndex != -1 && currentCharIndex > currentEntryStartIndex) {
			pieces.add(line.substring(currentEntryStartIndex, currentCharIndex));
		}
		
		return pieces;
	}
}
