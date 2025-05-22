<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login – InfoBookMart</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS (for grid & button base) -->
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    rel="stylesheet">
  <!-- Your custom CSS -->
  <link
    rel="stylesheet"
    href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
  <div class="login-card">
    <h2>Login to Your Account</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input
          type="email"
          id="email"
          name="login_garda_deko_email"
          class="form-control"
          required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input
          type="password"
          id="password"
          name="login_garda_deko_password"
          class="form-control"
          required>
      </div>

      <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="alert alert-danger mt-2">
          <%= request.getAttribute("errorMessage") %>
        </div>
      <% } %>

      <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
    <p class="signup-text">
      Don’t have an account?
      <a href="${pageContext.request.contextPath}/register">Sign up</a>
    </p>
  </div>
</body>
</html>