package com.bharath.training.working_out_queries_4;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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
import com.adventnet.ds.query.QueryConstants;
import com.adventnet.ds.query.QueryConstructionException;
import com.adventnet.ds.query.SelectQuery;
import com.adventnet.ds.query.SelectQueryImpl;
import com.adventnet.ds.query.Table;
import com.adventnet.ds.query.UnionQuery;
import com.adventnet.ds.query.UnionQueryImpl;

/**
 * Servlet implementation class GettingEmployeeNameWhoseEmailIdIsYahooAndGmail
 */
@WebServlet("/GettingEmployeeNameWhoseEmailIdIsGmailAndEmployeeIdTwelveUnionServlet")
public class GettingEmployeeNameWhoseEmailIdIsGmailAndEmployeeIdTwelveUnionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RelationalAPI relationalAPI = RelationalAPI.getInstance();
		Connection connection;
		try {
			connection = relationalAPI.getConnection();
			Criteria gmailCriteria = new Criteria(new Column("BHARATH_EMPLOYEE", "EMP_EMAIL_ID"), "@gmail.com", QueryConstants.ENDS_WITH);
			Criteria employeeIdCriteria = new Criteria(new Column("BHARATH_EMPLOYEE", "EMPLOYEE_ID"), new Integer(12), QueryConstants.EQUAL);
			Table table = new Table("BHARATH_EMPLOYEE");
			SelectQuery selectQueryForGmail = new SelectQueryImpl(table);
			SelectQuery selectQueryForEmployeeId = new SelectQueryImpl(table);
			selectQueryForGmail.setCriteria(gmailCriteria);
			selectQueryForEmployeeId.setCriteria(employeeIdCriteria);
			
			
			Column employeeNameColumn = new Column("BHARATH_EMPLOYEE", "EMP_NAME");
			selectQueryForGmail.addSelectColumn(employeeNameColumn);
			selectQueryForEmployeeId.addSelectColumn(employeeNameColumn);
			
			UnionQuery unionQuery = new UnionQueryImpl(selectQueryForGmail, selectQueryForEmployeeId, false);
			UnionQuery unionAllQuery = new UnionQueryImpl(selectQueryForGmail, selectQueryForEmployeeId, true);
			DataSet unionQueryDataSet = relationalAPI.executeQuery(unionQuery, connection);
			DataSet unionAllQueryDataSet = relationalAPI.executeQuery(unionAllQuery, connection);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("unionQueryDataSet", unionQueryDataSet);
			session.setAttribute("unionAllQueryDataSet", unionAllQueryDataSet);
			response.sendRedirect("viewEmployeeNames.jsp");
			return;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (QueryConstructionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
