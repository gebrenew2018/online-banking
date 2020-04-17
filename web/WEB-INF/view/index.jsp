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
    <link href="/minibank/images/favicon-16x16.png" type="images/ico" rel="Icon"/>
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
<div class="container ">
    <div class="row ">
        <div class="col-md-6 ">
            <div class="slgan"> <i><b>Fluent in finance</b></i></div>
        </div>
    </div>

    <div class="row ">
        <div class="col-md-6 ">
            <h3>Fast<i>B</i>ank </h3>
            <img src="/minibank/images/bank.jpg" height="270" alt="Mantra Bank">
            <h3>Mission & vision </h3>
            <p class="textjustify">
                We will be the preferred provider of targeted financial service in our communities based on strong
                customer relationships. We will strengthen these relationships by providing the right solutions that
                combine our technology, experience, and financial strength.
            </p>
        </div>

        <div class="col-md-4 ">
            <fieldset class="form-group">
                <legend class="col-form-label col-sm-2 pt-0">Login</legend>
                <form action="/minibank/login" class="needs-validation" method="post" name="loginForm" id="loginForm">
                    <div class="form-group">
                        <label for="userName">Username:</label>
                        <input type="text" class="form-control" id="userName" placeholder="Enter username"
                               name="userName"
                               required>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password"
                               name="password"
                               required>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                            <input type="submit" class="btn btn-outline-success " value="Login">
                    <span><a href="#">Forgot password?</a></span>
                </form>
            </fieldset>
        </div>
    </div>
</div>
<div style="height: 100px">
    <jsp:include page="/WEB-INF/view/common/footer.jsp"/>
</div>
<script>
    // Disable form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Get the forms we want to add validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>
