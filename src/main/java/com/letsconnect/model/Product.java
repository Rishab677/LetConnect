package com.letsconnect.model;

/**
 * Represents a product in the mobile store inventory.
 */
public class Product {
    private int id;
    private String product_name; // Product name field
    private String brand;
    private double price;
    private String specifications;
    private String imagePath;

    


    public Product(int id, String product_name, String brand, double price, String specifications, String imagePath) {
        this.id = id;
        this.product_name = product_name;
        this.brand = brand;
        this.price = price;
        this.specifications = specifications;
        this.imagePath = imagePath;
    }


    public Product(String product_name, String brand, double price, String specifications, String imagePath) {
        this.product_name = product_name;
        this.brand = brand;
        this.price = price;
        this.specifications = specifications;
        this.imagePath = imagePath;
    }


    public int getId() {
        return id;
    }

    public String getProduct_name() {
        return product_name;
    }

    
    public String getName() {
        return product_name;
    }

    public String getBrand() {
        return brand;
    }

    public double getPrice() {
        return price;
    }

    public String getSpecifications() {
        return specifications;
    }

    public String getImagePath() {
        return imagePath;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

  
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", product_name='" + product_name + '\'' +
                ", brand='" + brand + '\'' +
                ", price=" + price +
                ", specifications='" + specifications + '\'' +
                ", imagePath='" + imagePath + '\'' +
                '}';
    }
}
