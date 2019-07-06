<%-- 
    Document   : index
    Created on : Jun 29, 2019, 9:44:23 PM
    Author     : alami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome ${sessionScope.customerinfo.custname}</h1>
        <h1>Want to Place a New Order? </h1>
         <li>
      <a href="selectzone">
                        <i class="menu-icon icon-inbox"></i><span>Zone</span>
                    </a>
                </li>
    </body>
</html>
