package com.adventnet.taskengine;
import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import com.adventnet.taskengine.TaskCompletionHandler;
import com.adventnet.taskengine.TaskContext;

public class BharathTaskCompletionHandler implements TaskCompletionHandler{
	
	private static Logger logger = Logger.getLogger("BharathTaskCompletionHandler");
	private static FileHandler fileHandler;
	static{
		try {
			fileHandler = new FileHandler("..\\logs\\taskCompletionHandler.log", true);
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
	
	@Override
	public void onFailure(TaskContext arg0) throws Exception {
		logger.warning("SampleTaskCompletionHandler Task failed");
	}

	@Override
	public void onSuccess(TaskContext arg0) throws Exception {
		logger.info("SampleTaskCompletionHandler Task completed Successfully");
	}

}
