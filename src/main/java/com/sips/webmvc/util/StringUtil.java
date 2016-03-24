package com.sips.webmvc.util;

import java.text.Normalizer;

public final class StringUtil {

	public static final String convertFriendURL(String str){
		// lowercase
		String friendURL = convertToAscii(str);
	
		// Beause san-pham- has created by system for beginning with product URLs
		if(friendURL.indexOf("san-pham-") == 0){
			friendURL = friendURL.replaceFirst("san-pham-", "");
		}
		
		// Beause tu-van- has created by system for beginning with blog URLs
		else if(friendURL.indexOf("tu-van-") == 0){
			friendURL = friendURL.replaceFirst("tu-van-", "");
		}
		
		return friendURL;
	}
	
	public static final String convertToAscii(String str){
		String friendURL = str;
		
		// lowercase
		friendURL = friendURL.trim().toLowerCase();
		
		// Normalize all characters and get rid of all diacritical marks (so that e.g. é, ö, à becomes e, o, a).
		friendURL = Normalizer.normalize(friendURL, Normalizer.Form.NFD);
		//friendURL = friendURL.replaceAll("[\\p{InCombiningDiacriticalMarks}]","");
		friendURL = friendURL.replaceAll("\\p{InCombiningDiacriticalMarks}+","");
		
		if(friendURL.lastIndexOf("?") == friendURL.length() - 1){
			friendURL = friendURL.substring(0, friendURL.length() - 1);
		}
		
		// Some special characters
		friendURL = friendURL.replaceAll("đ", "d");
		friendURL = friendURL.replaceAll("%20", "-");
		friendURL = friendURL.replaceAll("[ ?=&/]", "-");
		friendURL = friendURL.replaceAll("[-]{2,}", "-");
	
		return friendURL;
	}
	
	public static final String getSubString(String str, int length){
		if(str != null){
			if(str.length() < length){
				return str;
			}else{
				return str.substring(0, length);
			}
		}
		return str;
	}
	
}
