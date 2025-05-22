<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>Manage Users</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminheader.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageUser.css"/>
</head>
<body>

	<%@ include file="/pages/adminheader.jsp" %>
	
	<div class="sidebar">
	  <ul>
	    <li><a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Dashboard</a></li>
	    <li><a href="${pageContext.request.contextPath}/admin/book?action=list">Manage Books</a></li>
	    <li class="active"><a href="${pageContext.request.contextPath}/admin/user?action=list">Manage Users</a></li>
		<%-- <li><a href="${pageContext.request.contextPath}/manageOrders">Manage Orders</a></li> --%>
	  </ul>
	</div>

<div class="main-content">
  <jsp:forward page="viewUsers.jsp"/>
</div>

</body>
</html>