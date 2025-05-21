package com.letsconnect.service;

import com.letsconnect.model.Payment;
import java.sql.*;

public class PaymentService {
    private Connection connection;

    public PaymentService(Connection connection) {
        this.connection = connection;
    }

    public void addPayment(Payment payment) throws SQLException {
        String sql = "INSERT INTO Payment (PaymentID, Payment_method, payment_Invoice, payment_verification) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, payment.getPaymentID());
            stmt.setString(2, payment.getPaymentMethod());
            stmt.setString(3, payment.getPaymentInvoice());
            stmt.setString(4, payment.getPaymentVerification());
            stmt.executeUpdate();
        }
    }
}
