<%@ page import="com.infobookmart.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null || !"CUSTOMER".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head><title>Customer Home</title></head>
<body>
    <h1>Welcome, <%= user.getFirstName() %>!</h1>
    <p>This is your customer home page.</p>
    <a href="${pageContext.request.contextPath}/LogoutController">Logout</a>
</body>
</html>
