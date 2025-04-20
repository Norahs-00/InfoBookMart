<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - InfoBookMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Login to Your Account</h2>
    <form action="${pageContext.request.contextPath}/LoginController" method="post">
        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="login_garda_deko_email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="login_garda_deko_password" class="form-control" required>
        </div>

        <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="alert alert-danger mt-2"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>

    <p class="mt-3 text-center">
        Don't have an account? <a href="register.jsp">Sign Up</a>
    </p>
</div>

</body>
</html>
