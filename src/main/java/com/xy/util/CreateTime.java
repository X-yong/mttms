package com.xy.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CreateTime {
	public String createtime(){
		Date date = new Date();
		DateFormat dt1 = new SimpleDateFormat("yyyy-MM-dd");
		String time = dt1.format(date); 
		return  time;
	}
}
