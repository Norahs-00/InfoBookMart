<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About Us - InfoBookMart</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f5f7fb;
      margin: 0;
      padding: 0;
    }

    .about-container {
      padding: 50px 20px;
      max-width: 1200px;
      margin: auto;
      background: #bcd1bf;
    }

    .about-text {
      flex: 1 1 500px;
      padding: 20px;
    }

    .about-text h1 {
      font-size: 40px;
      color: #1a3a2b;
      margin-bottom: 20px;
    }

    .about-text h2 {
      font-size: 24px;
      color: #444;
      margin-bottom: 20px;
      font-weight: 500;
    }

    .about-text p {
      font-size: 16px;
      line-height: 1.8;
      color: #555;
      margin-bottom: 15px;
      text-align: justify;
    }

    .about-images {
      flex: 1 1 400px;
      display: flex;
      justify-content: center;
      gap: 15px;
    }

    .about-images img {
      width: 200px;
      height: 400px;
      object-fit: cover;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .about-images img:hover {
      transform: scale(1.05);
    }

    .logo-pic {
      width: 48px;
      height: 55px;
      object-fit: fit;
    }

    .btn-home {
      display: block;
      margin: 20px auto 0 auto;
      padding: 10px 20px;
      font-size: 16px;
      color: white;
      background-color: #1a3a2b;
      text-decoration: none;
      border-radius: 5px;
      cursor: pointer;
      border: none;
      width: fit-content;
    }

    .btn-home:hover {
      background-color: #155029;
    }

    @media (max-width: 900px) {
      .about-container {
        flex-direction: column;
      }

      .about-images {
        margin-top: 30px;
      }
    }
  </style>

  <!-- External CSS library (Font Awesome) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>
<body>

  <!-- Navigation Bar -->
  <header class="top-bar">
    <img src="${pageContext.request.contextPath}/asset/images/logo.png" alt="Company logo" class="logo-pic"/>
    <div class="logo">InfoBookMart</div>
    <input type="text" placeholder="What do you want to read?" class="search-bar"/>
    <nav>
      <a href="${pageContext.request.contextPath}/pages/home.jsp">Home</a>
      <a href="${pageContext.request.contextPath}/pages/books.jsp">Books</a>
      <a href="${pageContext.request.contextPath}/pages/genres.jsp">Genres</a>
      <a href="${pageContext.request.contextPath}/pages/cart.jsp">View Cart</a>

      <!-- Profile Dropdown -->
      <div class="profile-dropdown">
        <a href="#">
          <img src="${pageContext.request.contextPath}/asset/images/profile.jpg" alt="User Profile" class="profile-pic"/>
        </a>
        <div class="dropdown-content">
          <a href="${pageContext.request.contextPath}/pages/profile.jsp">Manage Profile</a>
          <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
      </div>
    </nav>
  </header>

  <!-- About Us Content -->
  <div class="about-container">
    <div class="about-text">
      <h1>About Us</h1>
      <h2>Connecting Readers, One Book at a Time</h2>
      <p>InfoBookMart is Nepal’s premier online bookstore, dedicated to igniting and nurturing a lifelong passion for reading across all ages, professions, and walks of life. Our platform is a haven for bibliophiles, students, educators, researchers, and casual readers alike, offering an unparalleled collection that bridges the gap between timeless literary masterpieces and the latest contemporary releases. From thought-provoking non-fiction, gripping novels, and inspiring biographies to academic resources, children's literature, spiritual texts, and rare, hard-to-find gems our diverse catalogue is carefully curated to spark curiosity, broaden horizons, and satisfy every intellectual appetite.</p>
      <p>Designed with simplicity and accessibility in mind, InfoBookMart empowers you to seamlessly browse, discover, and acquire books across countless genres and subjects. Whether you're seeking global bestsellers, local literary treasures, academic textbooks, competitive exam guides, or self-help manuals, our intuitive search and recommendation system ensures you find exactly what you need with ease. With secure payment gateways, multiple delivery options, and a robust logistics network, we ensure your favorite reads arrive safely and swiftly at your doorstep, no matter where you reside within Nepal.</p>
      
      <div class="about-images">
        <img src="${pageContext.request.contextPath}/asset/images/about1.jpg" alt="Book Image 1">
        <img src="${pageContext.request.contextPath}/asset/images/about2.jpg" alt="Book Image 2">
        <img src="${pageContext.request.contextPath}/asset/images/about3.jpg" alt="Book Image 3">
      </div>

      <p>But we are more than just a bookstore, InfoBookMart is a vibrant and inclusive community of readers, writers, and lifelong learners. We aspire to cultivate a space where ideas are exchanged, stories are shared, and meaningful connections are forged over the love of books. Through engaging blog articles, author interviews, virtual book clubs, reading challenges, and curated reading lists, we aim to inspire thoughtful conversations and celebrate the transformative power of literature. Whether you are an avid reader devouring books weekly, a student chasing knowledge, or someone embarking on a new literary journey, you are warmly invited to be a part of our growing family.</p>
      <p>Founded with the mission to make literature accessible, enriching, and enjoyable for everyone, InfoBookMart stands as your trusted companion in the boundless and beautiful world of words. We believe that every book has the power to enlighten, entertain, and empower — and we are here to bring that power to your fingertips.</p>
      <p><strong>Welcome to InfoBookMart where stories live, ideas flourish, and readers connect.</strong></p>
    </div>

    <button class="btn-home" onclick="location.href='${pageContext.request.contextPath}/pages/home.jsp'">Back to Home</button>
  </div>

  <!-- Footer -->
  <footer class="site-footer">
    <div class="new-footer-grid">
      <div class="footer-card">
        <h3 class="footer-logo">
          <img src="${pageContext.request.contextPath}/asset/images/logo.png" alt="InfoBookMart Logo" class="logo-pic"/>
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
          <li><i class="fas fa-phone"></i> +977-61-525112</li>
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