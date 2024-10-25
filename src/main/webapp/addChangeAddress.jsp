<%@ page import="propack.Conprovider" %>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if ("valid".equals(msg)) {
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>
<%
if ("invalid".equals(msg)) {
%>
<h3 class="alert">Something Went Wrong! Try Again!</h3>
<%} %>

<%
try {
    Connection con = Conprovider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=?");
    ps.setString(1, email);
    ResultSet rs = ps.executeQuery();
    ResultSetMetaData metaData = rs.getMetaData();
    int columnCount = metaData.getColumnCount();
    while (rs.next()) {
%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%=rs.getString("address") %>" placeholder="Enter Address" required>
 <hr>
 <h3>Enter City</h3>
  <input class="input-style" type="text" name="city" value="<%=rs.getString("city") %>" placeholder="Enter City" required>
<hr>
<h3>Enter State</h3>
 <input class="input-style" type="text" name="state" value="<%=rs.getString("state") %>" placeholder="Enter State" required>
<hr>
<h3>Enter Country</h3>
 <input class="input-style" type="text" name="country" value="<%=rs.getString("country") %>" placeholder="Enter country" required>
<hr>
 <button class="button" type="submit"> Save <i class='far fa-arrow-alt-circle-right'></i></button>
<%
    }
    con.close();
} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
</form>
</body>
<br><br><br><br>
</html>
