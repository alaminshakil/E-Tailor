<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
    </head>
    <body>

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

                        <div id="main-wrapper">
                            <div class="row">
                                <!--main content start-->
                                <div class="col-md-10">
                                    <div class="panel panel-white">
                                        <div class="panel-heading clearfix">
                                            <h4 class="panel-title" style="text-align: center">My Profile </h4>
                                        </div>
                                        <div class="form-group input-field col s12">
                                            <div class="form-group">
                                                    <label for="Customer Name"> Name : </label> 
                                                    ${sessionScope.UserLoggedIn}
                                                </div>
                                            <div class="form-group">
                                                    <label for="Customer Name"> Phone : </label> 
                                                ${sessionScope.Userphone}
                                                </div>
                                            <div class="form-group">
                                                    <label for="Customer Name"> Email Address : </label> 
                                                    ${sessionScope.email}
                                                </div>
                                            <div class="form-group">
                                                    <label for="Customer Name"> Delivery Address : </label> 
                                                    ${sessionScope.customerinfo.deliveryaddress}
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
