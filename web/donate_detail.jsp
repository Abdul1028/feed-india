<%-- 
    Document   : donate_details
    Created on : Jan 6, 2023, 7:19:02 PM
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
        <h1>Hello World!</h1>
        
        <%
            
            
        try{
        
        int credits = 0;
        String donated = "";
        String n = request.getParameter("name");
        String e = request.getParameter("email");
        String c = request.getParameter("contact");
        String a = request.getParameter("address");
        String amt = request.getParameter("amt");
        String o = request.getParameter("org");
        String food_check_box = request.getParameter("food");
        String cloth_check_box = request.getParameter("cloth");
        
        if(food_check_box != null && cloth_check_box == null){
        credits += 100;  
        donated="Food";
            }
            else if(cloth_check_box != null  && food_check_box == null ){
            credits += 50;
            donated="Clothes";
            }
            else if(food_check_box == null && cloth_check_box == null){
            credits = 0;
            donated="";
            }
            else if (food_check_box != null && cloth_check_box != null){
            credits += 200;
            donated="Food and Clothes";
            }
            
         
           Class.forName("com.mysql.cj.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/feedindia";
           String user = "root";
           String pass = "root";
           
           Connection con = DriverManager.getConnection(url,user,pass);
           String query = "INSERT INTO donate_details VALUES (?,?,?,?,?,?,?);";
           
           PreparedStatement pst = con.prepareStatement(query);
           pst.setString(1,n);
           pst.setString(2,c);
           pst.setString(3,a);
           pst.setString(4,amt);
           pst.setString(5,o);
           pst.setString(6,donated);
           pst.setInt(7,credits);
           pst.executeUpdate();
           con.close();
            }
            catch(Exception ex){
            System.out.println(ex);
            }
             response.sendRedirect("essential_details.jsp");
             
        %>
                       
    </body>
</html>
