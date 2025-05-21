package com.letsconnect.controller;

import com.letsconnect.model.Product;
import com.letsconnect.model.Cart;
import com.letsconnect.service.ProductService;
import com.letsconnect.service.CartService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/add-to-cart")
public class AddtocartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProductService productService = new ProductService();
    private final CartService cartService = new CartService();

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get product ID from request
        String productIdStr = request.getParameter("productId");
        int productId;

        try {
            productId = Integer.parseInt(productIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/errorPage");
            return;
        }

        // Get user ID from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (Integer) session.getAttribute("userID");

        // Debug print
        System.out.println("User ID from session: " + userId);

        // Retrieve product details
        Product product;
        try {
            product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/errorPage");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/errorPage");
            return;
        }

        // Get or create cart list from session
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Check if the product already exists in cart
        boolean found = false;
        for (Cart item : cart) {
            if (item.getProduct().getId() == productId) {
                item.setQuantity(item.getQuantity() + 1);
                found = true;
                break;
            }
        }

        // If product not found, add it to cart list
        if (!found) {
            cart.add(new Cart(product, 1));
        }

        // Save cart in session
        session.setAttribute("cart", cart);

        // Save to DB: call with userId and productId only (no orderId)
        try {
            cartService.addCartItem(userId, productId);  // userId and productId only
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect to cart page
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
