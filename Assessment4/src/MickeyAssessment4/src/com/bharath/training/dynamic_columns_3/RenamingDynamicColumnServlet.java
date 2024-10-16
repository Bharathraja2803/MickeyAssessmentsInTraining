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
 * Servlet implementation class RenamingDynamicColumnServlet
 */
@WebServlet("/RenamingDynamicColumnServlet")
public class RenamingDynamicColumnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter printWriter = response.getWriter();
		AlterTableQuery atq = new AlterTableQueryImpl("BHARATH_EMPLOYEE");
		try {
			atq.renameDynamicColumn("DYNAMIC_COLUMN", "DYNAMIC_COLUMN_RENAMED");
			DataAccess.alterTable(atq);
		} catch (DataAccessException | SQLException e) {
			printWriter.println(e.toString());
		} catch (QueryConstructionException e) {
			printWriter.println(e.toString());
		}
	}


}
