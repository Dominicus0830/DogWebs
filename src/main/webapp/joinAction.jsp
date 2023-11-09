<%--
  Created by IntelliJ IDEA.
  User: gagam
  Date: 2023-11-09
  Time: 오후 6:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="org.domi.dogwebs.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="org.domi.dogwebs.user.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userTelcom"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 폼안에 유기견</title>
</head>
<body>
<%
    String userID= null;
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }
    if(userID != null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어있습니다.')");
        script.println("location.href = 'main.jsp'");//이전(로그인) 페이지로 돌려보냄
        script.println("</script>");
    }
    if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
            || user.getUserTelcom() == null || user.getUserEmail() == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.')");
        script.println("history.back()");//이전(로그인) 페이지로 돌려보냄
        script.println("</script>");
    }
    else{
        UserDAO userDAO = new UserDAO();
        int result = userDAO.join(user);
        if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다.')");
            script.println("history.back()");//이전(로그인) 페이지로 돌려보냄
            script.println("</script>");
        }
        else{
            session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
    }

%>
</body>
</html>
