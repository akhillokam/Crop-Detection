<%@ include file="aheader.jsp"%>
<%@ page import="java.sql.*" import="databaseconnection.*" %>
<font size="" color="#cc0033">
<table cellpadding="10">
<tr><th>Sno<th>Soil Moisture<th>Temp<th>Humidity<th>PH<th>CropType
<% 
int temp=0;
try{
Connection con2 = databasecon.getconnection();
Statement st5 = con2.createStatement();
String sss1 = "select * from results";
ResultSet rs1=st5.executeQuery(sss1);
while(rs1.next())
{
++temp;
%>
<tr><TH><H4><%=temp%><tH><H4><%=rs1.getString(1)%><tH><H4><%=rs1.getS
tring(2)%><tH><H4><%=rs1.getString(3)%><tH><H4><H4><%=rs1.getString(4)%><tH><H
4><H4><%=rs1.getString(5)%>

<%
}}
catch(Exception e1)
{
out.println(e1);
}
%>
</table>
<br><br>
<%@ include file="footer.jsp"%>