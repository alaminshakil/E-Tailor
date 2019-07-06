<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var order = ${oList};
                var customer = ${cList};
                var tailor = ${tList};

                angular.module('myapp', []).controller('CustorderCtrl',
                        function ($scope) {
                            $scope.olo = order;
                            $scope.clo = customer;
                            $scope.tlo = tailor;
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="CustorderCtrl">

        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <jsp:include page="/WEB-INF/views/partial/tailor/sidebar.jsp"></jsp:include>
                <!-- /Page Sidebar -->

                <!-- Page Content -->
                <div class="page-content">
                    <!-- Page Header -->
                <jsp:include page="/WEB-INF/views/partial/topnav.jsp"></jsp:include>
                    <!-- /Page Header -->
                    <!-- Page Inner -->
                    <div class="page-inner">
                        <div class="page-title">
                            <h1 style="text-align: center; color: tomato">Welcome ${sessionScope.tailorinfo.tailorname}</h1>
                            <h3 style="text-align: center; color: seagreen"> ${sessionScope.tailorinfo.tailoraddress}</h3>
                            <h5 style="text-align: center; color: seagreen">Phone: ${sessionScope.tailorinfo.phone}</h5>
                    </div>
                    <div id="main-wrapper">
                        <div class="row">
                            <!--main content start-->
                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Order List</h4>
                                    </div>

                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <div class="form-group input-field col s12">
                                                    <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                                </div>
                                                <thead>
                                                    <tr>
                                                        <th>Order Id</th>
                                                        <th>Cust Id</th>
                                                        <!--                                                        <th>Order Date</th>-->
                                                        <th>Delivery Date</th>
                                                        <th>Bill</th>
                                                        <th>Note</th>
                                                        <th>Status</th>
                                                        <th>Manage </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="c in olo| filter: test">
                                                        <td>{{c.orderid}}</td>
                                                        <td>{{c.custid}}</td>
                                                        <!--                                                        <td>{{c.orderdate}}</td>-->
                                                        <td>{{c.deliverydate}}</td>
                                                        <td>{{c.bill}}</td>
                                                        <td>{{c.note}}</td>
                                                        <td>{{c.orderstatus}}</td>
                                                        <td><a href="editorder?getorderid={{c.orderid}}"><button id="editbuttons" type="submit" class="waves-effect waves-light btn">Edit</button></a> <a href="removingorder/{{c.orderid}}"><button id="removebuttons" type="button" class="waves-effect waves-light btn btn-danger">Remove</button></a>
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
                </div>
                <!-- /Page Content -->
            </div>
            <!-- /Page Container -->
        <jsp:include page="/WEB-INF/views/partial/jsinclude.jsp"></jsp:include>
    </body>
</html>
