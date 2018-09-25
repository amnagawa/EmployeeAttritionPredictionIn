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

    <title>Add/Edit Trade Forecast</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet"> 

    <!-- Custom CSS -->
    <link href="<c:url value="/static/css/share-trade.css" />" rel="stylesheet"> 
    
    <!-- Custom Fonts -->
    <link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet">    
	
   
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
                <a class="navbar-brand" href="#"> AnandMurti</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
               <li class="dropdown">
                     <a href="<c:url value='/' />">Home</a>                   
                </li>                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a href="<c:url value='/aboutUs' />">About Us</a>                    
                </li>               
               <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/logout" />"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
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
<!--         	<table width="100%" class="table">  -->
<!-- 		        <tr>	 -->
<%-- 		        <%@include file="authheader.jsp" %>            --%>
<%-- 		            <td colspan="2" align="right"><a href="<c:url value='/list' />" class="btn btn-info custom-width">Cancel</a></td> --%>
<!-- 		        </tr>		 -->
<!-- 	        </table> -->        	       
        	<table class="table"> 
	        <tr>
	        	<td align="left"><%@include file="authheader.jsp" %></td>	             
	            <td align="right"><a href="<c:url value='/list' />" class="btn btn-info custom-width">Back</a></td>
	        </tr>		
        </table>  
            <div class="row">                
                <!-- /.col-lg-8 -->
				<div class="col-lg-12">
                    <h1 class="page-header">Add/Edit User Registration Form</h1>
                </div>
				<!-- /.col-lg-12 -->				          
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            User Registration Details
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">                        	
                            <table width="100%" class="table table-striped table-bordered table-hover">
	                           <form:form method="POST" modelAttribute="employee" class="form-horizontal">
									<form:input type="hidden" path="id" id="id"/>
									
									<div class="row">
										<div class="form-group col-md-12">
											<label class="col-md-3 control-lable" for="firstName">First Name</label>
											<div class="col-md-7">
												<form:input type="text" path="firstName" id="firstName" class="form-control input-sm"/>
												<div class="has-error">
													<form:errors path="firstName" class="help-inline"/>
												</div>
											</div>
										</div>
									</div>
							
									<div class="row">
										<div class="form-group col-md-12">
											<label class="col-md-3 control-lable" for="lastName">Last Name</label>
											<div class="col-md-7">
												<form:input type="text" path="lastName" id="lastName" class="form-control input-sm" />
												<div class="has-error">
													<form:errors path="lastName" class="help-inline"/>
												</div>
											</div>
										</div>
									</div>
							
									<div class="row">
										<div class="form-group col-md-12">
											<label class="col-md-3 control-lable" for="ssoId">SSO ID</label>
											<div class="col-md-7">
												<c:choose>
													<c:when test="${edit}">
														<form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" disabled="true"/>
													</c:when>
													<c:otherwise>
														<form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" />
														<div class="has-error">
															<form:errors path="ssoId" class="help-inline"/>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
							
									<div class="row">
										<div class="form-group col-md-12">
											<label class="col-md-3 control-lable" for="password">Password</label>
											<div class="col-md-7">
												<form:input type="password" path="password" id="password" class="form-control input-sm" />
												<div class="has-error">
													<form:errors path="password" class="help-inline"/>
												</div>
											</div>
										</div>
									</div>
							
									<div class="row">
										<div class="form-group col-md-12">
											<label class="col-md-3 control-lable" for="email">Email</label>
											<div class="col-md-7">
												<form:input type="text" path="email" id="email" class="form-control input-sm" />
												<div class="has-error">
													<form:errors path="email" class="help-inline"/>
												</div>
											</div>
										</div>
									</div>
							
									<div class="row">
										<div class="form-group col-md-12">
											<label class="col-md-3 control-lable" for="employeeProfiles">Roles</label>
											<div class="col-md-7">
												<form:select path="employeeProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-sm" />
												<div class="has-error">
													<form:errors path="employeeProfiles" class="help-inline"/>
												</div>
											</div>
										</div>
									</div>
							
									<div class="row">
										<div class="form-actions floatRight">
											<c:choose>
												<c:when test="${edit}">
<%-- 													<input type="submit" value="Update" class="btn btn-success custom-width"/> or <a href="<c:url value='/list' />">Cancel</a> --%>
													<tr>
										                <td colspan="2" align="right"><input type="submit" value="Update" class="btn btn-success custom-width"></td>
										                <td colspan="2" align="left"><a href="<c:url value='/list' />" class="btn btn-success custom-width">Cancel</a></td>
										            </tr>
												</c:when>
												<c:otherwise>
<%-- 													<input type="submit" value="Register" class="btn btn-success custom-width"/> or <a href="<c:url value='/list' />">Cancel</a> --%>
													<tr>
										                <td colspan="2" align="right"><input type="submit" value="Register" class="btn btn-success custom-width"></td>
										                <td colspan="2" align="left"><a href="<c:url value='/list' />" class="btn btn-success custom-width">Cancel</a></td>
										            </tr>													 
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</form:form>
                            </table>
                            
                            <!-- /.table-responsive -->                           
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

</body>

</html>
