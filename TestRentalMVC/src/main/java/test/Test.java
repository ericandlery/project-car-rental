package test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Test {

	public static void main(String[] args) throws ParseException {
		System.out.println("test start");
		
		for(int i=0;i<1000;i++) {
		System.out.println((int)Math.floor(Math.random()*10));
		}

		System.out.println("test end");

	}

}