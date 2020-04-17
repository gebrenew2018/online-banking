package edu.miu.cs.cs472.DAO;

import edu.miu.cs.cs472.DatabaseConnection;
import edu.miu.cs.cs472.model.Account;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO {
    public AccountDAO() {
    }

    // Do all Crud stuff
    private Connection con;
    public  Account AddAccount(Account account) throws SQLException{
        try {
            con = DatabaseConnection.initializeDatabase();
            PreparedStatement st = con
                    .prepareStatement("insert into account values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            st.setString(1, null);
            st.setString(2, account.getFirstName());
            st.setString(3, account.getLastName());
            st.setString(4, account.getStreet());
            st.setString(5, account.getCity());
            st.setString(6, account.getState());
            st.setString(7, account.getZip());
            st.setString(8, account.getUserName());
            st.setString(9, account.getPassword());
            st.setString(10, account.getPhoneNumber());
            st.setString(11, account.getAccountType());
            st.setString(12, account.getEmail());
            st.setString(13, String.valueOf(Float.valueOf(account.getBalance())));
            st.setString(14, account.getRegistrationDate());
//
//             st.executeUpdate();
            System.out.println(st.executeUpdate());
            st.close();
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Data Successfully saved!");
        }
        return getAccountDetails(account.getUserName());
    }

    public List<Account> getAllAccounts()throws SQLException {
        List<Account> accountList = new ArrayList<>();
        try {
            con = DatabaseConnection.initializeDatabase();
            String sql = "SELECT * FROM account";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Account account = new Account();
                account.setAccountNumber(resultSet.getString("accountNumber"));
                account.setFirstName(resultSet.getString("firstName"));
                account.setLastName(resultSet.getString("lastName"));
                account.setStreet(resultSet.getString("street"));
                account.setCity(resultSet.getString("city"));
                account.setState(resultSet.getString("state"));
                account.setZip(resultSet.getString("zip"));
                account.setUserName(resultSet.getString("userName"));
                account.setPhoneNumber(resultSet.getString("phoneNumber"));
                account.setEmail(resultSet.getString("email"));
                account.setAccountType(resultSet.getString("accountType"));
                account.setBalance(resultSet.getFloat("balance"));
                account.setRegistrationDate(resultSet.getString("registrationDate"));
                accountList.add(account);
            }
            con.close();
            statement.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            System.out.println("finished");
        }
        return accountList;
    }
    public Account getAccountDetails(String userName){
        Account account = null;
        try {
            con = DatabaseConnection.initializeDatabase();
            String sql = "SELECT * FROM account where userName ='"+userName+"'";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                account = new Account();
                account.setAccountNumber(resultSet.getString("accountNumber"));
                account.setFirstName(resultSet.getString("firstName"));
                account.setLastName(resultSet.getString("lastName"));
                account.setStreet(resultSet.getString("street"));
                account.setCity(resultSet.getString("city"));
                account.setState(resultSet.getString("state"));
                account.setZip(resultSet.getString("zip"));
                account.setUserName(resultSet.getString("userName"));
                account.setPhoneNumber(resultSet.getString("phoneNumber"));
                account.setEmail(resultSet.getString("email"));
                account.setAccountType(resultSet.getString("accountType"));
                account.setBalance(resultSet.getFloat("balance"));
                account.setRegistrationDate(resultSet.getString("registrationDate"));
            }
            con.close();
            statement.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            System.out.println("finished");
        }
        return account;
    }
    public Account getAccountDetail(String accountNumber){
        Account account = new Account();
        try {
            con = DatabaseConnection.initializeDatabase();
            String sql = "SELECT * FROM account where accountNumber ='"+accountNumber+"'";
            Statement st = con.createStatement();
            ResultSet resultSet = st.executeQuery(sql);
            while (resultSet.next()) {
                account = new Account();
                account.setAccountNumber(resultSet.getString("accountNumber"));
                account.setFirstName(resultSet.getString("firstName"));
                account.setLastName(resultSet.getString("lastName"));
                account.setStreet(resultSet.getString("street"));
                account.setCity(resultSet.getString("city"));
                account.setState(resultSet.getString("state"));
                account.setZip(resultSet.getString("zip"));
                account.setUserName(resultSet.getString("userName"));
                account.setPhoneNumber(resultSet.getString("phoneNumber"));
                account.setEmail(resultSet.getString("email"));
                account.setAccountType(resultSet.getString("accountType"));
                account.setBalance(resultSet.getFloat("balance"));
                account.setRegistrationDate(resultSet.getString("registrationDate"));
            }
            con.close();
            st.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            System.out.println("finished");
        }
        return account;
    }
    public boolean updateBalance(String amount, String accountNumber,String transType) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE account SET balance = ? WHERE accountNumber = ?";
        Account account = getAccountDetail(accountNumber);
        float baseBalance = account.getBalance();
        float updated=0.00f;
        if(transType.equals("Deposit")){
            updated= baseBalance + Float.valueOf(amount);
        }
        else{
            updated= baseBalance - Float.valueOf(amount);
        }
        con = DatabaseConnection.initializeDatabase();
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, String.valueOf(updated));
        stmt.setString(2, accountNumber);
        boolean rowUpdated = stmt.executeUpdate() > 0;
        stmt.close();
        con.close();
        return rowUpdated;
    }
}
