package com.taim.conduire.common;

import java.util.Random;
public class CommonUtil {

	public static synchronized String getOTP(int len){
		if(len > 0 && 10>=len){
			String numbers = "0123456789";
	        Random rndm_method = new Random();
	        char[] otp = new char[len];
	        for (int i = 0; i < len; i++){
	            otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));
	        }
	        return String.valueOf(otp);
		}
		return null;
    }
	
	
}
