<%@page import="com.adventnet.ds.query.DataSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details Using Join</title>
</head>
<body>
<div>
<h1>Employee's list whose department is Sales or Purchase</h1>
</div>
<div>
<h3>Join Query Dataset</h3>
<table border="1" width="90%">
<tr>
<th>Employee id</th>
<th>Employee name</th>
<th>Email id</th>
<th>Department</th>
</tr>
<%
	
	DataSet joinQueryDataSet = (DataSet)session.getAttribute("dataSetForJoinQuery");
	
	if(joinQueryDataSet == null){
		out.println("<h3>You have not executed the query!..</h3>");
		return;
	}
	
	while(joinQueryDataSet.next()){
		out.println(
				"<tr>"
				+"<td>"+joinQueryDataSet.getValue(1)+"</td>"
				+"<td>"+joinQueryDataSet.getValue(2)+"</td>"
				+"<td>"+joinQueryDataSet.getValue(3)+"</td>"
				+"<td>"+joinQueryDataSet.getValue(5)+"</td>"
				+"</tr>");
			
	}
	

%>
</table>

</div>
</body>
</html>