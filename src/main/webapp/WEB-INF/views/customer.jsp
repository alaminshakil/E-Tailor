<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <title>Tailor Dashboard</title>
        </head>
        <body style="background: #fbfbfb">
        <jsp:include page="/WEB-INF/views/partial/customer/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/views/partial/topnav.jsp"></jsp:include>
        <h1 style="text-align: center; color: tomato">Welcome ${sessionScope.customerinfo.custname}</h1>
        <h3 style="text-align: center; margin-top: 150px">Want to Place a New Order? </h3> <br> <br>
    <li style="text-align: center">
        <a href="selectzone">
            <span style="font-size: x-large">Start Order Now</span>
        </a>
    </li>
</body>
<jsp:include page="/WEB-INF/views/partial/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/partial/jsinclude.jsp"></jsp:include>

</html>
