package com.adventnet.taskengine;



import java.io.IOException;


import java.util.logging.FileHandler;

import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class LoggingTaskCalendarJava implements Task{
	private static Logger logger = Logger.getLogger("LoggingTaskCalendarJava");
	private static FileHandler fileHandler;
	static{
		
		try {
			fileHandler = new FileHandler("..\\logs\\calendarJava.log", true);
			fileHandler.setFormatter(new SimpleFormatter());
	    	logger.addHandler(fileHandler);
		} catch (SecurityException e) {
			logger.severe(e.toString());
		} catch (IOException e) {
			logger.severe(e.toString());
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
