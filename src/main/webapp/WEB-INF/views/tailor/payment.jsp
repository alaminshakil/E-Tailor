<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var payment = ${pList};
                var order = ${oList};
                var customer = ${cList};
                var tailor = ${tList};

                angular.module('myapp', []).controller('PaymentCtrl',
                        function ($scope) {
                            $scope.plo = payment;
                            $scope.olo = order;
                            $scope.clo = customer;
                            $scope.tlo = tailor;
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="PaymentCtrl">

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
                            <h3 class="breadcrumb-header">Payment Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            <form:form commandName="PaymentObject" action="addingpayment" method="post">
                               

                                <c:if test="${!check}">
                                    <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Edit Payment</h4>
                                            </div>
                                            <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Payment Id"  type="text" path="payid" required="true" id="orderid"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <select class="form-control" ng-model="order" ng-options="x.orderid as x.orderid for x in olo" required="true">
                                                        <option value="">-- Choose Order--</option>
                                                    </select>
                                                </div>
                                                 <form:hidden value="{{order}}" path="orderid"></form:hidden>
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
                                                        <label for="orderdate">Bill Amount</label>
                                                    <form:input class="form-control" Placeholder="Bill Amount"
                                                                type="text" path="bill" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="deliverydate">Payment date</label>
                                                    <form:input class="form-control" Placeholder="Payment Date"
                                                                type="date" path="paydate" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Pay Type"
                                                                type="text" path="paytype" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Pay  Status"
                                                                type="text" path="paystatus"></form:input>
                                                    </div>
                                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit</form:button>
                                                <%--<form:button id="removebuttons" type="reset" class="btn btn-danger">Reset</form:button>--%>
                                                <a href="showpaymentpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </form:form>
                            <div class="col-md-5">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <img src="resources/images/payment.gif" alt="Customer Image Here" style="height: 350px; width: 350px"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Payment List</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Payment Id</th>
                                                        <th>Order Id</th>
                                                        <th>Cust Id</th>
                                                        <th>Tailor Id</th>
                                                        <th>Bill</th>
                                                        <th>Pay Date</th>
                                                        <th>Pay Type</th>
                                                        <th>Pay Status</th>
                                                        <th>Manage Tailor</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="c in plo | filter : test">
                                                        <td>{{c.payid}}</td>
                                                        <td>{{c.orderid}}</td>
                                                        <td>{{c.custid}}</td>
                                                        <td>{{c.tailorid}}</td>
                                                        <td>{{c.bill}}</td>
                                                        <td>{{c.paydate}}</td>
                                                        <td>{{c.paytype}}</td>
                                                        <td>{{c.paystatus}}</td>
                                                        <td><a href="editpayment?getpayid={{c.payid}}"><button id="editbuttons" type="submit" class="waves-effect waves-light btn">Edit</button></a> <a href="removepayment/{{c.payid}}"><button id="removebuttons" type="button" class="waves-effect waves-light btn btn-danger">Remove</button></a>
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
