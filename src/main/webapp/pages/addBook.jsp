<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Add New Book</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addBook.css">
</head>
<body>
  <h2>Add New Book</h2>
  <form action="${pageContext.request.contextPath}/admin/book" method="post">
    <input type="hidden" name="action" value="insert"/>

    <div class="form-group">
      <label for="title">Title:</label>
      <input type="text" name="title" id="title" required/>
    </div>

    <div class="form-group">
      <label for="author">Author:</label>
      <input type="text" name="author" id="author" required/>
    </div>

    <div class="form-group">
      <label for="language">Language:</label>
      <input type="text" name="language" id="language" required/>
    </div>

    <div class="form-group">
      <label for="publishedYear">Published Year:</label>
      <input type="number" name="publishedYear" id="publishedYear" min="0"/>
    </div>

    <div class="form-group">
      <label for="isbn">ISBN:</label>
      <input type="text" name="isbn" id="isbn"/>
    </div>

    <div class="form-group">
      <label for="bookQuantity">Quantity:</label>
      <input type="number" name="bookQuantity" id="bookQuantity" min="0"/>
    </div>

    <div class="form-group">
      <label for="bookImage">Image URL:</label>
      <input type="text" name="bookImage" id="bookImage"/>
    </div>

    <div class="form-group">
      <label for="edition">Edition:</label>
      <input type="text" name="edition" id="edition"/>
    </div>

    <div class="form-group">
      <label for="genreId">Genre ID:</label>
      <input type="number" name="genreId" id="genreId" min="0"/>
    </div>

    <div class="form-group">
      <label for="description">Description:</label>
      <textarea name="description" id="description" rows="4" cols="50"></textarea>
    </div>

    <div class="form-group">
      <label for="price">Price:</label>
      <input type="number" name="price" id="price" step="0.01" min="0"/>
    </div>

    <div class="form-buttons">
      <button type="submit">Save</button>
      <a href="${pageContext.request.contextPath}/admin/book">Cancel</a>
    </div>
  </form>
</body>
</html>