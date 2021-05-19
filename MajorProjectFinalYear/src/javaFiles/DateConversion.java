package javaFiles;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

public class DateConversion {
	public long getDate(String oldDate) {
		LocalDate date = LocalDate.now(); 
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String currentDate=date.format(formatter);
		LocalDate d1 = LocalDate.parse(oldDate, DateTimeFormatter.ISO_LOCAL_DATE);
        LocalDate d2 = LocalDate.parse(currentDate, DateTimeFormatter.ISO_LOCAL_DATE);
        
        Duration diff = Duration.between(d1.atStartOfDay(), d2.atStartOfDay());

        long diffDays = diff.toDays();
        
        return diffDays;
	}
	
	public String getDateMonth(String oldDate) {
		String month="";
		String dt[]=oldDate.split("-");
		int dateN[]=new int[dt.length];
        
        for(int i=0;i<dt.length;i++){
            dateN[i]=Integer.parseInt(dt[i]);
           
        }
		
        if(dateN[1]==1) {
        	month="Jan";
        }else if(dateN[1]==2) {
        	month="Feb";
        }else if(dateN[1]==3) {
        	month="Mar";
        }else if(dateN[1]==4) {
        	month="Apr";
        }else if(dateN[1]==5) {
        	month="May";
        }else if(dateN[1]==6) {
        	month="June";
        }else if(dateN[1]==7) {
        	month="Jul";
        }else if(dateN[1]==8) {
        	month="Aug";
        }else if(dateN[1]==9) {
        	month="Sep";
        }else if(dateN[1]==10) {
        	month="Oct";
        }else if(dateN[1]==11) {
        	month="Nov";
        }else {
        	month="Dec";
        }
        
        return month+" "+dateN[2];
		
	}
	
	public String getMonthYear(String oldDate) {
		String month="";
		String dt[]=oldDate.split("-");
		int dateN[]=new int[dt.length];
        
        for(int i=0;i<dt.length;i++){
            dateN[i]=Integer.parseInt(dt[i]);
           
        }
		
        if(dateN[1]==1) {
        	month="Jan";
        }else if(dateN[1]==2) {
        	month="Feb";
        }else if(dateN[1]==3) {
        	month="Mar";
        }else if(dateN[1]==4) {
        	month="Apr";
        }else if(dateN[1]==5) {
        	month="May";
        }else if(dateN[1]==6) {
        	month="June";
        }else if(dateN[1]==7) {
        	month="Jul";
        }else if(dateN[1]==8) {
        	month="Aug";
        }else if(dateN[1]==9) {
        	month="Sep";
        }else if(dateN[1]==10) {
        	month="Oct";
        }else if(dateN[1]==11) {
        	month="Nov";
        }else {
        	month="Dec";
        }
        
        return dateN[2]+" "+month+" "+dateN[0];
	}
}
