<%-- 
    Document   : signup
    Created on : Jun 12, 2019, 12:06:08 PM
    Author     : R38 (JAVA)
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="resources/admin/images/favicon/favicon-32x32.png" sizes="32x32">
        <title>Registration Page</title>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .container{
                width: 400px;
                height: 100%;
                top: 20px;

            }
            .card{
                box-shadow: 0 3px 5px rgba(0,0,0,0.8);
            }
        </style>
    </head>
    <body style="background-color: ivory">
        <div class="container">
            <div class="card card-register mx-auto mt-5">
                <div class="card-header" style="background-color: gold; text-align: center; font-size: 25px; font-weight: 800;">Register an Account</div>
                <div class="card-body">
                    <form:form modelAttribute="urm" action="reguser">

                        <div class="form-group">
                            <div class="form-label-group">
                                <form:input type="text" class="form-control" placeholder="Username" id="name" autofocus="autofocus" aria-describedby="basic-addon1" path="username" required="true"></form:input>

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                <form:input type="password" class="form-control" id="pass"
                                            placeholder="Password" aria-describedby="basic-addon1" path="password" required="true"></form:input>

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                <form:input type="text" class="form-control" id="phone"
                                            placeholder="Phone Number" aria-describedby="basic-addon1" path="phone"  required="true"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                <form:input type="email" class="form-control" placeholder="Email" id="inputEmail" aria-describedby="basic-addon1" path="emailid" required="true"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                            <form:select class="form-control" path="role">
                                <option value="">I am a ---></option>
                                <option value="ROLE_TAILOR">Tailor</option>
                                <option value="ROLE_CUSTOMER">Customer</option>
                            </form:select>
                        </div>



                        <button id="signupbutton" class="btn btn-primary btn-block" type="submit">Sign Up</button>
                        <button id="cancelbutton" class="btn btn-outline-danger btn-block" type="Reset">Cancel</button>

                    </form:form>
                    <div class="text-center">
                        <h7>Already have an account?</h7><br>
                        <a href="login">Login Here</a>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="resources/jquery/jquery.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="resources/jquery-easing/jquery.easing.min.js"></script>
    </body>
</html>
