<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var customer = ${customerlist};
                var area = ${arealist};
                var zone = ${zonelist};

                angular.module('myapp', []).controller('CustomerinfoController',
                        function ($scope) {
                            $scope.customerlist = customer;
                            $scope.zlo = zone;
                            $scope.alo = area;
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="CustomerinfoController">

        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <jsp:include page="/WEB-INF/views/partial/admin/sidebar.jsp"></jsp:include>
                <!-- /Page Sidebar -->

                <!-- Page Content -->
                <div class="page-content">
                    <!-- Page Header -->
                <jsp:include page="/WEB-INF/views/partial/topnav.jsp"></jsp:include>
                    <!-- /Page Header -->
                    <!-- Page Inner -->
                    <div class="page-inner">
                        <div class="page-title">
                            <h3 class="breadcrumb-header">Customer Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            <form:form commandName="newCustomerObject" action="customeradd" method="post">
                                <c:if test="${check}">

                                    <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Add Customer</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Customer Name" type="text" path="custname" required="true" id="custname"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="zone" ng-options="x.zoneid as x.zonename for x in zlo" required="true">
                                                            <option value="">-- choose Zone Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{zone}}" path="zoneid"></form:hidden>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="area" ng-options="x.areaid as x.areaname for x in alo" required="true">
                                                            <option value="">-- choose Area Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{area}}" path="areaid"></form:hidden>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Delivery Option"
                                                                type="text" path="deliveryaddress" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Phone"
                                                                type="text" path="phone" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Email Id"
                                                                type="text" path="emailid" required="true"></form:input>
                                                    </div>
                                               <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Add Customer</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset</form:button>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>

                                <c:if test="${!check}">
                                    <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Edit Customer</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Customer Id" style="display:none" type="text" path="custid" required="true" id="custid"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Customer Name" type="text" path="custname" required="true" id="custname"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="zone" ng-options="x.zoneid as x.zonename for x in zlo" required="true">
                                                            <option value="">-- choose Zone Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{zone}}" path="zoneid"></form:hidden>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="area" ng-options="x.areaid as x.areaname for x in alo" required="true">
                                                            <option value="">-- choose Area Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{area}}" path="areaid"></form:hidden>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Delivery Option"
                                                                type="text" path="deliveryaddress" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Phone"
                                                                type="text" path="phone" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Email Id"
                                                                type="text" path="emailid" required="true"></form:input>
                                                    </div>
                                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit Customer</form:button>
                                                <%--<form:button id="removebuttons" type="reset" class="btn btn-danger">Reset</form:button>--%>
                                                    <a href="showcustomerpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>
                            </form:form>
                                <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <img src="resources/images/customer.gif" alt="Customer Image Here" style="height: 400px; width: 450px"/>
                                            </div>
                                        </div>
                                </div>
                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Customer List</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Customer Id</th>
                                                        <th>Customer Name</th>
                                                        <th>Area Id</th>
                                                        <th>Zone Id</th>
                                                        <th>Address</th>
                                                        <th>Phone</th>
<!--                                                        <th>Email</th>-->
                                                        <th>Manage Tailor</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="c in customerlist">
                                                        <td>{{c.custid}}</td>
                                                        <td>{{c.custname}}</td>
                                                        <td>{{c.areaid}}</td>
                                                        <td>{{c.zoneid}}</td>
                                                        <td>{{c.deliveryaddress}}</td>
                                                        <td>{{c.phone}}</td>
<!--                                                        <td>{{c.emailid}}</td>-->
                                                        <td><a href="editingcustomer?getcustid={{c.custid}}"><button id="editbuttons" type="submit" class="waves-effect waves-light btn">Edit</button></a> <a href="removingcustomer/{{c.custid}}"><button id="removebuttons" type="button" class="waves-effect waves-light btn btn-danger">Remove</button></a>
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
