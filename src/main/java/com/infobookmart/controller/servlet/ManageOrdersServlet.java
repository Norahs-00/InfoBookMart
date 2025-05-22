package com.infobookmart.controller.servlet;

import com.infobookmart.controller.dao.OrderDAO;
import com.infobookmart.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/manageOrders")
public class ManageOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        OrderDAO orderDAO = null;
        List<Order> orders = null;

        try {
            orderDAO = new OrderDAO();
            orders = orderDAO.getAllOrders();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // You can forward to an error page or set an error message
            request.setAttribute("error", "Unable to retrieve orders due to a database error.");
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/pages/manageOrders.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        String newStatus = request.getParameter("orderStatus");

        if (orderIdStr != null && newStatus != null) {
            try {
                int orderId = Integer.parseInt(orderIdStr);
                OrderDAO orderDAO = new OrderDAO();
                boolean success = orderDAO.updateOrderStatus(orderId, newStatus);

                if (success) {
                    request.setAttribute("message", "Order status updated successfully.");
                } else {
                    request.setAttribute("error", "Failed to update order status.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error occurred while updating order status.");
            }
        }
        doGet(request, response);  // reload orders page after update
    }

}