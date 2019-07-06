<%-- 
    Document   : report
    Created on : Mar 29, 2018, 10:46:50 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .error {
                color: #ff0000;
            }

        </style>
    </head>
    <body>
        <div class="card">
            <h2>Report example</h2>
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
                            Enter Order date:  <form:input path="orderdate" id="orderdate"/>
                            <input type="submit"  style="margin-left: 100px"value="Generate Report"  />
                        </td> 
                    </tr>
                </table>  
            </form:form>
        </div>

        <div class="card">
            <form:form method="POST" action="tailorByDelivery" commandName="reportInputForm">

                <table id="reptbl" width="350px" border="1">
                    <tr>
                        <td colspan="2"><form:errors path="tailorid" cssClass="error"/></td> </tr>
                    <tr>
                        <td>1
                            <h5>Find Tailor By Delivery Option</h5>
                            Enter Delivery Option:  
                            <form  path="deliveryoption" id="deliveryoption">
                                <select name="deliveryoption">
                                    <option value="">--Select--</option>
                                    <option value="home">Home</option>
                                    <option value="pick">Pick</option>
                                </select>
                                <input type="submit"  style="margin-left: 100px"value="Generate Report"  />

                            </form>
                        </td> 
                    </tr>
                </table>  
            </form:form>
        </div>
    </body>
</html>
