package dev.misc.lua;

public class LuaAttribute {
	private final String key;
	private final LuaValue value;
	
	public LuaAttribute(String key) {
		this(key, null);
	}
	
	public LuaAttribute(String key, LuaValue value) {
		this.key = key;
		this.value = value;
	}
	
	public String getKey() {
		return key;
	}
	
	public LuaValue getValue() {
		return value;
	}
	
	public LuaLiteral getValueAsLiteral() {
		if (value instanceof LuaLiteral literal) {
			return literal;
		}
		
		return null;
	}
	
	public LuaList getValueAsList() {
		if (value instanceof LuaList list) {
			return list;
		}
		
		return null;
	}
	
	public LuaDict getValueAsDict() {
		if (value instanceof LuaDict dict) {
			return dict;
		}
		
		return null;
	}
}
