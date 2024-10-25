<%@page import="propack.Conprovider"%>
<%@page import="java.sql.*"%>
<%
String productId = request.getParameter("productId");

if (productId != null) {
    try {
        Connection con = Conprovider.getCon();
        PreparedStatement ps;
              
        ps = con.prepareStatement("DELETE FROM cart WHERE product_id = ? AND address IS NULL");
        ps.setString(1, productId);
        int rowsAffected = ps.executeUpdate();
        
        if (rowsAffected > 0) {
            response.sendRedirect("myCart.jsp?msg=removed");
        } else {
            response.sendRedirect("myCart.jsp?msg=notFound");
        }
    } catch (Exception e) {
        response.sendRedirect("myCart.jsp?msg=error");
    }
} else {
    response.sendRedirect("myCart.jsp?msg=invalidAction");
}
%>
