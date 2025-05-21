package com.letsconnect.controller;

import com.letsconnect.service.CheckoutServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("CheckoutController: Received GET request.");
        req.getRequestDispatcher("/WEB-INF/Pages/Checkout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("CheckoutController: Received POST request.");

        try {
            // Order details
            String qtyParam = req.getParameter("quantity");
            String priceParam = req.getParameter("totalPrice");
            String location = req.getParameter("location");

            // Delivery details
            String deliveryAgency = req.getParameter("delivery_agency");
            String deliveryState = req.getParameter("delivery_state");
            String deliveryLocation = req.getParameter("delivery_location");

            // Payment details
            String paymentMethod = req.getParameter("payment_method");
            String paymentInvoice = req.getParameter("payment_invoice");
            String paymentVerification = req.getParameter("payment_verification");

         

            // Input validation
            if (qtyParam == null || priceParam == null || location == null ||
                deliveryAgency == null || deliveryState == null || deliveryLocation == null ||
                paymentMethod == null || paymentInvoice == null || paymentVerification == null) {
                req.setAttribute("error", "Missing required fields.");
         
                req.getRequestDispatcher("/WEB-INF/Pages/Checkout.jsp").forward(req, resp);
                return;
            }

            int quantity = Integer.parseInt(qtyParam);
            double totalPrice = Double.parseDouble(priceParam);

            System.out.println("Parsed Quantity: " + quantity);
            System.out.println("Parsed Total Price: " + totalPrice);

            CheckoutServices service = new CheckoutServices();

  
            service.placeOrder(quantity, totalPrice, location,
                    deliveryAgency, deliveryState, deliveryLocation,
                    paymentMethod, paymentInvoice, paymentVerification);
            
            // Clear cart
            HttpSession session = req.getSession();
            session.removeAttribute("cart");
            

            req.setAttribute("message", "Order placed successfully!");
            req.getRequestDispatcher("/WEB-INF/Pages/Checkout.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            System.out.println("NumberFormatException: " + e.getMessage());
            req.setAttribute("error", "Quantity and Price must be numbers.");
            req.getRequestDispatcher("/WEB-INF/Pages/Checkout.jsp").forward(req, resp);

        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("SQLException/ClassNotFoundException: " + e.getMessage());
            e.printStackTrace(); // Full stack trace for deeper inspection
            req.setAttribute("error", "Database error occurred: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/Pages/Checkout.jsp").forward(req, resp);
        }
    }
}