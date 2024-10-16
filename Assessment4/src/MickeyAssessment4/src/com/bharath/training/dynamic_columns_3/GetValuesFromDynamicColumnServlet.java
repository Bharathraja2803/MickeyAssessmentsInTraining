package com.bharath.training.dynamic_columns_3;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.ds.query.Column;
import com.adventnet.ds.query.SelectQuery;
import com.adventnet.ds.query.SelectQueryImpl;
import com.adventnet.ds.query.Table;
import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;
import com.adventnet.persistence.DataObject;
import com.adventnet.persistence.Row;

/**
 * Servlet implementation class GetValuesFromDynamicColumnServlet
 */
@WebServlet("/GetValuesFromDynamicColumnServlet")
public class GetValuesFromDynamicColumnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Table table = new Table("BHARATH_EMPLOYEE");
		SelectQuery sq = new SelectQueryImpl(table);
		sq.addSelectColumn(Column.getColumn("BHARATH_EMPLOYEE", "EMPLOYEE_ID"));
		sq.addSelectColumn(Column.getColumn("BHARATH_EMPLOYEE", "EMP_NAME"));
		sq.addSelectColumn(Column.getColumn("BHARATH_EMPLOYEE", "EMP_EMAIL_ID"));
		sq.addSelectColumn(Column.getColumn("BHARATH_EMPLOYEE", "DYNAMIC_COLUMN"));
		PrintWriter printWriter = response.getWriter();
		printWriter.println(String.format("%s\t%s\t%s\t%s", "EMPLOYEE_ID", "EMP_NAME", "EMP_EMAIL_ID", "DYNAMIC_COLUMN"));
		try {
			DataObject dataObject = DataAccess.get(sq);
			Iterator<Row> iterator = dataObject.getRows("BHARATH_EMPLOYEE");
			while(iterator.hasNext()){
				Row row = iterator.next();
				printWriter.println(String.format("%s\t%s\t%s\t%s", row.get("EMPLOYEE_ID"), row.get("EMP_NAME"), row.get("EMP_EMAIL_ID"), row.get("DYNAMIC_COLUMN")));
			}
			
		} catch (DataAccessException e) {
			printWriter.println(e.toString());
		}
	}
}
