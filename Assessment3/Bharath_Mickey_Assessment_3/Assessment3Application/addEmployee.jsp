<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
</head>
<body>
<div>
<h1>Add Employee</h1>
<h2><a href="index.jsp">Index page</a></h2>
<h2><a href="addDepartment.jsp">Add Department</a></h2>
<%
	if(session.getAttribute("isDepartmentIsInvalid") != null){
		out.println("<h3>Entered department id is invalid</h3>");
		session.removeAttribute("isDepartmentIsInvalid");
	}

	if(session.getAttribute("isSalaryInvalid") != null){
		out.println("<h3>Entered salary is invalid</h3>");
		session.removeAttribute("isSalaryInvalid");
	}
	
	if(session.getAttribute("somethingWentWrong") != null){
		out.println("<h3>Something went wrong</h3>");
		session.removeAttribute("somethingWentWrong");
	}
	
	if(session.getAttribute("emailAlreadyExits") != null){
		out.println("<h3>Entered email id already exists</h3>");
		session.removeAttribute("emailAlreadyExits");
	}
	
%>
</div>
<div>
<form action="AddNewEmployeeServlet" method="post">
<table border="1">
<tr>
<td><label for="employeeName">Employee Name: </label></td>
<td><input type="text" name="employeeName" id="employeeName"></td>
</tr>
<tr>
<td><label for="employeeEmailId">Email id: </label></td>
<td><input type="text" name="employeeEmailId" id="employeeEmailId"></td>
</tr>
<tr>
<td><label for="departmentId">Department Id: </label></td>
<td><input type="text" name="departmentId" id="departmentId"></td>
</tr>
<tr>
<td><label for="salary">Salary: </label></td>
<td><input type="text" name="salary" id="salary"></td>
</tr>
<tr>
<td colspan="2"><input type="submit"></td>
</tr>
</table>
</form>
</div>
</body>
</html>