<%@ page import="com.infobookmart.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*, com.infobookmart.controller.dao.BookDAO" %>
<%@ page import="com.infobookmart.model.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Books</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/books.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/popupAlert.css"/>

</head>

<body>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <div id="customPopup" class="popup">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup()">&times;</span>
            <p><%= message %></p>
        </div>
    </div>
    <script>
      window.onload = function () {
        const popup = document.getElementById('customPopup');
        popup.style.display = 'block';
        setTimeout(() => {
          popup.style.display = 'none';
        }, 3000);
      };

      function closePopup() {
        document.getElementById('customPopup').style.display = 'none';
      }
    </script>
<%
        session.removeAttribute("message");
    }
%>

<!-- Navigation Bar -->
<c:set var="activePage" value="dashboard" scope="request" />
<jsp:include page="/pages/navbar.jsp"/>

<!-- Fiction Book Section-->
<div class="books-header">
  <h1>Books</h1>
  <div class="genre-filter">
    <form id="genreForm" action="${pageContext.request.contextPath}/GenreFilterServlet" method="get">
      <label><input type="radio" name="genreId" value="1" onchange="document.getElementById('genreForm').submit();" <c:if test="${selectedGenreId == 1}">checked</c:if>> Fiction</label>
      <label><input type="radio" name="genreId" value="2" onchange="document.getElementById('genreForm').submit();" <c:if test="${selectedGenreId == 2}">checked</c:if>> Novel</label>
      <label><input type="radio" name="genreId" value="3" onchange="document.getElementById('genreForm').submit();" <c:if test="${selectedGenreId == 3}">checked</c:if>> Children</label>
      <label><input type="radio" name="genreId" value="4" onchange="document.getElementById('genreForm').submit();" <c:if test="${selectedGenreId == 4}">checked</c:if>> Thriller</label>
      <label><input type="radio" name="genreId" value="5" onchange="document.getElementById('genreForm').submit();" <c:if test="${selectedGenreId == 5}">checked</c:if>> Biography</label>
      <label><input type="radio" name="genreId" value="6" onchange="document.getElementById('genreForm').submit();" <c:if test="${selectedGenreId == 6}">checked</c:if>> Education</label>
    </form>
  </div>
</div>

<%
List<Book> booksToShow = (List<Book>) request.getAttribute("filteredBooks");

if (booksToShow != null && !booksToShow.isEmpty()) {
%>
  <div class="select-genre">
<%
  for (Book book : booksToShow) {
%>
    <div class="genre-book-card" onclick="openModal(
      '<%= book.getBookImage() %>',
      '<%= book.getTitle().replace("'", "\\'") %>',
      '<%= book.getAuthor().replace("'", "\\'") %>',
      '<%= book.getPrice() %>',
      '<%= book.getDescription().replace("'", "\\'") %>')">
      <img src="${pageContext.request.contextPath}/<%= book.getBookImage() %>" alt="<%= book.getTitle() %>" width="150" height="200">
      <p class="genre-book-title"><%= book.getTitle() %></p>
      <p><%= book.getAuthor() %></p>
      <p>₹<%= book.getPrice() %></p>
      <form action="addToCart" method="post">
        <input type="hidden" name="bookId" value="<%= book.getBookId() %>"/>
        <input type="hidden" name="quantity" value="1"/>
        <button onclick="event.stopPropagation(); location.href='addcart.jsp';" type="submit">Add to Cart</button>
      </form>
    </div>
<%
  }
%>
  </div>
<%
} else {
  List<Book> allBooksToShow = (List<Book>) request.getAttribute("allBooks");

  if (allBooksToShow != null && !allBooksToShow.isEmpty()) {
%>
  <div class="select-genre">
<%
  for (Book book : allBooksToShow) {
%>
    <div class="genre-book-card" onclick="openModal(
      '<%= book.getBookImage() %>',
      '<%= book.getTitle().replace("'", "\\'") %>',
      '<%= book.getAuthor().replace("'", "\\'") %>',
      '<%= book.getPrice() %>',
      '<%= book.getDescription().replace("'", "\\'") %>')">
      <img src="${pageContext.request.contextPath}/<%= book.getBookImage() %>" alt="<%= book.getTitle() %>" width="150" height="200">
      <p class="genre-book-title"><%= book.getTitle() %></p>
      <p><%= book.getAuthor() %></p>
      <p>₹<%= book.getPrice() %></p>
      <form action="addToCart" method="post">
        <input type="hidden" name="bookId" value="<%= book.getBookId() %>"/>
        <input type="hidden" name="quantity" value="1"/>
        <button onclick="event.stopPropagation(); location.href='addcart.jsp';" type="submit">Add to Cart</button>
      </form>
    </div>
<%
  }
%>
  </div>
<%
  }
}
%>

<!-- Book Details Modal -->
<div id="bookModal" class="modal">
  <div class="modal-content">
    <span class="close-btn">&times;</span>
    <div class="modal-body">
      <div class="modal-image">
        <img id="modalImage" src="" alt="Book Image" />
      </div>
      <div class="modal-details">
        <h2 id="modalTitle"></h2>
        <p id="modalDescription"></p>
        <p id="modalAuthor"></p>
        <p id="modalPrice"></p>
      </div>
    </div>
  </div>
</div> 

<jsp:include page="/pages/footer.jsp" />

<script>
  const modal = document.getElementById("bookModal");
  const closeBtn = document.querySelector(".modal .close-btn");

  function openModal(imgSrc, title, author, price, description) {
    document.getElementById("modalImage").src = imgSrc;
    document.getElementById("modalTitle").textContent = title;
    document.getElementById("modalAuthor").textContent = "By " + author;
    document.getElementById("modalPrice").textContent = price;
    document.getElementById("modalDescription").textContent = description;
    modal.style.display = "flex";
  }

  closeBtn.onclick = () => modal.style.display = "none";
  window.onclick = (e) => {
    if (e.target === modal) modal.style.display = "none";
  };
</script>
</body>
</html>
