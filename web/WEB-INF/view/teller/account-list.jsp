<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/14/2020
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Online Banking : teller</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
     <style type="text/css">
        html {
            position: relative;
            min-height: 100%;
        }

        body {
            margin-bottom: 50px;
        }

        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 50px;
            line-height: 50px;
            background-color: #f5f5f5;
            text-align: left;
            font-size: 14px;
        }

        #footer-content {
            margin-left: 1em;
            margin-right: 1em;
        }
    </style>
</head>
<body>
<%
    if(session.getAttribute("user") == null){
        response.sendRedirect("/minibank/");
    }
%>
<div style="height: 100px">
    <jsp:include page="/WEB-INF/view/common/teller-header.jsp" />
</div>
<main role="main">

    <div class="container marketing">
        <hr class="featurette-divider">
        <div class="row featurette">
            <div class="col-md-10">
                <div>
                    <span style="font-size: 1.5em">List Of All accounts</span>
                    <span style="float:right;">
                <a class="btn btn-outline-primary " href="/minibank/account/new">Add Account</a>
            </span>
                </div>
                <p>&nbsp;</p>
                <div class="table-responsive">
                <table id="example" class="display table table-hover" cellspacing="0">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Account Number</th>
                        <th scope="col">Customer Name</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">Account Type</th>
                        <th scope="col">Total Balance</th>
                        <th scope="col">Date Registered</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="account" items="${accounts}" varStatus="iteration">
                        <tr>
                            <th scope="row"><c:out value="${iteration.index+1}"></c:out>.</th>
                            <td><c:out value="${account.accountNumber}" /></td>
                            <td><c:out value="${account.firstName}" /></td>
                            <td><c:out value="${account.phoneNumber}" /></td>
                            <td><c:out value="${account.accountType}" /></td>
                            <td><c:out value="${account.balance}" /></td>
                            <td><c:out value="${account.registrationDate}" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                </div>
            </div>
          </div>
        <hr class="featurette-divider">
    </div>

 <div style="height: 100px">
        <jsp:include page="/WEB-INF/view/common/footer.jsp"/>
    </div>
</main>

<%--<script  src="https://code.jquery.com/jquery-3.3.1.js"></script>--%>
<%--<script  src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>--%>
<%--<script  src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>--%>
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#example').DataTable();
    });
</script>
</body>
</html>