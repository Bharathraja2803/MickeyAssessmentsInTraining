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
<title>Department List</title>
</head>
<body>
<div>
<h1>Departments</h1>
<h2><a href="index.jsp">Index page</a></h2>
<h2><a href="addDepartment.jsp">Add Department</a></h2>
<h2><a href="updateDepartment_3.jsp">Update Department</a></h2>
<%
	BharathDepartmentDao bharathDepartmentDaoImpl = new BharathDepartmentDaoImpl();
	List<BharathDepartment> bharathDepartments = bharathDepartmentDaoImpl.readAllDepartment();
	if(bharathDepartments== null || bharathDepartments.isEmpty()){
		out.println("<h3>No departments were added yet</h3>");
		return;
	}
%>
</div>
<div>
<table border="1" width="90%">  
<tr>
<th>Department id</th>
<th>Department name</th>
</tr>

<%
		for(BharathDepartment bharathDepartment: bharathDepartments){
			out.println(
					"<tr>"
					+"<td>"+bharathDepartment.getDepartmentId()+"</td>"
					+"<td>"+bharathDepartment.getDepartmentName()+"</td>"
					+"</tr>"
					);
		}	
%>

</table>
</div>
</body>
</html>