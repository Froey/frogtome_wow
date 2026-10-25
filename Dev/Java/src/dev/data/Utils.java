package dev.data;

public class Utils {
	public static String getLuaStringValue(String value) {
		return getLuaStringValue(value, false);
	}
	
	public static String getLuaStringValue(String value, boolean addParentheses) {
		return getLuaStringValue(value, addParentheses, true);
	}
	
	public static String getLuaStringValue(String value, boolean addParentheses, boolean replaceEmptyWithNull) {
		if (replaceEmptyWithNull && value != null && ((addParentheses && value.isEmpty()) || (!addParentheses && value.equals("\"\"")))) {
			value = null;
		}
		
		if (value == null) {
			return "nil";
		}
		
		if (addParentheses) {
			value = "\"" + value + "\"";
		}
		
		return value;
	}
	
	public static int compareStringsLikeIntegers(String i1, String i2) {
		return Integer.compare(Integer.parseInt(i1), Integer.parseInt(i2));
	}
}
