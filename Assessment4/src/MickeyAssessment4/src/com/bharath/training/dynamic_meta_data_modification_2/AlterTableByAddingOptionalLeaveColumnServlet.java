package com.bharath.training.dynamic_meta_data_modification_2;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.ds.query.AlterTableQuery;
import com.adventnet.ds.query.AlterTableQueryImpl;
import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;

/**
 * This servlet is used to add the column optional_leave to the bharath_employee_leaves table
 */
@WebServlet("/AlterTableByAddingOptionalLeaveColumnServlet")
public class AlterTableByAddingOptionalLeaveColumnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AlterTableQuery alterTableQuery = new AlterTableQueryImpl("BHARATH_EMPLOYEE_LEAVES", AlterTableQuery.ADD_COLUMN);
		alterTableQuery.setColumnName("OPTIONAL_LEAVE");
		alterTableQuery.setDataType("INTEGER");
		alterTableQuery.setDefaultValue(new Integer(0));
		alterTableQuery.setMaxLength(2);
		
		try {
			DataAccess.alterTable(alterTableQuery);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
