<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About Us - InfoBookMart</title>
  
  <!-- Link to the home.css file for page styling -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css"/>
 
  <!-- External CSS library (Font Awesome) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>
<body>
<c:set var="activePage" value="dashboard" scope="request" />
<jsp:include page="/pages/navbar.jsp"/>

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

 <jsp:include page="/pages/footer.jsp" />

</body>
</html>