<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Our Mission - InfoBookMart</title>
 
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ourMission.css">
  
  <!-- External CSS library (Font Awesome) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>
<body>
<c:set var="activePage" value="dashboard" scope="request" />
<jsp:include page="/pages/navbar.jsp"/>

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

<jsp:include page="/pages/footer.jsp" />

</body>
</html>