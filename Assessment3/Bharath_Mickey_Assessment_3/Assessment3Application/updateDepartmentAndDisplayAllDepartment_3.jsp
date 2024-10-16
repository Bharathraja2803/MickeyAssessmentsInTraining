<%@page import="com.adventnet.ds.query.QueryConstants"%>
<%@page import="com.adventnet.persistence.DataAccessException"%>
<%@page import="com.adventnet.persistence.Row"%>
<%@page import="com.adventnet.persistence.DataObject"%>
<%@page import="com.adventnet.persistence.DataAccess"%>
<%@page import="com.adventnet.ds.query.Column"%>
<%@page import="com.adventnet.ds.query.Criteria"%>
<%@page import="com.bharath.training.dao.BharathDepartmentDaoImpl"%>
<%@page import="com.bharath.training.model.BharathDepartment"%>
<%@page import="java.util.List"%>
<%@page import="com.bharath.training.dao.BharathDepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
<h1>Departments</h1>
<h2><a href="index.jsp">Index page</a></h2>
<h2><a href="updateDepartment.jsp">Update Department</a></h2>
<%

	//update BHARATH_DEPARTMENT set DEPARTMENT_NAME = value where DEPARTMENT_ID = value
	int departmentId = -1;
	
	try{
		departmentId = Integer.parseInt(request.getParameter("departmentId"));
	}catch(NumberFormatException e){
		System.out.println(e.toString());
		session.setAttribute("invalidDepartmentId", "y");
		response.sendRedirect("updateDepartment_3.jsp");
		return;
	}
	
	String newDepartmentName = request.getParameter("departmentName");
	
	Criteria criteria = new Criteria(new Column("BHARATH_DEPARTMENT", "DEPARTMENT_ID"), departmentId, QueryConstants.EQUAL);
	try {
		DataObject dataObject = DataAccess.get("BHARATH_DEPARTMENT", criteria);
		Row row = dataObject.getRow("BHARATH_DEPARTMENT");
		if(row == null){
			session.setAttribute("invalidDepartmentId", "y");
			response.sendRedirect("updateDepartment_3.jsp");
			return;
		}
		row.set("DEPARTMENT_NAME", newDepartmentName);
		dataObject.updateRow(row);
		DataAccess.update(dataObject);
	} catch (DataAccessException e) {
		System.out.println(e.toString());
		session.setAttribute("somethingWentWrong", "y");
		response.sendRedirect("updateDepartment_3.jsp");
		return;
	}


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