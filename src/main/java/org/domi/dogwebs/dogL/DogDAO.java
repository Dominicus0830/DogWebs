package org.domi.dogwebs.dogL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DogDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public DogDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/domi";
            String dbID = "root";
            String dbPassword = "4308";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getDate(){
        String SQL = "SELECT NOW()";
        try{
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return ""; //데이터베이스 오류
    }
    public int getNext(){
        String SQL = "SELECT dogID FROM dogL ORDER BY dogID DESC";
        try{
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return rs.getInt(1) + 1;
            }
            return 1; //첫 번째 게시물인 경우
        }catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }

    public int write(String dogTitle, String userID, String dogContent){
        String SQL = "INSERT INTO dogL VALUES (?,?,?,?,?,?)";
        try{
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, dogTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, dogContent);
            pstmt.setInt(6, 1);
            return pstmt.executeUpdate();
    }catch (Exception e) {
        e.printStackTrace();
    }
        return -1; //데이터베이스 오류
    }
}
