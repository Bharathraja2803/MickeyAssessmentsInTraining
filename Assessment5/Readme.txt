Assessment 5
DB: bharath_taskengine_task_db

Q1. 
module: BharathPeriodicScheduleXml
TableName: bharath_periodic_schedule_xml_table
TaskFileName: com.adventnet.taskengine.SampleTaskCalendarXml
Description: This will append the value to the table in every 10 seconds
eg. 
	bharath_taskengine_task_db=# select * from bharath_periodic_schedule_xml_table;
	 task_timing_id |    task_name_name     |     execution_time
	----------------+-----------------------+-------------------------
				  1 | SampleTaskPeriodicXml | 2024-10-15 12:48:23.953
				  2 | SampleTaskPeriodicXml | 2024-10-15 12:48:33.959
				  3 | SampleTaskPeriodicXml | 2024-10-15 12:48:43.972
				  4 | SampleTaskPeriodicXml | 2024-10-15 12:48:53.979
				  5 | SampleTaskPeriodicXml | 2024-10-15 12:49:03.993
				  6 | SampleTaskPeriodicXml | 2024-10-15 12:49:14.006
				  7 | SampleTaskPeriodicXml | 2024-10-15 12:49:24.017
				  8 | SampleTaskPeriodicXml | 2024-10-15 12:49:34.032
				  9 | SampleTaskPeriodicXml | 2024-10-15 12:49:44.043
	(9 rows)



Q2.
module: BharathPeriodicScheduleJava
TableName: bharath_periodic_schedule_java_table
TaskFileName: com.adventnet.taskengine.SampleTaskPeriodicJava
ServletLink: POST: http://localhost:8080/BharathTaskEnginePeriodicJavaConf/ConfigurePeriodicTaskUsingJavaServlet
Description: This will append the content in the table every one minute 
eg. 
	bharath_taskengine_task_db=# select * from bharath_periodic_schedule_java_table;
	 task_timing_id |     task_name_name     |     execution_time
	----------------+------------------------+-------------------------
				  1 | SampleTaskPeriodicJava | 2024-10-15 12:54:00.116
				  2 | SampleTaskPeriodicJava | 2024-10-15 12:55:00.12
				  3 | SampleTaskPeriodicJava | 2024-10-15 12:56:00.124
	(3 rows)


Q3.
module: BharathCalendarScheduleXml
Log file name: calendarXml.log
Log file path: MickeyLite\logs
TaskFileName: com.adventnet.taskengine.LoggingTaskCalendarXml
Description: This will append the log file content in every 10 seconds 
eg.
	Oct 15, 2024 1:12:51 PM com.adventnet.taskengine.LoggingTaskCalendarXml executeTask
	INFO: line: 1
	Oct 15, 2024 1:13:02 PM com.adventnet.taskengine.LoggingTaskCalendarXml executeTask
	INFO: line: 2
	Oct 15, 2024 1:13:12 PM com.adventnet.taskengine.LoggingTaskCalendarXml executeTask
	INFO: line: 3
	Oct 15, 2024 1:13:22 PM com.adventnet.taskengine.LoggingTaskCalendarXml executeTask
	INFO: line: 4
	Oct 15, 2024 1:13:32 PM com.adventnet.taskengine.LoggingTaskCalendarXml executeTask
	INFO: line: 5

Q4. 
module: BharathCalendarScheduleJava -> Since no table and task configuration is defined here so module is not required
Log file name: calendarJava.log
Log file path: MickeyLite\logs
TaskFileName: com.adventnet.taskengine.LoggingTaskCalendarJava
ServletLink: POST: http://localhost:8080/BharathTaskEngineCalendarJavaConf/ConfigureCalendarTaskUsingJavaServlet
Description: This will append the log file content every day at 12:01PM
eg. 
	Oct 14, 2024 12:01:00 AM com.adventnet.taskengine.LoggingTaskCalendarJava executeTask
	INFO: line: 1
	Oct 15, 2024 12:01:00 PM com.adventnet.taskengine.LoggingTaskCalendarJava executeTask
	INFO: line: 1

Q5. 
module: BharathAsynchronousTaskJava
TableName: bharath_asynchronous_task_java_table
ServletLink: POST: http://localhost:8080/BharathTaskEngineAsynchronousTask/ConfigureAsynchronousScheduleUsingJavaServlet
TaskFileName: com.adventnet.taskengine.SampleTaskAsynchronousJava
Description: This will add the entry to the table only once at 10th second of the server start time
eg.

	bharath_taskengine_task_db=# select * from bharath_asynchronous_task_java_table;
	 task_timing_id |       task_name_name       |     execution_time
	----------------+----------------------------+-------------------------
				  1 | SampleTaskAsynchronousJava | 2024-10-15 13:29:24.588
	(1 row)

6.
module: BharathTaskCompletionHandler
TableName: bharath_task_completion_handler_main_table
TaskCompletionHandlerFileName: taskCompletionHandler.log
TaskCompletionHandlerFilePath: MickeyLite\logs
Description: this will append the log file for the success and failure of task execution
eg.

main task:
	bharath_taskengine_task_db=# select * from bharath_task_completion_handler_main_table;
	 task_timing_id |       task_name_name        |     execution_time
	----------------+-----------------------------+-------------------------
				  1 | SampleTaskCompletionHandler | 2024-10-15 13:47:38.273
				  2 | SampleTaskCompletionHandler | 2024-10-15 13:47:48.386
	(2 rows)

Handler logs:
	Oct 15, 2024 1:47:38 PM com.adventnet.taskengine.BharathTaskCompletionHandler onSuccess
	INFO: SampleTaskCompletionHandler Task completed Successfully
	Oct 15, 2024 1:47:48 PM com.adventnet.taskengine.BharathTaskCompletionHandler onSuccess
	INFO: SampleTaskCompletionHandler Task completed Successfully

7. 
Module: BharathReminderTaskXml
RemainderTableName: bharath_remainder_xml_table
Log File name: remainderTaskMain.log
Log file path: MickeyLite\logs
ServletLink: POST: http://localhost:8080/BharathRemainderTaskConf/ConfigureRemainderTaskUsingJavaServlet
TaskFileName: com.adventnet.taskengine.LoggingTaskRemainderJava
Description: this will append the entry in the table a minute before appending the logs in the log file every day at 12:01PM
eg.
log file content:
	Oct 15, 2024 2:40:00 PM com.adventnet.taskengine.LoggingTaskRemainderJava executeTask
	INFO: line: 1

table remainder entry

	bharath_taskengine_task_db=# select * from bharath_remainder_xml_table;
	 remainder_id |       remainder_content        | remainder_execution_time
	--------------+--------------------------------+--------------------------
				1 | task will be added in 1 minute | 2024-10-15 12:00:00.897
	(1 row)