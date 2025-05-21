package com.letsconnect.service;

import com.letsconnect.model.Product;
import com.letsconnect.model.Cart;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductService {

    private static final String DB_URL = "jdbc:mysql://localhost:3316/lets_connect";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    
    public boolean addProduct(Product product) throws SQLException {
        if (product == null) return false;

        String sql = "INSERT INTO product (product_name, product_brand, product_price, product_specifications, product_image) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, product.getProduct_name());
            ps.setString(2, product.getBrand());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getSpecifications());
            ps.setString(5, product.getImagePath());

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                return false;
            }

        
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    product.setId(generatedKeys.getInt(1));
                }
            }

            return true;
        }
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("product_name"),
                        rs.getString("product_brand"),
                        rs.getDouble("product_price"),
                        rs.getString("product_specifications"),
                        rs.getString("product_image")
                );
                products.add(product);
            }
        }
        return products;
    }

    public Product getProductById(int productId) throws SQLException {
        if (productId <= 0) return null;

        String sql = "SELECT * FROM product WHERE ProductID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getInt("ProductID"),
                            rs.getString("product_name"),
                            rs.getString("product_brand"),
                            rs.getDouble("product_price"),
                            rs.getString("product_specifications"),
                            rs.getString("product_image")
                    );
                }
            }
        }
        return null;
    }

    public boolean updateProduct(Product product) throws SQLException {
        if (product == null || product.getId() <= 0) return false;

        String sql = "UPDATE product SET product_name = ?, product_brand = ?, product_price = ?, product_specifications = ?, product_image = ? WHERE ProductID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, product.getProduct_name());
            ps.setString(2, product.getBrand());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getSpecifications());
            ps.setString(5, product.getImagePath());
            ps.setInt(6, product.getId());

            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteProduct(int productId) throws SQLException {
        if (productId <= 0) return false;

        if (!productExists(productId)) {
            System.out.println("Product with ID " + productId + " does not exist.");
            return false;
        }

        String sql = "DELETE FROM product WHERE ProductID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean productExists(int productId) throws SQLException {
        if (productId <= 0) return false;

        String sql = "SELECT 1 FROM product WHERE ProductID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public List<Product> searchProducts(String searchTerm) throws SQLException {
        if (searchTerm == null || searchTerm.trim().isEmpty()) {
            return getAllProducts(); // Return all if no search term
        }

        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE product_name LIKE ? OR product_brand LIKE ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String pattern = "%" + searchTerm.trim() + "%";
            ps.setString(1, pattern);
            ps.setString(2, pattern);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(new Product(
                            rs.getInt("ProductID"),
                            rs.getString("product_name"),
                            rs.getString("product_brand"),
                            rs.getDouble("product_price"),
                            rs.getString("product_specifications"),
                            rs.getString("product_image")
                    ));
                }
            }
        }
        return products;
    }

    public List<Cart> addToCart(List<Cart> cart, int productId) throws SQLException {
        if (cart == null) cart = new ArrayList<>();

        Product product = getProductById(productId);

        if (product != null) {
            boolean found = false;

            for (Cart item : cart) {
                if (item.getProduct().getId() == productId) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }

            if (!found) {
                cart.add(new Cart(product, 1));
            }
        }

        return cart;
    }

    public void clearCart(List<Cart> cart) {
        if (cart != null) {
            cart.clear();
        }
    }
}