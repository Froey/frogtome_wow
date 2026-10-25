package dev.misc.lua;

public class LuaLiteral extends LuaValue {
	private final String value;
	
	public LuaLiteral(String value) {
		super(LuaType.LITERAL);
		
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
}
