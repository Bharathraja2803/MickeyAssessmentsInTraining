<%@page import="com.bharath.training.dao.BharathEmpSalaryDetailsDaoImpl"%>
<%@page import="com.bharath.training.dao.BharathEmpSalaryDetailsDao"%>
<%@page import="com.bharath.training.model.BharathEmpSalaryDetails"%>
<%@page import="com.bharath.training.dao.BharathEmpDepartmentMappingDaoImpl"%>
<%@page import="com.bharath.training.dao.BharathEmpDepartmentMappingDao"%>
<%@page import="com.bharath.training.model.BharathEmpDepartmentMapping"%>
<%@page import="com.bharath.training.dao.BharathEmployeeDaoImpl"%>
<%@page import="com.bharath.training.model.BharathEmployee"%>
<%@page import="com.bharath.training.dao.BharathEmployeeDao"%>
<%@page import="com.bharath.training.model.BharathDepartment"%>
<%@page import="java.util.List"%>
<%@page import="com.bharath.training.dao.BharathDepartmentDaoImpl"%>
<%@page import="com.bharath.training.dao.BharathDepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee List</title>
</head>
<body>
<div>
<h1>Employee</h1>
<h2><a href="index.jsp">Index page</a></h2>
<h2><a href="addEmployee.jsp">Add Employee</a></h2>
<h2><a href="DeleteEmployeeHavingYahooMailServlet">Delete Employee having Yahoo account</a></h2>
<%
	if(session.getAttribute("employeeAddedSuccessfully") != null){
	out.println("<h3>Employee was added successfully to the DB</h3>");
	session.removeAttribute("employeeAddedSuccessfully");
	}

	if(session.getAttribute("deletingTheYahooUserMailIdSuccessful") != null){
	out.println("<h3>Employee with yahoo mail was deleted successfully</h3>");
	session.removeAttribute("deletingTheYahooUserMailIdSuccessful");
	}

	
	if(session.getAttribute("somethingWentWrong") != null){
	out.println("<h3>Something went wrong in deleting the employee having yahoo mail account</h3>");
	session.removeAttribute("somethingWentWrong");
	}

	
	BharathEmployeeDao bharathEmployeeDaoImpl = new BharathEmployeeDaoImpl();
	List<BharathEmployee> bharathEmployees = bharathEmployeeDaoImpl.listAllEmployeeDetails();
	if(bharathEmployees == null || bharathEmployees.isEmpty()){
		out.println("<h3>No employees were added yet</h3>");
		return;
	}
	BharathDepartmentDao bharathDepartmentDaoImpl = new BharathDepartmentDaoImpl();
	BharathEmpDepartmentMappingDao bharathEmpDepartmentMappingDaoImpl = new BharathEmpDepartmentMappingDaoImpl();
%>
</div>
<div>
<table border="1" width="90%">  
<tr>
<th>Employee id</th>
<th>Employee name</th>
<th>Email id</th>
<th>Department</th>
<th>Salary</th>
</tr>

<%
		for(BharathEmployee bharathEmployee: bharathEmployees){
			List<BharathEmpDepartmentMapping> bharathEmpDepartmentMappings = bharathEmpDepartmentMappingDaoImpl.getEmployeeDepartmentMappingByEmployeeId(bharathEmployee.getEmployeeId());
			BharathEmpSalaryDetailsDao bharathEmpSalaryDetailsDaoImpl = new BharathEmpSalaryDetailsDaoImpl();
			BharathEmpSalaryDetails bharathEmpSalaryDetails = bharathEmpSalaryDetailsDaoImpl.getSalaryDetailsByEmployeeId(bharathEmployee.getEmployeeId());
			for(BharathEmpDepartmentMapping bharathEmpDepartmentMapping : bharathEmpDepartmentMappings){
				BharathDepartment bharathDepartment = bharathDepartmentDaoImpl.getDepartmentByDepartmentId(bharathEmpDepartmentMapping.getDepartmentId());
				out.println(
						"<tr>"
						+"<td>"+bharathEmployee.getEmployeeId()+"</td>"
						+"<td>"+bharathEmployee.getEmpName()+"</td>"
						+"<td>"+bharathEmployee.getEmpEmailId()+"</td>"
						+"<td>"+bharathDepartment.getDepartmentName()+"</td>"
						+"<td>"+bharathEmpSalaryDetails.getSalary()+"</td>"
						+"</tr>"
						);
			}
		}	
%>

</table>
</div>
</body>
</html>