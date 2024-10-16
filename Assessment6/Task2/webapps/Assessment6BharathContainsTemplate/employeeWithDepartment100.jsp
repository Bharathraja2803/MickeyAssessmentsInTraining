<%@page import="com.adventnet.model.table.CVTableModel"%>
<%@page import="com.adventnet.customview.ViewData"%>
<%@page import="com.adventnet.mfw.bean.BeanUtil"%>
<%@page import="com.adventnet.customview.CustomViewManager"%>
<%@page import="com.adventnet.customview.service.SQTemplateValuesServiceConfiguration"%>
<%@page import="com.adventnet.customview.service.ServiceConfiguration"%>
<%@page import="java.util.HashMap"%>
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
<h1>Employee in Department 100 details</h1>
<table border='1'>
        <tr><%
        CustomViewRequest cvRequest = new CustomViewRequest("EmployeeDepartment100CV");

        HashMap valueMap = new HashMap();
        valueMap.put("DEPARTMENT_ID", "BHARATH_EMPLOYEE_CONTAINS_TEMPLATE");
        ServiceConfiguration serviceConfiguration = new SQTemplateValuesServiceConfiguration(valueMap);
        cvRequest.putServiceConfiguration(serviceConfiguration);

        CustomViewManager cvManager = (CustomViewManager) BeanUtil.lookup("TableViewManager");
        ViewData viewData = cvManager.getData(cvRequest);

        CVTableModel model = (CVTableModel) viewData.getModel();
        int colcount = model.getColumnCount();
        int rowcount = model.getRowCount();
        for(int k = 0; k<colcount; k++)
        {%>
            <th><%=model.getColumnName(k)%></th><%
        }%>
        </tr><%
        for(int i=0; i<rowcount;i++)
        {%>
            <tr><%
            for (int j=0;j<colcount;j++)
            {%>
                <td><%=model.getValueAt(i, j)%></td><%
            }%>
            </tr><%
         }%>
    </table>
</body>
</html>