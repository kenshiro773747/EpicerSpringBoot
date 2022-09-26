package com.epicer.util;

import java.util.Date;

public class Test {

	public static void main(String[] args) {
     
	 Tools tools = new Tools();
	 Date date = new Date();	
	 String result = tools.StringDateFromDate(date);
	 System.out.println(result);
		
	}

}
