<%@page import="propack.Conprovider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="../css/addNewProduct-style.css">
    <title>Add New Product</title>
    <style>
        .back {
            color: white;
            margin-left: 2.5%;
        }
    </style>
</head>
<body>
    <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'></i> Back</a></h2>
    <%
    String id = request.getParameter("id");
    try {
        if (id != null && !id.isEmpty()) {
            Connection con = Conprovider.getCon();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM product WHERE id = ?");
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String category = rs.getString("category");
                int price = rs.getInt("price");
                String active = rs.getString("active");
    %>
    <form action="editProductAction.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <div class="left-div">
            <h3>Enter Name</h3>
            <input class="input-style" type="text" name="name" value="<%= name %>">
            <hr>
        </div>

        <div class="right-div">
            <h3>Enter Category</h3>
            <input class="input-style" type="text" name="category" value="<%= category %>">
            <hr>
        </div>

        <div class="left-div">
            <h3>Enter Price</h3>
            <input class="input-style" type="number" name="price" value="<%= price %>">
            <hr>
        </div>

        <div class="right-div">
            <h3>Active</h3>
            <select class="input-style" name="active">
                <option value="Yes" <%= active.equals("Yes") ? "selected" : "" %>>Yes</option>
                <option value="No" <%= active.equals("No") ? "selected" : "" %>>No</option>
            </select>
            <hr>
        </div>
        <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
    </form>
    <%
            } else {
                out.println("Product not found");
            }
            rs.close();
            pst.close();
            con.close();
        } else {
            out.println("Product ID is missing");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
    %>
</body>
</html>
