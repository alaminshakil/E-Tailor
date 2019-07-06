<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var orderms = ${odmList};
                var order = ${oList};
                var item = ${iList};
                var measurement = ${mList};
                
                

                angular.module('myapp', []).controller('OrdermeasurementCtrl',
                        function ($scope) {
                            $scope.omlo = orderms;
                            $scope.olo = order;
                            $scope.mlo = measurement;
                            $scope.ilo = item;
                         
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="OrdermeasurementCtrl">

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
                            <h3 class="breadcrumb-header">Order Details Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            <form:form commandName="OMsObject" action="addingorderms" method="post">
                                <c:if test="${check}">

                                    <div class="col-md-5">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Add Order Measurements</h4>
                                            </div>
                                            <div class="panel-body">
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="order" ng-options="x.orderid as x.orderid for x in olo" required="true">
                                                            <option value="">-- Choose Order --</option>
                                                        </select>
                                                    </div>
                                                 <form:hidden value="{{order}}" path="orderid"></form:hidden>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="item" ng-options="x.itemid as x.itemname for x in ilo" required="true">
                                                            <option value="">-- choose Item Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{item}}" path="itemid"></form:hidden>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="measurement" ng-options="x.measurementid as x.measurementname for x in mlo" required="true">
                                                            <option value="">-- choose Measurement Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{measurement}}" path="measurementid"></form:hidden> 
                                                    
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Measurement Value"
                                                                type="text" path="measurementvalue" ></form:input>
                                                    </div>
                                                <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Add</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset</form:button>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>

                                <c:if test="${!check}">
                                    <div class="col-md-4">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Edit Measurement</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Ordermeasurement Id"  type="text" path="ormeaid" required="true" id="ormeaid"></form:input>
                                                    </div>
                                                    <div class="panel-body">
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="order" ng-options="x.orderid as x.orderid for x in olo" required="true">
                                                            <option value="">-- Choose Order --</option>
                                                        </select>
                                                    </div>
                                                 <form:hidden value="{{order}}" path="orderid"></form:hidden>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="item" ng-options="x.itemid as x.itemname for x in ilo" required="true">
                                                            <option value="">-- choose Item Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{item}}" path="itemid"></form:hidden>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="measurement" ng-options="x.measurementid as x.measurementname for x in mlo" required="true">
                                                            <option value="">-- choose Measurement Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{measurement}}" path="measurementid"></form:hidden> 
                                                    
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Measurement Value"
                                                                type="text" path="measurementvalue" ></form:input>
                                                    </div>
                                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit</form:button>
                                                <%--<form:button id="removebuttons" type="reset" class="btn btn-danger">Reset Details</form:button>--%>
                                                <a href="showordermspage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </c:if>
                            </form:form>

                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Order Measurement List</h4>
                                    </div>
                                    <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Order Measurement Id</th>
                                                        <th>Order Id</th>
                                                        <th>Item Id</th>
                                                        <th>Measurement Id</th>
                                                        <th>Measurement Value </th>
                                                        <th>Manage</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="c in omlo | filter:test">
                                                        <td>{{c.ormeaid}}</td>
                                                        <td>{{c.orderid}}</td>
                                                        <td>{{c.itemid}}</td>
                                                        <td>{{c.measurementid}}</td>
                                                        <td>{{c.measurementvalue}}</td>
                                                        <td><a href="editorderms?getormeaid={{c.ormeaid}}"><button id="editbuttons" type="submit" class="waves-effect waves-light btn">Edit</button></a> <a href="removeorderms/{{c.ormeaid}}"><button id="removebuttons" type="button" class="waves-effect waves-light btn btn-danger">Remove</button></a>
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

