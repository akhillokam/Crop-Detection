<%@ include file="aheader.jsp"%>
<%@ page import="java.sql.*" import="databaseconnection.*" %>
<font size="" color="#cc0033">
<table cellpadding="10">
<% 
int temp=0;
try{
Connection con2 = databasecon.getconnection();
Statement st5 = con2.createStatement();
String sss1 = "select * from livevalues";
ResultSet rs1=st5.executeQuery(sss1);
if(rs1.next())
{
++temp;
%>
<form action="getKNN.jsp">
<tr><td>Soil Moisture<td><%=rs1.getString(2)%>
<tr><td>Temp<td><%=rs1.getString(3)%>
<tr><td>Humidity<td><%=rs1.getString(4)%>
<tr><td>PH<td><%=rs1.getString(5)%>
<%
}}
catch(Exception e1)
{
out.println(e1);
}
%>
<tr><td></td><td><input type="submit" value="Apply KNN"></td>
</form>
</table>
<br><br>
<%@ include file="footer.jsp"%>