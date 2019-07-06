<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>

            <script>
                var us = ${zonemodelobject};
                console.log(us);
                angular.module('myapp', []).controller('ZoneController',
                        function ($scope) {
                            $scope.Zonenam = us;
                        });
        </script>
    </head>
    <body >

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
                    <div style="margin-left: 250px">
                    <div class="card">
            <h2>Report Section</h2>
            <form:form method="POST" action="reportView" commandName="reportInputForm">

                <table id="reptbl" width="350px" border="1">
                    <tr>
                        <td colspan="2"><form:errors path="tailorid" cssClass="error"/></td> </tr>
                    <tr>

                        <td>
                            <h5>Find Payment By Tailor</h5>
                            Enter Tailor id:  <form:input path="tailorid" id="tailorid"/>
                            <input type="submit"  style="margin-left: 100px"value="Generate Report"  />
                        </td>

                    </tr>
                </table>  
            </form:form>
        </div>

        <div class="card">

            <form:form method="POST" action="tailorByZone" commandName="reportInputForm">

                <table id="reptbl" width="350px" border="1">
                    <tr>
                        <td colspan="2"><form:errors path="tailorid" cssClass="error"/></td> </tr>
                    <tr>
                        <td>
                            <h5>Find Tailor By Zone Id</h5>
                            Enter Zone id:  <form:input path="zoneid" id="zoneid"/>
                            <input type="submit"  style="margin-left: 100px"value="Generate Report"  />
                        </td> 
                    </tr>
                </table>  
            </form:form>
        </div>
        <div class="card">

            <form:form method="POST" action="tailorByPay" commandName="reportInputForm">

                <table id="reptbl" width="350px" border="1">
                    <tr>
                        <td colspan="2"><form:errors path="tailorid" cssClass="error"/></td> </tr>
                    <tr>
                        <td>
                            <h5>Find Tailor By Pay Option</h5>
                            Enter Pay Option: 


                            <form  path="payoption" id="payoption">
                                <select name="payoption">
                                    <option value="">--Select--</option>
                                    <option value="cash">Cash</option>
                                    <option value="online">Online</option>
                                </select>
                            </form>

                            <input type="submit"  style="margin-left: 100px"value="Generate Report"  />
                        </td> 
                    </tr>
                </table>  
            </form:form>
        </div>
        
         <div class="card">

            <form:form method="POST" action="orderByDate" commandName="reportInputForm">

                <table id="reptbl" width="350px" border="1">
                    <tr>
                        <td colspan="2"><form:errors path="tailorid" cssClass="error"/></td> </tr>
                    <tr>
                        <td>
                            <h5>Find Order By Date</h5>
                            Enter Order date:  <form:input  path="orderdate" id="orderdate"/>
                            <input type="submit"  style="margin-left: 100px"value="Generate Report"  />
                        </td> 
                    </tr>
                </table>  
            </form:form>
        </div>
                    </div>
                    <!-- /Page Inner -->
                <jsp:include page="/WEB-INF/views/partial/footer.jsp"></jsp:include>
                <jsp:include page="/WEB-INF/views/partial/notification.jsp"></jsp:include>
                </div><!-- /Page Content -->
            </div><!-- /Page Container -->


        <jsp:include page="/WEB-INF/views/partial/jsinclude.jsp"></jsp:include>
    </body>
</html>
