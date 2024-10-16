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
import com.adventnet.taskengine.PERIODIC;
import com.adventnet.taskengine.SCHEDULE;
import com.adventnet.taskengine.SCHEDULEDTASK_RETRY;
import com.adventnet.taskengine.SCHEDULED_TASK;
import com.adventnet.taskengine.Scheduler;
import com.adventnet.taskengine.TASKENGINE_TASK;
import com.adventnet.taskengine.TASK_INPUT;

@WebServlet("/ConfigurePeriodicTaskUsingJavaServlet")
public class ConfigurePeriodicTaskUsingJavaServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter printWriter = response.getWriter();
		try {
			Persistence pers = (Persistence) BeanUtil.lookup("Persistence");
			DataObject data = pers.constructDataObject();
			Row taskengineRow = new Row(TASKENGINE_TASK.TABLE);
			taskengineRow.set(TASKENGINE_TASK.TASK_NAME_IDX,"PeriodJavaTask");
			taskengineRow.set(TASKENGINE_TASK.CLASS_NAME_IDX,"com.adventnet.taskengine.SampleTaskPeriodicJava");
			
			
			Row scheduleRow = new Row(SCHEDULE.TABLE);
			scheduleRow.set(SCHEDULE.SCHEDULE_NAME_IDX,"SamplePeriodicJavaSchedule");

			Row scheduledTaskRow = new Row(SCHEDULED_TASK.TABLE);
			scheduledTaskRow.set(SCHEDULED_TASK.SCHEDULE_ID_IDX,scheduleRow.get(SCHEDULE.SCHEDULE_ID_IDX));
			scheduledTaskRow.set(SCHEDULED_TASK.TASK_ID_IDX,taskengineRow.get(TASKENGINE_TASK.TASK_ID_IDX));
			scheduledTaskRow.set(SCHEDULED_TASK.RETRY_HANDLER,"com.adventnet.taskengine.internal.DefaultScheduleRetryHandler");
			
			Row scheduledTaskRetryRow = new Row(SCHEDULEDTASK_RETRY.TABLE);
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.SCHEDULE_ID_IDX ,scheduleRow.get(SCHEDULE.SCHEDULE_ID_IDX));
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.TASK_ID_IDX,taskengineRow.get(TASKENGINE_TASK.TASK_ID_IDX));
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.RETRY_COUNT,5);
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.RETRY_FACTOR,5);
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.RETRY_TIME_PERIOD,10);
			scheduledTaskRetryRow.set(SCHEDULEDTASK_RETRY.RETRY_UNIT_OF_TIME,"seconds");
			data.addRow(scheduledTaskRetryRow);

			Row periodicRow = new Row(PERIODIC.TABLE);
			periodicRow.set(PERIODIC.SCHEDULE_ID_IDX, scheduleRow.get(SCHEDULE.SCHEDULE_ID_IDX));
			periodicRow.set(PERIODIC.START_DATE_IDX,"2024-10-14 09:35:00.0");
			// java.sql.Timestamp object.
			periodicRow.set(PERIODIC.END_DATE_IDX,"2024-10-20 01:00:00.0");
			// java.sql.Timestamp object.
			periodicRow.set(PERIODIC.TIME_PERIOD_IDX,1);
			periodicRow.set(PERIODIC.UNIT_OF_TIME_IDX,"minutes");

			data.addRow(taskengineRow);
			data.addRow(scheduleRow);
			data.addRow(periodicRow);
			data.addRow(scheduledTaskRow);
			pers.add(data);
			
			Scheduler s = (Scheduler) BeanUtil.lookup("Scheduler");
			DataObject taskInputDO = pers.constructDataObject();
			Row taskInputRow = new Row(TASK_INPUT.TABLE);
			taskInputDO.addRow(taskInputRow);

			// If needed, you can also add 'Default_Task_Input' rows to the above taskInputDO

			s.scheduleTask("SamplePeriodicJavaSchedule","PeriodJavaTask",taskInputDO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			printWriter.println(e.toString());
		}


	}
	
}
