<%--
  Created by IntelliJ IDEA.
  User: gagam
  Date: 2023-11-09
  Time: 오후 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="org.domi.dogwebs.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>내 폼안에 유기견</title>
</head>
<body>
<%
  session.invalidate();
%>
<script>
  location.href = 'main.jsp';
</script>
</body>
</html>
