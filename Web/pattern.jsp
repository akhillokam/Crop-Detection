<%@ page import="databaseconnection.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="aheader.jsp"%>
<center>
<h1>Upload Data Set</h2></font></h1>
<br>
<form method="post" action="upload.jsp">
<table>
<tr>
<td><input type="file" name="file" required><td><input type="submit" value="upload" 
accept="*.xlsx"></td>
</tr>
</table>
</form><br><br>
<%@ include file="footer.jsp"%>