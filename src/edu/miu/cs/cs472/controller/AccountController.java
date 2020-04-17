package edu.miu.cs.cs472.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import edu.miu.cs.cs472.DAO.AccountDAO;
import edu.miu.cs.cs472.DatabaseConnection;
import edu.miu.cs.cs472.model.Account;
import edu.miu.cs.cs472.utility.FormValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;
import java.sql.*;
import java.util.Date;

@WebServlet(name = "NewAccountCreationServlet", urlPatterns = {"/account", "/accounts",
        "/account/new", "/account/add","/account/detail"})
public class AccountController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message","");
        String action = request.getServletPath();
        System.out.println(action);
        try {
            switch (action) {
                case "/account/new":
                    showNewForm(request, response);
                    break;
                case "/account/add":
                    addNewAccount(request, response);
                    break;
                case "/account/detail":
                    getAccountDetail(request, response);
                    break;
                case "/account/delete":
//                    deleteAccount(request, response);
                    break;
                case "/account/edit":
//                    showEditForm(request, response);
                    break;
                case "/account/update":
//                    updateAccount(request, response);
                    break;
                default:
                    accountLlist(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }

    private void getAccountDetail(HttpServletRequest request, HttpServletResponse response) {
        String accountNumber = request.getParameter("accountNumber");
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/new-account.jsp");
        dispatcher.forward(request, response);
    }

    private void accountLlist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Account> accountList = accountDAO.getAllAccounts();
        for (Account account : accountList) {
            System.out.println(account.toString());
        }
        request.setAttribute("accounts", accountList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/account-list.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String userName = "";
        String password = "";
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String accountType = request.getParameter("accountType");
        String balance = request.getParameter("balance");
        // format the current date
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        String registrationDate = df.format(new Date());
        //populate username and password
        Random rand = new Random();
        int random_num = 100 + rand.nextInt(999);
        userName = firstName.substring(0, 3) + lastName.substring(0, 2) + random_num;
        System.out.println(userName);
        int randomnum = 100 + rand.nextInt(999);
        password = lastName.substring(0, 2) + firstName.substring(0, 3) + randomnum;
        System.out.println(password);
        boolean validateForm = FormValidator.AccountFormValidator(
                firstName, lastName,
                street, city, state,
                zip, userName, password,
                accountType, Float.valueOf(balance));
       Account newAccount =null;
        if (validateForm) {
            Account account = new Account( firstName,
                    lastName, street, city, state, zip, userName, password, phoneNumber,
                    email, accountType, registrationDate, Float.valueOf(balance));
            newAccount = accountDAO.AddAccount(account);
        } else {
            System.out.println("Fill the missing required fields.");
            request.setAttribute("message","<div class=\"alert alert-danger\" role=\"alert\"> Target Account Not Found! </div>");
        }
        System.out.println("New Added Account is:"+ newAccount.toString());
        List<Account> accountList = accountDAO.getAllAccounts();
        request.setAttribute("accounts", accountList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/teller/account-list.jsp");
        dispatcher.forward(request, response);
    }
}
