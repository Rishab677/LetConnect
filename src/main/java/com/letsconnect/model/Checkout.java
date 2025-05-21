package com.letsconnect.model;

public class Checkout {
    private int orderID;
    private int quantity;
    private double totalPrice;
    private String location;
    private String deliveryID;
    private String paymentID;

    // Constructors, getters, and setters
    public Checkout(int quantity, double totalPrice, String location, String deliveryID, String paymentID) {
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.location = location;
        this.deliveryID = deliveryID;
        this.paymentID = paymentID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDeliveryID() {
        return deliveryID;
    }

    public void setDeliveryID(String deliveryID) {
        this.deliveryID = deliveryID;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }
}
