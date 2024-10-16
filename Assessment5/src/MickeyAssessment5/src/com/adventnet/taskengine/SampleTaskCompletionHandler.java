package com.adventnet.taskengine;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;
import com.adventnet.persistence.DataObject;
import com.adventnet.persistence.Row;
import com.adventnet.persistence.WritableDataObject;
import com.adventnet.taskengine.Task;
import com.adventnet.taskengine.TaskContext;
import com.adventnet.taskengine.TaskExecutionException;


public class SampleTaskCompletionHandler implements Task {
	
	//This is the task method to insert the record in bharath_task_timing_check table in every 10 seconds
	@Override
	public void executeTask(TaskContext arg0) throws TaskExecutionException {
		
		Row row = new Row("bharath_task_completion_handler_main_table");
		row.set("task_name_name", this.getClass().getSimpleName());
		row.set("execution_time", Timestamp.valueOf(LocalDateTime.now()));
		
		DataObject dataObject = new WritableDataObject();
		try {
			dataObject.addRow(row);
			DataAccess.add(dataObject);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

	@Override
	public void stopTask() throws TaskExecutionException {
		// TODO Auto-generated method stub
		
	}

}
