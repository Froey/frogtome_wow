package dev.misc.lua;

import java.util.ArrayList;
import java.util.List;

public class LuaList extends LuaValue {
	private final List<LuaValue> items;
	
	public LuaList() {
		super(LuaType.LIST);
		
		this.items = new ArrayList<>();
	}
	
	public List<LuaValue> getItems() {
		return new ArrayList<>(items);
	}
	
	public void addItem(LuaValue item) {
		items.add(item);
	}
}
