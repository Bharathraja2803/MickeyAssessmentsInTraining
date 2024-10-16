import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.mfw.bean.BeanUtil;
import com.adventnet.taskengine.Scheduler;

@WebServlet("/ConfigureAsynchronousScheduleUsingJavaServlet")
public class ConfigureAsynchronousScheduleUsingJavaServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//This will config the Asynchronous schedule after 10 seconds of server start
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter printWriter = response.getWriter();
		try {
			Scheduler s = (Scheduler) BeanUtil.lookup("Scheduler");
			s.executeAsynchronously("com.adventnet.taskengine.SampleTaskAsynchronousJava", 10000, null, null, -1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			printWriter.println(e.toString());
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			printWriter.println(e.toString());
		}
		
	}
	
}
