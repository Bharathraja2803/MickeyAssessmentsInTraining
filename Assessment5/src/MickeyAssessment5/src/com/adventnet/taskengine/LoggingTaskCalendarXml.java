package com.adventnet.taskengine;



import java.io.IOException;


import java.util.logging.FileHandler;

import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class LoggingTaskCalendarXml implements Task{
	private static Logger logger = Logger.getLogger("LoggingTaskCalendarXml");
	private static FileHandler fileHandler;
	static{
		
		try {
			fileHandler = new FileHandler("..\\logs\\calendarXml.log", true);
			fileHandler.setFormatter(new SimpleFormatter());
	    	logger.addHandler(fileHandler);
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	private static int counter = 1;
	@Override
	public void executeTask(TaskContext arg0) throws TaskExecutionException {
		logger.info("line: "+ counter++);
	}

	@Override
	public void stopTask() throws TaskExecutionException {
		
		
	}

	
}
