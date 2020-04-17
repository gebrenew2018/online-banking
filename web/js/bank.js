/**
 * bank.js
 * @author Gebre H. Gebreegziyabher
 */

 "use strict";
    $(document).ready(function () {
        const accountNumberText = document.querySelector("#accountNo");
        const customerNameText = document.querySelector("#customerName");
        const accountTypeText = document.querySelector("#accountType");
        $("#bankApp").submit(
            function (event) {
                event.preventDefault();
                const accountNumber = accountNumberText.value;
                const customerName = customerNameText.value;
                const accountType = accountTypeText.value;
                const resultDiv = $("#divResult");
                const result = '<li class="list-group-item">' + accountNumber + ' |  ' + customerName + ' |  ' + accountType + '</li>';
                $("#result").append(result);
                resultDiv.css("display", "block");

                const newAccount = {
                    "accountNumber": accountNumber,
                    "customerName": customerName,
                    "accountType": accountType
                }
                fetch("http://localhost:8080/minibank/account-add", {
                    method: "post",
                    body: JSON.stringify(newAccount),
                    headers: {
                        "Content-Type":"application/json"
                    }
                    // }).then(function(response){
                    //     return response.json();
                }).then(function(jsonResponseData){
                    // clear the form controls
                    accountNumberText.value = "";
                    customerNameText.value = "";
                    accountTypeText.value = "";
                }).catch(function(err){
                    console.error(err);
                });
            }
        );
        $("#accountNo").keyup(function (e) {
            var res = $("#accountNo").val();
            if (e.key.match(/[0-9]/) === null) {
                res = res.replace(e.key, "");
                $("#accountNo").val(res);
                return;
            }
            if (res.length == 2) {
                $("#accountNo").val(res + "-")
            }

            if (res.length == 6) {
                $("#accountNo").val(res + "-")
            }
        });
        (function () {
            fetch("http://localhost:8080/minibank/account-list")
                .then((response) => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        return Promise.reject({status: response.status, statusText: response.statusText});
                    }
                })
                .then(accounts => {
                    console.log(accounts);
                    let content = "";
                    accounts.forEach(function (account, i) {
                        content += '<li class="list-group-item">' + account.accountNumber + ' |  ' + account.customerName + ' |  ' + account.accountType + '</li>';
                    });

                    const resultDiv = $("#divResult");
                    $("#result").append(content);
                    resultDiv.css("display", "block");
                })
                .catch(err => {
                    console.log("Error:" + err);

                })
        })();
    });