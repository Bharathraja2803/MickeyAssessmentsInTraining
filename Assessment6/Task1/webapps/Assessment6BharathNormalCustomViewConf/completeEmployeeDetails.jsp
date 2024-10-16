<%@page import="com.adventnet.swissqlapi.sql.functions.math.mod"%>
<%@page import="com.adventnet.model.table.CVTableModel"%>
<%@page import="com.adventnet.customview.ViewData"%>
<%@page import="com.adventnet.mfw.bean.BeanUtil"%>
<%@page import="com.adventnet.customview.CustomViewManager"%>
<%@page import="com.adventnet.customview.CustomViewRequest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Employee and department details</h1>
<table border='1'>
<tr>
<%
	CustomViewRequest cvRequest = new CustomViewRequest("EmployeeDepartmentCV");
	
	CustomViewManager cvManager = (CustomViewManager) BeanUtil.lookup("TableViewManager");
	System.out.println(cvManager);
	ViewData viewData = cvManager.getData(cvRequest);
	
	CVTableModel model = (CVTableModel) viewData.getModel();
	int colcount = model.getColumnCount();
	int rowcount = model.getRowCount();
	for(int i = 0; i<colcount; i++){
		out.println(
				"<th>"+model.getColumnName(i)+"</th>"
				);
	}
%>
</tr>

<%
	for(int j = 0; j < rowcount; j++){
%>
<tr>
<%
	for(int k = 0; k < colcount; k++){
		out.println(
				"<td>"+model.getValueAt(j, k)+"</td>"
				);
	}
%>
</tr>
<%	
	}
%>
</table>
</body>
</html>