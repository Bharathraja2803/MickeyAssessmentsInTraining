<%@page import="com.adventnet.persistence.Row"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.adventnet.persistence.DataObject"%>
<%@page import="com.adventnet.ds.query.DataSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Names</title>
</head>
<body>
<div>
<h1>Employee Name</h1>
<%
	DataSet unionQueryDataSet = (DataSet)session.getAttribute("unionQueryDataSet");
	DataSet unionAllQueryDataSet = (DataSet)session.getAttribute("unionAllQueryDataSet");
	
	if(unionQueryDataSet == null || unionAllQueryDataSet == null){
		out.println("<h3>You haven't executed the query yet</h3>");
		return;
	}
%>
</div>
<div>
<h2>Union Query Dataset</h2>
<table border="1" width="90%">
<tr>
<th>Employee name</th>
</tr>
<%
		while(unionQueryDataSet.next()){
			out.println(
					"<tr>"
					+"<td>"+unionQueryDataSet.getValue("EMP_NAME")+"</td>"
					+"</tr>"
					);
		}
%>
</table>
<hr>
</div>

<div>
<h2>UnionAll Query Dataset</h2>
<table border="1" width="90%">
<tr>
<th>Employee name</th>
</tr>
<%
		while(unionAllQueryDataSet.next()){
			out.println(
					"<tr>"
					+"<td>"+unionAllQueryDataSet.getValue(1)+"</td>"
					+"</tr>"
					);
		}
%>

</table>
</div>
</body>
</html>