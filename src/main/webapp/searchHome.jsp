<%@page import="propack.Conprovider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
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
int z = 0;
try {
    String search = request.getParameter("search");
    if (search != null && !search.isEmpty()) {
        Connection con = Conprovider.getCon();
        PreparedStatement pst = con.prepareStatement("SELECT * FROM product WHERE name LIKE ? OR category LIKE ? AND active = 'yes'");
        pst.setString(1, "%" + search + "%");
        pst.setString(2, "%" + search + "%");
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            z = 1;
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
        con.close();
    }
} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
    </tbody>
</table>
<% if (z == 0) { %>
    <h1 style="color:white; text-align: center;">Nothing to show</h1>
<% } %>
<br>
<br>
<br>
</body>
</html>
