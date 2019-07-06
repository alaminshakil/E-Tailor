<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var febric = ${fList};
                var item = ${iList};
                var tailor = ${tList};

                angular.module('myapp', []).controller('FebricCtrl',
                        function ($scope) {
                            $scope.febricList = febric;
                            $scope.ilo = item;
                            $scope.tlo = tailor;
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="FebricCtrl">

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
                            <h3 class="breadcrumb-header">Fabric Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            <form:form commandName="FebricObject" action="febricadd" method="post">
                                <c:if test="${check}">

                                    <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Add Fabric</h4>
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
                                                    <form:input class="form-control" Placeholder="Febric Name" type="text" path="febricname" required="true" id="febricname"></form:input>
                                                    </div>
                                                    
                                                <form:hidden value="{{item}}" path="itemid"></form:hidden>
                                                    
                                                <form:hidden value="{{tailor}}" path="tailorid"></form:hidden> 
                                                    <div class="form-group">
                                                        <label for="fabriccost">Fabric Cost (BDT)</label> 
                                                    <form:input class="form-control" Placeholder="Febric Cost"      
                                                                type="text" path="febriccost" required="true"></form:input>
                                                    </div>
<!--                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Photo"
                                                                type="text" path="photourl" ></form:input>
                                                    </div>-->
                                                <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Add Febric</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset</form:button>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>

                                <c:if test="${!check}">
                                    <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Edit Fabric</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Febric Id" style="display:none" type="text" path="febricid" required="true" id="febricid"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Febric Name" type="text" path="febricname" required="true" id="febricname"></form:input>
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
                                                    <!--                                                    <div class="form-group">
                                                <form:input class="form-control" Placeholder="Febric Name"
                                                            type="text" path="febricname" required="true"></form:input>
                                                </div>-->
                                                    <div class="form-group">
                                                        <label for="febriccost">Fabric Cost (BDT)</label>
                                                    <form:input class="form-control" Placeholder="Febric Cost"
                                                                type="text" path="febriccost" required="true"></form:input>
                                                    </div>
<!--                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Photo"
                                                                type="text" path="photourl" required="true"></form:input>
                                                    </div>-->
                                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit Febric</form:button>
                                                <%--<form:button id="removebuttons" type="reset" class="btn btn-danger">Reset Details</form:button>--%>
                                                <a href="showfebricpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </form:form>
                                <div class="col-md-6">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <img src="resources/images/febric.jpg" alt="Tailor Image Here" style="height: 340px; width: 450px"/>
                                            </div>
                                        </div>
                                </div>
                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Febric List</h4>
                                    </div>
                                    <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Fabric Id</th>
                                                        <th>Fabric Name</th>
<!--                                                        <th>Item Id</th>
                                                        <th>Tailor Id</th>-->

                                                        <th>Fabric Cost</th>
<!--                                                        <th>Photo URL</th>-->
                                                        <th>Manage Tailor</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="c in febricList | filter: test">
                                                        <td>{{c.febricid}}</td>
                                                        <td>{{c.febricname}}</td>
<!--                                                        <td>{{c.itemid}}</td>
                                                        <td>{{c.tailorid}}</td>-->
                                                        <td>{{c.febriccost}}</td>
<!--                                                        <td>{{c.photourl}}</td>-->

                                                        <td><a href="editingfebric?getfebricid={{c.febricid}}"><button id="editbuttons" type="submit" class="waves-effect waves-light btn">Edit</button></a> <a href="removingfebric/{{c.febricid}}"><button id="removebuttons" type="button" class="waves-effect waves-light btn btn-danger">Remove</button></a>
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
