<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
			
		<div id="page-wrapper">
			<div class="main-page">
				<div class="forms">
					<h2 class="title1">CR Construction</h2>
					<div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
						
						<div class="form-body">
							<form action="SAssignTask" method="post"> 
							
							 
					</div>
			
					
					<div class="row">
						<h3 class="title1">Assign Task :</h3>
						<div class="form-three widget-shadow">
							<div class="form-horizontal">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">Title</label>
									<div class="col-sm-8">
										<input type="text" class="form-control1" name="Title" placeholder="Default Input">
									</div>
								</div>
								
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">Assigner</label>
									<div class="col-sm-8"><select name="Assigner" id="Assigner" class="form-control1">
									<option>-select-</option>
									<%
										try
									{
											Connection con = ConnectionDB.getConnect();
											PreparedStatement ps1 = con.prepareStatement("select ae_name from arc_eng");
											ResultSet rs = ps1.executeQuery();
											while(rs.next())
											{
												
											%>
											
												<option><%=rs.getString("ae_name") %></option>
											
											<% 
											}
									}
									catch(Exception e)
									{
										e.printStackTrace();
									}
									%>
										
										
									</select></div>
								</div>
								
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">Employee Name</label>
									<div class="col-sm-8"><select name="em_name" id="em_name" class="form-control1">
									<option>-select-</option>
									<%
										try
									{
											Connection con = ConnectionDB.getConnect();
											PreparedStatement ps1 = con.prepareStatement("select em_name from employee");
											ResultSet rs = ps1.executeQuery();
											while(rs.next())
											{
												
											%>
											
												<option><%=rs.getString("em_name") %></option>
											
											<% 
											}
									}
									catch(Exception e)
									{
										e.printStackTrace();
									}
									%>
										
										
									</select></div>
								</div>
								
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">Priority</label>
									<div class="col-sm-8"><select name="Priority" id="Priority" class="form-control1">
									<option>-select-</option>
									<option>High</option>
									<option>Medium</option>
									<option>Low</option>
									</select></div>
								</div>
								
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">Location</label>
									<div class="col-sm-8"><select name="Location" id="Location" class="form-control1">
									<option>-select-</option>
									<%
										try
									{
											Connection con = ConnectionDB.getConnect();
											PreparedStatement ps1 = con.prepareStatement("select p_address from project");
											ResultSet rs = ps1.executeQuery();
											while(rs.next())
											{
												
											%>
											
												<option><%=rs.getString("p_address") %></option>
											
											<% 
											}
									}
									catch(Exception e)
									{
										e.printStackTrace();
									}
									%>
										
										
									</select></div>
								</div>
								
								<div class="form-group">
									<label for="econtactno" class="col-sm-2 control-label">Start Date</label>
									<div class="col-sm-8">
										<input type="Date" class="form-control1" name="sdate" placeholder="Discription">
									</div>
								</div>
								
								<div class="form-group">
									<label for="econtactno" class="col-sm-2 control-label">End Date</label>
									<div class="col-sm-8">
										<input type="Date" class="form-control1" name="edate" placeholder="Discription">
									</div>
								</div>
								
								<div class="form-group">
									<label for="econtactno" class="col-sm-2 control-label">Man Power Required</label>
									<div class="col-sm-8">
										<input type="text" class="form-control1" name="mprequ" placeholder="No. of Worker's">
									</div>
								</div>
								
								<div class="form-group">
									<label for="econtactno" class="col-sm-2 control-label">Department/Employee</label>
									<div class="col-sm-8">
										<input type="text" class="form-control1" name="de" placeholder="Discription">
									</div>
								</div>
							
								
								</div>
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
							</form>
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