<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Our Mission - InfoBookMart</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
  <style>
    .mission-container {
      max-width: 900px;
      margin: 85px auto;
      padding: 30px;
      background-color: #bcd1bf;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      text-align: center;
    }
    .mission-container h1 {
      color: #1a3a2b;
      margin-bottom: 20px;
    }
    .mission-container p {
      font-size: 18px;
      line-height: 1.8;
      color: #333;
    }
    .btn-home {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      font-size: 16px;
      color: white;
      background-color: #1a3a2b;
      text-decoration: none;
      border-radius: 5px;
      cursor: pointer;
      border: none;
    }
    .btn-home:hover {
      background-color: #155029;
    }
  </style>

  <!-- External CSS library (Font Awesome) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>
<body>

  <header class="top-bar">
    <img src="${pageContext.request.contextPath}/asset/images/logo.png" alt="Company logo" class="logo-pic" />
    <div class="logo">InfoBookMart</div>
    <input type="text" placeholder="What do you want to read?" class="search-bar" />
    <nav>
      <a href="${pageContext.request.contextPath}/pages/home.jsp">Home</a>
      <a href="${pageContext.request.contextPath}/pages/books.jsp">Books</a>
      <a href="${pageContext.request.contextPath}/pages/genres.jsp">Genres</a>
      <a href="${pageContext.request.contextPath}/pages/cart.jsp">View Cart</a>

      <!-- Profile Dropdown -->
      <div class="profile-dropdown">
        <a href="#">
          <img src="${pageContext.request.contextPath}/asset/images/profile.jpg" alt="User Profile" class="profile-pic" />
        </a>
        <div class="dropdown-content">
          <a href="${pageContext.request.contextPath}/pages/profile.jsp">Manage Profile</a>
          <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
      </div>
    </nav>
  </header>

  <!-- Our Mission Section -->
  <div class="mission-container">
    <h1>Our Mission</h1>
    <p>
      At <strong>InfoBookMart</strong>, our mission is to ignite the love of reading and knowledge in every individual.  
      We strive to offer a diverse collection of books from timeless classics to modern bestsellers making quality literature accessible to readers across Nepal and beyond.
    </p>
    <p>
      We are committed to supporting lifelong learning, fostering curiosity, and empowering minds through books.  
      Whether you're seeking inspiration, education, or simply a great story, InfoBookMart is here to serve as your trusted companion in the world of reading.
    </p>

    <!-- Button to Redirect to Login Page (Home) -->
    <button class="btn-home" onclick="location.href='${pageContext.request.contextPath}/pages/home.jsp'">Back to Home</button>
  </div>

  <!-- Footer -->
  <footer class="site-footer">
    <div class="new-footer-grid">
      <div class="footer-card">
        <h3 class="footer-logo">
          <img src="${pageContext.request.contextPath}/asset/images/logo.png" alt="InfoBookMart Logo" class="logo-pic" />
          <span>InfoBookMart</span>
        </h3>
        <p>Your one-stop online bookstore for all your literary needs. Discover, explore, and enjoy a vast collection of books.</p>
      </div>

      <div class="footer-card">
        <h4>Quick Links</h4>
        <ul class="footer-list">
          <li><a href="${pageContext.request.contextPath}/pages/home.jsp">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/pages/books.jsp">Books</a></li>
          <li><a href="${pageContext.request.contextPath}/pages/genres.jsp">Genres</a></li>
          <li><a href="${pageContext.request.contextPath}/pages/cart.jsp">View Cart</a></li>
        </ul>
      </div>

      <div class="footer-card">
        <h4>About</h4>
        <ul class="footer-list">
          <li><a href="${pageContext.request.contextPath}/pages/aboutus.jsp">About Us</a></li>
          <li><a href="${pageContext.request.contextPath}/pages/ourMission.jsp">Our Mission</a></li> 
        </ul>
      </div>

      <div class="footer-card">
        <h4>Contact Us</h4>
        <ul class="footer-list contact-info">
          <li><i class="fas fa-map-marker-alt"></i> 16 Lakeside, Pokhara 33700, Nepal</li>
          <li><i class="fas fa-phone"></i> +977-61-525112 </li>
          <li><i class="fas fa-envelope"></i> infobookmart123@gmail.com</li>
        </ul>
      </div>
    </div>

    <div class="footer-bottom-centered">
      &copy; 2025 InfoBookMart. All rights reserved.
    </div>
  </footer>

</body>
</html>