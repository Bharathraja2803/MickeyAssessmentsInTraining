<%@page import="com.adventnet.ds.query.DataSet"%>
<%@page import="com.adventnet.ds.query.Join"%>
<%@page import="com.adventnet.ds.query.QueryConstants"%>
<%@page import="com.adventnet.ds.query.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<title>Employee Working on Sales or Purchase</title>
</head>
<body>
<div>
<h1>Employee's list whose department is Sales or Purchase</h1>
<h2><a href="index.jsp">Index page</a></h2>
</div>
<div>
<table border="1" width="90%">
<tr>
<th>Employee id</th>
<th>Employee name</th>
<th>Email id</th>
<th>Department</th>
</tr>
<%

//Select BE.employee_id, BE.emp_name, BE.EMP_EMAIL_ID, BD.DEPARTMENT_NAME from BHARATH_EMPLOYEE BE inner join BHARATH_EMP_DEPARTMENT_MAPPING BED on BE.EMPLOYEE_ID=BED.EMPLOYEE_ID inner join BHARATH_DEPARTMENT BD on BD.DEPARTMENT_ID=BED.DEPARTMENT_ID where BD.DEPARTMENT_NAME='Sales' or BD.DEPARTMENT_NAME='Purchase'
	RelationalAPI relationalAPI = RelationalAPI.getInstance();
	Connection connection = relationalAPI.getConnection();
	
	Table table = new Table("BHARATH_EMPLOYEE");
	SelectQuery selectQuery = new SelectQueryImpl(table);
	Column employeeColumns = new Column("BHARATH_EMPLOYEE", "*");
	Column departmentColumns = new Column("BHARATH_DEPARTMENT", "*");
	Column departmentEmployeeColumns = new Column("BHARATH_EMP_DEPARTMENT_MAPPING", "*");
	
	List<Column> columnsList = new ArrayList<>();
	columnsList.add(employeeColumns);
	columnsList.add(departmentColumns);
	columnsList.add(departmentEmployeeColumns);
	
	selectQuery.addSelectColumns(columnsList);
	
	
	Criteria departmentSalesPurchaseCriteria = new Criteria(new Column("BHARATH_DEPARTMENT", "DEPARTMENT_NAME"), "Sales", QueryConstants.EQUAL);
	departmentSalesPurchaseCriteria = departmentSalesPurchaseCriteria.or(new Column("BHARATH_DEPARTMENT", "DEPARTMENT_NAME"), "Purchase", QueryConstants.EQUAL);
	selectQuery.setCriteria(departmentSalesPurchaseCriteria);
	
	Join joinEmployeeWithDepartmentEmployeeMapping = new Join("BHARATH_EMPLOYEE", "BHARATH_EMP_DEPARTMENT_MAPPING", new String[]{"EMPLOYEE_ID"}, new String[]{"EMPLOYEE_ID"}, Join.INNER_JOIN);
	Join joinDepartmentWithDepartmentEmployeeMapping = new Join("BHARATH_EMP_DEPARTMENT_MAPPING", "BHARATH_DEPARTMENT", new String[]{"DEPARTMENT_ID"}, new String[]{"DEPARTMENT_ID"}, Join.INNER_JOIN);
	selectQuery.addJoin(joinEmployeeWithDepartmentEmployeeMapping);
	selectQuery.addJoin(joinDepartmentWithDepartmentEmployeeMapping);
	
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