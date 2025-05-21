// com.letsconnect.controller.ViewCartServlet.java
package com.letsconnect.controller;

import com.letsconnect.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class ViewcartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            request.setAttribute("message", "Your cart is empty.");
        } else {
            request.setAttribute("cartItems", cart);
        }

        request.getRequestDispatcher("/WEB-INF/Pages/Cart.jsp").forward(request, response);
    }
}
