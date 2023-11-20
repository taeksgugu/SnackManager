<%--
  Created by IntelliJ IDEA.
  User: seonghwan
  Date: 11/17/23
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.service.spring.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Member member = (Member) session.getAttribute("loginUser");
	String userName = member.getName();
	
    String pageTitle = request.getParameter("pageTitle");
    if (pageTitle == null || pageTitle.isEmpty()) {
        pageTitle = "간식관리시스템";
    }
%>
<html>
<head>
     <title><%= pageTitle %></title>
</head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<body>

<h1 style = "text-align : center;"><%= pageTitle %></h1>
<div style = "display: flex; justify-content : flex-end; ">
    <div style="margin-right: 10px; display:flex; justify-content : center; align-items: center; "><%= userName %> 님</div>
    <button class = "btn btn-outline-info" style="margin-right: 10px;">마이페이지</button>
    <button class = "btn btn-outline-danger" style="margin-right: 10px;">로그아웃</button>
</div>
<hr>

</body>
</html>
