<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Update Book</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css"/>
</head>
<body>

<h2>Update Book</h2>

<form action="${pageContext.request.contextPath}/admin/book" method="post" enctype="multipart/form-data">
  <input type="hidden" name="action" value="update" />
  <input type="hidden" name="id" value="${book.id}" />

  Title: <input type="text" name="title" value="${book.title}" required/><br/>

  Author: <input type="text" name="author" value="${book.author}" required/><br/>

  Description: <textarea name="description" rows="4" cols="50" required>${book.description}</textarea><br/>

  Genre: 
  <select name="genreName" required>
      <option value="">-- Select Genre --</option>
      <option value="Fiction" <c:if test="${book.genre eq 'Fiction'}">selected</c:if>>Fiction</option>
      <option value="Non-Fiction" <c:if test="${book.genre eq 'Non-Fiction'}">selected</c:if>>Non-Fiction</option>
      <option value="Mystery" <c:if test="${book.genre eq 'Mystery'}">selected</c:if>>Mystery</option>
      <option value="Sci-Fi" <c:if test="${book.genre eq 'Sci-Fi'}">selected</c:if>>Sci-Fi</option>
      <option value="Biography" <c:if test="${book.genre eq 'Biography'}">selected</c:if>>Biography</option>
      <option value="Fantasy" <c:if test="${book.genre eq 'Fantasy'}">selected</c:if>>Fantasy</option>
  </select><br/>

  Price: <input type="number" name="price" step="0.01" value="${book.price}" required/><br/>

  Year Published: <input type="date" name="publishedYear" value="${book.publishedYear}" required/><br/>

  Current Book Cover: 
  <img src="${pageContext.request.contextPath}/images/${book.bookImage}" width="100" alt="Book Cover"/><br/>

  Update Book Cover Image: <input type="file" name="bookImage" accept="image/*"/><br/>

  Stock Quantity: <input type="number" name="quantity" value="${book.quantity}" required/><br/>

  <button type="submit">Update</button>
  <a href="${pageContext.request.contextPath}/admin/book?action=list">Cancel</a>
</form>

</body>
</html>