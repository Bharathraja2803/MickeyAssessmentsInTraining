package com.bharath.training.dynamic_columns_3;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.ds.query.AlterTableQuery;
import com.adventnet.ds.query.AlterTableQueryImpl;
import com.adventnet.ds.query.QueryConstructionException;
import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;

/**
 * Servlet implementation class DeleteDynamicColumnServlet
 */
@WebServlet("/DeleteDynamicColumnServlet")
public class DeleteDynamicColumnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AlterTableQuery atq = new AlterTableQueryImpl("BHARATH_EMPLOYEE");
		PrintWriter printWriter = response.getWriter();
		try {
			atq.removeDynamicColumn("DYNAMIC_COLUMN");
			DataAccess.alterTable(atq);
		} catch (QueryConstructionException e) {
			printWriter.println(e.toString());
		} catch (DataAccessException e) {
			printWriter.println(e.toString());
		} catch (SQLException e) {
			printWriter.println(e.toString());
		}

		
	}

}
