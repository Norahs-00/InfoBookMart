<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*, com.infobookmart.model.CartItem" %>
<%@ page import = "com.infobookmart.model.Order" %>
<%@ page import="com.infobookmart.model.OrderItem" %>
<%@ page import="java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9f9f9;
        padding: 40px;
        margin: 0;
    }

    .section {
        background-color: #fff;
        border-radius: 16px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        padding: 30px;
        margin-bottom: 40px;
        margin-top:0px;
    }

    h2 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 15px;
        text-align: left;
    }

    thead {
        background-color: #f1f1f1;
    }

    tr {
        border-bottom: 1px solid #e0e0e0;
    }

    button {
        cursor: pointer;
    }

    .cart-controls button {
        padding: 6px 12px;
        background-color: #ddd;
        border: none;
        border-radius: 6px;
        font-weight: bold;
    }

    .cart-controls span {
        margin: 0 10px;
        font-weight: bold;
    }

    .delete-btn {
        background-color: transparent;
        color: #d63384;
        font-weight: bold;
        border: none;
        cursor: pointer;
    }

    .place-order-btn {
        background-color: #d63384;
        color: white;
        border: none;
        padding: 12px 25px;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
        margin-top: 20px;
    }

    .continue-shopping {
        margin-bottom: 20px;
        display: inline-block;
        color: #2e5e38;
        text-decoration: none;
        font-weight: 500;
    }

    .container {
        display: flex;
        flex-direction: column;
        gap: 40px;
    }
</style>
    
</head>
<body>

<div class = "container">
	<div class="section">
    <h2>Your Cart</h2>

    <%
        List<CartItem> items = (List<CartItem>) request.getAttribute("cartItems");
        double grandTotal = 0;
    %>

    <table>
        <thead>
        <tr>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Quantity</th>
            <th>Price Each</th>
            <th>Total</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
<%
    if (items != null && !items.isEmpty()) {
        for (CartItem item : items) {
            double itemTotal = item.getQuantity() * item.getPriceEach();
            grandTotal += itemTotal;
%>
<tr>
    <td><%= item.getId() %></td>
    <td><%= item.getBookTitle() %></td>
    <td>
        <form action="updateCart" method="post" style="display:inline;">
            <input type="hidden" name="bookId" value="<%= item.getId() %>" />
            <input type="hidden" name="action" value="decrease" />
            <button type="submit" style="padding: 6px 10px; background-color: #7eb87a; border: none; border-radius: 4px; font-weight: bold;">-</button>
        </form>
        <span style="margin: 0 12px; font-weight: bold;"><%= item.getQuantity() %></span>
        <form action="updateCart" method="post" style="display:inline;">
            <input type="hidden" name="bookId" value="<%= item.getId() %>" />
            <input type="hidden" name="action" value="increase" />
            <button type="submit" style="padding: 6px 10px; background-color: #7eb87a; border: none; border-radius: 4px; font-weight: bold;">+</button>
        </form>
    </td>
    <td>Rs. <%= item.getPriceEach() %></td>
    <td>Rs. <%= itemTotal %></td>
    <td>
	  <form action="updateCart" method="post" onsubmit="return confirm('Remove this item?');">
	    <input type="hidden" name="bookId" value="<%= item.getId() %>" />
	    <input type="hidden" name="action" value="delete" />
	    <button type="submit" style="background-color: transparent; border: none; color: #2e5e38; font-size: 16px; font-weight: bold; cursor: pointer;">
	      Delete
	    </button>
	  </form>
	</td>

</tr>
<% } %>
<tr>
    <td colspan="5" style="text-align:right; font-size: 18px;">Grand Total:</td>
    <td colspan="2" style="text-align:left; font-weight: bold;font-size:18px">Rs. <%= grandTotal %></td>
</tr>
<%
    } else {
%>
<tr>
    <td colspan="6">Your cart is empty.</td>
</tr>
<% } %>
</tbody>
    </table>
     <% if (items != null && !items.isEmpty()) { %>
		<div style="text-align: center; margin-top: 20px;">
		  <form action="placeOrder" method="post">
		    <button type="submit" style="background-color: #2e5e38;color: white;border: none;padding: 12px 25px;
		    font-size: 16px;border-radius: 8px;cursor: pointer;">Place Order</button>
		  </form>
		</div>
		<% } %>
</div>
</div>

		<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<div class="section">
    <h2>Your Orders</h2>

    <% if (orders != null && !orders.isEmpty()) { %>
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Status</th>
                <th>Total Items</th>
                <th>Total Price</th>
            </tr>
        </thead>
        <tbody>
        <% for (Order order : orders) { %>
            <tr>
                <td><%= order.getOrderId() %></td>
                <%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = sdf.format(order.getOrderDate());
%>
<td><%= formattedDate %></td>

                <td><%= order.getStatus() %></td>
                <td><%= order.getTotalItems() %></td>
                <td>Rs. <%= order.getTotalPrice() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
        <p style="text-align:center;">You haven’t placed any orders yet.</p>
    <% } %>
    
</div>
<a href="${pageContext.request.contextPath}/DisplayAllBooksServlet" class="continue-shopping">← Continue Shopping</a>
</body>
</html>
