package com.letsconnect.model;

public class Order {
    private String orderID;
    private int quantity;
    private double totalPrice;
    private String location;
    private String deliveryID;
    private String paymentID;

    public Order(String orderID, int quantity, double totalPrice, String location, String deliveryID, String paymentID) {
        this.orderID = orderID;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.location = location;
        this.deliveryID = deliveryID;
        this.paymentID = paymentID;
    }

    public String getOrderID() { return orderID; }
    public int getQuantity() { return quantity; }
    public double getTotalPrice() { return totalPrice; }
    public String getLocation() { return location; }
    public String getDeliveryID() { return deliveryID; }
    public String getPaymentID() { return paymentID; }
}
