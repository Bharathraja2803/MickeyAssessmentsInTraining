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
import com.adventnet.ds.query.DataSet;
import com.adventnet.ds.query.GroupByClause;
import com.adventnet.ds.query.QueryConstructionException;
import com.adventnet.ds.query.SelectQuery;
import com.adventnet.ds.query.SelectQueryImpl;
import com.adventnet.ds.query.Table;


/**
 * Servlet implementation class GetEmployeeCountPerDepartmentSelectQueryServlet
 */
@WebServlet("/GetEmployeeCountPerDepartmentSelectQueryServlet")
public class GetEmployeeCountPerDepartmentSelectQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//select department_id , count(*) from BHARATH_EMP_DEPARTMENT_MAPPING group by department_id
		RelationalAPI relationalAPI = RelationalAPI.getInstance();
		

		Table table = new Table("BHARATH_EMP_DEPARTMENT_MAPPING");
		SelectQuery selectQuery = new SelectQueryImpl(table);
		Column departmentIdColumn = new Column("BHARATH_EMP_DEPARTMENT_MAPPING", "DEPARTMENT_ID");
		Column countOfEmployeeColumn = new Column(null, "*").count();



		selectQuery.addSelectColumn(departmentIdColumn);
		selectQuery.addSelectColumn(countOfEmployeeColumn);

		List<Column> columnsList = new ArrayList<>();
		columnsList.add(departmentIdColumn);

		GroupByClause groupByClause = new GroupByClause(columnsList);
		selectQuery.setGroupByClause(groupByClause);

		try {
			Connection connection = relationalAPI.getConnection();
			DataSet dataSet = relationalAPI.executeQuery(selectQuery, connection);
			HttpSession session = request.getSession();
			session.setAttribute("selectQueryDataSet", dataSet);
			response.sendRedirect("viewEmployeeBySelectQuery.jsp");
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (QueryConstructionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
