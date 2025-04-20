<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register | InfoBookMart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/register.css">
</head>
<body>

<div class="container py-5">
    <div class="register-container shadow">
        
        <!-- FORM ON LEFT -->
        <div class="form-section">
            <h3>Create Your Account</h3>
            <form action="RegisterController" method="POST" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" name="firstName" id="firstName" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" name="lastName" id="lastName" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">E-mail</label>
                    <input type="email" name="email" id="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="userName" class="form-label">Username</label>
                    <input type="text" name="userName" id="userName" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="contactNo" class="form-label">Contact Number</label>
                    <input type="text" name="contactNo" id="contactNo" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" name="address" id="address" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="gender" class="form-label">Gender</label>
                    <select class="form-select" name="gender" id="gender" required>
                        <option value="">-- Select Gender --</option>
                        <option value="Female">Female</option>
                        <option value="Male">Male</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="dateOfBirth" class="form-label">Date of Birth</label>
                    <input type="date" name="dateOfBirth" id="dateOfBirth" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="profileImg" class="form-label">Profile Image</label>
                    <input type="file" name="profileImg" id="profileImg" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn submit-btn">Register</button>
                </div>

                <div class="mt-3 text-center">
                    Already have an account? <a href="Login.jsp">Login here</a>
                </div>
            </form>
        </div>

       <!-- IMAGE ON RIGHT -->
<div class="image-section d-none d-md-block" style="background-image: url('<%=request.getContextPath()%>/asset/images/register.png'); background-size: cover; background-position: center;"></div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>  