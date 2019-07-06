<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var msnt = ${msntList};
                var item = ${iList};
                var tailor = ${tList};

                angular.module('myapp', []).controller('MeasurementCtrl',
                        function ($scope) {
                            $scope.msntlist = msnt;
                            $scope.ilo = item;
                            $scope.tlo = tailor;
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="MeasurementCtrl">

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
                            <h3 class="breadcrumb-header">Measurement Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->

                                <div class="col-md-8">
                                    <div class="panel panel-white">
                                        <div class="panel-heading clearfix">
                                            <h4 class="panel-title">Measurement List</h4>
                                        </div>
                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                    <thead>
                                                        <tr>
                                                            <th>Measurement Id</th>
                                                            <th>Measurement Name</th>
                                                            <th>Item Id</th>
                                                            <th>Tailor Id</th>


                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="c in msntlist| filter:test">
                                                            <td>{{c.measurementid}}</td>
                                                            <td>{{c.measurementname}}</td>
                                                            <td>{{c.itemid}}</td>
                                                            <td>{{c.tailorid}}</td>
                                                            <td><a href="#"><button id="editbuttons" type="submit" class="btn btn-primary">Select</button></a> 
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>  
                                            </div>
                                            <a href="selectmsntdetail"><button  type="submit" class="btn btn-primary">Next</button></a>
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
