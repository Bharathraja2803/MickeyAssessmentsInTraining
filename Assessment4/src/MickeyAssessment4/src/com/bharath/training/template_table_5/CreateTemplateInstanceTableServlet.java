package com.bharath.training.template_table_5;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class CreateTemplateInstanceTableServlet
 */
@WebServlet("/CreateTemplateInstanceTableServlet")
public class CreateTemplateInstanceTableServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter printWriter = response.getWriter();
		ImplementationClass implementationClass = new ImplementationClass();
		implementationClass.createTemplateTableInstance();
		printWriter.println("Table created successfully");
	}

}
