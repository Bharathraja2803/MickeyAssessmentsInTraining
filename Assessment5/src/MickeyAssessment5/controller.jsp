<%@page import="com.adventnet.persistence.DataAccessException"%>
<%@page import="com.adventnet.persistence.DataAccess"%>
<%@page import="com.adventnet.persistence.WritableDataObject"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.adventnet.persistence.DataObject"%>
<%@page import="com.adventnet.persistence.Row"%>
<%
Row row = new Row("BHARATH_TASK_TIMING_CHECK");
row.set("TASK_NAME_NAME", this.getClass().getSimpleName());
row.set("EXECUTION_TIME", Timestamp.valueOf(LocalDateTime.now()));

DataObject dataObject = new WritableDataObject();
try {
	dataObject.addRow(row);
	DataAccess.add(dataObject);
} catch (DataAccessException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>