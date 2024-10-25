<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
			<div class="signup">
				<form action="signupAction.jsp" method="post">
				<input type="text" name="name" placeholder="Enter Name" required>
				<input type="email" name="email" placeholder="Enter Email" required>				
				<input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>	
				<input type="password" name="password" placeholder="*****" required>
				<input type="submit" value="signup">
				</form>
				<h2><a href="login.jsp">Login</a></h2>
				</div>
			</div>
		<div class='whysign'>
<%
String msg=request.getParameter("msg");
if ("valid".equals(msg))
{
%>
<h1>Successfully Updated</h1>
<%} %>

<%if ("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
</div>

</body>
</html>