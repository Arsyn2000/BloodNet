package com.taim.utils;

import java.util.HashMap;

public class AmazonUtils {
	private static HashMap <String, String> marketPlaceMap  = new HashMap<String, String>();
	static {
		marketPlaceMap.put("A2EUQ1WTGCTBG2", "CA");
		marketPlaceMap.put("ATVPDKIKX0DER", "US");
		marketPlaceMap.put("A1AM78C64UM0Y8", "MX");
		marketPlaceMap.put("A1PA6795UKMFR9", "DE");
		marketPlaceMap.put("A1RKKUPIHCS9HS", "ES");
		marketPlaceMap.put("A13V1IB3VIYZZH", "FR");
		marketPlaceMap.put("A21TJRUUN4KGV", "IN");
		marketPlaceMap.put("APJ6JRA9NG5V4", "IT");
		marketPlaceMap.put("A1F83G8C2ARO7P", "UK");
		marketPlaceMap.put("A1VC38T7YXB528", "JP");
		marketPlaceMap.put("AAHKV2X7AFYLW", "CN");
	}
	
	public static String getMarketPlaceNameById(String id){
		return marketPlaceMap.get(id);
	}
}
