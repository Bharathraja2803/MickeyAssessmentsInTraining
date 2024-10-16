<%@page import="com.adventnet.ds.query.GroupByClause"%>
<%@page import="com.adventnet.ds.query.DataSet"%>
<%@page import="com.adventnet.ds.query.Join"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.adventnet.ds.query.Column"%>
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
<title>Count of employees in each department</title>
</head>
<body>
<div>
<h1>Count of employees in each department</h1>
<h2><a href="index.jsp">Index page</a></h2>
</div>
<div>
<table border="1" width="90%">
<tr>
<th>Department id</th>
<th>Employee Count</th>
</tr>
<%
//select department_id , count(*) from BHARATH_EMP_DEPARTMENT_MAPPING group by department_id
RelationalAPI relationalAPI = RelationalAPI.getInstance();
Connection connection = relationalAPI.getConnection();

Table table = new Table("BHARATH_EMP_DEPARTMENT_MAPPING");
SelectQuery selectQuery = new SelectQueryImpl(table);
Column departmentIdColumn = new Column("BHARATH_EMP_DEPARTMENT_MAPPING", "DEPARTMENT_ID");
Column countOfEmployeeColumn = new Column(null, "*").count();



selectQuery.addSelectColumn(departmentIdColumn);
selectQuery.addSelectColumn(countOfEmployeeColumn);

List<Column> columnsList = new ArrayList<>();
columnsList.add(departmentIdColumn);

GroupByClause groupByClause = new GroupByClause(columnsList);
selectQuery.setGroupByClause(groupByClause);

DataSet dataSet = relationalAPI.executeQuery(selectQuery, connection);

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