package com.bharath.training.working_out_queries_4;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.db.persistence.metadata.ColumnDefinition;
import com.adventnet.db.persistence.metadata.MetaDataException;
import com.adventnet.ds.query.AlterTableQuery;
import com.adventnet.ds.query.AlterTableQueryImpl;
import com.adventnet.ds.query.QueryConstructionException;
import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;

/**
 * Servlet implementation class AddBasicSalaryColumnToEmployeeSalaryMappingTableUsingAlterQueryServlet
 */
@WebServlet("/RemoveBasicSalaryColumnFromEmployeeSalaryMappingTableUsingAlterQueryServlet")
public class RemoveBasicSalaryColumnFromEmployeeSalaryMappingTableUsingAlterQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AlterTableQuery alterTableQuery = new AlterTableQueryImpl("BHARATH_EMP_SALARYDETAILS");
		try {
			alterTableQuery.removeColumn("BASIC_SALARY");
			DataAccess.alterTable(alterTableQuery);
		} catch (QueryConstructionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
