package com.letsconnect.service;

import java.sql.*;

public class CheckoutServices {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/lets_connect";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public void placeOrder(int quantity, double totalPrice, String location,
                           String deliveryAgency, String deliveryState, String deliveryLocation,
                           String paymentMethod, String paymentInvoice, String paymentVerification)
            throws SQLException, ClassNotFoundException {

        Connection conn = null;
        PreparedStatement psDelivery = null;
        PreparedStatement psPayment = null;
        PreparedStatement psOrder = null;
        ResultSet rsDelivery = null;
        ResultSet rsPayment = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            conn.setAutoCommit(false);

            // Insert into Delivery
            String sqlDelivery = "INSERT INTO Delivery (delivery_agency, delivery_state, delivery_location) VALUES (?, ?, ?)";
            psDelivery = conn.prepareStatement(sqlDelivery, Statement.RETURN_GENERATED_KEYS);
            psDelivery.setString(1, deliveryAgency);
            psDelivery.setString(2, deliveryState);
            psDelivery.setString(3, deliveryLocation);
            psDelivery.executeUpdate();

            rsDelivery = psDelivery.getGeneratedKeys();
            int deliveryID = -1;
            if (rsDelivery.next()) {
                deliveryID = rsDelivery.getInt(1);
            }

            // Insert into Payment
            String sqlPayment = "INSERT INTO Payment (Payment_method, payment_Invoice, payment_verification) VALUES (?, ?, ?)";
            psPayment = conn.prepareStatement(sqlPayment, Statement.RETURN_GENERATED_KEYS);
            psPayment.setString(1, paymentMethod);
            psPayment.setString(2, paymentInvoice);
            psPayment.setString(3, paymentVerification);
            psPayment.executeUpdate();

            rsPayment = psPayment.getGeneratedKeys();
            int paymentID = -1;
            if (rsPayment.next()) {
                paymentID = rsPayment.getInt(1);
            }

            // Insert into Order
            String sqlOrder = "INSERT INTO `Order` (Quantity, Total_price, location, DeliveryID, PaymentID) VALUES (?, ?, ?, ?, ?)";
            psOrder = conn.prepareStatement(sqlOrder);
            psOrder.setInt(1, quantity);
            psOrder.setDouble(2, totalPrice);
            psOrder.setString(3, location);
            psOrder.setInt(4, deliveryID);
            psOrder.setInt(5, paymentID);
            psOrder.executeUpdate();

            conn.commit();

        } catch (SQLException e) {
            if (conn != null) conn.rollback();
            throw e;
        } finally {
            if (rsDelivery != null) rsDelivery.close();
            if (rsPayment != null) rsPayment.close();
            if (psDelivery != null) psDelivery.close();
            if (psPayment != null) psPayment.close();
            if (psOrder != null) psOrder.close();
            if (conn != null) conn.close();
        }
    }
}