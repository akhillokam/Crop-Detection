<%@include file="header.jsp"%>
<header class="major">
<h1>Admin</h1>
<p id="mid_text"></p>
 
</header>
<%
String msg1 = request.getParameter("msg1");
if(msg1 != null){
out.println("<script>alert('Login Fail..')</script>");
}
%>
<div id="tooplate_main">
<div class="col_2 float_l"><br>
 <div id="contact_form">
 <form method="post" name="contact" action="alogin.jsp">
<h3>User Name:</h3> <input type="text" id="author" 
name="uid" class="required input_field" required />
<div class="cleaner h10"></div>
<h3>Password:</h3> <input type="password" class="validateemail required input_field" name="pwd" required />
<div class="cleaner h10"></div>
<br><br>
<input type="submit" value="Login" id="submit" name="submit" 
class="submit_btn float_l" />
 </form>
 </div> 
 </div>
 <div class="cleaner"></div>
</div><br><br><br><br>