

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.mfw.bean.BeanUtil;
import com.adventnet.persistence.DataObject;
import com.adventnet.persistence.Persistence;
import com.adventnet.persistence.Row;
import com.adventnet.taskengine.CALENDAR;
import com.adventnet.taskengine.SCHEDULE;
import com.adventnet.taskengine.SCHEDULEDTASK_RETRY;
import com.adventnet.taskengine.SCHEDULED_TASK;
import com.adventnet.taskengine.Scheduler;
import com.adventnet.taskengine.TASKENGINE_TASK;
import com.adventnet.taskengine.TASK_INPUT;
import com.adventnet.taskengine.util.CalendarRowConfig;

@WebServlet("/ConfigureRemainderTaskUsingJavaServlet")
public class ConfigureRemainderTaskUsingJavaServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter printWriter = resp.getWriter();
		try{
			Persistence pers = (Persistence) BeanUtil.lookup("Persistence");
			DataObject data = pers.constructDataObject();



			Row taskengineRow = new Row(TASKENGINE_TASK.TABLE);
			taskengineRow.set(TASKENGINE_TASK.TASK_NAME_IDX, "LoggingTaskRemainderJava");
			taskengineRow.set(TASKENGINE_TASK.CLASS_NAME_IDX, "com.adventnet.taskengine.LoggingTaskRemainderJava");



			Row scheduleRow = new Row(SCHEDULE.TABLE);
			scheduleRow.set(SCHEDULE.SCHEDULE_NAME_IDX,"testing");

			Row scheduledTaskRow = new Row(SCHEDULED_TASK.TABLE);
			scheduledTaskRow.set(SCHEDULED_TASK.SCHEDULE_ID_IDX,scheduleRow.get(SCHEDULE.SCHEDULE_ID_IDX));
			scheduledTaskRow.set(SCHEDULED_TASK.TASK_ID_IDX,taskengineRow.get(TASKENGINE_TASK.TASK_ID_IDX));
			scheduledTaskRow.set(SCHEDULED_TASK.AUDIT_FLAG,new Boolean(true));
			scheduledTaskRow.set(SCHEDULED_TASK.REMIND_BEFORE,1);
			scheduledTaskRow.set(SCHEDULED_TASK.RETRY_HANDLER,"com.adventnet.taskengine.internal.DefaultScheduleRetryHandler");
			Row scheduledTaskRetryRow = new Row(SCHEDULEDTASK_RETRY.TABLE);
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.SCHEDULE_ID_IDX ,scheduleRow.get(SCHEDULE.SCHEDULE_ID_IDX));
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.TASK_ID_IDX,taskengineRow.get(TASKENGINE_TASK.TASK_ID_IDX));
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.RETRY_COUNT,2);
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.RETRY_FACTOR,10);
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.RETRY_TIME_PERIOD,30);
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.RETRY_UNIT_OF_TIME,"minutes");
			
			data.addRow(scheduledTaskRetryRow);

			CalendarRowConfig calRowConf = new CalendarRowConfig();

			calRowConf.setSkipFrequency(2);

			calRowConf.setScheduleType("DAILY");
			calRowConf.setFirstDayOfWeek(1);
			calRowConf.setExecutionTime(12,01,00);

			Row calendarRow = calRowConf.toCalendarRow();
			calendarRow.set(CALENDAR.SCHEDULE_ID_IDX, scheduleRow.get(SCHEDULE.SCHEDULE_ID_IDX));
			data.addRow(taskengineRow);
			data.addRow(scheduleRow);
			data.addRow(calendarRow);
			data.addRow(scheduledTaskRow);
			pers.add(data);


			Scheduler s = (Scheduler) BeanUtil.lookup("Scheduler");
			DataObject taskInputDO = pers.constructDataObject();
			Row taskInputRow = new Row(TASK_INPUT.TABLE);
			taskInputDO.addRow(taskInputRow);


			s.scheduleTask("testing","LoggingTaskRemainderJava",taskInputDO);
		
		}catch(Exception e){
			printWriter.println(e.toString());
		}
	}
	
}
