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
                    <span style="font-size: 1.5em">List Of All Transactions</span>
                    <span style="float:right;">
                <a class="btn btn-outline-primary " href="/minibank/transaction/withdraw">Withdraw</a>
                <a class="btn btn-outline-primary " href="/minibank/transaction/deposit">Deposit</a>
                <a class="btn btn-outline-primary " href="/minibank/transaction/transfer">Transfer</a>
            </span>
                </div>
                <p>&nbsp;</p>
                <div class="table-responsive">
                    <table id="example" class="display table table-hover" cellspacing="0">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Transaction ID</th>
                            <th scope="col">Account Number</th>
                            <th scope="col">Transaction Type</th>
<%--                            <th scope="col">Account Type</th>--%>
                            <th scope="col">Target Account</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Date</th>
                            <th scope="col">User</th>
                            <th scope="col">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="transaction" items="${transactions}" varStatus="iteration">
                            <tr>
                                <th scope="row"><c:out value="${iteration.index+1}"></c:out>.</th>
                                <td><c:out value="${transaction.transactionId}" /></td>
                                <td><c:out value="${transaction.ownerAccount}" /></td>
                                <td><c:out value="${transaction.transactionType}" /></td>
<%--                                <td><c:out value="${transaction.accountType}" /></td>--%>
                                <td><c:out value="${transaction.targetAccount}" /></td>
                                <td><c:out value="${transaction.amount}" /></td>
                                <td><c:out value="${transaction.transactionDate}" /></td>
                                <td><c:out value="${transaction.user}" /></td>
                                <td>
                                    <a href="/edit?id=<c:out value='${transaction.transactionId}' />">Edit</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="/delete?id=<c:out value='${transaction.transactionId}' />">Void</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
<%--                <h2 class="featurette-heading">List Of All Transactions.</h2>--%>
<%--                <p class="lead">When you open an account from our bank you get convenience,--%>
<%--                    security and a team of bankers who’ve got your back. Choose between our four checking accounts to find the one for you.</p>--%>
            </div>
            <%--            <div class="col-md-5">--%>
            <%--                &lt;%&ndash;                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em"><img src="../../../images/cust.jpg"></text></svg>&ndash;%&gt;--%>
            <%--                <img src="images/customer.png" alt="customer" width="500" height="500">--%>
            <%--            </div>--%>
        </div>
        <hr class="featurette-divider">
    </div>

    <%--    <footer class="container">--%>
    <%--        <p class="float-right"><a href="#">Back to top</a></p>--%>
    <%--        <p>&copy; 2020 Online Bank, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms and Conditions</a></p>--%>
    <%--    </footer>--%>
    <div style="height: 100px">
        <jsp:include page="/WEB-INF/view/common/footer.jsp"/>
    </div>
</main>
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#example').DataTable();
    });
</script>
</body>
</html>