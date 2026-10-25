package dev.misc.lua;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LuaDict extends LuaValue {
	private final Map<String, LuaAttribute> entries;
	
	public LuaDict() {
		super(LuaType.DICTIONARY);
		
		entries = new HashMap<>();
	}
	
	public Map<String, LuaAttribute> getEntries() {
		return new HashMap<>(entries);
	}
	
	public List<String> getKeys() {
		return new ArrayList<>(entries.keySet());
	}
	
	public List<LuaAttribute> getValues() {
		return new ArrayList<>(entries.values());
	}
	
	public LuaAttribute getEntry(String key) {
		return entries.get(key);
	}
	
	public String getLiteralValue(String key) {
		LuaLiteral literal = getLiteral(key);
		if (literal == null) {
			return null;
		}
		
		return literal.getValue();
	}
	
	public LuaLiteral getLiteral(String key) {
		if (!entries.containsKey(key)) {
			return null;
		}
		
		return entries.get(key).getValueAsLiteral();
	}
	
	public LuaList getList(String key) {
		if (!entries.containsKey(key)) {
			return null;
		}
		
		return entries.get(key).getValueAsList();
	}
	
	public LuaDict getDict(String key) {
		if (!entries.containsKey(key)) {
			return null;
		}
		
		return entries.get(key).getValueAsDict();
	}
	
	public void addEntry(LuaAttribute entry) {
		entries.put(entry.getKey(), entry);
	}
}
