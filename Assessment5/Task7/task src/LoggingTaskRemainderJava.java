package com.adventnet.taskengine;



import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.logging.FileHandler;

import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;
import com.adventnet.persistence.DataObject;
import com.adventnet.persistence.Row;
import com.adventnet.persistence.WritableDataObject;

public class LoggingTaskRemainderJava implements Task{
	private static Logger logger = Logger.getLogger("LoggingTaskRemainderJava");
	private static FileHandler fileHandler;
	static{
		
		try {
			fileHandler = new FileHandler("..\\logs\\remainderTaskMain.log", true);
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

	@Override
	public int remindTask(TaskContext taskContext) throws TaskExecutionException {
		Row row = new Row("bharath_remainder_xml_table");
		row.set("remainder_content", "task will be added in 1 minute");
		row.set("remainder_execution_time", Timestamp.valueOf(LocalDateTime.now()));
		
		DataObject dataObject = new WritableDataObject();
		
		try{
			dataObject.addRow(row);
			DataAccess.add(dataObject);
		}catch(DataAccessException e){
			throw new RuntimeException(e);
		}
		
		
		return 0;
	}
	
	
	
}
