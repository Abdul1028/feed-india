<%-- 
    Document   : register
    Created on : Jan 6, 2023, 12:48:44 AM
    Author     : AbdulRasool
--%>

<%@page import = "java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            String name = request.getParameter("volunteer-name");
            String email = request.getParameter("volunteer-email");
            String password = request.getParameter("volunteer-pwd");
            String message = request.getParameter("volunteer-message");
            

           Class.forName("com.mysql.cj.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/feedindia";
           String user = "root";
           String pass = "root";
           
           Connection con = DriverManager.getConnection(url,user,pass);
           String query = "INSERT INTO REGISTER VALUES (?,?,?,?);";
           
           PreparedStatement pst = con.prepareStatement(query);
           pst.setString(1,name);
           pst.setString(2,email);
           pst.setString(3,password);
           pst.setString(4,message);
           pst.executeUpdate();
           con.close();
            }
            catch(Exception ex){
            System.out.println(ex);
            }
            

            response.sendRedirect("index.html");
            %>
    </body>
</html>
