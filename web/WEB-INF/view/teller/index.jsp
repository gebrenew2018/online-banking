<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/14/2020
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <link href="/minibank/images/favicon-16x16.png" type="images/ico" rel="Icon">

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
        fieldset {
            border: 1px solid #ddd !important;
            margin: 0;
            padding: 10px;
            position: relative;
            border-radius: 4px;
            background-color: #f5f5f5;
            padding-left: 10px!important;
        }
    </style>
</head>
<body>
<div style="height: 100px">
    <jsp:include page="/WEB-INF/view/common/header.jsp"/>
</div>
<main role="main">

    <div class="container marketing">
        <hr class="featurette-divider">
        <div class="row featurette">
            <div class="col-md-7">
                <fieldset class="form-group">
                    <legend class="col-form-label col-sm-2 pt-0">Login</legend>
                    <%=request.getAttribute("message")%>
                    <form action="/minibank/teller/login" class="needs-validation" method="post" name="loginForm" id="loginForm">
                        <div class="form-group">
                            <label for="userName">Username:</label>
                            <input type="text" class="form-control" id="userName" placeholder="Enter username" name="userName"
                                   required>
                            <div class="invalid-feedback">Please fill out this field.</div>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password"
                                   required>
                            <div class="invalid-feedback">Please fill out this field.</div>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Login">
                    </form>
                </fieldset>
            </div>
            <div class="col-md-5">
                <img src="/minibank/images/customer.png" alt="customer" width="500" height="500">
            </div>
        </div>
        <hr class="featurette-divider">
    </div>

    <div style="height: 100px">
        <jsp:include page="/WEB-INF/view/common/footer.jsp"/>
    </div>
</main>
<script  src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>