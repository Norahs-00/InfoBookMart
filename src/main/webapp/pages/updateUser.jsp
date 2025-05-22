<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.infobookmart.model.User" %>
<%
  User user = (User) request.getAttribute("u");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit User</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateUser.css"/>
</head>
<body>

<h2>Edit User</h2>

<form action="${pageContext.request.contextPath}/admin/user" method="post">
  <input type="hidden" name="action" value="update" />
  <input type="hidden" name="userId" value="<%= user.getUserId() %>" />

  Email: <input type="email" name="email" value="<%= user.getEmail() %>" required/><br/>
  First Name: <input type="text" name="firstName" value="<%= user.getFirstName() %>" required/><br/>
  Last Name: <input type="text" name="lastName" value="<%= user.getLastName() %>" required/><br/>
  Username: <input type="text" name="userName" value="<%= user.getUserName() %>" required/><br/>
  Password: <input type="text" name="password" value="<%= user.getPassword() %>" required/><br/>
  Role: <input type="text" name="role" value="<%= user.getRole() %>" required/><br/>
  Account Status: <input type="text" name="accountStatus" value="<%= user.getAccountStatus() %>" required/><br/>
  DOB: <input type="date" name="dateOfBirth" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(user.getDateOfBirth()) %>" required/><br/>
  Contact No: <input type="text" name="contactNo" value="<%= user.getContactNo() %>"/><br/>
  Gender: <input type="text" name="gender" value="<%= user.getGender() %>"/><br/>
  Address: <input type="text" name="address" value="<%= user.getAddress() %>"/><br/>

  <button type="submit">Update</button>
  <a href="${pageContext.request.contextPath}/admin/user?action=list">Cancel</a>
</form>

</body>
</html>