<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#"><img src="/minibank/images/bank.jpg" height="28" alt="FastBrank">Online Banking System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor02">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/minibank/accounts">Accounts </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/minibank/transaction/all">Transaction </a>
            </li>
        </ul>
        <div style="float:right; padding-right: 2em; color: white">Welcome: <%=session.getAttribute("user")%><a href="/minibank/logout">Logout</a></div>
    </div>
</nav>