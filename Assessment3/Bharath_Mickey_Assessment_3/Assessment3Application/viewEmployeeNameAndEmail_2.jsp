<%@page import="com.bharath.training.dao.BharathEmployeeDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.bharath.training.dao.BharathEmployeeDao"%>
<%@page import="com.bharath.training.model.BharathEmployee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View all employee name and email Id:</title>
</head>
<body>
<div>
<h1>Employee</h1>
<h2><a href="index.jsp">Index page</a></h2>
<h2><a href="addEmployee.jsp">Add Employee</a></h2>
<%
	if(session.getAttribute("employeeAddedSuccessfully") != null){
	out.println("<h3>Employee was added successfully to the DB</h3>");
	session.removeAttribute("employeeAddedSuccessfully");
	}
	
	BharathEmployeeDao bharathEmployeeDaoImpl = new BharathEmployeeDaoImpl();
	List<BharathEmployee> bharathEmployees = bharathEmployeeDaoImpl.listAllEmployeeDetails();
	if(bharathEmployees == null || bharathEmployees.isEmpty()){
		out.println("<h3>No employees were added yet</h3>");
		return;
	}
	
%>
</div>
<div>
<table border="1" width="90%">  
<tr>
<th>Employee name</th>
<th>Email id</th>
</tr>

<%
		for(BharathEmployee bharathEmployee: bharathEmployees){	
			out.println(
					"<tr>"
					+"<td>"+bharathEmployee.getEmpName()+"</td>"
					+"<td>"+bharathEmployee.getEmpEmailId()+"</td>"
					+"</tr>"
					);
		}	
%>

</table>
</div>
</body>
</html>