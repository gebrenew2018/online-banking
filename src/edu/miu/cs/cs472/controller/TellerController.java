package edu.miu.cs.cs472.controller;

import edu.miu.cs.cs472.DatabaseConnection;
import edu.miu.cs.cs472.model.Account;
import edu.miu.cs.cs472.model.User;

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

@WebServlet(name = "TellerController",urlPatterns = {"/teller","/teller/login"})
public class TellerController extends HttpServlet {
    private Connection con;
    HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message","");
        String action = request.getServletPath();
        System.out.println(action);
        try {
            switch (action) {
                case "/teller":
                    displayLogin(request, response);
                    break;
                case "/teller/login":
                    tellerLogin(request, response);
                    break;
                default:
                    asDefault(request, response);
                    break;
            }

        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void asDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/teller/index.jsp").forward(request, response);
    }

    private void tellerLogin(HttpServletRequest request, HttpServletResponse response) {
        session = request.getSession(true);
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        try {
            con = DatabaseConnection.initializeDatabase();
            User user = null;
            String sql = "SELECT * FROM users WHERE userName = ? and password = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, userName);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            System.out.println(resultSet.toString());
            while (resultSet.next()) {
                user = new User();
                user.setUserName(resultSet.getString("userName"));
            }
            if (user == null) {
                System.out.println("Login Not Successful. Please Try Again.");
                request.setAttribute("message","<div class=\"alert alert-danger\" role=\"alert\"> Login Not Successful. Please Try Again. </div>");
                request.getRequestDispatcher("/WEB-INF/view/teller/index.jsp").forward(request, response);
            } else {
                resultSet.close();
                System.out.println("Login Successful.");
                request.setAttribute("user",user.getUserName());
                session.setAttribute("user",user.getUserName());
//                response.sendRedirect("/minibank/account");
                request.getRequestDispatcher("/WEB-INF/view/teller/home.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            System.out.println("finished");
        }
    }

    private void displayLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/teller/index.jsp").forward(request, response);
    }
}
