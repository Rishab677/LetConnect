package com.letsconnect.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.letsconnect.configure.DbConfig;

public class CartService {

    // Method to add item to cart with userId and productId only
    public void addCartItem(int userId, int productId) throws SQLException {
        String sql = "INSERT INTO cart (UserID, ProductID) VALUES (?, ?)";

        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, productId);

            stmt.executeUpdate();
        }
    }

    // Optional: delete cart items by user
    public void deleteCartItemsByUser(int userId) throws SQLException {
        String query = "DELETE FROM cart WHERE UserID = ?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        }
    }
}
