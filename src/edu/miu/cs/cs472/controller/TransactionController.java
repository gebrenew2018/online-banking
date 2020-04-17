package edu.miu.cs.cs472.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import edu.miu.cs.cs472.DAO.AccountDAO;
import edu.miu.cs.cs472.DAO.TransactionDAO;
import edu.miu.cs.cs472.model.Account;
import edu.miu.cs.cs472.model.Transaction;
import edu.miu.cs.cs472.utility.FormValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "TransactionController", urlPatterns = {"/transaction",
        "/transaction/all", "/transaction/api_list", "/transaction/deposit", "/transaction/withdraw",
        "/transaction/transfer", "/transaction/deposit-money",
        "/transaction/withdraw-money", "/transaction/transfer-money",
        "/transaction/customer", "/transaction/money-transfer"})
public class TransactionController extends HttpServlet {
    private TransactionDAO transactionDAO;
    private AccountDAO accountDAO;
    HttpSession session;

    public void init() {
        transactionDAO = new TransactionDAO();
        accountDAO = new AccountDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", "");
        String action = request.getServletPath();
        System.out.println(action);
        try {
            switch (action) {
                case "/transaction/all":
                    getAllTranasaction(request, response);
                    break;

                case "/transaction/api_list":
                    getAllTranasactionApi(request, response);
                    break;
                case "/transaction/deposit":
                    deposit(request, response);
                    break;
                case "/transaction/deposit-money":
                    depositMoney(request, response);
                    break;
                case "/transaction/withdraw":
                    withdraw(request, response);
                    break;
                case "/transaction/withdraw-money":
                    withdrawMoney(request, response);
                    break;
                case "/transaction/transfer":
                    transfer(request, response);
                    break;
                case "/transaction/money-transfer":
                    customerMoneyTransfer(request, response);
                    break;
                case "/transaction/transfer-money":
                    transfermoney(request, response);
                    break;
                case "/transaction/customer":
                    getTransaction(request, response);
                    break;
                case "/edit":
//                    showEditForm(request, response);
                    break;
                case "/update":
//                    updateAccount(request, response);
                    break;
                default:
//                    getAllTranasaction(request, response);
                    asDefault(request, response);
                    break;
            }

        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void customerMoneyTransfer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/customer/transfer.jsp");
        dispatcher.forward(request, response);

    }

    private void getTransaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        System.out.println(account.toString());
        List<Transaction> transactionList = transactionDAO.getTransaction(account.getAccountNumber());
        for (Transaction transaction : transactionList) {
            System.out.println(transaction.toString());
        }
        request.setAttribute("myTransaction", transactionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/customer/transactions.jsp");
        dispatcher.forward(request, response);

    }

    private void transfermoney(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        session = request.getSession();
        String accountNo = "";
        if (session.getAttribute("user") != null) {
            accountNo = request.getParameter("accountNumber");
        } else {
            Account account = (Account) session.getAttribute("account");
            accountNo = account.getAccountNumber();
        }
        String accountTarget = request.getParameter("targetAccount");
        System.out.println(accountNo);
        System.out.println(accountTarget);
        if (accountTarget.equals(accountNo)) {
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\"> Sender Account Number should be different from the receiver account number! </div>");
            RequestDispatcher dispatcher;

            if (session.getAttribute("user") != null) {
                dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/transfer.jsp");
            } else {
                dispatcher = request.getRequestDispatcher("/WEB-INF/view/customer/transfer.jsp");
            }
            dispatcher.forward(request, response);
        }
        String moneyAmount = request.getParameter("amount");
        System.out.println("Account Number" + accountNo);
        Account acc = accountDAO.getAccountDetail(accountNo);
        System.out.println("Account Detail:" + acc.toString());
        float afterDeduction = acc.getBalance() - Float.valueOf(moneyAmount);
        Account accTarget = accountDAO.getAccountDetail(accountTarget);
        if (acc.getAccountNumber() != null && accTarget.getAccountNumber() != null && afterDeduction > 50) {
            Transaction transaction = new Transaction();
            transaction.setOwnerAccount(acc.getAccountNumber());
            transaction.setAmount(moneyAmount);
            transaction.setTargetAccount(accTarget.getAccountNumber());
            transaction.setTransactionType("Transfer");
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String date = df.format(new Date());
            transaction.setTransactionDate(date);
            transaction.setUser((String) session.getAttribute("user"));
            boolean tran = transactionDAO.addTransaction(transaction);
            boolean amount_updated = false;
            boolean amount_target = false;
            if (tran) {
                amount_updated = accountDAO.updateBalance(String.valueOf(moneyAmount), acc.getAccountNumber(), transaction.getTransactionType());
                amount_target = accountDAO.updateBalance(String.valueOf(moneyAmount), accTarget.getAccountNumber(), "Deposit");
            }
            if (amount_updated && amount_target) {
                List<Transaction> transactions = transactionDAO.getAllTransaction();
                request.setAttribute("transactions", transactions);
                RequestDispatcher dispatcher;


                if (session.getAttribute("user") != null) {
                    request.setAttribute("message", "<div class=\"alert alert-success\" role=\"alert\"> Money transfered to " + accountTarget + " successfully! Your Balance is   $" + acc.getBalance() + "&nbsp;&nbsp;&nbsp;" +
                            "<span><a href=\"/minibank/transaction/all\"  class=\"btn btn-outline-success\" style=\"margin-right: 2em;\">Details</a>\n" +
                            "</span></div>");
                    dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/transfer.jsp");

                } else {
                    request.setAttribute("message", "<div class=\"alert alert-success\" role=\"alert\"> Money transfered to " + accountTarget + " successfully! Your Balance is   $" + acc.getBalance() + "&nbsp;&nbsp;&nbsp;" +
                        "<span><a href=\"/minibank/transaction/customer\"  class=\"btn btn-outline-success\" style=\"margin-right: 2em;\">Details</a>\n" +
                        "</span></div>");
                    dispatcher = request.getRequestDispatcher("/WEB-INF/view/customer/transfer.jsp");
                }
                dispatcher.forward(request, response);
            } else {
                System.out.println("transfer Amount Not Updated!");
            }

        } else if (acc.getAccountNumber() != null) {
            System.out.println("Transfer Not Allowed! Insufficient Balance! Your Balance is" + acc.getBalance());
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\"> Transfer Not Allowed! " +
                    "Insufficient Balance! Your Balance is $" + acc.getBalance() + "'</div>");
            RequestDispatcher dispatcher;
            if (session.getAttribute("user") != null) {
                dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/transfer.jsp");
            } else {
                dispatcher = request.getRequestDispatcher("/WEB-INF/view/customer/transfer.jsp");
            }
            dispatcher.forward(request, response);
        } else {
            System.out.println("Target Account Not Found!");
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\"> Target Account Not Found! </div>");
            RequestDispatcher dispatcher;
            if (session.getAttribute("user") != null) {
                dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/transfer.jsp");
            } else {
                dispatcher = request.getRequestDispatcher("/WEB-INF/view/customer/transfer.jsp");
            }
            dispatcher.forward(request, response);
        }
    }

    private void withdrawMoney(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String accountNo = request.getParameter("accountNumber");
        String amount = request.getParameter("amount");
        Account acc = accountDAO.getAccountDetail(accountNo);
        float afterDeduction = acc.getBalance() - Float.valueOf(amount);
        if (acc.getAccountNumber() != null && afterDeduction > 50) {
            Transaction transaction = new Transaction();
            transaction.setOwnerAccount(acc.getAccountNumber());
            transaction.setAmount(amount);
            transaction.setTargetAccount(acc.getAccountNumber());
            transaction.setTransactionType("Withdraw");
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String date = df.format(new Date());
            transaction.setTransactionDate(date);
            transaction.setUser((String) session.getAttribute("user"));
            boolean tran = transactionDAO.addTransaction(transaction);
            boolean amount_updated = false;
            if (tran) {
                amount_updated = accountDAO.updateBalance(String.valueOf(amount), acc.getAccountNumber(), transaction.getTransactionType());
            }
            if (amount_updated) {
                List<Transaction> transactions = transactionDAO.getAllTransaction();
                request.setAttribute("transactions", transactions);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/transactions.jsp");
                dispatcher.forward(request, response);
            } else {
                System.out.println("Withdrawal Amount Not Updated!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/withdraw.jsp");
                dispatcher.forward(request, response);
            }

        } else if (acc.getAccountNumber() != null) {
            System.out.println("Insufficient Balance! Your Balance is" + acc.getBalance());
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\"> " +
                    "Insufficient Balance! Your Balance is $" + acc.getBalance() + "  </div>");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/withdraw.jsp");
            dispatcher.forward(request, response);
        } else {
            System.out.println("Account Number Not Found!");
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\"> Account Number Not Found! </div>");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/withdraw.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void depositMoney(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        session = request.getSession();
        String accountNumber = request.getParameter("accountNumber");
        String amount = request.getParameter("amount");
        System.out.println(accountNumber);
        Account account = accountDAO.getAccountDetail(accountNumber);
        System.out.println("Account:" + account.toString());
        if (account.getAccountNumber() != null) {
            Transaction transaction = new Transaction();
            transaction.setOwnerAccount(account.getAccountNumber());
            transaction.setAmount(amount);
            transaction.setTargetAccount(account.getAccountNumber());
            transaction.setTransactionType("Deposit");
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String date = df.format(new Date());
            transaction.setTransactionDate(date);
            transaction.setUser((String) session.getAttribute("user"));
            boolean tran = transactionDAO.addTransaction(transaction);
            boolean amount_updated = false;
            if (tran) {
                amount_updated = accountDAO.updateBalance(String.valueOf(amount), account.getAccountNumber(), transaction.getTransactionType());
            }
            if (amount_updated) {
                List<Transaction> transactions = transactionDAO.getAllTransaction();
                request.setAttribute("transactions", transactions);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/transactions.jsp");
                dispatcher.forward(request, response);
            } else {
                System.out.println("Amount Not Updated!");
            }

        } else {
            System.out.println("Account Not Found!");
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\"> Account Number Not Found! </div>");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/deposit.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void transfer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/transfer.jsp");
        dispatcher.forward(request, response);
    }

    private void withdraw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/withdraw.jsp");
        dispatcher.forward(request, response);
    }

    private void asDefault(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("this is default.");
    }

    private void deposit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/deposit.jsp");
        dispatcher.forward(request, response);
    }

    private void getAllTranasaction(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Transaction> transactionList = transactionDAO.getAllTransaction();
        for (Transaction transaction : transactionList) {
            System.out.println(transaction.toString());
        }
        request.setAttribute("transactions", transactionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/transactions.jsp");
        dispatcher.forward(request, response);
    }

    private void getAllTranasactionApi(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Transaction> allTransactions = transactionDAO.getAllTransaction();
        for (Transaction transaction : allTransactions) {
            System.out.println(transaction.toString());
        }

        GsonBuilder builder = new GsonBuilder();
        builder.setPrettyPrinting();
        Gson gson = builder.create();
//        Account account = gson.fromJson(sb.toString(), Account.class);
//        System.out.println(account.toString());
        String jsonString = null;
        jsonString = gson.toJson(allTransactions);
        System.out.println(jsonString);
        ServletOutputStream out = response.getOutputStream();
        out.print(jsonString);

//        request.setAttribute("transactions", allTransactions);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/transactions.jsp");
//        dispatcher.forward(request, response);
    }
}
