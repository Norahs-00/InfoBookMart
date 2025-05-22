<%@ page import="com.infobookmart.model.User" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Management- InfoBookMart</title>
    <!-- Link to the home.css file for page styling -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css"/>
</head>
<body>

    

    <div class="container">
        <div class="header">
            <h2>Manage Your Profile</h2>
            <p>View and update your profile information</p>
        </div>

        <div class="tabs">
            <button class="tab active">Profile Details</button>
        </div>

        <div class="profile-info">
           <img src="<%= request.getContextPath() + "/asset/images/" + user.getProfileImg() %>" 
		     alt="Profile Image"
		     style="height: 100px; width: 100px; border-radius: 50%; object-fit: cover; border: 2px solid #28a745;" />
           
            <h2><%= user.getFirstName() + " " + user.getLastName() %></h2>
			<p class="username">@<%= user.getUserName() %></p>
			<div class="role-badge"><%= user.getRole() %></div>

        </div>

        <div class="details">
            <div class="detail-box">
                <label>Email</label>
				<p><%= user.getEmail() %></p>

				<label>Date of Birth</label>
				<p><%= user.getDateOfBirth() %></p>

				<label>Address</label>
				<p><%= user.getAddress() %></p>

            </div>
            <div class="detail-box">
                <label>Contact Number</label>
				<p><%= user.getContactNo() %></p>
				
				<label>Gender</label>
				<p><%= user.getGender() %></p>

            </div>
        </div>

        <div class="edit-button">
	    <a href="editProfile.jsp">
	        <button type="button">&#9998; Edit Profile</button>
	    </a>
	</div>

    </div>
    
	<%
    String targetPage;
    if ("admin".equalsIgnoreCase(user.getRole())) {
        targetPage = request.getContextPath() + "/pages/dashboard.jsp";
    } else {
        targetPage = request.getContextPath() + "/pages/home.jsp";
    }
	%>
	
	<div class="main-page">
	    <form action="<%= targetPage %>" method="get">
	        <button type="submit">Go to Main Page</button>
	    </form>
	</div>
	
	
</body>
</html>
