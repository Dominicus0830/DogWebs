package org.domi.dogwebs.user;

public class User {
    private String userID;
    private String userPassword;
    private String userName;
    private String userTelcom;
    private String userEmail;

    //getter setter
    public String getUserID() {
        return userID;
    }
    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserPassword() {
        return userPassword;
    }
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserTelcom() {
        return userTelcom;
    }
    public void setUserTelcom(String userTelcom) {
        this.userTelcom = userTelcom;
    }

    public String getUserEmail() {
        return userEmail;
    }
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
