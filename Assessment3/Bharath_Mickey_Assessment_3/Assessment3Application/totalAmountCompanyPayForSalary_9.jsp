
<%@page import="com.adventnet.ds.query.Column"%>
<%@page import="com.adventnet.ds.query.DataSet"%>
<%@page import="com.adventnet.ds.query.SelectQueryImpl"%>
<%@page import="com.adventnet.ds.query.SelectQuery"%>
<%@page import="com.adventnet.ds.query.Table"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.adventnet.db.api.RelationalAPI"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Total salary of Employee</title>
</head>
<body>
<div>
<h1>Total Salary of employee</h1>
<h2><a href="index.jsp">Index page</a></h2>
</div>
<div>
<table border="1" width="90%">
<tr>
<th>Total amount</th>
</tr>
<%

//select sum(salary) from BHARATH_EMP_SALARYDETAILS;
RelationalAPI relationalAPI = RelationalAPI.getInstance();
Connection connection = relationalAPI.getConnection();

Table table = new Table("BHARATH_EMP_SALARYDETAILS");
SelectQuery selectQuery = new SelectQueryImpl(table);

Column column = new Column("BHARATH_EMP_SALARYDETAILS", "SALARY").summation();

selectQuery.addSelectColumn(column);

DataSet dataSet = relationalAPI.executeQuery(selectQuery, connection);
while(dataSet.next()){
	
	out.println(
			"<tr>"
			+"<td>"+(dataSet.getValue(1) == null ? 0 : dataSet.getValue(1))+"</td>"
			+"</tr>");
		
}
	

%>
</table>
</div>
</body>
</html>