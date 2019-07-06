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
                            <h3 class="breadcrumb-header">Measurement Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            <form:form commandName="MsntObject" action="msntadd" method="post">
                                <c:if test="${check}">

                                    <div class="col-md-4">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Add Measurement</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                        <select class="form-control" ng-model="tailor" ng-options="x.tailorid as x.tailorname for x in tlo" required="true">
                                                            <option value="">-- choose Tailor Name--</option>
                                                        </select>
                                                    </div>
                                                <div class="form-group">
                                                        <select class="form-control" ng-model="item" ng-options="x.itemid as x.itemname for x in ilo" required="true">
                                                            <option value="">-- choose Item Name--</option>
                                                        </select>
                                                    </div>
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Measurement Name" type="text" path="measurementname" required="true" id="measurementname"></form:input>
                                                    </div>
                                                    
                                                <form:hidden value="{{item}}" path="itemid"></form:hidden>
                                                    
                                                <form:hidden value="{{tailor}}" path="tailorid"></form:hidden> 
                                                    
                                                    
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
                                                    <form:input class="form-control" Placeholder="Measurement Id" style="display:none" type="text" path="measurementid" required="true" id="measurementid"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Measurement Name" type="text" path="measurementname" required="true" id="measurementname"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="item" ng-options="x.itemid as x.itemname for x in ilo" required="true">
                                                            <option value="">-- choose Item Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{item}}" path="itemid"></form:hidden>
                                                    <div class="form-group">
                                                        <select class="form-control" ng-model="area" ng-options="x.tailorid as x.tailorname for x in tlo" required="true">
                                                            <option value="">-- choose Tailor Name--</option>
                                                        </select>
                                                    </div>
                                                <form:hidden value="{{tailor}}" path="tailorid"></form:hidden>
                                                   
                                                    
                                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit Measurement</form:button>
                                                <%--<form:button id="removebuttons" type="reset" class="btn btn-danger">Reset Details</form:button>--%>
                                                <a href="showmsntpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </form:form>
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
<!--                                                        <th>Item Id</th>
                                                        <th>Tailor Id</th>-->

                                                        
                                                        <th>Manage</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="c in msntlist | filter:test">
                                                        <td>{{c.measurementid}}</td>
                                                        <td>{{c.measurementname}}</td>
<!--                                                        <td>{{c.itemid}}</td>
                                                        <td>{{c.tailorid}}</td>-->
                                                        

                                                        <td><a href="editmsnt?getmeasurementid={{c.measurementid}}"><button id="editbuttons" type="submit" class="waves-effect waves-light btn">Edit</button></a> <a href="removemsnt/{{c.measurementid}}"><button id="removebuttons" type="button" class="waves-effect waves-light btn btn-danger">Remove</button></a>
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
