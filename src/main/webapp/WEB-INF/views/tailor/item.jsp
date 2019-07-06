<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var il = ${iList};
                var tl = ${tList};
                angular.module('myapp', []).controller('ItemCtrl',
                        function ($scope) {
                            $scope.ilo = il;
                            $scope.tlo = tl;
                        }
                );
        </script>
    </head>
    <body ng-app="myapp" ng-controller="ItemCtrl">

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
                            <h3 class="breadcrumb-header">Item Information</h3>
                        </div>
                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                            <form:form commandName="ItemObject" action="addingitem" method="post">
                                <c:if test="${check}">

                                    <div class="col-md-4">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Add Item</h4>
                                            </div>
                                            <div class="form-group">
                                                        <select class="form-control" ng-model="tailor" ng-options="x.tailorid as x.tailorname for x in tlo" required="true">
                                                            <option value="">-- choose Tailor Name--</option>
                                                        </select>
                                                    </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Item Name" type="text" path="itemname" required="true" id="itemname"></form:input>
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <label for="makingcost">Making Cost (BDT)</label>
                                                    <form:input class="form-control" Placeholder="Making Cost" type="text" path="makingcost" required="true" id="makingcost"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                      <label for="makingcost">Making Time (day's)</label>  
                                                    <form:input class="form-control" Placeholder="Making Time" type="text" path="makingtime" required="true" id="makingtime"></form:input>
                                                    </div>
                                                <form:hidden value="{{tailor}}" path="tailorid"></form:hidden>
                                                <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Add Item</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset</form:button>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>

                                <c:if test="${!check}">
                                    <div class="col-md-5">
                                        <div class="panel panel-white">
                                            <div class="panel-heading clearfix">
                                                <h4 class="panel-title">Edit Item</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                        <select class="form-control" ng-model="tailor" ng-options="x.tailorid as x.tailorname for x in tlo" required="true">
                                                            <option value="">-- choose Tailor Name--</option>
                                                        </select>
                                                    </div>
                                                <div class="form-group">
                                                    <form:input type="text" class="form-control" id="itemid" path="itemid" placeholder="Item ID"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                    <form:input class="form-control" Placeholder="Item Name" type="text" path="itemname" required="true" id="itemname"></form:input>
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <label for="makingcost">Making Cost (BDT)</label> 
                                                    <form:input class="form-control" Placeholder="Making Cost" type="text" path="makingcost" required="true" id="makingcost"></form:input>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="makingdays">Making Time (day's)</label> 
                                                    <form:input class="form-control" Placeholder="Making Time" type="text" path="makingtime" required="true" id="makingtime"></form:input>
                                                    </div>
                                                <form:hidden value="{{tailor}}" path="tailorid"></form:hidden>
                                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit Item</form:button>
                                                <%--<form:button id="removebuttons" type="reset" class="btn btn-danger">Reset Details</form:button>--%>
                                                <a href="showitempage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>
                            </form:form>
                            <div class="col-md-7">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title" style="text-align: center; background-color:scrollbar; font-size: large ;">Item List</h4>
                                    </div>
                                    <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                                <thead>
                                                    <tr>
                                                        <th>Item Id</th>
                                                        <th>Item Name</th>
<!--                                                        <th>Tailor Id</th>-->
                                                        <th>Item Cost</th>
                                                        <th>Making time</th>
                                                        <th>Manage Area</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="i in ilo | filter:test">
                                                        <td>{{i.itemid}}</td>
                                                        <td>{{i.itemname}}</td>
<!--                                                        <td>{{i.tailorid}}</td>-->
                                                        <td>{{i.makingcost}}</td>
                                                        <td>{{i.makingtime}}</td>
                                                        <td><a href="edititem?getitemid={{i.itemid}}"><button id="editbuttons" type="submit" class="btn btn-primary">Edit</button></a> <a href="removeitem/{{i.itemid}}"><button id="removebuttons" type="button" class="btn btn-danger">Remove</button></a>
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
