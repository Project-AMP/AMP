package com.jj.util;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class CheckDayOfWeek {

	LocalDate date;
	DayOfWeek dayOfWeek;
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String checkDay[];
	ArrayList<String[]> list = new ArrayList<String[]>();

	Calendar cal = Calendar.getInstance();
	
	String dow[];
	String sDay;
	String eDay;	
	String nextDay = "";
	String day="";
	String nowDate = dateFormat.format(new Date());
	
	
	public CheckDayOfWeek(String time ,String sDate,String eDate){
		dow= (time.split("\\("))[0].split(",");
		sDay=sDate;
		eDay=eDate;
	}
	
	public ArrayList<String[]> getDow(){
		//시작 날짜 셋팅
		cal.set ( Integer.parseInt(sDay.split("-")[0]),Integer.parseInt(sDay.split("-")[1])-1,Integer.parseInt(sDay.split("-")[2]));

		while(!eDay.equals(nextDay)){
			
			
			day=dateFormat.format(cal.getTime());

			date = LocalDate.of(Integer.parseInt(day.split("-")[0]), Integer.parseInt(day.split("-")[1]), Integer.parseInt(day.split("-")[2]));
			// DayOfWeek 객체 구하기
			dayOfWeek = date.getDayOfWeek();
			
			for(int i=0; i<dow.length;i++) {
				if(dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.KOREAN).equals(dow[i])) {
					checkDay = new String [2];
					checkDay[0]=date+"";
					checkDay[1]=dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.KOREAN);
					list.add(checkDay);
				}
			}
				
			
			cal.add(Calendar.DATE, 1); //하루하루 더해준다.
			nextDay = dateFormat.format(cal.getTime()); //비교를 위한 값 셋팅
			if(nextDay.equals(nowDate))
				break;
		}
		
		day=dateFormat.format(cal.getTime());
		date = LocalDate.of(Integer.parseInt(day.split("-")[0]), Integer.parseInt(day.split("-")[1]), Integer.parseInt(day.split("-")[2]));
		// DayOfWeek 객체 구하기
		dayOfWeek = date.getDayOfWeek();
		
		for(int i=0; i<dow.length;i++) {
			if(dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.KOREAN).equals(dow[i])) {
				checkDay = new String [2];
				checkDay[0]=date+"";
				checkDay[1]=dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.KOREAN);
				list.add(checkDay);
			}
		}
		
		return list;
	}
	

}
