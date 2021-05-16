package javaFiles;

import java.time.*;
import java.time.format.DateTimeFormatter;

import java.time.format.DateTimeParseException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeConversion {
	
	public long getTime(String oldTime) throws Exception {
		LocalTime currentT = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String currentTime=currentT.format(formatter);

    SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
    Date date1 = format.parse(oldTime);
    Date date2 = format.parse(currentTime);
    long difference = date2.getTime() - date1.getTime();
    
    return difference/1000;
	}
	
	public String getTime(String time , String date) {
		DateConversion dc=new DateConversion();
		TimeConversion tc=new TimeConversion();
		FindDay findDay=new FindDay();
		long diffDate=dc.getDate(date);
		long diffTime;
		String timeShow="";
		try {
			diffTime = tc.getTime(time);
		
		
		if(diffDate>0){
			if(diffDate>365){
				timeShow=dc.getMonthYear(date);
			}else if(diffDate>7 && diffDate<=365){
				timeShow=dc.getDateMonth(date);
			}else if(diffDate>0 && diffDate<=7){
				if(diffDate==1 && diffTime<0){
					diffTime+=86400;
					if(diffTime>0 && diffTime<59){
						timeShow=diffTime+" seconds ago";
					}else if((diffTime/60)>0 && (diffTime/60)<59){
						timeShow=(diffTime/60)+" minutes ago";
					}else if((diffTime/3600)>0 && (diffTime/3600)<23){
						timeShow=(diffTime/3600)+" hours ago";
					}
				}else{
					timeShow=findDay.day(date);
				}
			}
			
		}else{
			if(diffTime>0 && diffTime<59){
				timeShow=diffTime+" seconds ago";
			}else if((diffTime/60)>0 && (diffTime/60)<59 || diffTime==60){
				timeShow=(diffTime/60)+" minutes ago";
			}else if((diffTime/3600)>0 && (diffTime/3600)<23){
				timeShow=(diffTime/3600)+" hours ago";
			}
		}} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return timeShow;
	}
}
