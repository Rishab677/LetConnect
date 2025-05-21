package com.letsconnect.service;

import com.letsconnect.model.Delivery;
import java.sql.*;

public class DeliveryService {
    private Connection connection;

    public DeliveryService(Connection connection) {
        this.connection = connection;
    }

    public void addDelivery(Delivery delivery) throws SQLException {
        String sql = "INSERT INTO delivery (DeliveryID, delivery_agency, delivery_state, delivery_location) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, delivery.getDeliveryID());
            stmt.setString(2, delivery.getDeliveryAgency());
            stmt.setString(3, delivery.getDeliveryState());
            stmt.setString(4, delivery.getDeliveryLocation());
            stmt.executeUpdate();
        }
    }
}
