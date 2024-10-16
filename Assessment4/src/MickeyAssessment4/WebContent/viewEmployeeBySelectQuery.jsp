<%@page import="com.adventnet.ds.query.DataSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Query DataSet View</title>
</head>
<body>
<div>
<h1>Count of employees in each department</h1>
</div>
<div>
<table border="1" width="90%">
<tr>
<th>Department id</th>
<th>Employee Count</th>
</tr>
<%

	DataSet dataSet = (DataSet)session.getAttribute("selectQueryDataSet");
	if(dataSet == null){
		out.println("<h3>You haven't executed the Select Query</h3>");
		return;
	}
	while(dataSet.next()){
		out.println(
			"<tr>"
			+"<td>"+dataSet.getValue(1)+"</td>"
			+"<td>"+dataSet.getValue(2)+"</td>"
			+"</tr>");
		
}
%>
</table>
</div>
</body>
</html>