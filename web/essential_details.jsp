<%-- 
    Document   : essential_details.jsp
    Created on : Jan 6, 2023, 10:00:04 PM
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

        <title>Kind Heart Charity - News Detail</title>

        <!-- CSS FILES -->        
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-icons.css" rel="stylesheet">

        <link href="css/feedindiastyle.css" rel="stylesheet">
        
        <style>
            table{
                margin-top:25px;
                border:solid 1px black;
                width: 100%;
                border-collapse: collapse;
	        overflow: hidden;
	        box-shadow: 0 0 20px rgba(0,0,0,0.1);
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
        
<!--


-->
    </head>
    
    <body>

        <header class="site-header">
            <div class="container">
                <div class="row">
                    
                    <div class="col-lg-8 col-12 d-flex flex-wrap">
                        <p class="d-flex me-4 mb-0">
                            <i class="bi-geo-alt me-2"></i>
                            Marine Lines 452 Helios Apt Mumbai, India
                        </p>

                        <p class="d-flex mb-0">
                            <i class="bi-envelope me-2"></i>

                            <a href="mailto:info@company.com">
                                info@company.com
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
                    <img src="images/logo.png" class="logo img-fluid" alt="">
                    <span>
                        Kind Heart Charity
                        <small>Non-profit Organization</small>
                    </span>
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="index.html#section_1">Home</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link smoothscroll" href="index.html#section_2">About</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="index.html#section_3">Causes</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="index.html#section_4">Volunteer</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link click-scroll dropdown-toggle" href="index.html#section_5" id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Work</a>

                            <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
                                <li><a class="dropdown-item" href="donate_detail.jsp">Donate Essentials</a></li>

                                <li><a class="dropdown-item active" href="essential_details.jsp">View Essentials</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="index.html#section_6">Contact</a>
                        </li>

                        <li class="nav-item ms-3">
                            <a class="nav-link custom-btn custom-border-btn btn" href="donate.html">Donate</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
 
        
        <!-- header and nav bar end -->

                            
 <%
           Class.forName("com.mysql.cj.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/feedindia";
           String user = "root";
           String pass = "root";
           
           Connection con = DriverManager.getConnection(url,user,pass);
           String query = "SELECT * FROM DONATE_DETAILS;";
           
           Statement st = con.createStatement();
          ResultSet rs = st.executeQuery(query);
                    
                        %>
       
       <table>
			<tr>
				<th id="tablehead">Name</th>
				<th id="tablehead">Contact</th>
				<th id="tablehead">Receive</th>
				<th id="tablehead">Amount</th>
				<th id="tablehead">From</th>
                                <th id="tablehead">Essentials</th><!-- comment -->
                                <th id="tablehead">Credits</th>
			</tr>

                        <%
                             while(rs.next()){
                                String column1 = rs.getString(1);
                                String column2 = rs.getString(2);
                                String column3 = rs.getString(3);
                                String column4 = rs.getString(4);
                                String column5 = rs.getString(5);
                                String column6 = rs.getString(6);
                                int column7 = rs.getInt(7);
                            %>
                        
			<tr>
				<td> <%= column1%></td>
				<td> <%= column2%></td>
				<td> <%= column3%></td>
				<td> <%= column4%></td>
				<td> <%= column5%></td>
                                <td> <%= column6%></td>
				<td> <%= column7%></td>
			</tr>
                        
                        <%
                            }
                        %>
			
	</table>
            
       

                
        
        <!-- JAVASCRIPT FILES -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/click-scroll.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>
