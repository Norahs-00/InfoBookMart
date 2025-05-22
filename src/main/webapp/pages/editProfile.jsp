<%@ page import="com.infobookmart.model.User" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin: 3rem auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #28a745;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: 600;
            margin-top: 1rem;
            color: #333;
        }
        input, select {
            padding: 0.5rem;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-top: 0.5rem;
        }
        button {
            margin-top: 2rem;
            padding: 0.75rem;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Profile</h2>
    <form action="<%= request.getContextPath() %>/UpdateProfileServlet" method="post" enctype="multipart/form-data">

        <label>First Name</label>
        <input type="text" name="firstName" value="<%= user.getFirstName() %>" required>

        <label>Last Name</label>
        <input type="text" name="lastName" value="<%= user.getLastName() %>" required>

        <label>Username</label>
        <input type="text" name="userName" value="<%= user.getUserName() %>" required>

        <label>Email</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required>

        <label>Date of Birth</label>
        <input type="date" name="dob" value="<%= user.getDateOfBirth() %>" required>

        <label>Contact Number</label>
        <input type="text" name="contactNo" value="<%= user.getContactNo() %>" required>

        <label>Gender</label>
        <select name="gender" required>
            <option value="male" <%= "male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
            <option value="female" <%= "female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
            <option value="other" <%= "other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
        </select>

        <label>Address</label>
        <input type="text" name="address" value="<%= user.getAddress() %>" required>

        <label>Profile Image</label>
        <input type="file" name="profileImg">

        <button type="submit">Update Profile</button>
    </form>
</div>
</body>
</html>