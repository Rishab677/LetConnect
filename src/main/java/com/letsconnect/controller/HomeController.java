package com.letsconnect.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.letsconnect.model.Product;
import com.letsconnect.model.User;
import com.letsconnect.service.ProductService;
import com.letsconnect.service.loginservice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/home", "/" })
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final loginservice loginService = new loginservice();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // false avoids creating a new session
        String username = (session != null) ? (String) session.getAttribute("username") : null;

        // If user is not logged in, redirect to login page
        if (username == null || username.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Fetch user details
            User user = loginService.getUserByUsername(username);
            request.setAttribute("user", user);

            // Get the search query from request (if any)
            String searchTerm = request.getParameter("searchTerm");

            List<Product> products;
            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                // Perform search
                products = productService.searchProducts(searchTerm);
                if (products.isEmpty()) {
                    request.setAttribute("message", "No products found matching your search.");
                }
            } else {
                // If no search term, get all products
                products = productService.getAllProducts();
                if (products.isEmpty()) {
                    request.setAttribute("message", "No products available at the moment.");
                }
            }

            // Set the products in request attributes
            request.setAttribute("products", products);

            // Forward to Home.jsp
            request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Internal server error occurred.");
            request.getRequestDispatcher("/WEB-INF/Pages/Error.jsp").forward(request, response);
        }
    }
}
