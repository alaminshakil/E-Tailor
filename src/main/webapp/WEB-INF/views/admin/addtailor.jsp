<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var tl = ${tailormodelobject};
                var al = ${arealist};
                var zl = ${zonelist};

                angular.module('myapp', []).controller('TailorinfoController',
                        function ($scope) {
                            $scope.tailorangularobject = tl;
                            $scope.zlo = zl;
                            $scope.alo = al;
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="TailorinfoController">

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
                            <h3 class="breadcrumb-header">Tailor Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            <form:form commandName="newTailorObject" action="tailoradd" method="post">
                                <c:if test="${check}">

                                    <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Add Tailor</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Tailor Name" type="text" path="tailorname" required="true" id="tailorname"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="zone" ng-options="x.zoneid as x.zonename for x in zlo" required="true">
                                                            <option value="">-- choose Zone Name--</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="area" ng-options="x.areaid as x.areaname for x in alo" required="true">
                                                            <option value="">-- choose Area Name--</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Delivery Option"
                                                                type="text" path="deliveryoption" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Pay Option"
                                                                type="text" path="payoption" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Phone"
                                                                type="text" path="phone" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Address"
                                                                type="text" path="tailoraddress" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Email Id"
                                                                type="text" path="emailid" required="true"></form:input>
                                                    </div>

                                                <form:hidden value="{{zone}}" path="zoneid"></form:hidden>
                                                <form:hidden value="{{area}}" path="areaid"></form:hidden>
                                                <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Add Area</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset</form:button>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>

                                <c:if test="${!check}">
                                    <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Edit Zone</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Tailor Id" style="display:none" type="text" path="tailorid" required="true" id="tailorid"></form:input>
                                                    </div>
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Tailor Name" type="text" path="tailorname" required="true" id="tailorname"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="zone" ng-options="x.zoneid as x.zonename for x in zlo" required="true">
                                                            <option value="">-- choose Zone Name--</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="area" ng-options="x.areaid as x.areaname for x in alo" required="true">
                                                            <option value="">-- choose Area Name--</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Delivery Option"
                                                                type="text" path="deliveryoption" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Pay Option"
                                                                type="text" path="payoption" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Phone"
                                                                type="text" path="phone" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Address"
                                                                type="text" path="tailoraddress" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Email Id"
                                                                type="text" path="emailid" required="true"></form:input>
                                                    </div>

                                                <form:hidden value="{{zone}}" path="zoneid"></form:hidden>
                                                <form:hidden value="{{area}}" path="areaid"></form:hidden>
                                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit Area</form:button>
                                                <%--<form:button id="removebuttons" type="reset" class="btn btn-danger">Reset </form:button>--%>
                                                    <a href="showtailorpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>
                            </form:form>
                                <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <img src="resources/images/tailor.gif" alt="Tailor Image Here" style="height: 450px; width: 450px"/>
                                            </div>
                                        </div>
                                </div>
                                        
                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Tailor List</h4>
                                    </div>
                                    <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Tailor Id</th>
                                                        <th>Tailor Name</th>
                                                        <th>Area Id</th>
                                                        <th>Zone Id</th>
                                                        <th>Address</th>
                                                        <th>Delivery</th>
                                                        <th>Payment</th>
                                                        <th>Phone</th>
                                                        <th>Manage Tailor</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="tailor in tailorangularobject | filter : test">
                                                        <td>{{tailor.tailorid}}</td>
                                                        <td>{{tailor.tailorname}}</td>
                                                        <td>{{tailor.areaid}}</td>
                                                        <td>{{tailor.zoneid}}</td>
                                                        <td>{{tailor.tailoraddress}}</td>
                                                        <td>{{tailor.deliveryoption}}</td>
                                                        <td>{{tailor.payoption}}</td>
                                                        <td>{{tailor.phone}}</td>
                                                        <td><a href="editingtailor?gettailorid={{tailor.tailorid}}"><button id="editbuttons" type="submit" class="waves-effect waves-light btn">Edit</button></a> <a href="removingtailor/{{tailor.tailorid}}"><button id="removebuttons" type="button" class="waves-effect waves-light btn btn-danger">Remove</button></a>
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
