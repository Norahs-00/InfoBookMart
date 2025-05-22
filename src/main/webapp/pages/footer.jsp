<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bar.css"/>

</head>
<body>

    <!-- Footer -->
    <footer class="site-footer">
        <div class="new-footer-grid">
            <div class="footer-card">
                <h3 class="footer-logo">
                    <img src="${pageContext.request.contextPath}/asset/images/logo.png" alt="InfoBookMart Logo" class="logo-pic" />
                    <span>InfoBookMart</span> <!-- Inline container to style or target the text InfoBookMart without breaking layout -->
                </h3>
                <p>Your one-stop online bookstore for all your literary needs. Discover, explore, and enjoy a vast collection of books.</p>
            </div>
            
			<!-- Footer card for quick links -->
            <div class="footer-card">
                <h4>Quick Links</h4>
                <ul class="footer-list">
                    <li><a href="${pageContext.request.contextPath}/pages/home.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/DisplayAllBooksServlet">Books</a></li>
                    <li class="genre-dropdown">
				    <a href="#" class="genre-dropbtn">Genres</a>
				    <div class="genre-dropdown-content">
				        <a href="${pageContext.request.contextPath}/SelectGenreServlet?id=1">Fiction</a>
					    <a href="${pageContext.request.contextPath}/SelectGenreServlet?id=2">Novel</a>
					    <a href="${pageContext.request.contextPath}/SelectGenreServlet?id=3">Children</a>
					    <a href="${pageContext.request.contextPath}/SelectGenreServlet?id=4">Thriller</a>
					    <a href="${pageContext.request.contextPath}/SelectGenreServlet?id=5">Biography</a>
					    <a href="${pageContext.request.contextPath}/SelectGenreServlet?id=6">Education</a>
				    </div>
					</li>
                    <li><a href="${pageContext.request.contextPath}/pages/cart.jsp">View Cart</a></li>
                </ul>
            </div>

			<!-- Footer card for about us -->
            <div class="footer-card">
                <h4>About</h4>
                <ul class="footer-list">
                    <li><a href="${pageContext.request.contextPath}/pages/aboutus.jsp">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/pages/ourMission.jsp">Our Mission</a></li>
                </ul>
            </div>

			<!-- Footer card for contact us -->
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
        	<!-- &copy is an HTML character entity code that shows the copyright symbol -->
            &copy; 2025 InfoBookMart. All rights reserved.
        </div>
    </footer>
</body>
</html>