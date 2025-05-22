package com.infobookmart.controller.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.infobookmart.controller.database.DatabaseConnection;
import com.infobookmart.model.Order;
import com.infobookmart.model.OrderItem;

public class OrderDAO {
    private Connection conn;
    public OrderDAO() throws ClassNotFoundException, SQLException {
        this.conn = DatabaseConnection.getConnection();
    }

    public List<Order> getOrdersForUser(int userId) {
        List<Order> orders = new ArrayList<>();

        String orderQuery = "SELECT * FROM orders WHERE userId = ?";
        String itemQuery = "SELECT oi.bookId, b.title, oi.orderQuantity, oi.eachPrice"
            +" FROM order_items oi"
            +" JOIN books b ON b.bookId = oi.bookId"
            +" WHERE oi.orderId = ?";

        try {
            PreparedStatement psOrder = conn.prepareStatement(orderQuery);
            psOrder.setInt(1, userId);
            ResultSet rsOrder = psOrder.executeQuery();

            while (rsOrder.next()) {
                int orderId = rsOrder.getInt("orderId");
                Timestamp orderDate = rsOrder.getTimestamp("orderDate");
                String status = rsOrder.getString("orderStatus");

                List<OrderItem> items = new ArrayList<>();

                PreparedStatement psItem = conn.prepareStatement(itemQuery);
                psItem.setInt(1, orderId);
                ResultSet rsItem = psItem.executeQuery();

                while (rsItem.next()) {
                    OrderItem item = new OrderItem(
                        rsItem.getInt("bookId"),
                        rsItem.getString("title"),
                        rsItem.getInt("orderQuantity"),
                        rsItem.getDouble("eachPrice")
                    );
                    items.add(item);
                }

                rsItem.close();
                psItem.close();

                orders.add(new Order(orderId, orderDate, status, items));
            }

            rsOrder.close();
            psOrder.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();

        String orderQuery = "SELECT * FROM orders";
        String itemQuery = "SELECT oi.bookId, b.title, oi.orderQuantity, oi.eachPrice"
            +" FROM order_items oi"
            +" JOIN books b ON oi.bookId = b.bookId"
            +" WHERE oi.orderId = ?";

        try {
            PreparedStatement psOrder = conn.prepareStatement(orderQuery);
            ResultSet rsOrder = psOrder.executeQuery();

            while (rsOrder.next()) {
                int orderId = rsOrder.getInt("orderId");
                int userId = rsOrder.getInt("userId");
                Timestamp orderDate = rsOrder.getTimestamp("orderDate");
                String status = rsOrder.getString("orderStatus");

                List<OrderItem> items = new ArrayList<>();

                PreparedStatement psItem = conn.prepareStatement(itemQuery);
                psItem.setInt(1, orderId);
                ResultSet rsItem = psItem.executeQuery();

                while (rsItem.next()) {
                    OrderItem item = new OrderItem(
                        rsItem.getInt("bookId"),
                        rsItem.getString("title"),
                        rsItem.getInt("orderQuantity"),
                        rsItem.getDouble("eachPrice")
                    );
                    items.add(item);
                }

                rsItem.close();
                psItem.close();

                orders.add(new Order(orderId, userId, orderDate, status, items));
            }

            rsOrder.close();
            psOrder.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
    public boolean updateOrderStatus(int orderId, String newStatus) {
        String sql = "UPDATE orders SET orderStatus = ? WHERE orderId = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


}