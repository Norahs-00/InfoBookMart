<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>Manage Books – InfoBookMart</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminheader.css"/>
  <!-- For manageBooks.jsp -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageBooks.css"/>
</head>
<body>

  <%@ include file="/pages/adminheader.jsp" %>

  <div class="sidebar">
    <ul>
      <li><a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Dashboard</a></li>
      <li class="active"><a href="${pageContext.request.contextPath}/admin/book?action=list">Manage Books</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/user?action=list">Manage Users</a></li>
	  <li><a href="${pageContext.request.contextPath}/manageOrders">Manage Orders</a></li>
    </ul>
  </div>

  <div class="main-content">
    <div class="header-bar">
      <h2>Manage Books</h2>
      <a class="add-book" href="${pageContext.request.contextPath}/pages/addBook.jsp">+ Add New Book</a>
    </div>

    <!-- Book Table -->
    <table class="book-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Title</th>
          <th>Author</th>
          <th>Quantity</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="b" items="${bookList}">
          <tr>
            <td>${b.bookId}</td>
            <td>${b.title}</td>
            <td>${b.author}</td>
            <td>${b.bookQuantity}</td>
            
            <td class="actions-col">
              <a class="edit-btn" href="${pageContext.request.contextPath}/admin/book?action=edit&bookId=${b.bookId}">Edit</a>
              <a class="delete-btn" href="${pageContext.request.contextPath}/admin/book?action=delete&bookId=${b.bookId}" onclick="return confirm('Delete this book?');">Delete</a>
            </td>
            
          </tr>
        </c:forEach>
        <c:if test="${empty bookList}">
          <tr><td colspan="5">No books found.</td></tr>
        </c:if>
      </tbody>
    </table>
  </div>
</body>
</html>