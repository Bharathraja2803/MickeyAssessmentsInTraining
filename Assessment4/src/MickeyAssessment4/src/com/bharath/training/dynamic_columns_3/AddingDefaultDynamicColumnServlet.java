package com.bharath.training.dynamic_columns_3;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.db.persistence.metadata.ColumnDefinition;
import com.adventnet.ds.query.AlterTableQuery;
import com.adventnet.ds.query.AlterTableQueryImpl;
import com.adventnet.ds.query.QueryConstructionException;
import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;

/**
 * Servlet implementation class AddingDefaultDynamicColumnServlet
 */
@WebServlet("/AddingDefaultDynamicColumnServlet")
public class AddingDefaultDynamicColumnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ColumnDefinition columnDefinition = new ColumnDefinition();
		columnDefinition.setTableName("BHARATH_EMPLOYEE");
		columnDefinition.setColumnName("DYNAMIC_COLUMN");
		columnDefinition.setDataType("CHAR");
		columnDefinition.setNullable(true);
		columnDefinition.setMaxLength(2);
		PrintWriter printWriter = response.getWriter();
		AlterTableQuery alterTableQuery = new AlterTableQueryImpl("BHARATH_EMPLOYEE");
		try {
			alterTableQuery.addDynamicColumn(columnDefinition);
			DataAccess.alterTable(alterTableQuery);
		} catch (QueryConstructionException e) {
			printWriter.println(e.toString());
		} catch (DataAccessException e) {
			printWriter.println(e.toString());
		} catch (SQLException e) {
			printWriter.println(e.toString());
		}

		

	}

}
