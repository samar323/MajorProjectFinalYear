package javaFiles;

import java.io.*;

public class FindDay {
    
    public static String day(String date){
    	String dt[]=date.split("-");
    	int dateN[]=new int[dt.length];
        
        for(int i=0;i<dt.length;i++){
            dateN[i]=Integer.parseInt(dt[i]);
           
        }
        int q,m,k,j;
        String day;
        if(dateN[1]<3){
            m=dateN[1]+12;
            dateN[0]-=1;
        }else{
        m=dateN[1];
        }
        q=dateN[2];
        k=dateN[0]%100;
        j=dateN[0]/100;
        int a=26*(m+1)/10;
        int dayNum=(q+a+k+(k/4)+(j/4)+(5*j))%7;
        
        if(dayNum==0)
            day="Saturday";
        else if(dayNum==1)
            day="Sunday";
        else if(dayNum==2)
            day="Monday";
        else if(dayNum==3)
            day="Tuesday";
        else if(dayNum==4)
            day="Wednesday";
        else if(dayNum==5)
            day="Thursday";
        else 
            day="Friday";
       return day;
        
    }
    
}