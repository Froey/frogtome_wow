package dev.misc.lua;

public abstract class LuaValue {
	private final LuaType type;
	
	public LuaValue(LuaType type) {
		this.type = type;
	}
	
	public LuaType getType() {
		return type;
	}
}
