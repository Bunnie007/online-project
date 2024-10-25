<%@page import="propack.Conprovider"%>
<%@page import="java.sql.*"%>
<%
try
{
    Connection con = Conprovider.getCon();
    Statement st = con.createStatement();
    
    String p1 = "create table users(name varchar(100), email varchar(100) primary key, mobileNumber bigint, password varchar(100), address varchar(500), city varchar(100), state varchar(100), country varchar(100))";
    
    String p2 = "create table product(id int, name varchar(500), category varchar(200), price int, active varchar(10))";
    
    String p3 = "create table cart(email varchar(100), product_id int, quantity int, price int, total int, address varchar(500), city varchar(100), state varchar(100), country varchar(100), mobileNumber bigint, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionID varchar(100), status varchar(10))";
    
    String p4 = "create table message(id int AUTO_INCREMENT, email varchar(100), subject varchar(200), body varchar(1000), PRIMARY KEY(id))";
    
    System.out.println(p1);
    System.out.println(p2);
    System.out.println(p3);
    System.out.println(p4);

    st.execute(p1);
    st.execute(p2);
    st.execute(p3);
    st.execute(p4);
    System.out.println("Table Created");
    con.close();
}
catch(Exception e)
{
    System.out.println(e);
}
%>
