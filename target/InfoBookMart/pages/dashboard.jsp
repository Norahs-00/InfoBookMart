<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    com.infobookmart.model.User user = (com.infobookmart.model.User) session.getAttribute("currentUser");
    if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | InfoBookMart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Dashboard CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/dashboard.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
    <a class="navbar-brand" href="#">InfoBookMart Admin</a>
    <div class="ms-auto">
        <span class="navbar-text text-white me-3">Hi, <%= user.getFirstName() %>!</span>
        <a href="<%= request.getContextPath() %>/LogoutController" class="btn btn-outline-light btn-sm">Logout</a>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4">Admin Dashboard</h2>

    <div class="row g-4">
        <!-- Books -->
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Books</h5>
                    <p class="card-text">Manage all books here.</p>
                    <a href="manageBooks.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
        </div>

        <!-- Orders -->
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Orders</h5>
                    <p class="card-text">View and manage orders.</p>
                    <a href="orders.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
        </div>

        <!-- Customers -->
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Customers</h5>
                    <p class="card-text">Customer details and profiles.</p>
                    <a href="customers.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
        </div>

        <!-- Sales -->
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Sales</h5>
                    <p class="card-text">Track book sales.</p>
                    <a href="sales.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
        </div>

        <!-- Profile -->
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Profile</h5>
                    <p class="card-text">Update your admin profile.</p>
                    <a href="updateAdmin.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
