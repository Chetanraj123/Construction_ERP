<%@ page import="com.construction.erp.db.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Home Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Glance Design Dashboard Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />

<!-- font-awesome icons CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons CSS-->

<!-- side nav css file -->
<link href='css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
<!-- //side nav css file -->
 
 <!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>

<!--webfonts-->
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
<!--//webfonts--> 

<!-- chart -->
<script src="js/Chart.js"></script>
<!-- //chart -->

<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
<style>
#chartdiv {
  width: 100%;
  height: 295px;
}
</style>

<!-- //pie-chart --><!-- index page sales reviews visitors pie chart -->

	<!-- requried-jsfiles-for owl -->
					<link href="css/owl.carousel.css" rel="stylesheet">
					<script src="js/owl.carousel.js"></script>
						<script>
							$(document).ready(function() {
								$("#owl-demo").owlCarousel({
									items : 3,
									lazyLoad : true,
									autoPlay : true,
									pagination : true,
									nav:true,
								});
							});
						</script>
					<!-- //requried-jsfiles-for owl -->
</head> 
<body class="cbp-spmenu-push">
	<div class="main-content">
	<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
		<!--left-fixed -navigation-->
		<aside class="sidebar-left">
      <nav class="navbar navbar-inverse">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <h1><a class="navbar-brand" href="index.html"><span class="fa fa-area-chart"></span>CR<span class="dashboard_text">Construction</span></a></h1>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="sidebar-menu">
              <li class="header">Main Menu</li>
              <li class="treeview">
                <a href="index.html">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
              </li>
			 
                <li class="header">LABELS</li>
              <li><a href="viewAssingProject.jsp"><i class="fa fa-angle-right text-red"></i> <span>View Assign Projects</span></a></li>
              <li><a href="viewTeamMember.jsp"><i class="fa fa-angle-right text-yellow"></i> <span>View Team Members</span></a></li>
    			 <li><a href="AssignTask.jsp"><i class="fa fa-angle-right text-yellow"></i> <span>Assign Task</span></a></li>
              <li class="treeview">
                <a href="viewReport.jsp">
                <i class="fa fa-laptop"></i>
                <span>Project Status</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
              </li>
            
          </div>
          <!-- /.navbar-collapse -->
      </nav>
    </aside>
	</div>
		<!--left-fixed -navigation-->
		
		
		<!-- header-starts -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--toggle button start-->
				<button id="showLeftPush"><i class="fa fa-bars"></i></button>
				<!--toggle button end-->
				
				<!--notification menu end -->
				<div class="clearfix"> </div>
			</div>
			<div class="header-right">
				
				
				<div class="clearfix"> </div>				
			</div>
			<div class="clearfix"> </div>	
		</div>
		<!-- //header-ends -->
		<!-- main content start-->
				
				<%
				
						 try
						 {
							 Connection con = ConnectionDB.getConnect();
							 PreparedStatement ps2 = con.prepareStatement("select * from project_assing"); 							
							 ResultSet rs = ps2.executeQuery();
							 if(rs.next())
							 {
								
								UserData.setAe_name(rs.getString("ae_name"));
						
							 }
						 }
						 catch(Exception e)
						 {
							 e.printStackTrace();
						 }
						 %>
				
			<div id="page-wrapper">
			<div class="main-page">
				<div class="tables">
					<h2 class="title1">CR Construction</h2>
										
					<div class="bs-example widget-shadow" data-example-id="contextual-table"> 
						<h4>Assign Project:</h4>
						<table class="table"> 
		
						<tr> 
						<th>Project ID</th> 
						<th>Name</th> 
						<th>Architect/Engineer</th> 
						<th>Department</th> 
						</tr> 
						 <%
						 
						  String a = UserData.getAe_name();
						 try
						 {
							 Connection con = ConnectionDB.getConnect();
							 PreparedStatement ps1 = con.prepareStatement("select * from project_assing where ae_name=?");
							 ps1.setString(1,a);
							 ResultSet rs = ps1.executeQuery();
							 while(rs.next())
							 {
							%>
							<tr class="active"> 
							<th scope="row"><%= rs.getInt("p_id") %></th> 
							<td><%= rs.getString("p_name") %></td> 
							<td><%= rs.getString("ae_name") %></td> 
							<td><%= rs.getString("department") %></td>
							 </tr>
							<% 
							 }
						 }
						 catch(Exception e)
						 {
							 e.printStackTrace();
						 }
						 %>
					 </table> 
					</div>
					
				</div>
			</div>
		</div>
	
	<!-- for amcharts js photo slide hotat mhnun js ahe -->
			<script src="js/amcharts.js"></script>
			<script src="js/serial.js"></script>
			<script src="js/export.min.js"></script>
			<link rel="stylesheet" href="css/export.css" type="text/css" media="all" />
			<script src="js/light.js"></script>
	<di>
	<!--footer-->
	<div class="footer">
	   <p>&copy; 2022 Chetanraj Patil. All Rights Reserved | Design by Chetanraj Patil</p>		
	</div>
    <!--//footer-->
	</div>
		
	
	
	<!-- Classie --><!-- for toggle left push menu script -->
		<script src="js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			

			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!-- //Classie --><!-- //for toggle left push menu script -->
		
	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	
	<!-- side nav js -->
	<script src='js/SidebarNav.min.js' type='text/javascript'></script>
	<script>
      $('.sidebar-menu').SidebarNav()
    </script>
	<!-- //side nav js -->
	
	
	
	
	<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.js"> </script>
	<!-- //Bootstrap Core JavaScript -->
	
</body>
</html>