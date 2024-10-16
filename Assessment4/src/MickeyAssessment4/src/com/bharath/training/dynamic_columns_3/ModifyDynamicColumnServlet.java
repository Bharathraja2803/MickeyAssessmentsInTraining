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
 * Servlet implementation class ModifyDynamicColumnServlet
 */
@WebServlet("/ModifyDynamicColumnServlet")
public class ModifyDynamicColumnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ColumnDefinition cd = new ColumnDefinition();
		cd.setTableName("BHARATH_EMPLOYEE");
		cd.setColumnName("DYNAMIC_COLUMN");
		cd.setDataType("CHAR");
		cd.setNullable(true);
		cd.setMaxLength(200);
		PrintWriter printWriter = response.getWriter();
		AlterTableQuery atq = new AlterTableQueryImpl("BHARATH_EMPLOYEE");
		try {
			atq.modifyDynamicColumn("DYNAMIC_COLUMN", cd);
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
