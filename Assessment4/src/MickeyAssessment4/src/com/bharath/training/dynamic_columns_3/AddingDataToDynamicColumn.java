package com.bharath.training.dynamic_columns_3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;
import com.adventnet.persistence.DataObject;
import com.adventnet.persistence.Row;
import com.adventnet.persistence.WritableDataObject;

/**
 * Servlet implementation class AddingDataToDynamicColumn
 */
@WebServlet("/AddingDataToDynamicColumn")
public class AddingDataToDynamicColumn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Row r = new Row("BHARATH_EMPLOYEE");
		r.set("EMP_NAME", "bharath"); 
		r.set("EMP_EMAIL_ID", "bharath@gmail.com");
		r.set("DYNAMIC_COLUMN", "Value1"); 
		PrintWriter printWriter = response.getWriter();
		DataObject dataObject = new WritableDataObject();
		try {
			dataObject.addRow(r);
			DataAccess.add(dataObject);
		} catch (DataAccessException e) {
			printWriter.println(e.toString());
		}

	}

}
