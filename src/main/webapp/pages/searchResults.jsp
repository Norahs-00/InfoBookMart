<%@ page import="java.util.List" %>
<%@ page import="com.infobookmart.model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    List<Book> searchResults = (List<Book>) request.getAttribute("books");
    String searchQuery = (String) request.getAttribute("keyword");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchResults.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/popupAlert.css" />
  <!-- External CSS library (Font Awesome) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>
<body>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <div id="customPopup" class="popup">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup()">&times;</span>
            <p><%= message %></p>
        </div>
    </div>
    <script>
      window.onload = function () {
        const popup = document.getElementById('customPopup');
        popup.style.display = 'block';
        setTimeout(() => {
          popup.style.display = 'none';
        }, 3000);
      };

      function closePopup() {
        document.getElementById('customPopup').style.display = 'none';
      }
    </script>
<%
        session.removeAttribute("message");
    }
%>
<!-- Navigation Bar -->
<c:set var="activePage" value="dashboard" scope="request" />
<jsp:include page="/pages/navbar.jsp"/>

    <h2>Search Results for "<%= searchQuery %>"</h2>
    <div class="books-section">
       	<% if (searchResults != null && !searchResults.isEmpty()) {
      			for (Book book : searchResults) { %>
   		<div class="book-card" onclick="openModal(
     		'<%= request.getContextPath() + "/" + book.getBookImage() %>',
     		'<%= book.getTitle().replace("'", "\\'") %>',
     		'<%= book.getAuthor().replace("'", "\\'") %>',
     		'₹<%= book.getPrice() %>',
     		'<%= book.getDescription().replace("'", "\\'") %>'
   		)">
	        <img src="<%= request.getContextPath() + "/" + book.getBookImage() %>" alt="Book cover" />
	        <p><%= book.getTitle() %><br>By <%= book.getAuthor() %><br>₹<%= book.getPrice() %></p>
	        <form action="addToCart" method="post">
				    <input type="hidden" name="bookId" value="<%= book.getBookId() %>"/>
				    <input type="hidden" name="quantity" value="1"/>
				    <button onclick="event.stopPropagation(); location.href='addcart.jsp';" type="submit">Add to Cart</button>
			</form>
  	 	</div>
	<%   }
  		} else { %>
   		<p>No books found matching.</p>
	<% } %>
	</div>
    
   
  
   <div id="bookModal" class="modal">
	  <div class="modal-content">
	    <span class="close-btn">&times;</span>
	    <div class="modal-body">
	      <div class="modal-image">
	        <img id="modalImage" src="" alt="Book Image" />
	      </div>
	      <div class="modal-details">
	        <h2 id="modalTitle"></h2>
	        <p id="modalDescription"></p>
	        <p id="modalAuthor"></p>
	        <p id="modalPrice"></p>
	        <button>Add to Cart</button>
	      </div>
	    </div>
	  </div>
	</div>
  
 <script>
  const modal = document.getElementById("bookModal");
  const closeBtn = document.querySelector(".close-btn");

  function openModal(imgSrc, title, author, price, description) {
	console.log("Modal opened with:", title);
    document.getElementById("modalImage").src = imgSrc;
    document.getElementById("modalTitle").textContent = title;
    document.getElementById("modalAuthor").textContent = "By " + author;
    document.getElementById("modalPrice").textContent = price;
    document.getElementById("modalDescription").textContent = description;
    modal.style.display = "flex";
  }

  closeBtn.onclick = () => modal.style.display = "none";
  window.onclick = (e) => {
    if (e.target === modal) modal.style.display = "none";
  };
</script>

<jsp:include page="/pages/footer.jsp" />
  
</body>
</html>