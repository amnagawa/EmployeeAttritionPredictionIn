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

    <title>Add/Edit Employee Attrition Prediction</title>

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
                <a class="navbar-brand" href="#"> Employee Attrition Prediction</a>
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
	        <table class="table"> 
		        <tr>
		        	<td align="left"><%@include file="authheader.jsp" %></td>	             
		            <td align="right"><a href="<c:url value='/list' />" class="btn btn-info custom-width">Back</a></td>
		        </tr>		
        	</table>      
            <div class="row">                
                <!-- /.col-lg-8 -->
				<div class="col-lg-12">
                    <h1 class="page-header">Add/Edit Employee Attrition Prediction Details</h1>
                </div>
				<!-- /.col-lg-12 -->				          
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Trade Forecast Details
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">                        	
                            <table width="100%" class="table table-striped table-bordered table-hover">
	                            <form:form action="saveEmpAttrPrediction" method="post" modelAttribute="empAttrPrediction">
	                                 <form:hidden path="tradeId"/>
							            <tr>
							                <td>Date</td>
							                <td><form:input path="tradeDate" /></td>
							            </tr>
							            <tr>
							                <td>Company/Index/Currency</td>
							                <td><form:input path="company" /></td>
							            </tr>
						              	<tr>
							                <td>Status</td>
							                <td><form:input path="status" /></td>
							            </tr>
							            <tr>
							                <td>CPM</td>
							                <td><form:input path="cpm" /></td>
							            </tr>
							            <tr>
							                <td>Order Type</td>
							                <td>
							                <form:select path="orderType">
								                <form:option  value="Buy">Buy</form:option>
								                <form:option value="Sell">Sell</form:option>							                
							                </form:select>
							                </td>
							            </tr>
							             <tr>
							                <td>Buy/Sell Value</td>
							                <td><form:input path="buySellValue" /></td>
							            </tr>
							             <tr>
							                <td>Target</td>
							                <td><form:input path="targetValue" /></td>
							            </tr>
							             <tr>
							                <td>Stop Loss</td>
							                <td><form:input path="stopLossValue" /></td>
							            </tr>
							             <tr>
							                <td>Profit/Loss in %</td>
							                <td><form:input path="profitLossValue" /></td>
							            </tr>
							            <tr>
							                <td>Result</td>
							                <td><form:input path="result" /></td>
							            </tr>
							            <tr>
							                <td>Date Of Result</td>
							                <td><form:input path="tradeResultDate" /></td>
							            </tr> 
							            <tr>
							                <td>Comments</td>
							                <td><form:textarea path="comments" /></td>
							            </tr>              
							            <tr>
							                <td colspan="2" align="center"><input type="submit" value="Save" class="btn btn-success custom-width"></td>
							            </tr>
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
