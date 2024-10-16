<%@page import="com.adventnet.ds.query.QueryConstants"%>
<%@page import="com.adventnet.ds.query.Criteria"%>
<%@page import="com.adventnet.ds.query.DataSet"%>
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
<title>Highest and Lowest Salary</title>
</head>
<body>
</head>
<body>
<div>
<h1>Highest and Lowest Salary</h1>
<h2><a href="index.jsp">Index page</a></h2>
</div>
<div>
<%

//maximum_salary = select max(salary) from BHARATH_EMP_SALARYDETAILS
//minimum_salary = select min(salary) from BHARATH_EMP_SALARYDETAILS
//select * from BHARATH_EMP_SALARYDETAILS where salary=maximum_salary or salary=minimum_salary

RelationalAPI relationalAPI = RelationalAPI.getInstance();
Connection connection = relationalAPI.getConnection();

Table table = new Table("BHARATH_EMP_SALARYDETAILS");
SelectQuery selectQueryForFindingMaxAndMinSalary = new SelectQueryImpl(table);
SelectQuery selectQuery = new SelectQueryImpl(table);

Column maxColumn = new Column("BHARATH_EMP_SALARYDETAILS", "SALARY").maximum();
Column minColumn = new Column("BHARATH_EMP_SALARYDETAILS", "SALARY").minimum();
selectQueryForFindingMaxAndMinSalary.addSelectColumn(maxColumn);
selectQueryForFindingMaxAndMinSalary.addSelectColumn(minColumn);

Column allColumnsOnSalaryMappingTable = new Column("BHARATH_EMP_SALARYDETAILS", "*");
selectQuery.addSelectColumn(allColumnsOnSalaryMappingTable);


DataSet dataSet = relationalAPI.executeQuery(selectQueryForFindingMaxAndMinSalary, connection);

int maximumSalary = -1;
int minimumSalary = -1;

if(dataSet.next()){
	maximumSalary = (int) dataSet.getValue(1);
	minimumSalary = (int) dataSet.getValue(2);
}else{
	out.println("<h3>No Records added for employee</h3>");
	return;
}
%>
<table border="1" width="50%">
<tr>
<td>Maximum Salary</td>
<td><%=maximumSalary%></td>
</tr>
<tr>
<td>Minimum Salary</td>
<td><%=minimumSalary%></td>
</tr>
</table>
</div>
<div>
<table border="1" width="90%">
<tr>
<th>Employee Id</th>
<th>Employee Salary</th>
</tr>
<%

Criteria criteria = new Criteria(new Column("BHARATH_EMP_SALARYDETAILS", "SALARY"), new Integer(maximumSalary), QueryConstants.EQUAL)
					.or(new Column("BHARATH_EMP_SALARYDETAILS", "SALARY"), new Integer(minimumSalary), QueryConstants.EQUAL);

selectQuery.setCriteria(criteria);
dataSet = relationalAPI.executeQuery(selectQuery, connection);
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