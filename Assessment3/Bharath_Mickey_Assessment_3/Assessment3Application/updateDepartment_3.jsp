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
<title>Update Department</title>
</head>
<body>
<div>
<h1>Update Department</h1>
<h2><a href="index.jsp">Index page</a></h2>
<h2><a href="addDepartment.jsp">Add Department</a></h2>
<%

	BharathDepartmentDao bharathDepartmentDaoImpl = new BharathDepartmentDaoImpl();
	List<BharathDepartment> bharathDepartments = bharathDepartmentDaoImpl.readAllDepartment();
	if(bharathDepartments== null || bharathDepartments.isEmpty()){
		out.println("<h3>No departments were added yet</h3>");
		return;
	}
	
	if(session.getAttribute("invalidDepartmentId") != null){
		out.println("<h3>Invalid Department Id</h3>");
		session.removeAttribute("invalidDepartmentId");
	}

	if(session.getAttribute("somethingWentWrong") != null){
		out.println("<h3>Something went wrong</h3>");
		session.removeAttribute("somethingWentWrong");
	}

	
%>
</div>
<div>
<form action="updateDepartmentAndDisplayAllDepartment_3.jsp" method="post">
<table border="1">
<tr>
<td><label for="departmentId">Department Id: </label></td>
<td><input type="text" name="departmentId" id="departmentId"></td>
</tr>
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