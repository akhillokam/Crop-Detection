<%@ include file="aheader.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,java.util.*,java.math.*,KNN.*"%>

<%@ page import="java.sql.*"%>
<%!String thisLine = null; 
StringBuffer sb1=null; 
String unm=null,fid=null,fnm=null,pk0,pku,sk2;
int i=0;
File f;
ResultSet rs6;
%>
 
<%
 Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select * from livevalues");
if(rs1.next()){
String 
querypoints=rs1.getString(2)+","+rs1.getString(3)+","+rs1.getString(4)+","+rs1.getString(5);
 ArrayList resultList=KNN.SecurekNN(querypoints); 
 System.out.println("al="+resultList);
 for(int i=0;i<resultList.size();i++){
 
 String av[]=resultList.get(i).toString().split(",");
System.out.println("querypoints="+av[0]);

Statement st6=con.createStatement();
rs6=st6.executeQuery("select *from dataset where sno='"+av[0]+"'");
if(rs6.next()){
%>
<!-- font size="" color="#cc0033">
<table cellpadding="10">
 <tr><td>Crop Type<td><%=rs6.getString(7)%></td></tr></table> -->
<%
Statement st2=con.createStatement();
int j=st2.executeUpdate("insert into results 
values('"+rs1.getString(2)+"','"+rs1.getString(3)+"','"+rs1.getString(4)+"','"+rs1.getString(5)+"','"
+rs6.getString(7)+"')");
if(j>0){
response.sendRedirect("results.jsp");
}
}}}
%>
