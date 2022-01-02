<%@include file="aheader.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%
int rice=0,wheat=0,corn=0,sweetcorn=0,cnt=0;
Connection con2 = databasecon.getconnection();
Statement st=con2.createStatement();
//s5.executeUpdate("delete from graph");
Statement st3=con2.createStatement();
ResultSet rs3=st3.executeQuery("select count(*) from results where ctype='Rice'");
if(rs3.next()){
rice=rs3.getInt(1);
}
Statement st4=con2.createStatement();
ResultSet rs4=st4.executeQuery("select count(*) from results where ctype='Wheat'");
if(rs4.next()){
wheat=rs4.getInt(1);
}
Statement st6=con2.createStatement();
ResultSet rs6=st6.executeQuery("select count(*) from results where ctype='Cotton'");
if(rs6.next()){
corn=rs6.getInt(1);
}
Statement st7=con2.createStatement();
ResultSet rs7=st7.executeQuery("select count(*) from results where ctype='Oil'");

if(rs7.next()){
sweetcorn=rs7.getInt(1);
}
Statement st8=con2.createStatement();
ResultSet rs8=st8.executeQuery("select count(*) from results where ctype='Coconut'");
if(rs8.next()){
cnt=rs8.getInt(1);
}
Statement st5=con2.createStatement();
st5.executeUpdate("delete from graph");
st5.executeUpdate("insert into graph 
values(1,'"+rice+"','"+wheat+"','"+corn+"','"+sweetcorn+"','"+cnt+"')");
String query="SELECT *from graph";
JDBCCategoryDataset dataset=new 
JDBCCategoryDataset("jdbc:mysql://185.28.23.173:3306/ctcorphy_crop",
"com.mysql.jdbc.Driver","ctcorphy_crop","crop@1234");
dataset.executeQuery(query);
JFreeChart chart = ChartFactory .createBarChart3D(
"Crop-Detecting Analysis", 
"Crop Type", 
"Crop Values",
dataset, 
PlotOrientation.VERTICAL,true, true, false);
try
{
ChartUtilities.saveChartAsJPEG(new File("E:\\Apache Software Foundation\\Tomcat 
8.0\\webapps\\Crop-KNN\\images\\chart.jpg"), chart, 400, 300);
}
catch (IOException e)
{
e.printStackTrace();

System.out.println("");
}
%>
<center><img src="images/chart.jpg" height="500px" width="500px" >
<%@ include file="footer.jsp" %>