<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var detail = ${odtList};
                var order = ${oList};
                var febric = ${fList};
                var item = ${iList};
                

                angular.module('myapp', []).controller('OrderdetailCtrl',
                        function ($scope) {
                            $scope.odlo = detail;
                            $scope.olo = order;
                            $scope.flo = febric;
                            $scope.ilo = item;
                         
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="OrderdetailCtrl">

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
                            <h3 class="breadcrumb-header">Order Details Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            
                            <div class="col-md-8">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Order Detail List</h4>
                                    </div>
                                    <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Detail Id</th>
                                                        <th>Order Id</th>
                                                        <th>Item Id</th>
                                                        <th>Fabric Id</th>
                                                        <th>Quantity </th>
                                                        <th>Manage</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="c in odlo | filter: test">
                                                        <td>{{c.detailid}}</td>
                                                        <td>{{c.orderid}}</td>
                                                        <td>{{c.itemid}}</td>
                                                        <td>{{c.febricid}}</td>
                                                        <td>{{c.itemqty}}</td>
                                                        <td><a href="editodt?getdetailid={{c.detailid}}"><button id="editbuttons" type="submit" class="waves-effect waves-light btn">Edit</button></a> <a href="removeodt/{{c.detailid}}"><button id="removebuttons" type="button" class="waves-effect waves-light btn btn-danger">Remove</button></a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>  
                                        </div>
                                    </div>
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
