package com.bharath.training.dynamic_columns_3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.ds.query.Column;
import com.adventnet.ds.query.Criteria;
import com.adventnet.ds.query.QueryConstants;
import com.adventnet.ds.query.UpdateQuery;
import com.adventnet.ds.query.UpdateQueryImpl;
import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;
import com.adventnet.persistence.DataObject;
import com.adventnet.persistence.Row;

/**
 * Servlet implementation class UpdatingValuesInDynamicColumn
 */
@WebServlet("/UpdatingValuesInDynamicColumn")
public class UpdatingValuesInDynamicColumn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter printWriter = response.getWriter();
		UpdateQuery uq = new UpdateQueryImpl("BHARATH_EMPLOYEE");
		uq.setUpdateColumn("DYNAMIC_COLUMN", "Value_new");
		uq.setCriteria(new Criteria(Column.getColumn("BHARATH_EMPLOYEE", "EMPLOYEE_ID"), new Integer(1), QueryConstants.EQUAL));
		try {
			DataAccess.update(uq);
		} catch (DataAccessException e) {
			printWriter.println(e.toString());
		}
	}

}
