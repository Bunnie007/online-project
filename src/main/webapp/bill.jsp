<%@ page import="propack.Conprovider" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link rel="stylesheet" href="css/bill.css">
    <title>Bill</title>
</head>
<body>
<%
String email = (String) session.getAttribute("email");
int total = 0;
int sno = 0;
try {
    Connection con = Conprovider.getCon();
    Statement st = con.createStatement();
    ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='" + email + "' and status='bill'");
    while (rs1.next()) {
        total = rs1.getInt(1);
    }

    ResultSet rs2 = st.executeQuery("select * from users inner join cart where cart.email='" + email + "' and cart.status='bill'");
    while(rs2.next()) {
%>
<center><h2>Online shopping Bill</h2></center>
<hr>
<div class="left-div"><h3>Name:<span class="name-color"> <%= rs2.getString("name") %></span> </h3></div>
<div class="right-div-right"><h3>Email: <span class="email-color"><%= email %> </span></h3></div>
<div class="right-div"><h3>Mobile Number:<span class="mobileNumber-color"> <%= rs2.getString("mobileNumber") %> </span></h3></div>  

<div class="left-div"><h3>Order Date:<span class="orderDate-color"> <%= rs2.getString("orderDate") %> </span></h3></div>
<div class="right-div-right"><h3>Payment Method: <span class="paymentMethod-color"><%= rs2.getString("paymentMethod") %> </span></h3></div>
<div class="right-div"><h3>Expected Delivery:<span class="deliveryDate-color"><%= rs2.getString("deliveryDate") %> </span></h3></div> 

<div class="left-div"><h3>Transaction Id:<span class="transactionID-color"> <%= rs2.getString("transactionID") %></span> </h3></div>
<div class="right-div-right"><h3>City: <span class="city-color"><%= rs2.getString("city") %> </span></h3></div> 
<div class="right-div"><h3>Address: <span class="address-color"><%= rs2.getString("address") %></span> </h3></div>

<div class="left-div"><h3>State:<span class="state-color"><%= rs2.getString("state") %></span> </h3></div>
<div class="right-div-right"><h3>Country: <span class="country-color"><%= rs2.getString("country") %> </span></h3></div>  
<hr>
<% break;} %>

<br>
<div class="table-container">
<table>
   <thead>
    <center><h2>Product Details</h2></center>
    <tr>
        <th>S.No</th>
        <th>Product Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Sub Total</th>
     </tr>
    </thead>
    <tbody>
    <%
    ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id where cart.email='"+email+"' and cart.status='bill'");
    while(rs.next()) {
        sno=sno+1;
    %>
    <tr>
        <td><%= sno %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><i class="fa fa-inr"></i><%= rs.getString(4) %> </td>
        <td><%= rs.getString(8) %></td>
        <td><%= rs.getString(10) %></td>
       
    </tr>
  <%} %>
    </tbody>
</table>
</div>
<center><h2>Total: <%= total %></h2></center>
<center><a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<button class="button right-button" onclick="window.print();">Print</button></center>
<br><br><br><br>
<%
    }
     catch(Exception e) 
     {
        System.out.println(e);
     }
%>
<footer>
          <center><h4> Welcome to our digital showroom! </h4></center>
</footer>
</body>
</html>
