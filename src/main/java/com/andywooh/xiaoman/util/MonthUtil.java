package com.andywooh.xiaoman.util;
 
import java.util.Calendar;
 
/**
 * 
 * @author think
 *
 */
public class MonthUtil 
{
	public static String getCurrentMonth() {
		int year;
		int month;
		String currentMonth;

		Calendar calendar = Calendar.getInstance();
		year = calendar.get(Calendar.YEAR);
		month = calendar.get(Calendar.MONTH) + 1;
		currentMonth = year + "-" + ( month<10 ? "0" + month : month);
        return currentMonth;
    }
}