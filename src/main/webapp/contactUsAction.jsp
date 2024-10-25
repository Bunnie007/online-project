<%@page import="propack.Conprovider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString(); 
String subject=request.getParameter("subject");
String body=request.getParameter("body");

try
{
	    Connection con = Conprovider.getCon();
	    PreparedStatement ps=con.prepareStatement("insert into message(email,subject,body) value(?,?,?)");
	    ps.setString(1, email);
	    ps.setString(2, subject);
	    ps.setString(3, body);
	    ps.executeUpdate();
	    
	    response.sendRedirect("contactUs.jsp?msg=valid");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("contactUs.jsp?msg=invalid");
}
%>