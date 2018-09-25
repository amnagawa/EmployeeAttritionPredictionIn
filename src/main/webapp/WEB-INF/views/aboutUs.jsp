<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Employee Attrition Prediction Screen</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet"> 

    <!-- Custom CSS -->
    <link href="<c:url value="/static/css/share-trade.css" />" rel="stylesheet"> 
    
    <!-- Custom Fonts -->
    <link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet"> 
    
	<!-- DataTables Responsive CSS -->
    <link href="<c:url value="/static/css/dataTables.responsive.css" />" rel="stylesheet">   
   
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"> Employee Attrition Prediction</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">               
                <!-- /.dropdown -->
                <li class="dropdown">
                     <a href="<c:url value='/' />">Home</a>                   
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a href="<c:url value='/aboutUs' />">About Us</a>                    
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                <a href="<c:url value='/list' />"><i class="fa fa-user fa-fw"></i></a>
<!--                     <a class="dropdown-toggle" data-toggle="dropdown" href="#"> -->
<!--                         <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i> -->
<!--                     </a> -->
<!--                     <ul class="dropdown-menu dropdown-user"> -->
<!--                         <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a> -->
<!--                         </li> -->
<!--                         <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a> -->
<!--                         </li> -->
<!--                         <li class="divider"></li> -->
<!--                         <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a> -->
<!--                         </li> -->
<!--                     </ul> -->
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
<!--                         <li class="sidebar-search"> -->
<!--                             <div class="input-group custom-search-form"> -->
<!--                                 <input type="text" class="form-control" placeholder="Search..."> -->
<!--                                 <span class="input-group-btn"> -->
<!--                                 <button class="btn btn-default" type="button"> -->
<!--                                     <i class="fa fa-search"></i> -->
<!--                                 </button> -->
<!--                             </span> -->
<!--                             </div>                             -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a> -->
<!--                         </li>                       -->
<!--                         <li> -->
<!--                             <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a> -->
<!--                         </li>                        -->
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">            
            <div class="row">                
                <!-- /.col-lg-8 -->
				<div class="col-lg-12">
                    <h1 class="page-header">About Us</h1>
                </div>
				<!-- /.col-lg-12 -->				          
                <div class="col-lg-12">
                    <div class="panel panel-default">
<!--                         <div class="panel-heading"> -->
<!--                             About Us -->
<!--                         </div> -->
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <p>AnandMurti portal is created considering the small investors who are totally dependent on external sources like News channels,
                        financial advisors,
                        </p>
                        <p>fundamental and technical analyst to make their investment. Anand Murti portal is developed to provide  Intraday, 
                        short term (1-3 Months),
                        </p> 
                        <p>and Long term (2-5 years) views based on the technical analysis.  </p>
                        <p>Views will be provided on below instruments  </p>
                        <p>1. Company listed in NSE  </p>
                        <p>2. View on Nifty  </p>
                        <p>3. Currency  </p>
                        <p>4. Crypto Currency like Bit coin </p>                                                             
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
                <div class="col-lg-4">                   
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->            
        </div>
        <!-- /#page-wrapper -->
         <%@include file="authfooter.jsp" %>
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<c:url value="/static/js/jquery.min.js" />" ></script> 

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/static/js/bootstrap.min.js" />" ></script> 
    <script src="<c:url value="/static/js/jquery.dataTables.min.js" />" ></script> 
    <script src="<c:url value="/static/js/dataTables.bootstrap.min.js" />" ></script> 
    <script src="<c:url value="/static/js/dataTables.responsive.js" />" ></script> 

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>
