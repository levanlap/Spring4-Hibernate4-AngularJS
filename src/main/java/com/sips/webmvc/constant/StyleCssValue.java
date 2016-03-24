package com.sips.webmvc.constant;

import java.util.HashMap;
import java.util.Map.Entry;

public class StyleCssValue {
	public static HashMap<String, String> map = new HashMap<String, String>();

	public StyleCssValue(HashMap<String, String> map) {
		super();
		map.put("nexus.marsala.css", "#985051");
		map.put("nexus.violet.css", "#653d87");
		map.put("nexus.turquoise.css", "#4FBFA8");
		map.put("nexus.green.css", "#01A147");
		map.put("nexus.red.css", "#da4d4d");
		map.put("nexus.lachuoi.css", "#82b440");
		StyleCssValue.map = map;
	}

	public String getCssLink(String value) {
		for (Entry<String, String> entry : map.entrySet()) {
			if (entry.getValue().equals(value)) {
				return entry.getKey();
			}
		}
		return null;
	}
	
	public String getCssColor(String key) {
		for (Entry<String, String> entry : map.entrySet()) {
			if (entry.getKey().equals(key)) {
				return entry.getValue();
			}
		}
		return null;
	}
}