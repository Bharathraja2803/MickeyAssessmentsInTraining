

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adventnet.customview.CustomViewManager;
import com.adventnet.customview.CustomViewRequest;
import com.adventnet.customview.ViewData;
import com.adventnet.ds.query.Column;
import com.adventnet.ds.query.Criteria;
import com.adventnet.ds.query.Join;
import com.adventnet.ds.query.QueryConstants;
import com.adventnet.ds.query.SelectQuery;
import com.adventnet.ds.query.SelectQueryImpl;
import com.adventnet.ds.query.Table;
import com.adventnet.mfw.bean.BeanUtil;
import com.adventnet.model.table.CVTableModel;

/**
 * Servlet implementation class EmployeeWithSalaryLessThanUserInputServlet
 */
@WebServlet("/EmployeeWithSalaryLessThanUserInputServlet")
public class EmployeeWithSalaryLessThanUserInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int salaryMaxRange = -1;
		
		try{
			salaryMaxRange = Integer.parseInt(request.getParameter("salaryMaxRange"));
		}catch (NumberFormatException e) {
			session.setAttribute("salaryInvalid", "y");
			response.sendRedirect("index.jsp");
			return;
		}
		
		if(salaryMaxRange <= 0){
			session.setAttribute("salaryInvalid", "y");
			response.sendRedirect("index.jsp");
			return;
		}
		
		Table table = new Table("BHARATH_EMPLOYEE_DYNAMIC");
		SelectQuery sq = new SelectQueryImpl(table);
		sq.addJoin(new Join("BHARATH_EMPLOYEE_DYNAMIC", "BHARATH_EMP_SALARYDETAILS_DYNAMIC", new String[]{"EMPLOYEE_ID"}, 
		  new String[]{"EMPLOYEE_ID"}, Join.INNER_JOIN));
		sq.addSelectColumn(Column.getColumn("BHARATH_EMPLOYEE_DYNAMIC", "EMPLOYEE_ID"));
		sq.addSelectColumn(Column.getColumn("BHARATH_EMPLOYEE_DYNAMIC", "EMP_NAME"));
		sq.addSelectColumn(Column.getColumn("BHARATH_EMP_SALARYDETAILS_DYNAMIC", "SALARY"));
		Criteria criteria = new Criteria(new Column("BHARATH_EMP_SALARYDETAILS_DYNAMIC", "SALARY"), new Integer(salaryMaxRange), QueryConstants.LESS_THAN);

		sq.setCriteria(criteria);
		CustomViewRequest cvRequest = new CustomViewRequest(sq);

		CustomViewManager cvManager;
		try {
			cvManager = (CustomViewManager) BeanUtil.lookup("TableViewManager");
			ViewData viewData = cvManager.getData(cvRequest);
			CVTableModel model = (CVTableModel) viewData.getModel();
			
			session.setAttribute("model", model);
			response.sendRedirect("employeeSalaryQuery.jsp");
			return;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
