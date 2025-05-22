<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>All Users</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminheader.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageUser.css"/>
</head>
<body>

<%@ include file="/pages/adminheader.jsp" %>

<div class="sidebar">
  <ul>
    <li><a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Dashboard</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/book?action=list">Manage Books</a></li>
    <li class="active"><a href="${pageContext.request.contextPath}/admin/user?action=list">Manage Users</a></li>
    <li><a href="${pageContext.request.contextPath}/manageOrders">Manage Orders</a></li>
  </ul>
</div>

<div class="main-content">
  <div class="table-header">
    <h2>All Users</h2>
    <a href="${pageContext.request.contextPath}/pages/addUser.jsp" class="add-btn">+ Add User</a>
  </div>

  <div class="content-table">
    <table border="1">
      <thead>
        <tr>
          <th>ID</th><th>Name</th><th>Email</th><th>Username</th><th>Role</th><th>Status</th><th>Registered</th><th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="u" items="${userList}">
          <tr>
            <td>${u.userId}</td>
            <td>${u.firstName} ${u.lastName}</td>
            <td>${u.email}</td>
            <td>${u.userName}</td>
            <td>${u.role}</td>
            <td>${u.accountStatus}</td>
            <td>${u.registerDate}</td>
            <td>
              <a class="btn green" href="${pageContext.request.contextPath}/admin/user?action=edit&userId=${u.userId}">Edit</a>
              <a class="btn red" href="${pageContext.request.contextPath}/admin/user?action=delete&userId=${u.userId}" onclick="return confirm('Delete this user?');">Delete</a>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty userList}">
          <tr><td colspan="8">No users found.</td></tr>
        </c:if>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>