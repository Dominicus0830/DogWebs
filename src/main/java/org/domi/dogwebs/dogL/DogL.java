package org.domi.dogwebs.dogL;

public class DogL {
    private int dogID;
    private String dogTitle;
    private String userID;
    private String dogDate;
    private String dogContent;
    private int dogAvailable;

    //getters setters
    public int getDogID() {
        return dogID;
    }
    public void setDogID(int dogID) {
        this.dogID = dogID;
    }

    public String getDogTitle() {
        return dogTitle;
    }
    public void setDogTitle(String dogTitle) {
        this.dogTitle = dogTitle;
    }

    public String getUserID() {
        return userID;
    }
    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getDogDate() {
        return dogDate;
    }
    public void setDogDate(String dogDate) {
        this.dogDate = dogDate;
    }

    public String getDogContent() {
        return dogContent;
    }
    public void setDogContent(String dogContent) {
        this.dogContent = dogContent;
    }

    public int getDogAvailable() {
        return dogAvailable;
    }
    public void setDogAvailable(int dogAvailable) {
        this.dogAvailable = dogAvailable;
    }
}
