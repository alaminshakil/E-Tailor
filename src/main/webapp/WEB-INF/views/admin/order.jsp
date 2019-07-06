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
                            <h3 class="breadcrumb-header">Order Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            <form:form commandName="OrderObject" action="addingorder" method="post">
                                <c:if test="${check}">

                                    <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Add Order</h4>
                                            </div>
                                            <div class="panel-body">

                                                <div class="form-group">
                                                    <select class="form-control" ng-model="cust" ng-options="x.custid as x.custname for x in clo" required="true">
                                                        <option value="">-- Choose Customer--</option>
                                                    </select>
                                                </div>
                                                <form:hidden value="{{cust}}" path="custid"></form:hidden>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="tailor" ng-options="x.tailorid as x.tailorname for x in tlo" required="true">
                                                            <option value="">-- Choose Tailor --</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{tailor}}" path="tailorid"></form:hidden>
                                                    <div class="form-group">
                                                        <label for="orderdate">Order date</label>
                                                    <form:input class="form-control" Placeholder="Order Date"
                                                                type="date" path="orderdate" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="deliverydate">Delivery date</label>
                                                    <form:input class="form-control" Placeholder="Delivery Date"
                                                                type="date" path="deliverydate" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Bill Amount"
                                                                type="text" path="bill" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Customer Note (optional)"
                                                                type="text" path="note"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Order Status"
                                                                type="text" path="orderstatus"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Pay type"
                                                                type="text" path="paytype"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Delivery Address"
                                                                type="text" path="deliveryaddress"></form:input>
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
                                                <h4 class="panel-title">Edit Order</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Order Id" style="display:none" type="text" path="orderid" required="true" id="orderid"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="cust" ng-options="x.custid as x.custname for x in clo" required="true">
                                                            <option value="">-- Choose Customer--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{cust}}" path="custid"></form:hidden>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="tailor" ng-options="x.tailorid as x.tailorname for x in tlo" required="true">
                                                            <option value="">-- Choose Tailor --</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{tailor}}" path="tailorid"></form:hidden>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Order Date"
                                                                type="text" path="orderdate" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Delivery Date"
                                                                type="text" path="deliverydate" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Bill Amount"
                                                                type="text" path="bill" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Customer Note (optional)"
                                                                type="text" path="note"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Order Status"
                                                                type="text" path="orderstatus"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Pay type"
                                                                type="text" path="paytype"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Delivery Address"
                                                                type="text" path="deliveryaddress"></form:input>
                                                    </div>
                                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit Order</form:button>
                                                <%--<form:button id="removebuttons" type="reset" class="btn btn-danger">Reset</form:button>--%>
                                                <a href="showorderpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </form:form>
                            <div class="col-md-6">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <img src="resources/images/customer.jpg" alt="Customer Image Here" style="height: 400px; width: 450px"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Order List</h4>
                                    </div>
                                    <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Order Id</th>
                                                        <th>Cust Id</th>
                                                        <!--                                                        <th>Order Date</th>-->
                                                        <th>Delivery Date</th>
                                                        <th>Bill</th>
                                                        <th>Note</th>
                                                        <th>Status</th>
                                                        <th>Manage Tailor</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="c in olo | filter: test">
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
