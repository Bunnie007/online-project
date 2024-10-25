<%@page import="propack.Conprovider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Delivered Orders</title>
<style>
.th-style {
    width: 25%;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>

<%
String msg = request.getParameter("msg");
if (msg != null) {
    if ("success".equals(msg)) {
%>
<h3 class="alert">Order Marked as Delivered Successfully!</h3>
<%
    } else if ("error".equals(msg)) {
%>
<h3 class="alert">Something went wrong! Try Again!</h3>
<%
    }
}
%>

<table id="customers">
    <tr>
        <th>Mobile Number</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th><i class="fa fa-inr"></i> Sub Total</th>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
        <th>Country</th>
        <th>Order Date</th>
        <th>Expected Delivery Date</th>
        <th>Payment Method</th>
        <th>T-ID</th>
        <th>Status</th>
    </tr>
<%
try {
    Connection con = Conprovider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM cart INNER JOIN product ON cart.product_id = product.id WHERE cart.orderDate IS NOT NULL AND cart.status = 'processing'");
    while (rs.next()) {
%>
    <tr>
        <td><%=rs.getString(10) %></td>
        <td><%=rs.getString(17) %></td>
        <td><%=rs.getString(3) %></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(5) %></td>
        <td><%=rs.getString(6) %></td>
        <td><%=rs.getString(7) %></td>
        <td><%=rs.getString(8) %></td>
        <td><%=rs.getString(9) %></td>
        <td><%=rs.getString(11) %></td>
        <td><%=rs.getString(12) %></td>
        <td><%=rs.getString(13) %></td>
        <td><%=rs.getString(14) %></td>
        <td><%=rs.getString(15) %></td>
    </tr>
<%
    }
    con.close();
} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
</table>
<br><br><br>
</body>
</html>
