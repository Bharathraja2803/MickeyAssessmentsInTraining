<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding Department</title>
</head>
<body>
<div>
<h1>Add Department</h1>
<h2><a href="index.jsp">Index page</a></h2>
<h2><a href="addEmployee.jsp">Add Employee</a></h2>
<%
	
	if(session.getAttribute("somethingWentWrong") != null){
		out.println("<h3>Something went wrong</h3>");
		session.removeAttribute("somethingWentWrong");
	}
	
%>
</div>
<div>
<form action="AddDepartmentServlet" method="post">
<table border="1">
<tr>
<td><label for="departmentName">Department Name: </label></td>
<td><input type="text" name="departmentName" id="departmentName"></td>
</tr>
<tr>
<td colspan="2"><input type="submit"></td>
</tr>
</table>
</form>
</div>
</body>
</html>