<%@page import="propack.Conprovider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
h3 {
    color: yellow;
    text-align: center;
}

table {
    margin: 0 auto;
    width: 80%; 
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

<%
String msg = request.getParameter("msg");
if ("added".equals(msg)) { %>
<h3 class="alert">Product added successfully!</h3>

<% } else if ("exist".equals(msg)) { %>
<h3 class="alert">Product already exists in your cart! Quantity increased!</h3>

<% } else if ("invalid".equals(msg)) { %>
<h3 class="alert">Something went wrong! Try Again!</h3>
<% } %>

<div style="text-align: center;">
    <table>
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col"><i class="fa fa-inr"></i> Price</th>
                <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
            </tr>
        </thead>
        <tbody>

<%
try
{
	 Connection con=Conprovider.getCon();
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select * from product where active='yes' ");
     while(rs.next())
     {
	
%>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%= rs.getString(4) %></td>
            <td><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
        </tr>
     <%
	        }
	    }
 catch(Exception e)
 {
	 System.out.println(e);
 }
         %>
    </tbody>
</table>
</div>
 <br>
 <br>
 <br>

</body>
</html>
