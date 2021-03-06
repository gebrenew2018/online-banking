<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/14/2020
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Online Banking : teller</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
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
    <jsp:include page="/WEB-INF/view/common/teller-header.jsp"/>
</div>
<main role="main">
    <div class="container marketing">
        <hr class="featurette-divider">
        <div class="row featurette">
            <div class="col-md-10">
                <h3 class="well text-center customerProfile">Make Money Deposit</h3>
                <%=request.getAttribute("message")%>
                <hr>
                <form id="depositeForm" action="/minibank/transaction/deposit-money" method="POST">
                    <fieldset>
                        <div class="form-group row ">
                            <label for="accountNumber" class="col-lg-3 col-form-label">Account Number</label>
                            <div class="col-md-6 form-group">
                                <input value="100001" class="form-control" type="number" name="accountNumber"
                                       id="accountNumber" placeholder="Account Number ">
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label for="amount" class="col-lg-3 col-form-label">Amount</label>
                            <div class="col-md-6 form-group">
                                <input value="100.00" class="form-control" type="amount" name="amount" id="amount"
                                       placeholder="initial Amount ">
                            </div>
                        </div>
                        <div class="form-group row" style="text-align: right">
                            <label class="col-lg-3 col-form-label form-control-label "></label>
                            <div class="col-sm-6 form-group" style="float: right">
                                <a href="/minibank/transaction/all"  class="btn btn-outline-danger" style="margin-right: 2em;">Cancel</a>
                                <input type="submit" class="btn btn-outline-primary" value="Deposit Money">
                                <a href="/minibank/account/detail"  class="btn btn-outline-success" style="margin-right: 2em;">Details</a>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <hr class="featurette-divider">
        <div>
            <h6>Customer Information</h6>
        </div>
    </div>
    <div style="height: 100px">
        <jsp:include page="/WEB-INF/view/common/footer.jsp"/>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>