package com.yc.wyyyy.util;



public class StringUtil {
	public static boolean isNull(String str){
		if(str==null || "".equals(str)){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isNull(String ... params){
		if(params!=null && params.length>0){
			for(String str:params){
				if(isNull(str)){
					return true;
				}
			}
			return false;
		}
		return true;
	}
}
