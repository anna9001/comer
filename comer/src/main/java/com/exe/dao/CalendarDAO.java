package com.exe.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.exe.dto.CalendarDTO;

@Service("CalDAO")
public class CalendarDAO {
	
	public Map<String,Integer> todayInfo(CalendarDTO calDTO){
		
		Map<String,Integer> today_Data = new HashMap<String, Integer>();
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat ysdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat msdf = new SimpleDateFormat("m");
		SimpleDateFormat dsdf = new SimpleDateFormat("dd");
		
		//연월일
		//cal.set(Integer.parseInt(calDTO.getYear()), Integer.parseInt(calDTO.getMonth())-1,1);
		
		int startDate = cal.getMinimum(java.util.Calendar.DATE);
		int endDate = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		int start = java.util.Calendar.DAY_OF_WEEK; //요일 
	
		int year = Integer.parseInt(ysdf.format(cal.getTime()));
		int month = Integer.parseInt(msdf.format(cal.getTime()));
		int todayDate = Integer.parseInt(dsdf.format(cal.getTime()));
		
		today_Data.put("startDate",startDate);
		today_Data.put("endDate",endDate);
		today_Data.put("start",start);
		today_Data.put("year",endDate);
		today_Data.put("month",month);
		today_Data.put("todayDate",todayDate);
		
		return today_Data;
	}

}
