package com.bharath.training.working_out_queries_4;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adventnet.db.api.RelationalAPI;
import com.adventnet.ds.query.Column;
import com.adventnet.ds.query.Criteria;
import com.adventnet.ds.query.DataSet;
import com.adventnet.ds.query.Join;
import com.adventnet.ds.query.QueryConstants;
import com.adventnet.ds.query.QueryConstructionException;
import com.adventnet.ds.query.SelectQuery;
import com.adventnet.ds.query.SelectQueryImpl;
import com.adventnet.ds.query.Table;
import com.adventnet.ds.query.UnionQuery;
import com.adventnet.ds.query.UnionQueryImpl;

/**
 * Servlet implementation class GettingEmployeeWorkingInSalesAndPurchaseUsingUnionServlet
 */
@WebServlet("/GettingEmployeeWorkingInSalesAndPurchaseUsingJoinServlet")
public class GettingEmployeeWorkingInSalesAndPurchaseUsingJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RelationalAPI relationalAPI = RelationalAPI.getInstance();
		
		try {
			Connection connection = relationalAPI.getConnection();
			Table table = new Table("BHARATH_EMPLOYEE");
			SelectQuery selectQuery = new SelectQueryImpl(table);
			
			Column employeeColumns = new Column("BHARATH_EMPLOYEE", "*");
			Column departmentColumns = new Column("BHARATH_DEPARTMENT", "*");
			Column departmentEmployeeColumns = new Column("BHARATH_EMP_DEPARTMENT_MAPPING", "*");
			
			List<Column> columnsList = new ArrayList<>();
			columnsList.add(employeeColumns);
			columnsList.add(departmentColumns);
			columnsList.add(departmentEmployeeColumns);
			
			selectQuery.addSelectColumns(columnsList);
			
			Criteria departmentSalesPurchaseCriteria = new Criteria(new Column("BHARATH_DEPARTMENT", "DEPARTMENT_NAME"), "Sales", QueryConstants.EQUAL).or(new Criteria(new Column("BHARATH_DEPARTMENT", "DEPARTMENT_NAME"), "Purchase", QueryConstants.EQUAL));
			selectQuery.setCriteria(departmentSalesPurchaseCriteria);
			
			Join joinEmployeeWithDepartmentEmployeeMapping = new Join("BHARATH_EMPLOYEE", "BHARATH_EMP_DEPARTMENT_MAPPING", new String[]{"EMPLOYEE_ID"}, new String[]{"EMPLOYEE_ID"}, Join.INNER_JOIN);
			Join joinDepartmentWithDepartmentEmployeeMapping = new Join("BHARATH_EMP_DEPARTMENT_MAPPING", "BHARATH_DEPARTMENT", new String[]{"DEPARTMENT_ID"}, new String[]{"DEPARTMENT_ID"}, Join.INNER_JOIN);
			selectQuery.addJoin(joinEmployeeWithDepartmentEmployeeMapping);
			selectQuery.addJoin(joinDepartmentWithDepartmentEmployeeMapping);
			
			DataSet dataSet = relationalAPI.executeQuery(selectQuery, connection);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("dataSetForJoinQuery", dataSet);
			
			response.sendRedirect("viewEmployeeDetails.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (QueryConstructionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
