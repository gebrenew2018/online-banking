package edu.miu.cs.cs472.utility;

public class FormValidator {
    public static boolean AccountFormValidator(String firstName, String lastName,
                                               String street, String city, String state,
                                               String zip, String userName, String password,
                                               String accountType, float balance) {

        if (firstName.equals("") || lastName.equals("") ||
                street.equals("") || city.equals("") ||
                state.equals("") || zip.equals("") ||
                userName.equals("") || password.equals("") ||
                accountType.equals("") || balance == 0.00) {
            return false;
        }
        return true;
    }
}
