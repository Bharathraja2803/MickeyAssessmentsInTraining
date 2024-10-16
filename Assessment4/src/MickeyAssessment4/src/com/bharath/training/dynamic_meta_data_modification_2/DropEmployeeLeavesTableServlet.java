package com.bharath.training.dynamic_meta_data_modification_2;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;

/**
 * This Servlet is used to drop the bharath_employee_leaves table
 */
@WebServlet("/DropEmployeeLeavesTableServlet")
public class DropEmployeeLeavesTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			DataAccess.dropTable("BHARATH_EMPLOYEE_LEAVES");
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
