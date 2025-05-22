<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add New User</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addUser.css"/>
</head>
<body>

<h2>Add New User</h2>

<form action="${pageContext.request.contextPath}/admin/user" method="post">
  <input type="hidden" name="action" value="add" />

  <div class="form-group">
    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required/>
  </div>

  <div class="form-group">
    <label for="firstName">First Name:</label>
    <input type="text" name="firstName" id="firstName" required/>
  </div>

  <div class="form-group">
    <label for="lastName">Last Name:</label>
    <input type="text" name="lastName" id="lastName" required/>
  </div>

  <div class="form-group">
    <label for="userName">Username:</label>
    <input type="text" name="userName" id="userName" required/>
  </div>

  <div class="form-group">
    <label for="password">Password:</label>
    <input type="password" name="password" id="password" required/>
  </div>

  <div class="form-group">
    <label for="role">Role:</label>
    <input type="text" name="role" id="role" value="user" required/>
  </div>

  <div class="form-group">
    <label for="accountStatus">Account Status:</label>
    <input type="text" name="accountStatus" id="accountStatus" value="active" required/>
  </div>

  <div class="form-group">
    <label for="dateOfBirth">DOB:</label>
    <input type="date" name="dateOfBirth" id="dateOfBirth" required/>
  </div>

  <div class="form-group">
    <label for="contactNo">Contact No:</label>
    <input type="text" name="contactNo" id="contactNo"/>
  </div>

  <div class="form-group">
    <label for="gender">Gender:</label>
    <input type="text" name="gender" id="gender"/>
  </div>

  <div class="form-group">
    <label for="address">Address:</label>
    <input type="text" name="address" id="address"/>
  </div>

  <div class="form-buttons">
    <button type="submit">Save</button>
    <a href="${pageContext.request.contextPath}/admin/user?action=list">Cancel</a>
  </div>
</form>

</body>
</html>