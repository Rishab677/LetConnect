package com.letsconnect.model;

public class Payment {
    private String paymentID;
    private String paymentMethod;
    private String paymentInvoice;
    private String paymentVerification;

    public Payment(String paymentID, String paymentMethod, String paymentInvoice, String paymentVerification) {
        this.paymentID = paymentID;
        this.paymentMethod = paymentMethod;
        this.paymentInvoice = paymentInvoice;
        this.paymentVerification = paymentVerification;
    }

    public String getPaymentID() { return paymentID; }
    public String getPaymentMethod() { return paymentMethod; }
    public String getPaymentInvoice() { return paymentInvoice; }
    public String getPaymentVerification() { return paymentVerification; }
}
