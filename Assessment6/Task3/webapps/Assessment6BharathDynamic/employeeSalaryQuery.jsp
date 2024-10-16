
<%@page import="com.adventnet.ds.query.QueryConstants"%>
<%@page import="com.adventnet.ds.query.Criteria"%>
<%@page import="com.adventnet.ds.query.Table"%>
<%@page import="com.adventnet.model.table.CVTableModel"%>
<%@page import="com.adventnet.customview.ViewData"%>
<%@page import="com.adventnet.mfw.bean.BeanUtil"%>
<%@page import="com.adventnet.customview.CustomViewManager"%>
<%@page import="com.adventnet.customview.CustomViewRequest"%>
<%@page import="com.adventnet.ds.query.Column"%>
<%@page import="com.adventnet.ds.query.Join"%>
<%@page import="com.adventnet.ds.query.SelectQueryImpl"%>
<%@page import="com.adventnet.ds.query.SelectQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Employee with Salary Details</h1>
<table border="1" width="90%">
<%

if (session.getAttribute("model")== null){
	out.println("<h3>No Query Executed</h3>");
	return;
}

CVTableModel model = (CVTableModel)session.getAttribute("model");

int colcount = model.getColumnCount();
int rowcount = model.getRowCount();
%>
<tr>
<% 
for(int k = 0; k<colcount; k++)
{

    out.print("<th>"+model.getColumnName(k) + "</th>");

}
%>
</tr>
<%

for(int i = 0; i < rowcount; i++)
{
	out.println("<tr>");
    for(int j = 0; j < colcount; j++)
    {
    	
        out.println("<td>"+model.getValueAt(i, j) + "</td>");
    }
    out.println("</tr>");
}

session.removeAttribute("model");
%>
</table>
</body>
</html>