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
                                                    
                                                </div>
                                                <form:hidden value="{{cust}}" path="custid"></form:hidden>
                                                    <div class="form-group">
                                                        <label for="Customer Name">Customer Name</label> <br>
                                                    <input type="text" name="customername" value="${sessionScope.UserLoggedIn}">
                                                    </div>
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
                                                    
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Pay type"
                                                                type="text" path="paytype"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Delivery Address"
                                                                type="text" path="deliveryaddress"></form:input>
                                                    </div>
                                                <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Submit Order</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Cancel</form:button>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>
                            </form:form>
                            
                            
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
