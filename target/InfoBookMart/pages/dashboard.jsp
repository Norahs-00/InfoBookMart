<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    com.infobookmart.model.User user = (com.infobookmart.model.User) session.getAttribute("currentUser");
    if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h1>Welcome Admin <%= user.getFirstName() %>!</h1>
</body>
</html>
