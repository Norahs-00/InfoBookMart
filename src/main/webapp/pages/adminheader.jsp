<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminheader.css"/>

<header class="admin-header">
  <img src="${pageContext.request.contextPath}/asset/images/logo.png"
       alt="InfoBookMart Logo"
       class="logo-pic"/>
  <span class="site-name">InfoBookMart</span>
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
  
</header>