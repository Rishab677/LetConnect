package com.letsconnect.model;

public class Delivery {
    private String deliveryID;
    private String deliveryAgency;
    private String deliveryState;
    private String deliveryLocation;

    public Delivery(String deliveryID, String deliveryAgency, String deliveryState, String deliveryLocation) {
        this.deliveryID = deliveryID;
        this.deliveryAgency = deliveryAgency;
        this.deliveryState = deliveryState;
        this.deliveryLocation = deliveryLocation;
    }

    public String getDeliveryID() { return deliveryID; }
    public String getDeliveryAgency() { return deliveryAgency; }
    public String getDeliveryState() { return deliveryState; }
    public String getDeliveryLocation() { return deliveryLocation; }
}
