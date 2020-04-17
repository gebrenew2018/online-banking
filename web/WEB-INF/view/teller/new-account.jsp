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
    <jsp:include page="/WEB-INF/view/common/teller-header.jsp" />
</div>
<main role="main">

    <div class="container marketing">
        <hr class="featurette-divider">
        <div class="row featurette">
            <div class="col-md-10">
                <h2 class="well text-center customerProfile">Create New Account</h2>
                <hr>
                <form id="newAccountform" action="/minibank/account/add" method="POST">
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label text-left">First Name</label>
                        <div class="col-lg-9">
                            <input value="john" class="form-control " type="text" name="firstName" id="firstName" placeholder="firstName " required>
                        </div>
                    </div>
                    <div class="form-group row ">
                        <label class="col-lg-3 col-form-label form-control-label text-left ">Last Name</label>
                        <div class="col-lg-9 ">
                            <input value="Gebre" class="form-control " type="text" name="lastName" id="lastName" placeholder="LastName " required>
                        </div>
                    </div>
                    <div class="form-group row ">
                        <label class="col-lg-3 col-form-label form-control-label text-left ">Address</label>
                        <div class="col-lg-9 ">
                            <input value="1000 N 4th" class="form-control " type="text" name="street" id="street" placeholder="Street " placeholder="Street " required>
                        </div>
                    </div>
                    <div class="form-group row ">
                        <label class="col-lg-3 col-form-label form-control-label "></label>
                        <div class="col-lg-3 ">
                            <input value="FairField" id="city" class="form-control " name="city" type="text" placeholder="City " required>
                        </div>
                        <div class="col-lg-3 ">
                            <select id="state" class="form-control" name="state" required>
                                <option value=""> select state.... </option>
                                <option value="Alabama ">Alabama</option><option value="Alaska " selected>Alaska</option><option value="Arizona ">Arizona</option><option value="Arkansas ">Arkansas</option><option value="California
                                ">California</option><option value="Colorado ">Colorado</option><option value="Connecticut ">Connecticut</option><option value="Delaware ">Delaware</option><option value="District of Columbia ">District of Columbia</option><option value="Florida
                                ">Florida</option><option value="Georgia ">Georgia</option><option value="Guam ">Guam</option><option value="Hawaii ">Hawaii</option><option value="Idaho ">Idaho</option><option value="Illinois ">Illinois</option><option value="Indiana
                                ">Indiana</option><option value="Iowa ">Iowa</option><option value="Kansas ">Kansas</option><option value="Kentucky ">Kentucky</option><option value="Louisiana ">Louisiana</option><option value="Maine ">Maine</option><option value="Maryland
                                ">Maryland</option><option value="Massachusetts ">Massachusetts</option><option value="Michigan ">Michigan</option><option value="Minnesota ">Minnesota</option><option value="Mississippi ">Mississippi</option><option value="Missouri
                                ">Missouri</option><option value="Montana ">Montana</option><option value="Nebraska ">Nebraska</option><option value="Nevada ">Nevada</option><option value="New Hampshire ">New Hampshire</option><option value="New Jersey
                                ">New Jersey</option><option value="New Mexico ">New Mexico</option><option value="New York ">New York</option><option value="North Carolina ">North Carolina</option><option value="North Dakota ">North Dakota</option><option value="Northern Marianas Islands
                                ">Northern Marianas Islands</option><option value="Ohio ">Ohio</option><option value="Oklahoma ">Oklahoma</option><option value="Oregon ">Oregon</option><option value="Pennsylvania ">Pennsylvania</option><option value="Puerto Rico ">Puerto Rico</option><option value="Rhode
                                Island ">Rhode Island</option><option value="South Carolina ">South Carolina</option><option value="South Dakota ">South Dakota</option><option value="Tennessee ">Tennessee</option><option value="Texas
                                ">Texas</option><option value="Utah ">Utah</option><option value="Vermont ">Vermont</option><option value="Virginia ">Virginia</option><option value="Virgin Islands ">Virgin Islands</option><option value="Washington ">Washington</option><option value="West
                                Virginia ">West Virginia</option><option value="Wisconsin ">Wisconsin</option><option value="Wyoming ">Wyoming</option>
                            </select>
                        </div>
                        <div class="col-lg-3 ">
                            <input value="12345" class="form-control " type="number" name="zip" id="zip" placeholder="ZIP Code " pattern="[0-9]{5} " required>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group row ">
                        <label class="col-lg-3 col-form-label form-control-label text-left " for="phoneNumber">Phone Number</label>
                        <div class="col-lg-9 ">
                            <input value="641-233-2222" class="form-control " type="tel" id="phoneNumber" name="phoneNumber" placeholder="Format: xxx-xxx-xxxx ">
                        </div>
                    </div>
                    <div class="form-group row ">
                        <label class="col-lg-3 col-form-label form-control-label text-left " for="email">Email</label>
                        <div class="col-lg-9 ">
                            <input value="test@bank.com" class="form-control " type="email" name="email" id="email" placeholder="Email ">
                        </div>
                    </div>
                    <div class="form-group row ">
                        <label class="col-lg-3 col-form-label form-control-label text-left " for="accountType">Account Type</label>
                        <div class="col-lg-3 ">
                            <select id="accountType" id="accountType"  name="accountType" class=' form-control ' required>
                                <option value=" " selected>..select Type</option>
                                <option value="checking " selected>Checking Account</option>
                                <option value="saving ">Saving Account</option>
                                <option value="loan">Loan Account</option>
                            </select>
                        </div>
                        <label class="col-lg-3 col-form-label form-control-label text-left " for="initialAmount">Initial Amount</label>
                        <div class="col-lg-3 ">
                            <input value="500" class="form-control" type="number" id="initialAmount" name="balance" placeholder="initial Amount ">
                        </div>
                    </div>
<%--                    <div class="form-group row ">--%>
<%--                        <label class="col-lg-3 col-form-label form-control-label text-left ">Initial Amount</label>--%>
<%--                        <div class="col-lg-3 ">--%>
<%--                            <input value="500" class="form-control" type="number" id="initialAmount" name="balance" placeholder="initial Amount ">--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <hr>
                    <div class="form-group row ">
                        <label class="col-lg-3 col-form-label form-control-label "></label>
                        <div class="col-lg-9 ">
                            <input type="reset" class="btn btn-info " value="Reset ">
                            <input type="reset" class="btn btn-info " value="Cancel ">
                            <input type="submit" accept class="btn btn-primary " value="Save">
                        </div>
                    </div>
                </form>
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