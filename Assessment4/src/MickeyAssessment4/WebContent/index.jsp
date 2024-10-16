<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>
<body>
<div>
<h1>Index page</h1>
</div>

<div>
<h2>Q1. Personality Configuration</h2>
<form action="GetAllDetailsOfEmployeesServlet" method="get">
<h3>View Complete Employee Details</h3>
<input type="submit">
</form>
<hr>
</div>

<div>
<h2>Q2. Dynamic Meta Data Modification</h2>
<form action="CreateEmployeeLeavesTableServlet" method="post">
<h3>Create "EMPLOYEE_LEAVES" table</h3>
<input type="submit">
</form>


<h3>Alter "EMPLOYEE_LEAVES" table by adding "OPTIONAL_LEAVE" column</h3>
<h4>This needs to be performed in Postman API</h4>
<p>
PUT: http://localhost:8080/Assessment4Bharath/AlterTableByAddingOptionalLeaveColumnServlet
</p>


<h3>Delete "EMPLOYEE_LEAVES" table</h3>
<h4>This needs to be performed in Postman API</h4>
<p>
DELETE: http://localhost:8080/Assessment4Bharath/DropEmployeeLeavesTableServlet
</p>

<hr>
</div>

<div>
<h2>Q3. Dynamic Columns in Mickey</h2>
<form action="AddingDefaultDynamicColumnServlet" method="post">
<h3>Add Dynamic Column "DYNAMIC_COLUMN" to "BHARATH_EMPLOYEE" table</h3>
<input type="submit">
</form>

<form action="AddingDataToDynamicColumn" method="post">
<h3>Insert data to the table "BHARATH_EMPLOYEE" having Dynamic Column</h3>
<input type="submit">
</form>


<h3>Modify "DYNAMIC_COLUMN" max-size parameter to 200</h3>
<h4>This needs to be performed in Postman API</h4>
<p>
PUT: http://localhost:8080/Assessment4Bharath/ModifyDynamicColumnServlet
</p>

<h3>Update values in the Dynamic Column</h3>
<h4>This needs to be performed in Postman API</h4>
<p>
PUT: http://localhost:8080/Assessment4Bharath/UpdatingValuesInDynamicColumn
</p>

<form action="GetValuesFromDynamicColumnServlet" method="get">
<h3>Get values from DYNAMIC_COLUMN</h3>
<input type="submit">
</form>

<h3>Delete the Dynamic Column created</h3>
<h4>This needs to be performed in Postman API</h4>
<p>
DELETE: http://localhost:8080/Assessment4Bharath/DeleteDynamicColumnServlet
</p>

<h3>Rename the "DYNAMIC_COLUMN" column name to "DYNAMIC_COLUMN_RENAMED"</h3>
<h4>This needs to be performed in Postman API</h4>
<p>
PUT: http://localhost:8080/Assessment4Bharath/RenamingDynamicColumnServlet
</p>

<hr>
</div>

<div>
<h2>Q4. Working out UnionQuery, AlterTableQuery, Join, SelectQuery, RelationalAPI</h2>
<h2>Using AlterTableQuery</h2>
<form action="AddBasicSalaryColumnToEmployeeSalaryMappingTableUsingAlterQueryServlet" method="post">
<h3>Add basic_salary column in BHARATH_EMP_SALARYDETAILS table</h3>
<input type="submit">
</form>

<h3>Modify the default value for basic_salary column in BHARATH_EMP_SALARYDETAILS table</h3>
<h4>This needs to be performed in Postman API</h4>
<p>
PUT: http://localhost:8080/Assessment4Bharath/ModifyBasicSalaryColumnFromEmployeeSalaryMappingTableUsingAlterQueryServlet
</p>

<h3>Delete basic_salary column in BHARATH_EMP_SALARYDETAILS table</h3>
<h4>This needs to be performed in Postman API</h4>
<p>
DELETE : http://localhost:8080/Assessment4Bharath/RemoveBasicSalaryColumnFromEmployeeSalaryMappingTableUsingAlterQueryServlet
</p>

<form action="AddUniqueKeyToEmailIdInEmployeeTableServlet" method="post">
<h3>Add unique key constraint to EMP_EMAIL_ID column in BHARATH_EMPLOYEE table</h3>
<input type="submit">
</form>

<h3>Delete unique key constraint for EMP_EMAIL_ID column in BHARATH_EMPLOYEE table</h3>
<h4>This needs to be performed in Postman API</h4>
<p>
DELETE : http://localhost:8080/Assessment4Bharath/DeleteUniqueKeyForEmailIdInEmployeeTableServlet
</p>

<h2>Using UnionQuery</h2>
<form action="GettingEmployeeNameWhoseEmailIdIsGmailAndEmployeeIdTwelveUnionServlet" method="get">
<h3>Getting employee names who is having gmail email id and whose employee id is 12</h3>
<input type="submit">
</form>

<h2>Using Join</h2>
<form action="GettingEmployeeWorkingInSalesAndPurchaseUsingJoinServlet" method="get">
<h3>Get employee details who are working in Sales and Purchase department</h3>
<input type="submit">
</form>

<h2>Using SelectQuery</h2>
<form action="GetEmployeeCountPerDepartmentSelectQueryServlet" method="get">
<h3>Get employee count for each department</h3>
<input type="submit">
</form>

<hr>
</div>

<div>
<h2>Q5. Template Table creation</h2>
<form action="CreateTemplateInstanceTableServlet" method="post">
<h3>Create template table instance with table name "BHARATH_SAMPLE_DD_'$id'"</h3>
<input type="submit">
</form>
<hr>
</div>

</body>
</html>