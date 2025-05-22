<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.infobookmart.model.User" %>
<%
    // Session validation: Allow only customers
    User user = (User) session.getAttribute("currentUser");
    if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>Admin Dashboard – InfoBookMart</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminheader.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css"/>
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  
</head>
<body>
  <%@ include file="/pages/adminheader.jsp" %>

  <div class="sidebar">
    <ul>
      <li class="active"><a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Dashboard</a></li>
      <li><a href="manageBooks.jsp">Manage Books</a></li>
      <li><a href="manageUsers.jsp">Manage Users</a></li>
      <li><a href="${pageContext.request.contextPath}/manageOrders">Manage Orders</a></li>
    </ul>
  </div>

  <div class="main-content">
    <div class="header-bar">
      <h2>Admin Dashboard</h2>
    </div>

    <div class="summary">
      <div class="card">
      	<i class="fas fa-book icon" style="color: #2487e9;"></i>
        <h3>Total Books</h3>
        <p>1,248</p>
      </div>
      <div class="card">
      	<i class="fas fa-check-circle icon" style="color: #2ac71b;"></i>
        <h3>Available Books</h3>
        <p>1,186</p>
      </div>
      <div class="card">
      	<i class="fas fa-users icon" style="color: #b05dde;"></i>
        <h3>Registered Users</h3>
        <p>245</p>
      </div>
    </div>

    <div class="dashboard-grid">
      <div class="activities">
        <h3>Recent Activities</h3>
        <ul>
          <li><span>Today, 2:30 PM</span><br/>
            <strong>New Book Added:</strong> Admin added 'The Silent Patient'</li>
          <li><span>Today, 12:15 PM</span><br/>
            <strong>User Registration:</strong> New user 'Sarah Johnson'</li>
          <li><span>Yesterday, 4:45 PM</span><br/>
            <strong>Book Updated:</strong> 'To Kill a Mockingbird'</li>
          <li><span>Yesterday, 11:20 AM</span><br/>
            <strong>Low Stock Alert:</strong> 'The Great Gatsby' (2 left)</li>
        </ul>
      </div>

      <div class="popular-books">
        <h3>Popular Books</h3>
        <ul>
          <li><strong>To Kill a Mockingbird</strong><br/>Harper Lee – 42 borrows</li>
          <li><strong>1984</strong><br/>George Orwell – 38 borrows</li>
          <li><strong>The Great Gatsby</strong><br/>F. Scott Fitzgerald – 35 borrows</li>
          <li><strong>Pride and Prejudice</strong><br/>Jane Austen – 31 borrows</li>
        </ul>
      </div>
    </div>
  </div>
</body>
</html>