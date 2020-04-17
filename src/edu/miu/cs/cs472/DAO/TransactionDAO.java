package edu.miu.cs.cs472.DAO;

import edu.miu.cs.cs472.DatabaseConnection;
import edu.miu.cs.cs472.model.Account;
import edu.miu.cs.cs472.model.Transaction;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
    public TransactionDAO() {
    }
    private Connection con;

    public List<Transaction> getAllTransaction() throws SQLException{
        List<Transaction> transactionList = new ArrayList<>();
        try {
            con = DatabaseConnection.initializeDatabase();
            String sql = "SELECT * FROM transaction";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(resultSet.getInt("transactionId"));
                transaction.setOwnerAccount(resultSet.getString("ownerAccount"));
                transaction.setTransactionType(resultSet.getString("transactionType"));
                transaction.setTargetAccount(resultSet.getString("targetAccount"));
                transaction.setAmount(resultSet.getString("amount"));
                transaction.setUser(resultSet.getString("user"));
                transaction.setTransactionDate(resultSet.getString("transactionDate"));
                transactionList.add(transaction);
            }
            con.close();
            statement.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            System.out.println("success");
        }
        return transactionList;
    }
    public boolean addTransaction(Transaction transaction){
        try {
            con = DatabaseConnection.initializeDatabase();
            PreparedStatement st = con
                    .prepareStatement("insert into transaction values(?,?,?,?,?,?,?)");
            st.setString(1, null);
            st.setString(2, transaction.getOwnerAccount());
            st.setString(3, transaction.getTransactionType());
            st.setString(4, transaction.getTargetAccount());
            st.setString(5, transaction.getAmount());
            st.setString(6, transaction.getUser());
            st.setString(7, transaction.getTransactionDate());
            st.executeUpdate();
            st.close();
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Data Successfully saved!");
        }
        return true;
    }


    public List<Transaction> getTransaction(String accountNumber) {
        List<Transaction> transactionList = new ArrayList<>();
        try {
            con = DatabaseConnection.initializeDatabase();
            String sql = "SELECT * FROM transaction where ownerAccount ='"+accountNumber+"' or targetAccount  ='"+accountNumber+"' order by transactionDate desc";
            System.out.println(sql);
            Statement stmt = con.createStatement();
            ResultSet resultSet = stmt.executeQuery(sql);
            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(resultSet.getInt("transactionId"));
                transaction.setOwnerAccount(resultSet.getString("ownerAccount"));
                transaction.setTransactionType(resultSet.getString("transactionType"));
                transaction.setTargetAccount(resultSet.getString("targetAccount"));
                transaction.setAmount(resultSet.getString("amount"));
                transaction.setUser(resultSet.getString("user"));
                transaction.setTransactionDate(resultSet.getString("transactionDate"));
                transactionList.add(transaction);
            }
            con.close();
            stmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            System.out.println("finished");
        }
        return transactionList;
    }
}
