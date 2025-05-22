<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>InfoBookMart Home</title>

<!-- Link to the home.css file for page styling -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bar.css"/>

<!-- Link to Font Awesome icons stylesheet from a Content Delivery Network (CDN), which helps load resources faster by distributing them across multiple servers worldwide -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>

<style>
    /* Cart count badge style */
    .cart-link {
        position: relative;
        display: inline-block;
    }
    
    .cart-count {
        position: absolute;
        top: -10px;
        right: -10px;
        background-color: #2e5e38; /* Match your theme's color */
        color: white;
        border-radius: 50%;
        padding: 4px 8px;
        font-size: 12px;
        font-weight: bold;
    }
    
    /* Success message style */
    .message-box {
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 25px;
        background-color: #2e5e38; /* Match your theme's color */
        color: white;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        z-index: 1000;
        display: none;
        animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
        animation-fill-mode: forwards;
    }
    
    @keyframes fadeIn {
        from {opacity: 0;}
        to {opacity: 1;}
    }
    
    @keyframes fadeOut {
        from {opacity: 1;}
        to {opacity: 0;}
    }
</style>
</head>
<body>
<!-- Success message display -->
<% if(session.getAttribute("message") != null) { %>
    <div id="message-box" class="message-box">
        <%= session.getAttribute("message") %>
    </div>
    <% session.removeAttribute("message"); %>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var messageBox = document.getElementById('message-box');
            messageBox.style.display = 'block';
            
            // Hide the message after 3 seconds
            setTimeout(function() {
                messageBox.style.display = 'none';
            }, 3000);
        });
    </script>
<% } %>

<!-- Navigation -->
<header class="top-bar">
<img src="${pageContext.request.contextPath}/asset/images/logo.png" alt="Company logo" class="logo-pic" />
<div class="logo">InfoBookMart</div>
<div class="search-container">
<form action="${pageContext.request.contextPath}/searchBook" method="get">
<input type="text" name="keyword" placeholder="Search by title, author, or genre" class="search-bar"/>
<button type="submit" class="search-button">
<i class="fa fa-search"></i>
</button>
</form>
</div>

<!--Navigation bar with links to Home, Books, Genres, and View Cart pages.
Each link uses contextPath to ensure correct path resolution within the application.-->
<nav>
<a href="${pageContext.request.contextPath}/pages/home.jsp">Home</a>
<a href="${pageContext.request.contextPath}/DisplayAllBooksServlet">Books</a>

<!-- Genres Dropdown -->
<div class="dropdown">
<div class="dropbtn">Genres</div>
<div class="dropdown-content">
<a href="${pageContext.request.contextPath}/SelectGenreServlet?id=1">Fiction</a>
<a href="${pageContext.request.contextPath}/SelectGenreServlet?id=2">Novel</a>
<a href="${pageContext.request.contextPath}/SelectGenreServlet?id=3">Children</a>
<a href="${pageContext.request.contextPath}/SelectGenreServlet?id=4">Thriller</a>
<a href="${pageContext.request.contextPath}/SelectGenreServlet?id=5">Biography</a>
<a href="${pageContext.request.contextPath}/SelectGenreServlet?id=6">Education</a>
</div>
</div>

<!-- Updated Cart Link with Cart Count -->
<a href="${pageContext.request.contextPath}/ViewCartServlet" class="cart-link">
    View Cart
    <% if(session.getAttribute("cartCount") != null && (int)session.getAttribute("cartCount") > 0) { %>
        <span class="cart-count"><%= session.getAttribute("cartCount") %></span>
    <% } %>
</a>

<!-- Profile Dropdown -->
<div class="profile-dropdown">
<a href="#">
<img src="${pageContext.request.contextPath}/asset/images/profile.jpg" alt="User Profile" class="profile-pic" />
</a>
<div class="dropdown-content">
<a href="${pageContext.request.contextPath}/pages/userprofile.jsp">Manage Profile</a>
<a href="${pageContext.request.contextPath}/logout">Logout</a>
</div>
</div>
</nav>
</header>
</body>
</html>