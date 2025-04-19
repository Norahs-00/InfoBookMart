<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<!DOCTYPE html>
<html>
<head>
    <title>Login - InfoBookMart</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Your external style.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="container login-container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card">
                <h3 class="text-center mb-4">Login to Your Account</h3>
                <form action="${pageContext.request.contextPath}/LogInController" method="post">
                    <div class="mb-3">
                        <label for="login_garda_deko_email" class="form-label">Email</label>
                        <input type="email" name="login_garda_deko_email" class="form-control" id="login_garda_deko_email" required>
                    </div>
                    <div class="mb-3">
                        <label for="login_garda_deko_password" class="form-label">Password</label>
                        <input type="password" name="login_garda_deko_password" class="form-control" id="login_garda_deko_password" required>
                    </div>

                    <%-- Show error message if login fails --%>
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%= errorMessage %>
                    </div>
                    <%
                        }
                    %>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
                <p class="mt-3 text-center">
                    Don't have an account? <a href="#">Sign up</a>
                </p>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS CDN (Optional if needed for features) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>  