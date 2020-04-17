package edu.miu.cs.cs472.model;

import java.time.LocalDate;

public class Transaction {
    private int transactionId;
    private String ownerAccount;
    private String transactionType;
    private String targetAccount;
    private String amount;
    private String user;
    private String transactionDate;

    public Transaction() {
    }

    public Transaction(int transactionId, String ownerAccount, String transactionType,
                       String targetAccount, String amount, String user, String  transactionDate) {
        this.transactionId = transactionId;
        this.ownerAccount = ownerAccount;
        this.transactionType = transactionType;
        this.targetAccount = targetAccount;
        this.amount = amount;
        this.user = user;
        this.transactionDate = transactionDate;
    }

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public String getOwnerAccount() {
        return ownerAccount;
    }

    public void setOwnerAccount(String ownerAccount) {
        this.ownerAccount = ownerAccount;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getTargetAccount() {
        return targetAccount;
    }

    public void setTargetAccount(String targetAccount) {
        this.targetAccount = targetAccount;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(String transactionDate) {
        this.transactionDate = transactionDate;
    }

    @Override
    public String toString() {
        return "Transaction{" +
                "transactionId=" + transactionId +
                ", ownerAccount='" + ownerAccount + '\'' +
                ", transactionType='" + transactionType + '\'' +
                ", targetAccount='" + targetAccount + '\'' +
                ", amount='" + amount + '\'' +
                ", user='" + user + '\'' +
                ", transactionDate=" + transactionDate +
                '}';
    }
}
