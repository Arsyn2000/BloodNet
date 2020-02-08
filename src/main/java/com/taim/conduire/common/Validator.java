package com.taim.conduire.common;

import java.util.List;

public class Validator {

	@SuppressWarnings("rawtypes")
	public static boolean validateList(List listToValidate) {
		return listToValidate != null && listToValidate.size() > 0;
	}

	public static boolean validateObject(Object objectToValidate) {
		return objectToValidate != null;
	}

	public static boolean validateBlankString(String str) {
		return str != null && !str.equalsIgnoreCase("");
	}
}
