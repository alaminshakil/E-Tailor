<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var al = ${alistgson};
                var zl = ${zList};
                angular.module('myapp', []).controller('AreaController',
                        function ($scope) {
                            $scope.zlo = zl;
                            $scope.alo = al;
                            console.log($scope.zlo);
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="AreaController">

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
                            <h class="listtittle">Showing for :: ${sessionScope.zoneSelected.zonename} </h>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->

                                <div class="col-md-5">
                                    <div class="panel panel-white">
                                        <div class="panel-heading clearfix">
                                            <h4 class="panel-title">Area List</h4>
                                        </div>

                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                    <thead>
                                                        <tr>
                                                            <th>Area Id</th>
                                                            <th>Area Name</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="area in alo| filter: test ">
                                                            <td>{{area.areaid}}</td>
                                                            <td>{{area.areaname}}</td>
                                                            <td><a href="selectAreaBtn?getAreaId={{area.areaid}}"><button id="editbuttons" type="submit" class="btn btn-primary">Select</button></a> 
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>  
                                                <a href="selectzone"><button  type="submit" class="btn btn-primary">Back</button></a>

                                            </div>
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
