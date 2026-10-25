package dev.misc;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;

public class FileIO {
	public static String readFile(File file) {
		if (!file.exists() || !file.isFile()) {
			return null;
		}
		
		StringBuilder output = new StringBuilder();
		try (BufferedReader fileReader = new BufferedReader(new FileReader(file))) {
			String currentLine;
			while ((currentLine = fileReader.readLine()) != null) {
				output.append(currentLine);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		return output.toString();
	}
	
	public static boolean writeFile(File file, String text) {
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}
		if (file.exists()) {
			file.delete();
		}
		
		try {
			file.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		
		try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file)))) {
			writer.write(text);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
}
