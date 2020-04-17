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
    </style>
</head>
<body>
<div style="height: 100px">
    <jsp:include page="/WEB-INF/view/common/customer-header.jsp" />
</div>
<main role="main">
    <div class="container marketing">
        <hr class="featurette-divider">
        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">You are on the right place. <span class="text-muted">It’ll blow your mind.</span></h2>
                <p class="lead">When you open an account from our bank you get convenience,
                    security and a team of bankers who’ve got your back. Choose between our four checking accounts to find the one for you.</p>
            </div>
            <div class="col-md-5">
                <img src="/minibank/images/customer.png" alt="customer" width="500" height="300">
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