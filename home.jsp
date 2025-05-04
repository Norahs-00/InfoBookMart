<%@ page import="com.infobookmart.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Session validation: Allow only customers
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

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css"/>

    <!-- External CSS library (Font Awesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>

<body>
    <!-- Navigation -->
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

    <!-- Hero Section -->
    <div class="home-section">
        <div class="content">
            <h1>
                Discover Your Next <span class="highlight">Favorite Book</span>
            </h1>
            <p>
                Explore thousands of books from bestselling authors across all genres.
                Your literary adventure begins with Info Book Mart.
            </p>
            <div class="buttons">
                <button class="btn">Browse Books</button>
            </div>
        </div>
        <div class="image">
            <img src="${pageContext.request.contextPath}/asset/images/book1.jpg" alt="Books on shelf" />
        </div>
    </div>

    <!-- Best Sellers -->
    <div class="hero1"><h1>Best Sellers</h1></div>
    <div class="books-section">
        <div class="book-grid">
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book2.png" alt="Book cover" />
                <p>Stories Poppy<br>By Children World<br>₹499</p><br>
                <button onclick="event.stopPropagation(); location.href='addcart.jsp';">Add to Cart</button>
            </div>

            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book3.png" alt="Book cover" />
                <p>The Scum Villain's Self-Saving System<br>By Mo Xiang Tong Xiu<br>₹399</p>
                <button onclick="event.stopPropagation(); location.href='addcart.jsp';">Add to Cart</button>
            </div>

            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book4.png" alt="Book cover" />
                <p>Harry Potter and the Deathly Hallow<br>By J.K. Rowling<br>₹350</p>
                <button onclick="event.stopPropagation(); location.href='addcart.jsp';">Add to Cart</button>
            </div>

            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book5.png" alt="Book cover" />
                <p>The Perks of Being a Wallflower<br>By Stephen Chbosky<br>₹299</p><br>
                <button onclick="event.stopPropagation(); location.href='addcart.jsp';">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- New Arrivals -->
    <div class="hero2"><h1>New Arrivals</h1></div>
    <div class="books-section">
        <div class="book-grid">
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book6.png" alt="Book cover" />
                <p>The Psychology of Money<br>By Morgan Housel<br>₹499</p>
                <button onclick="event.stopPropagation(); location.href='addcart.jsp';">Add to Cart</button>
            </div>

            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book7.png" alt="Book cover" />
                <p>Catherine, the Princess of Wales<br>By Robert Jobson<br>₹450</p>
                <button onclick="event.stopPropagation(); location.href='addcart.jsp';">Add to Cart</button>
            </div>

            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book8.png" alt="Book cover" />
                <p>Salem's Lot<br>By Stephen King<br>₹400</p>
                <button onclick="event.stopPropagation(); location.href='addcart.jsp';">Add to Cart</button>
            </div>

            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book9.png" alt="Book cover" />
                <p>Twilight<br>By Stephenie Meyer<br>₹550</p>
                <button onclick="event.stopPropagation(); location.href='addcart.jsp';">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Collection Banner -->
    <div class="collection-banner" style="background-image: url('${pageContext.request.contextPath}/asset/images/explorebook1.jpg');">
        <h1>Explore our Amazing Collection of Books</h1>

        <div class="card-container">
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/explore1.jpg" alt="Book 1">
            </div>
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/explore2.jpg" alt="Book 2">
            </div>
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/explore3.jpg" alt="Book 3">
            </div>
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/explore4.jpg" alt="Book 4">
            </div>
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/explore5.jpg" alt="Book 5">
            </div>
        </div>
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