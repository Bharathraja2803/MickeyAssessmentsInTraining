package com.bharath.training.personality_configuration_1;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.adventnet.ds.query.Criteria;
import com.adventnet.mfw.bean.BeanUtil;
import com.adventnet.persistence.DataObject;
import com.adventnet.persistence.Persistence;


/**
 * Servlet implementation class GetAllDetailsOfEmployeesServlet
 */
@WebServlet("/GetAllDetailsOfEmployeesServlet")
public class GetAllDetailsOfEmployeesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter printWriter = response.getWriter();
		try {
			Persistence persistence = (Persistence)BeanUtil.lookup("Persistence");
			DataObject dataObject = persistence.getForPersonality("employeeDetails",  (Criteria) null);
			HttpSession session = request.getSession();
			session.setAttribute("dataObjectUsingPersonality", dataObject);
			response.sendRedirect("personalityDataView.jsp");
		} catch (Exception e) {
			printWriter.println(e.toString());
		}
	}

}
