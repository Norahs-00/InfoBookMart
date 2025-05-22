<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.infobookmart.model.Order" %>
<%@ page import="com.infobookmart.model.OrderItem" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Manage Orders – InfoBookMart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminheader.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageBooks.css"/>
</head>
<body>

<%@ include file="/pages/adminheader.jsp" %>

<div class="sidebar">
    <ul>
        <li><a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/book?action=list">Manage Books</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/user?action=list">Manage Users</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/manageOrders">Manage Orders</a></li>
    </ul>
</div>

<div class="main-content">
    <div class="header-bar">
        <h2>Manage Orders</h2>
    </div>

    <% if (request.getAttribute("message") != null) { %>
        <div style="color: green; text-align: center; margin: 20px;">
            <%= request.getAttribute("message") %>
        </div>
    <% } %>

    <% if (request.getAttribute("error") != null) { %>
        <div style="color: red; text-align: center; margin: 20px;">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <table class="book-table">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Ordered Date</th>
                <th>Order Status</th>
                <th>Items </th>
                <th>Total Price</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
                    double totalPrice = 0;
                    for (OrderItem item : order.getItems()) {
                        totalPrice += item.getQuantity() * item.getPriceEach();
                    }
        %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getUserId() %></td>
            <%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = sdf.format(order.getOrderDate());
%>
            <td><%= formattedDate %></td>
            <td>
                <form method="post" action="<%= request.getContextPath() %>/manageOrders">
                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>" />
                    <select name="orderStatus" class="status-dropdown" onchange="this.form.submit()">
                        <option value="pending" <%= "pending".equals(order.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="shipped" <%= "shipped".equals(order.getStatus()) ? "selected" : "" %>>Shipped</option>
                        <option value="delivered" <%= "delivered".equals(order.getStatus()) ? "selected" : "" %>>Delivered</option>
                        <option value="cancelled" <%= "cancelled".equals(order.getStatus()) ? "selected" : "" %>>Cancelled</option>
                    </select>
                </form>
            </td>
            <td>
                <ul>
                    <%
                        for (OrderItem item : order.getItems()) {
                    %>
                    <li style="margin-left:10px;"> <%= item.getBookTitle() %> x <%= item.getQuantity() %></li>
                    <%
                        }
                    %>
                </ul>
            </td>
            <td>Rs.<%= String.format("%.2f", totalPrice) %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">No orders found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>