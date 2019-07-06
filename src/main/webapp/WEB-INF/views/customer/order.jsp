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
        <script src="resources/js/date.js"></script>
    </head>
    <body ng-app="myapp" ng-controller="CustorderCtrl">

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
                            <h class="listtittle">Showing for :: ${sessionScope.zoneSelected.zonename} :: ${sessionScope.areaSelected.areaname} ::  ${sessionScope.tailorSelected.tailorname}::${sessionScope.febricSelected.febricname} </h>                 

                    </div>
                    <div id="main-wrapper">
                        <div class="row">
                            <!--main content start-->
                            <form:form commandName="OrderObject" action="addingorder" method="post">
                                <c:if test="${check}">

                                    <div class="col-md-5">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Add Order</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <label for="orderdate">Order date</label>
                                                    <form:input class="form-control" Placeholder="Order Date"
                                                                type="date"  id="date" onload="getDate()" path="orderdate" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="deliverydate">Delivery date</label>
                                                    <form:input class="form-control" Placeholder="Delivery Date"
                                                                type="date" path="deliverydate" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Bill Amount"
                                                                type="text" path="bill" required="true" value="${sessionScope.itemSelected.makingcost + sessionScope.febricSelected.febriccost}" readonly="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Special Instruction (optional)"
                                                                type="text" path="note"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:input class="form-control" Placeholder="Order Status" readonly="true"
                                                                type="text" path="orderstatus"></form:input>
                                                    </div>
                                                    
                                                <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Confirm Order</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Cancel</form:button>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>

                                
                            </form:form>
                            
                            <div class="col-md-5" style="margin-left: 160px">
                                
                                <div class="panel panel-white">
                                    <h5 style="color:  #cccccc; background-color: #006dcc; font-size: x-large">
                                   ${sessionScope.customerinfo.custname} 's  Cart
                                </h5>
                                    <div class="panel-heading clearfix">
                                        <a  class="btn btn-info btn-lg"style="margin-left: 235px">
                                            <span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
                                        </a>    <br> <br>                                            
                                        Your Zone:  ${sessionScope.zoneSelected.zonename} <br> <br>
                                        Your Area:  ${sessionScope.areaSelected.areaname} <br> <br>
                                        Selected Tailor: ${sessionScope.tailorSelected.tailorname} <br> <br>
                                        Selected Item: ${sessionScope.itemSelected.itemname} will cost ${sessionScope.itemSelected.makingcost} to make<br> <br>
                                        Selected Fabric: ${sessionScope.febricSelected.febricname} will cost ${sessionScope.febricSelected.febriccost} to buy <br> <br> <br> <br>
                                        <h4 style="color: tomato; font-style: italic; text-align: center">  Cart Value: ${sessionScope.itemSelected.makingcost + sessionScope.febricSelected.febriccost} </h4>
                                    </div>
<!--                                    <a href="selectarea"><button  type="submit" class="btn btn-primary">Confirm</button></a>
                                    <a href="customerpanel"><button  type="submit" class="btn btn-danger">Cancel</button></a>-->
                                </div>
                            </div>
                                    
                                    <!--order info-->
                                    <div class="col-md-5" style="margin-left: 160px">
                                
                                <div class="panel panel-white">
                                    <h5 style="color:  #cccccc; background-color: #006dcc; font-size: x-large">
<!--                                   Order Info-->
                                </h5>
                                    <div class="panel-heading clearfix">
                                        <a  class="btn btn-info btn-lg"style="margin-left: 275px">
                                            <span class="glyphicon glyphicon-shopping-cart"></span> Cart Detail's
                                        </a>    <br> <br> 
                                        <div class="form-group">
                                                    <label for="Customer Name"> My ID:</label> <br>
                                                    <input type="text" path="custid" value="${sessionScope.customerinfo.custid}" readonly="true" name="custid">
                                                </div>
                                                <div class="form-group">
                                                    <label for="Customer Name">My Name</label> <br>
                                                    <input type="text" name="customername" value="${sessionScope.customerinfo.custname}" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label for="Customer Name"> Tailor ID</label> <br>
                                                    <input type="text" name="tailorid"  path="tailorid" value="${sessionScope.tailorSelected.tailorid}" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label for="Customer Name"> Tailor Name</label> <br>
                                                    <input type="text" name="tailorname" value="${sessionScope.tailorSelected.tailorname}" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label for="Customer Name"> Payment Option</label> <br>
                                                    <input type="text" name="paytype" path="paytype" value="${sessionScope.tailorSelected.payoption}" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Delivery Address"
                                                                type="text" value="${sessionScope.customerinfo.deliveryaddress}" path="deliveryaddress" readonly="true"></form:input>
                                                    </div>
                                       
                                        <h4 style="color: tomato; font-style: italic; text-align: center">  Cart Value: ${sessionScope.itemSelected.makingcost + sessionScope.febricSelected.febriccost} </h4>
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
                </div>
                <!-- /Page Content -->
            </div>
            <!-- /Page Container -->
        <jsp:include page="/WEB-INF/views/partial/jsinclude.jsp"></jsp:include>
    </body>
</html>
