<%@page import="com.adventnet.persistence.Row"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.adventnet.persistence.DataObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personality View</title>
</head>
<body>
<div>
<h1>Personality View</h1>
</div>
<div>

<%
	DataObject personalityDataObject = (DataObject)session.getAttribute("dataObjectUsingPersonality");
	if(personalityDataObject == null){
		out.println("<h3>You haven't executed the query yet</h3>");
		return;
	}else{
		
%>
<table border="1" width="90%">
<tr>
<th>Employee id</th>
<th>Employee name</th>
<th>Salary</th>
<th>Department ID</th>
</tr>
<%
		Iterator<Row> iteratorEmployee = personalityDataObject.getRows("BHARATH_EMPLOYEE");
		Iterator<Row> iteratorSalary = personalityDataObject.getRows("BHARATH_EMP_SALARYDETAILS");
		Iterator<Row> iteratorDepartmentMapping = personalityDataObject.getRows("BHARATH_EMP_DEPARTMENT_MAPPING");
		while(iteratorEmployee.hasNext()){
			Row row1 = iteratorEmployee.next();
			Row row2 = iteratorSalary.next();
			Row row3 = iteratorDepartmentMapping.next();
			out.println(
					"<tr>"
					+"<td>"+row1.get("EMPLOYEE_ID")+"</td>"
					+"<td>"+row1.get("EMP_NAME")+"</td>"
					+"<td>"+row2.get("SALARY")+"</td>"
					+"<td>"+row3.get("DEPARTMENT_ID")+"</td>"
					+"</tr>");
				
		}
		
	}
%>
</table>
</div>
</body>
</html>