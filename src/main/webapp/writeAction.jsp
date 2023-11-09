<%--
  Created by IntelliJ IDEA.
  User: gagam
  Date: 2023-11-10
  Time: 오전 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="org.domi.dogwebs.dogL.DogDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dog" class="org.domi.dogwebs.dogL.DogL" scope="page" />
<jsp:setProperty name="dog" property="dogTitle"/>
<jsp:setProperty name="dog" property="dogContent"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>[로고]</title>
</head>
<body>
<%
    String userID= null;
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }
    if(userID == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요')");
        script.println("location.href = 'login.jsp'");//이전(로그인) 페이지로 돌려보냄
        script.println("</script>");
    }else{
        if(dog.getDogTitle() == null || dog.getDogContent() == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다.')");
            script.println("history.back()");//이전(로그인) 페이지로 돌려보냄
            script.println("</script>");
        }
        else{
            DogDAO dogDAO = new DogDAO();
            int result = dogDAO.write(dog.getDogTitle(), userID, dog.getDogContent());
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글쓰기에 실패했습니다.')");
                script.println("history.back()");//이전(로그인) 페이지로 돌려보냄
                script.println("</script>");
            }
            else{
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'dog.jsp'");
                script.println("</script>");
            }
        }
    }
%>
</body>
</html>
