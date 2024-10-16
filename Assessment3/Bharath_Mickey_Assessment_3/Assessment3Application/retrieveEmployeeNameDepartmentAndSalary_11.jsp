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
<title>Retrieving Employee details</title>
</head>
<body>
<div>
<h1>Retrieving Employee details</h1>
<h2><a href="index.jsp">Index page</a></h2>
</div>
<table border="1" width="90%">
<tr>
<th>Employee Name</th>
<th>Department Name</th>
<th>Salary</th>
</tr>
<%
	//select BE.EMP_NAME, BD.DEPARTMENT_NAME, BES.SALARY from BHARATH_EMPLOYEE BE inner join BHARATH_EMP_DEPARTMENT_MAPPING BED on BE.EMPLOYEE_ID=BED.EMPLOYEE_ID inner join BHARATH_DEPARTMENT BD on BD.DEPARTMENT_ID=BED.DEPARTMENT_ID inner join BHARATH_EMP_SALARYDETAILS BES on BES.EMPLOYEE_ID=BE.EMPLOYEE_ID;
	RelationalAPI relationalAPI = RelationalAPI.getInstance();
	Connection connection = relationalAPI.getConnection();
	
	Table table = new Table("BHARATH_EMPLOYEE");
	SelectQuery selectQuery = new SelectQueryImpl(table);
	
	Column employeeTableColumns = new Column("BHARATH_EMPLOYEE", "*");
	Column departmentMappingTableColumns = new Column("BHARATH_EMP_DEPARTMENT_MAPPING", "*");
	Column salaryMappingTableColumns = new Column("BHARATH_EMP_SALARYDETAILS", "*");
	Column departmentTableColumns = new Column("BHARATH_DEPARTMENT", "*");
	
	List<Column> listOfColumns = new ArrayList<>();
	listOfColumns.add(employeeTableColumns);
	listOfColumns.add(departmentMappingTableColumns);
	listOfColumns.add(salaryMappingTableColumns);
	listOfColumns.add(departmentTableColumns);
	
	selectQuery.addSelectColumns(listOfColumns);
	
	Join joinEmployeeWithDepartmentMapping = new Join("BHARATH_EMPLOYEE", "BHARATH_EMP_DEPARTMENT_MAPPING", new String[]{"EMPLOYEE_ID"}, new String[]{"EMPLOYEE_ID"}, Join.INNER_JOIN);
	Join joinDepartmentMappingWithDepartment = new Join("BHARATH_EMP_DEPARTMENT_MAPPING", "BHARATH_DEPARTMENT", new String[]{"DEPARTMENT_ID"}, new String[]{"DEPARTMENT_ID"}, Join.INNER_JOIN);
	Join joinEmployeeWithSalary = new Join("BHARATH_EMPLOYEE", "BHARATH_EMP_SALARYDETAILS", new String[]{"EMPLOYEE_ID"}, new String[]{"EMPLOYEE_ID"}, Join.INNER_JOIN);
	
	selectQuery.addJoin(joinEmployeeWithDepartmentMapping);
	selectQuery.addJoin(joinDepartmentMappingWithDepartment);
	selectQuery.addJoin(joinEmployeeWithSalary);
	
	DataSet dataSet = relationalAPI.executeQuery(selectQuery, connection);
	
	while(dataSet.next()){
		out.println(
				"<tr>"
				+"<td>"+dataSet.getValue(2)+"</td>"
				+"<td>"+dataSet.getValue(9)+"</td>"
				+"<td>"+dataSet.getValue(7)+"</td>"		
				+"</tr>"
				);
	}
%>
</table>
</body>
</html>