<%-- 
    Document   : donations.jsp
    Created on : Jan 7, 2023, 12:10:13 AM
    Author     : AbdulRasool
--%>

<%@page import = "java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Feeding India</title>

        <!-- CSS FILES -->        
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-icons.css" rel="stylesheet">

        <link href="css/feedindiastyle.css" rel="stylesheet">
        
         <style>
            table{
                margin-top:25px;
                border:solid 1px black;
                width: 70%;
                border-collapse: collapse;
	        overflow: hidden;
	        box-shadow: 0 0 20px rgba(0,0,0,0.1);
                border-radius: 10px;
                margin-bottom: 25px;
            }
            
            th{
                background-color: #5bc1ac;
            }
            
            
            
            
         th,td {
	padding: 15px;
        border:solid 1px #000;
}

th {
	text-align: left;
}
            </style>


    </head>
    
    <body id="section_1">

        <header class="site-header">
            <div class="container">
                <div class="row">
                    
                    <div class="col-lg-8 col-12 d-flex flex-wrap">
                        <p class="d-flex me-4 mb-0">
                            <i class="bi-geo-alt me-2"></i>
                            Marine Lines, 452 Helios Apt Mumbai, India
                        </p>

                        <p class="d-flex mb-0">
                            <i class="bi-envelope me-2"></i>

                            <a href="mailto:info@company.com">
                                feedindiaorg@company.com
                            </a>
                        </p>
                    </div>

                    <div class="col-lg-3 col-12 ms-auto d-lg-block d-none">
                        <ul class="social-icon">
                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-twitter"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-facebook"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-instagram"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-youtube"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-whatsapp"></a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </header>

        <nav class="navbar navbar-expand-lg bg-light shadow-lg">
            <div class="container">
                <a class="navbar-brand" href="index.html">
                    <img src="images/logo.png" class="logo img-fluid" alt="Kind Heart Charity">
                    <span>
                        Feed India
                        <small>Non-profit NGO</small>
                    </span>
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#top">Home</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_2">About</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_3">Causes</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_4">Volunteer</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link click-scroll dropdown-toggle" href="#section_5" id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Work</a>

                            <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
                                <li><a class="dropdown-item" href="donate_essential.html">Donate Essentials</a></li>

                                <li><a class="dropdown-item" href="essential_details.jsp">Essential Details</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_6">Contact</a>
                        </li>

                        <li class="nav-item ms-3">
                            <a class="nav-link custom-btn custom-border-btn btn" href="donate.html">Donate</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <!-- Navbar end-->
        
          <%
            
            
        try{
        
        String amount = "";
        String name = request.getParameter("donation-name");
        String email = request.getParameter("donation-email");
        String type = request.getParameter("DonationFrequency");
        String donation = request.getParameter("flexRadioDefault");
        String custom_donation = request.getParameter("custom");
        String method = request.getParameter("DonationPayment");
        if(donation != null){
            amount = donation;
              }
              
              else{
              amount = custom_donation;
              }
              
              int amt;
              amt = Integer.parseInt(amount);
        
              
                  
           Class.forName("com.mysql.cj.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/feedindia";
           String user = "root";
           String pass = "root";
           
           Connection con = DriverManager.getConnection(url,user,pass);
           String query = "INSERT INTO donations VALUES (?,?,?,?,?);";
           
           PreparedStatement pst = con.prepareStatement(query);
           pst.setString(1,name);
           pst.setString(2,email);
           pst.setString(3,type);
           pst.setInt(4,amt);
           pst.setString(5,method);
           pst.executeUpdate();
           con.close();       
            }
            catch(Exception ex){
            System.out.println(ex);
            }
            
             //response.sendRedirect("essential_details.jsp");
             
        %>

        <%
           Class.forName("com.mysql.cj.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/feedindia";
           String user = "root";
           String pass = "root";
           
           Connection con = DriverManager.getConnection(url,user,pass);
           String query = "SELECT * FROM DONATIONS;";
           Statement st = con.createStatement();
          ResultSet rs = st.executeQuery(query);      
         
                        %>
       
    <center> <table>
			<tr>
				<th id="tablehead">Name</th>
				<th id="tablehead">Email</th>
				<th id="tablehead">Frequency</th>
				<th id="tablehead">Amount</th>
				<th id="tablehead">Method</th>
			</tr>

                        <%
                             while(rs.next()){
                                String column1 = rs.getString(1);
                                String column2 = rs.getString(2);
                                String column3 = rs.getString(3);
                                int column4 = rs.getInt(4);
                                String column5 = rs.getString(5);

                            %>
                        
			<tr>
				<td> <%= column1%></td>
				<td> <%= column2%></td>
				<td> <%= column3%></td>
				<td> <%= column4%></td>
				<td> <%= column5%></td>
			</tr>
                        
                        <%
                            }
                        %>
                   
	</table>
                                 </center>
        
        <!-- Footer Start -->
        
         <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-12 mb-4">
                        <img src="images/logo.png" class="logo img-fluid" alt="">
                    </div>

                    <div class="col-lg-4 col-md-6 col-12 mb-4">
                        <h5 class="site-footer-title mb-3">Quick Links</h5>

                        <ul class="footer-menu">
                            <li class="footer-menu-item"><a href="#" class="footer-menu-link">Our Story</a></li>

                            <li class="footer-menu-item"><a href="#" class="footer-menu-link">Become a Life-Saver</a></li>

                            <li class="footer-menu-item"><a href="#" class="footer-menu-link">Connect with us</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-4 col-md-6 col-12 mx-auto">
                        <h5 class="site-footer-title mb-3">Contact Infomation</h5>

                        <p class="text-white d-flex mb-2">
                            <i class="bi-telephone me-2"></i>

                            <a href="tel: 120-240-9600" class="site-footer-link">
                                120-240-9600
                            </a>
                        </p>

                        <p class="text-white d-flex">
                            <i class="bi-envelope me-2"></i>

                            <a href="mailto:info@yourgmail.com" class="site-footer-link">
                                donate@charity.org
                            </a>
                        </p>

                        <p class="text-white d-flex mt-3">
                            <i class="bi-geo-alt me-2"></i>
                            Marine Lines, 452 Helios Apt Mumbai, India
                        </p>

                        <a href="#" class="custom-btn btn mt-3">Get Direction</a>
                    </div>
                </div>
            </div>

            <div class="site-footer-bottom">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-6 col-md-7 col-12">
                            <p class="copyright-text mb-0">Copyright ©2022 <a href="#">Feed India</a> Org.
                        	
                        </div>
                        
                        <div class="col-lg-6 col-md-5 col-12 d-flex justify-content-center align-items-center mx-auto">
                            <ul class="social-icon">
                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link bi-twitter"></a>
                                </li>

                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link bi-facebook"></a>
                                </li>

                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link bi-instagram"></a>
                                </li>

                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link bi-linkedin"></a>
                                </li>

                                <li class="social-icon-item">
                                    <a href="https://youtube.com" class="social-icon-link bi-youtube"></a>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
            </div>
        </footer>

        <!-- JAVASCRIPT FILES -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/click-scroll.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>
        
