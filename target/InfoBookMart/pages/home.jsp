<%@ page import="com.infobookmart.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // session check: only customers
    User user = (User) session.getAttribute("currentUser");
    if (user == null || !"customer".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>InfoBookMart Home</title>

  <!-- Home page CSS -->
  <link 
    rel="stylesheet" 
    href="${pageContext.request.contextPath}/css/home.css"/>

  <!-- Font Awesome (icons) -->
  <link 
    rel="stylesheet" 
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>

<body>
  <!-- Top navigation bar -->
  <header class="top-bar">
    <div class="logo">InfoBookMart</div>
    <input 
      type="text" 
      placeholder="What do you want to read?" 
      class="search-bar" />
    <nav>
      <a href="${pageContext.request.contextPath}/pages/home.jsp">Home</a>
      <a href="${pageContext.request.contextPath}/pages/genres.jsp">Genres</a>
      <a href="${pageContext.request.contextPath}/pages/cart.jsp">View Cart</a>
      <a href="${pageContext.request.contextPath}/pages/profile.jsp">
        <img 
          src="${pageContext.request.contextPath}/asset/images/profile.jpg" 
          alt="User Profile" 
          class="profile-pic" />
      </a>
      <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </nav>
  </header>

  <!-- Hero Section -->
  <section class="hero">
    <h1>LOOKING FOR BOOKS ?</h1>
    <p>Explore books in our genre section</p>
    <div class="featured-books">
      <img 
        src="${pageContext.request.contextPath}/asset/images/book1.png" 
        alt="Featured Book">
    </div>
  </section>

  <!-- Best Sellers -->
  <section class="hero1"><h1>Best Sellers</h1></section>
  <section class="books-section">
    <div class="book-grid">
      <div class="book-card">
        <img 
          src="${pageContext.request.contextPath}/asset/images/book2.png" 
          alt="Book Cover" />
        <p>Book Title<br>By Author<br>₹499</p>
        <button>Add to Cart</button>
      </div>
      <!-- repeat .book-card as needed -->
    </div>
  </section>

  <!-- New Arrivals -->
  <section class="hero2"><h1>New Arrivals</h1></section>
  <section class="books-section">
    <div class="book-grid">
      <div class="book-card">
        <img 
          src="${pageContext.request.contextPath}/asset/images/book6.png" 
          alt="New Book" />
        <p>New Book<br>By Another<br>₹599</p>
        <button>Add to Cart</button>
      </div>
      <!-- more cards -->
    </div>
  </section>

  <!-- Collection Banner -->
  <section class="collection-banner">
    <h1>Explore our Amazing Collection of Books</h1>
    <img 
      src="${pageContext.request.contextPath}/asset/images/book10.png" 
      alt="Open Books" />
  </section>

  <!-- Footer -->
  <footer class="site-footer">
    <div class="footer-grid">
      <div class="footer-card">
        <h4>Quick Links</h4>
        <button class="footer-btn">Best Sellers</button><br>
        <button class="footer-btn">New Arrivals</button>
      </div>
      <div class="footer-card">
        <h4>About</h4>
        <button class="footer-btn">About Us</button>
      </div>
      <div class="footer-card">
        <h4>Genres</h4>
        <button class="footer-btn">Fiction</button><br>
        <button class="footer-btn">Thriller</button><br>
        <button class="footer-btn">Biography</button>
      </div>
      <div class="footer-card">
        <img 
          src="${pageContext.request.contextPath}/asset/images/book11.png" 
          alt="InfoBookMart Logo" 
          class="footer-logo-img" />
      </div>
    </div>
    <div class="footer-bottom">
      <span>InfoBookMart</span>
      <div class="footer-right">
        <span>Connect with us:</span>
        <i class="fab fa-instagram"></i>
        <i class="fab fa-tiktok"></i>
        <i class="fab fa-facebook"></i>
      </div>
    </div>
  </footer>
</body>
</html>
