<%@page import="com.adventnet.ds.query.DataSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.adventnet.db.api.RelationalAPI"%>
<%@page import="com.adventnet.persistence.Row"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.adventnet.persistence.DataObject"%>
<%@page import="com.adventnet.mfw.bean.BeanUtil"%>
<%@page import="com.adventnet.persistence.Persistence"%>
<%@page import="com.unboundid.ldap.sdk.persist.PersistedObjects"%>
<%@page import="com.adventnet.ds.query.Join"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.adventnet.ds.query.Column"%>
<%@page import="com.adventnet.ds.query.QueryConstants"%>
<%@page import="com.adventnet.ds.query.Criteria"%>
<%@page import="com.adventnet.ds.query.SelectQueryImpl"%>
<%@page import="com.adventnet.ds.query.SelectQuery"%>
<%@page import="com.adventnet.ds.query.Table"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employees having salary less than 13000</title>
</head>
<body>
<div>
<h1>Employee's list having salary less than 13000</h1>
<h2><a href="index.jsp">Index page</a></h2>
</div>
<div>
<table border="1" width="90%">
<tr>
<th>Employee id</th>
<th>Employee name</th>
<th>Email id</th>
<th>Salary</th>
</tr>
<%
	//select BE.EMPLOYEE_ID, BE.EMP_NAME, BE.EMP_EMAIL_ID, BES.SALARY from BHARATH_EMPLOYEE BE inner join BHARATH_EMP_SALARYDETAILS on BES.EMPLOYEE_ID=BE.EMPLOYEE_ID where BES.SALARY<13000
	RelationalAPI relationalAPI = RelationalAPI.getInstance();
	Connection connection = relationalAPI.getConnection();
	
	Table table = new Table("BHARATH_EMPLOYEE");
	SelectQuery selectQuery = new SelectQueryImpl(table);
	Column employeeColumns = new Column("BHARATH_EMPLOYEE", "*");
	Column salaryColumns = new Column("BHARATH_EMP_SALARYDETAILS", "*");
	
	List<Column> columnsList = new ArrayList<>();
	columnsList.add(employeeColumns);
	columnsList.add(salaryColumns);
	
	selectQuery.addSelectColumns(columnsList);
	Criteria salaryLessThan13000Criteria = new Criteria(new Column("BHARATH_EMP_SALARYDETAILS", "SALARY"), new Integer(13000), QueryConstants.LESS_THAN);
	selectQuery.setCriteria(salaryLessThan13000Criteria);
	
	Join joinEmployeeWithSalary = new Join("BHARATH_EMPLOYEE", "BHARATH_EMP_SALARYDETAILS", new String[]{"EMPLOYEE_ID"}, new String[]{"EMPLOYEE_ID"}, Join.INNER_JOIN);
	selectQuery.addJoin(joinEmployeeWithSalary);
	
	DataSet dataSet = relationalAPI.executeQuery(selectQuery, connection);
	
	while(dataSet.next()){
		out.println(
				"<tr>"
				+"<td>"+dataSet.getValue(1)+"</td>"
				+"<td>"+dataSet.getValue(2)+"</td>"
				+"<td>"+dataSet.getValue(3)+"</td>"
				+"<td>"+dataSet.getValue(5)+"</td>"
				+"</tr>");
			
	}
	

%>
</table>
</div>
</body>
</html>