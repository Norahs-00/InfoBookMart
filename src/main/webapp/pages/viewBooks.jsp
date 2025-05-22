<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>All Books</title>
</head>
<body>
  <h2>All Books</h2>
  <a href="${pageContext.request.contextPath}/pages/addBook.jsp">Add New Book</a>
  <table border="1">
    <tr>
      <th>ID</th><th>Title</th><th>Author</th><th>Language</th>
      <th>Year</th><th>ISBN</th><th>Quantity</th><th>Edition</th><th>Price</th><th>Actions</th>
    </tr>

    <c:forEach var="b" items="${bookList}">
      <tr>
        <td>${b.bookId}</td>
        <td>${b.title}</td>
        <td>${b.author}</td>
        <td>${b.language}</td>
        <td>${b.publishedYear}</td>
        <td>${b.isbn}</td>
        <td>${b.bookQuantity}</td>
        <td>${b.edition}</td>
        <td>${b.price}</td>
        <td>
          <a href="${pageContext.request.contextPath}/admin/book?action=edit&bookId=${b.bookId}">Edit</a> |
          <a href="${pageContext.request.contextPath}/admin/book?action=delete&bookId=${b.bookId}" onclick="return confirm('Delete?')">Delete</a>
        </td>
      </tr>
    </c:forEach>

    <c:if test="${empty bookList}">
      <tr><td colspan="10">No books found.</td></tr>
    </c:if>
  </table>
</body>
</html>