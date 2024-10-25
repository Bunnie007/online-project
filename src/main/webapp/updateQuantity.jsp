<%@ page import="java.sql.*" %>
<%@ page import="propack.Conprovider" %>
<%
String productId = request.getParameter("productId");
String action = request.getParameter("action");

if (productId != null && action != null) {
    try {
        Connection con = Conprovider.getCon();
        PreparedStatement ps;
        ResultSet rs;
              
        ps = con.prepareStatement("SELECT quantity, price FROM cart WHERE product_id = ? AND address IS NULL");
        ps.setString(1, productId);
        rs = ps.executeQuery();
        if (rs.next()) {
            int quantity = rs.getInt("quantity");
            int price = rs.getInt("price");
                        
            if ("increment".equals(action)) {
                quantity++;
            } else if ("decrement".equals(action)) {
                
                if (quantity > 1) {
                    quantity--;
                } else {
                     response.sendRedirect("myCart.jsp?msg=notPossible");
                    return;
                }
            }
                      
            ps = con.prepareStatement("UPDATE cart SET quantity = ? WHERE product_id = ? AND address IS NULL");
            ps.setInt(1, quantity);
            ps.setString(2, productId);
            ps.executeUpdate();
                    
            int totalPrice = quantity * price;
            ps = con.prepareStatement("UPDATE cart SET total = ? WHERE product_id = ? AND address IS NULL");
            ps.setInt(1, totalPrice);
            ps.setString(2, productId);
            ps.executeUpdate();
                        
            response.sendRedirect("myCart.jsp?msg=" + action);
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
