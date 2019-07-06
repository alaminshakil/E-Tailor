<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var febric = ${flistgson};
//                var item = ${iList};
//                var tailor = ${tList};

                angular.module('myapp', []).controller('FebricCtrl',
                        function ($scope) {
                            $scope.febricList = febric;
//                            $scope.ilo = item;
//                            $scope.tlo = tailor;
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="FebricCtrl">

        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <jsp:include page="/WEB-INF/views/partial/customer/sidebar.jsp"></jsp:include>
                <!-- /Page Sidebar -->

                <!-- Page Content -->
                <div class="page-content">
                    <!-- Page Header -->
                <jsp:include page="/WEB-INF/views/partial/topnav.jsp"></jsp:include>
                    <!-- /Page Header -->
                    <!-- Page Inner -->
                    <div class="page-inner">
                        <div class="page-title">
                            <h class="listtittle">Showing for :: ${sessionScope.zoneSelected.zonename} :: ${sessionScope.areaSelected.areaname} ::  ${sessionScope.tailorSelected.tailorname}:: ${sessionScope.itemSelected.itemname} </h>                 

                    </div>
                    <div id="main-wrapper">
                        <div class="row">
                            <!--main content start-->


                            <div class="col-md-5">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Febric List</h4>
                                    </div>
                                    <div class="form-group input-field col s12">
                                        <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Fabric Id</th>
                                                        <th>Fabric Name</th>
                                                        <!--                                                            <th>Item Id</th>
                                                                                                                    <th>Tailor Id</th>-->

                                                        <th>Fabric Cost</th>
                                                        <!--                                                        <th>Photo URL</th>-->
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="c in febricList| filter:test">
                                                        <td>{{c.febricid}}</td>
                                                        <td>{{c.febricname}}</td>
                                                        <!--                                                            <td>{{c.itemid}}</td>
                                                                                                                    <td>{{c.tailorid}}</td>-->
                                                        <td>{{c.febriccost}}</td>
                                                        <td><a href="selectFebricBtn?getFebricId={{c.febricid}}"><button id="editbuttons" type="submit" class="btn btn-primary">Select</button></a> 
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>  
                                            <a href="selecttailor"><button  type="submit" class="btn btn-primary">Next</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <img src="resources/images/febric.jpg" alt="Tailor Image Here" style="height: 340px; width: 450px"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5" style="margin-left: 160px">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <a  class="btn btn-info btn-lg"style="margin-left: 235px">
                                            <span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
                                        </a>    <br> <br>                                            
                                        Your Zone:  ${sessionScope.zoneSelected.zonename} <br> <br>
                                        Your Area:  ${sessionScope.areaSelected.areaname} <br> <br>
                                        Selected Tailor: ${sessionScope.tailorSelected.tailorname} <br> <br>
                                        Selected Item: ${sessionScope.itemSelected.itemname} will cost ${sessionScope.itemSelected.makingcost} to make<br> <br>
                                    </div>
<!--                                    <a href="selectarea"><button  type="submit" class="btn btn-primary">Confirm</button></a>
                                    <a href="customerpanel"><button  type="submit" class="btn btn-danger">Cancel</button></a>-->
                                </div>
                            </div>


                            <!--main content end-->
                        </div><!-- Row -->
                    </div><!-- Main Wrapper -->
                    <!--footer-->
                    <jsp:include page="/WEB-INF/views/partial/footer.jsp"></jsp:include>
                    </div><!-- /Page Inner -->

                <jsp:include page="/WEB-INF/views/partial/notification.jsp"></jsp:include>
                </div><!-- /Page Content -->
            </div><!-- /Page Container -->


        <jsp:include page="/WEB-INF/views/partial/jsinclude.jsp"></jsp:include>
    </body>
</html>
