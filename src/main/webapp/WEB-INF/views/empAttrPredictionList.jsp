<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Employee Attrition Prediction</title>
    
     <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }

      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }

    </style>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet"> 
<%--     <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link> --%>

    <!-- Custom CSS -->
    <link href="<c:url value="/static/css/share-trade.css" />" rel="stylesheet">
     
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<%-- 	<link href="<c:url value='/static/css/one-page-wonder.css' />" rel="stylesheet"> --%>
    
    <!-- Custom Fonts -->
    <link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet"> 
    
	<!-- DataTables Responsive CSS -->
<%--     <link href="<c:url value="/static/css/dataTables.responsive.css" />" rel="stylesheet">        --%>
<link href="<c:url value="/static/css/jquery.dataTables.min.css" />" rel="stylesheet"> 
	
   
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
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
        <%@include file="authheader.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">                
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>Add New Employee!</div>
                                </div>
                            </div>
                        </div>
                        <a href="<c:url value='/newuser' />">
                            <div class="panel-footer">
                                <span class="pull-left">Add Employee</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>Add New Trade</div>
                                </div>
                            </div>
                        </div>
                        <a href="<c:url value='/newEmpAttrPrediction' />">
                            <div class="panel-footer">
                                <span class="pull-left">Add Employee Attrition Prediction Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>                
            </div>
            <!-- /.row -->
            <div class="row">                  
	            <sec:authorize access="hasRole('HR')">               		
					<!-- /.col-lg-12 -->				          
		            <div ng-app="myApp" class="col-lg-12"  ng-controller="AttritionPredictionController as ctrl">
		                <div class="panel panel-default">
		                 <!-- /.col-lg-8 -->
							<div class="col-lg-12">
				                <h1 class="page-header">Add/Edit Employee Attrition Prediction Details</h1>
				            </div>
		                    <div class="panel-heading">
		                        Employee Attrition Prediction Details
		                    </div>
		                    <!-- /.panel-heading -->
		                    <div class="panel-body">   
		                    	<table width="100%" class="table table-striped table-bordered table-hover">			                        
			                         <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">			                         
				                      <input type="hidden" ng-model="ctrl.empAttrPrediction.tradeId" />
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="tradeDate">Date</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.tradeDate" id="tradeDate" class="username form-control input-sm" placeholder="Enter Trade Date" required/>
				                                  <div class="has-error" ng-show="myForm.$dirty">
				                                      <span ng-show="myForm.tradeDate.$error.required">This is a required field</span>
				                                  </div>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="company">Company</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.company" id="company" class="username form-control input-sm" placeholder="Enter Company Name" required ng-minlength="3"/>
				                                  <div class="has-error" ng-show="myForm.$dirty">
				                                      <span ng-show="myForm.company.$error.required">This is a required field</span>
				                                      <span ng-show="myForm.company.$error.minlength">Minimum length required is 3</span>
				                                      <span ng-show="myForm.company.$invalid">This field is invalid </span>
				                                  </div>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="status">Status</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.status" id="status" class="username form-control input-sm" placeholder="Enter Status" required ng-minlength="3"/>
				                                  <div class="has-error" ng-show="myForm.$dirty">
				                                      <span ng-show="myForm.status.$error.required">This is a required field</span>
				                                      <span ng-show="myForm.status.$error.minlength">Minimum length required is 3</span>
				                                      <span ng-show="myForm.status.$invalid">This field is invalid </span>
				                                  </div>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="cpm">CPM</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.cpm" id="cpm" class="username form-control input-sm" placeholder="Enter CPM Value" required/>
				                                  <div class="has-error" ng-show="myForm.$dirty">
				                                      <span ng-show="myForm.cpm.$error.required">This is a required field</span>
				                                  </div>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="orderType">Order Type</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.orderType" id="orderType" class="username form-control input-sm" placeholder="Enter Order Type" required ng-minlength="3"/>
				                                  <div class="has-error" ng-show="myForm.$dirty">
				                                      <span ng-show="myForm.orderType.$error.required">This is a required field</span>
				                                      <span ng-show="myForm.orderType.$error.minlength">Minimum length required is 3</span>
				                                      <span ng-show="myForm.orderType.$invalid">This field is invalid </span>
				                                  </div>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="buySellValue">Buy/Sell Value</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.buySellValue" id="buySellValue" class="username form-control input-sm" placeholder="Enter Buy Sell Value" required/>
				                                  <div class="has-error" ng-show="myForm.$dirty">
				                                      <span ng-show="myForm.buySellValue.$error.required">This is a required field</span>
				                                  </div>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="targetValue">Target</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.targetValue" id="targetValue" class="username form-control input-sm" placeholder="Enter Target Value" required/>
				                                  <div class="has-error" ng-show="myForm.$dirty">
				                                      <span ng-show="myForm.targetValue.$error.required">This is a required field</span>
				                                  </div>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="stopLossValue">Stop Loss</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.stopLossValue" id="stopLossValue" class="username form-control input-sm" placeholder="Enter Stop Loss Value" required/>
				                                  <div class="has-error" ng-show="myForm.$dirty">
				                                      <span ng-show="myForm.stopLossValue.$error.required">This is a required field</span>
				                                  </div>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="profitLossValue">Profit/Loss in %</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.profitLossValue" id="profitLossValue" class="username form-control input-sm" placeholder="Enter Profit Loss Value" required/>
				                                  <div class="has-error" ng-show="myForm.$dirty">
				                                      <span ng-show="myForm.profitLossValue.$error.required">This is a required field</span>
				                                      <span ng-show="myForm.profitLossValue.$error.minlength">Minimum length required is 3</span>
				                                      <span ng-show="myForm.profitLossValue.$invalid">This field is invalid </span>
				                                  </div>
				                              </div>
				                          </div>
				                        
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="result">Result</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.result" id="result" class="form-control input-sm" placeholder="Enter Result. [This field is validation free]"/>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="tradeResultDate">Date Of Result</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.tradeResultDate" id="tradeResultDate" class="form-control input-sm" placeholder="Enter Date of Result. [This field is validation free]"/>
				                              </div>
				                          </div>
				                      
				                          <div class="form-group col-md-12">
				                              <label class="col-md-2 control-lable" for="result">Comments</label>
				                              <div class="col-md-7">
				                                  <input type="text" ng-model="ctrl.empAttrPrediction.comments" id="comments" class="form-control input-sm" placeholder="Enter Comments. [This field is validation free]"/>
				                              </div>
				                          </div>
				
				                          <div class="form-actions" style="padding-left:170px;">
				                              <input type="submit"  value="{{!ctrl.empAttrPrediction.tradeId ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
				                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
				                          </div>
				                      </form>
			                      </table>      
		                        
		                        
		                        <!-- /.table-responsive -->                           
		                    </div>
		                    <!-- /.panel-body -->
		                    </div>		               
		                <!-- /.panel -->
		                
		                 <div class="col-lg-12">
		                    <h1 class="page-header">Employee Attrition Prediction</h1>
		                </div>
						<!-- /.col-lg-12 -->				          
		                <!-- /.col-lg-12 -->				          
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            Employee Attrition Prediction Information
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body">
		                            <table width="100%" class="table table-striped table-bordered table-hover" datatable="ng" dt-options="dtOptions">
		                            	<thead>	                            
				                            <th>Trade #</th>
				                            <th>Date</th>
				                            <th>Company</th>
				                            <th>Status</th>
				                            <th>CPM</th>
				                            <th>Order Type</th>
											<th>Buy/Sell Value</th>
											<th>Target</th>
											<th>Stop Loss</th>
				                            <th>Profit/Loss in %</th>
				                            <th>Result</th>		                            
				                            <th>Date Of Result</th>
				                            <th>Comments</th>
											<th>Edit</th>
				                            <th>Delete</th>
		                        		</thead>
				                        <tbody>
				                           <tr ng-repeat="empAttrPrediction in ctrl.empAttrPredictions" class="odd gradeX">
				                              <td><span ng-bind="empAttrPrediction.tradeId"></span></td>
				                              <td><span ng-bind="empAttrPrediction.tradeDate"></span></td>
				                              <td><span ng-bind="empAttrPrediction.company"></span></td>
				                              <td><span ng-bind="empAttrPrediction.status"></span></td>
				                              <td><span ng-bind="empAttrPrediction.cpm"></span></td>
				                              <td><span ng-bind="empAttrPrediction.orderType"></span></td>
				                              <td><span ng-bind="empAttrPrediction.buySellValue"></span></td>
				                              <td><span ng-bind="empAttrPrediction.targetValue"></span></td>
				                              <td><span ng-bind="empAttrPrediction.stopLossValue"></span></td>
				                              <td><span ng-bind="empAttrPrediction.profitLossValue"></span></td>
				                              <td><span ng-bind="empAttrPrediction.result"></span></td>
				                              <td><span ng-bind="empAttrPrediction.tradeResultDate"></span></td>
				                              <td><span ng-bind="empAttrPrediction.comments"></span></td>                        
				                              
				                              <td>	
												<p data-placement="top" data-toggle="tooltip" title="Edit">
												    <button ng-click="ctrl.edit(empAttrPrediction.tradeId)" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button>                                      
			                                    </p>
			                                  </td>
				                                
			                               	  <td>
			                                    <p data-placement="top" data-toggle="tooltip" title="Delete">
			                                    <button ng-click="ctrl.remove(empAttrPrediction.tradeId)" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete"><span class="glyphicon glyphicon-trash"></span></button>                               
			                                    </p>
			                                  </td>       
				                          </tr>
				                        </tbody>
		                            </table>
		                            <!-- /.table-responsive -->                           
		                        </div>
		                        <!-- /.panel-body -->
		                    <!-- /.panel -->
	                	</div>
			            <!-- /.col-lg-12 -->
			            <div class="col-lg-4">                   
			            </div>
			            <!-- /.col-lg-4 -->
			           </div>			           
		                </sec:authorize>
		                </div>
		            </div>		             
		            <!-- /.row -->            
		                <!-- /.col-lg-12 -->
		                <div class="col-lg-4">                   
		                </div>
		                <!-- /.col-lg-4 -->
            <%@include file="authfooter.jsp" %> 
        </div>
        <!-- /#page-wrapper -->
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<c:url value="/static/js/jquery.min.js" />" ></script> 

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/static/js/bootstrap.min.js" />" ></script> 
    <script src="<c:url value="/static/js/jquery.dataTables.min.js" />" ></script> 
<%--     <script src="<c:url value="/static/js/dataTables.bootstrap.min.js" />" ></script>  --%>
<%--     <script src="<c:url value="/static/js/dataTables.responsive.js" />" ></script>  --%>
    <script src="<c:url value="/static/js/angular-datatables.min.js" />" ></script> 
    <script src="<c:url value='/static/js/angular.js' />"></script>
    <script src="<c:url value='/static/js/angular-resource.js' />"></script>
    <script src="<c:url value='/static/js/app.js' />"></script>
    <script src="<c:url value='/static/js/service/emp_attr_prediction_service.js' />"></script>
    <script src="<c:url value='/static/js/controller/emp_attr_prediction_controller.js' />"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
        
        $('#dataTables-example1').DataTable({
            responsive: true
        });
        
        $("#mytable #checkall").click(function () {
            if ($("#mytable #checkall").is(':checked')) {
                $("#mytable input[type=checkbox]").each(function () {
                    $(this).prop("checked", true);
                });

            } else {
                $("#mytable input[type=checkbox]").each(function () {
                    $(this).prop("checked", false);
                });
            }
        });

        $("[data-toggle=tooltip]").tooltip();
    });
    </script>

</body>

</html>
