package com.letsconnect.service;

import com.letsconnect.model.Order;
import java.sql.*;

public class OrderService {
    private Connection connection;

    public OrderService(Connection connection) {
        this.connection = connection;
    }

    public void addOrder(Order order) throws SQLException {
        String sql = "INSERT INTO Orders (OrderID, Quantity, Total_price, location, deliveryID, paymentID) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, order.getOrderID());
            stmt.setInt(2, order.getQuantity());
            stmt.setDouble(3, order.getTotalPrice());
            stmt.setString(4, order.getLocation());
            stmt.setString(5, order.getDeliveryID());
            stmt.setString(6, order.getPaymentID());
            stmt.executeUpdate();
        }
    }
}
