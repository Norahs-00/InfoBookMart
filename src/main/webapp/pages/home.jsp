<%@ page import="com.infobookmart.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

    <!-- Link to the home.css file for page styling -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css"/>

    <!-- Link to Font Awesome icons stylesheet from a Content Delivery Network (CDN), which helps load resources faster by distributing them across multiple servers worldwide -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    
    <!-- Add CSS for the cart notification popup -->
    <style>
        #cartNotification {
            position: fixed;
            bottom: 50px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #4CAF50;
            color: white;
            padding: 15px 30px;
            border-radius: 8px;
            z-index: 9999;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: none;
            width: 250px;
            text-align: center;
        }
    </style>
</head>

<body>
<!-- Cart notification popup -->
<div id="cartNotification">
    <i class="fas fa-shopping-cart"></i> Item added to cart!
</div>

<!-- Navigation Bar -->
<c:set var="activePage" value="dashboard" scope="request" />
<jsp:include page="/pages/navbar.jsp"/>

    <!-- Home Section -->
    <div class="home-section">
        <div class="content">
            <h1>
                Discover Your Next <span class="highlight">Favorite Book</span> <!-- Inline container to style or target the text "Favorite Book" without breaking layout -->
            </h1>
            <p>
                Explore thousands of books from bestselling authors across all genres.
                Your literary adventure begins with Info Book Mart.
            </p>
            <div class="buttons">
                <button class="btn" onclick="location.href='${pageContext.request.contextPath}/DisplayAllBooksServlet'">Browse Books</button>
            </div>
        </div>
        <div class="image">
            <img src="${pageContext.request.contextPath}/asset/images/book1.jpg" alt="Books on shelf" />
        </div>
    </div>

    <!-- Best Sellers -->
    <div class="home1"><h1>Best Sellers</h1></div>
    <div class="books-section">
        <div class="book-grid">
        	<!-- When the card is clicked, the onclick event uses location.href to change the current page's URL to 'books.jsp'.
        	This causes the browser to navigate the user to the 'books.jsp' page. -->
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book2.png" alt="Book cover" />
                <p>Stories Poppy<br>By Children World<br>₹499</p><br>
                <!-- Updated to call showCartNotification() instead of directly redirecting -->
                <button onclick="event.stopPropagation(); location.href='${pageContext.request.contextPath}/DisplayAllBooksServlet';">Go to Books</button>

            </div>
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book3.png" alt="Book cover" />
                <p>The Scum Villain's Self-Saving System<br>By Mo Xiang Tong Xiu<br>₹399</p>
                <button onclick="event.stopPropagation(); location.href='${pageContext.request.contextPath}/DisplayAllBooksServlet';">Go to Books</button>

            </div>
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book4.png" alt="Book cover" />
                <p>Harry Potter and the Deathly Hallow<br>By J.K. Rowling<br>₹350</p>
                <button onclick="event.stopPropagation(); location.href='${pageContext.request.contextPath}/DisplayAllBooksServlet';">Go to Books</button>

            </div>
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book5.png" alt="Book cover" />
                <p>The Perks of Being a Wallflower<br>By Stephen Chbosky<br>₹299</p>
                <br>
                <button onclick="event.stopPropagation(); location.href='${pageContext.request.contextPath}/DisplayAllBooksServlet';">Go to Books</button>

            </div>
        </div>
    </div>

    <!-- New Arrivals -->
    <div class="home2"><h1>New Arrivals</h1></div>
    <div class="books-section">
        <div class="book-grid">
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book6.png" alt="Book cover" />
                <p>The Psychology of Money<br>By Morgan Housel<br>₹499</p>
               <button onclick="event.stopPropagation(); location.href='${pageContext.request.contextPath}/DisplayAllBooksServlet';">Go to Books</button>

            </div>
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book7.png" alt="Book cover" />
                <p>Catherine, the Princess of Wales<br>By Robert Jobson<br>₹450</p>
                <button onclick="event.stopPropagation(); location.href='${pageContext.request.contextPath}/DisplayAllBooksServlet';">Go to Books</button>

            </div>
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book8.png" alt="Book cover" />
                <p>Salem's Lot<br>By Stephen King<br>₹400</p>
                <button onclick="event.stopPropagation(); location.href='${pageContext.request.contextPath}/DisplayAllBooksServlet';">Go to Books</button>

            </div>
            <div class="book-card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/book9.png" alt="Book cover" />
                <p>Twilight<br>By Stephenie Meyer<br>₹550</p>
                <button onclick="event.stopPropagation(); location.href='${pageContext.request.contextPath}/DisplayAllBooksServlet';">Go to Books</button>

            </div>
        </div>
    </div>

    <!-- Explore Books Banner -->
    <div class="explore-banner" style="background-image: url('${pageContext.request.contextPath}/asset/images/explorebook1.jpg');">
        <h1>Explore our Amazing Collection of Books</h1>
        <div class="card-container">
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/books/Raha ke Phool.jpg" alt="Book 1">
            </div>
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/books/We are All Perfectly Imperfect.jpg" alt="Book 2">
            </div>
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/books/Mountains Painted With Turmeric.jpg" alt="Book 3">
            </div>
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/books/A Flower in the Midst of Thorns.jpg" alt="Book 4">
            </div>
            <div class="card" onclick="location.href='books.jsp'">
                <img src="${pageContext.request.contextPath}/asset/images/books/A Tempest at Sea.jpg" alt="Book 5">
            </div>
        </div>
    </div>

    <!-- JavaScript for cart notification -->
    <script>
        
        
        // Check for session message (optional - for when redirected back with a message)
        <c:if test="${not empty sessionScope.message}">
            window.onload = function() {
                showCartNotification();
                <% session.removeAttribute("message"); %>
            };
        </c:if>
    </script>

<jsp:include page="/pages/footer.jsp" />
</body>
</html>