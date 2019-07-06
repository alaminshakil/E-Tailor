<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var al = ${aList};
                var zl = ${zList};
                angular.module('myapp', []).controller('AreaController',
                        function ($scope) {
                            $scope.zlo = zl;
                            $scope.alo = al;
                            console.log($scope.zlo);
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="AreaController">

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
                            <h3 class="breadcrumb-header">Area Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            <form:form commandName="AreaObject" action="addingarea" method="post">
                                <c:if test="${check}">

                                    <div class="col-md-4">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Add Zone</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Area Name" type="text" path="areaname" required="true" id="areaname"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="zone" ng-options="x.zoneid as x.zonename for x in zlo" required="true">
                                                            <option value="">-- choose Zone Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{zone}}" path="zoneid"></form:hidden>
                                                <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Add Area</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset</form:button>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>

                                <c:if test="${!check}">
                                    <div class="col-md-4">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Edit Zone</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input type="text" class="form-control" id="zoneid" path="areaid" placeholder="Areaid"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Area Name" type="text" path="areaname" required="true" id="areaname"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="zone" ng-options="x.zoneid as x.zonename for x in zlo" required="true">
                                                            <option value="">-- choose Zone Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{zone}}" path="zoneid"></form:hidden>
                                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit Area</form:button>
                                                <%--<form:button id="removebuttons" type="reset" class="btn btn-danger">Reset Details</form:button>--%>
                                                <a href="showareapage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>
                            </form:form>
                            <div class="col-md-8">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Zone List</h4>
                                    </div>
                                    <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Area Id</th>
                                                        <th>Area Name</th>
                                                        <th>Zone Id</th>
                                                        <th>Manage Area</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="area in alo | filter:test">
                                                        <td>{{area.areaid}}</td>
                                                        <td>{{area.areaname}}</td>
                                                        <td>{{area.zoneid}}</td>
                                                        <td><a href="editareabutton?getareaid={{area.areaid}}"><button id="editbuttons" type="submit" class="btn btn-primary">Edit</button></a> <a href="removearea/{{area.areaid}}"><button id="removebuttons" type="button" class="btn btn-danger">Remove</button></a>
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
