<%@page import="propack.Conprovider"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try {
    Connection con = Conprovider.getCon();
    PreparedStatement pst = con.prepareStatement("UPDATE product SET name=?, category=?, price=?, active=? WHERE id=?");
    pst.setString(1, name);
    pst.setString(2, category);
    pst.setString(3, price);
    pst.setString(4, active);
    pst.setString(5, id);

    pst.executeUpdate();
    
    if (active.equals("No")) {
        PreparedStatement pstDelete = con.prepareStatement("DELETE FROM cart WHERE product_id=? AND address IS NULL");
        pstDelete.setString(1, id);
        pstDelete.executeUpdate();
        pstDelete.close();
    }
    
    pst.close();
    con.close();
    
    response.sendRedirect("allProductEditProduct.jsp?msg=done");
} catch(Exception e) {
    e.printStackTrace();
    response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>
