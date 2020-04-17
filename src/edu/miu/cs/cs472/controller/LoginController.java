package edu.miu.cs.cs472.controller;

import com.sun.tools.jconsole.JConsoleContext;
import edu.miu.cs.cs472.DatabaseConnection;
import edu.miu.cs.cs472.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginController", urlPatterns = "/login")
public class LoginController extends HttpServlet {
    private Connection con;
    HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", "");
        String action = request.getServletPath();
        System.out.println(action);
        try {
            switch (action) {
                case "/login":
                    loginUser(request, response);
                    break;
                default:
                    asDefault(request, response);
                    break;
            }

        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }


    private void asDefault(HttpServletRequest request, HttpServletResponse response) {
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) {
        session = request.getSession(true);
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        try {
            con = DatabaseConnection.initializeDatabase();
            Account account = null;
            String sql = "SELECT * FROM account WHERE userName = ? and password = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, userName);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            System.out.println(resultSet.toString());
            while (resultSet.next()) {
                account = new Account();
                account.setUserName(resultSet.getString("userName"));
                account.setAccountNumber(resultSet.getString("accountNumber"));
                account.setFirstName(resultSet.getString("firstName"));
                account.setLastName(resultSet.getString("lastName"));
                account.setStreet(resultSet.getString("street"));
                account.setCity(resultSet.getString("city"));
                account.setState(resultSet.getString("state"));
                account.setZip(resultSet.getString("zip"));
                account.setPhoneNumber(resultSet.getString("phoneNumber"));
                account.setEmail(resultSet.getString("email"));
                account.setAccountType(resultSet.getString("accountType"));
                account.setRegistrationDate(resultSet.getString("registrationDate"));
            }
            if (account == null) {
                System.out.println("Login Not Successful. Please Try Again.");
                request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\"> Login Not Successful. Please Try Again. </div>");
                request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
            } else {
                resultSet.close();
                System.out.println("Login Successful.");
                System.out.println(account.toString());
                session.setAttribute("account", account);
                request.getRequestDispatcher("/WEB-INF/view/customer/index.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            System.out.println("finished");
        }
    }


}
