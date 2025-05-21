// com.letsconnect.controller.RemoveCartItemServlet.java
package com.letsconnect.controller;

import com.letsconnect.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/remove-cart-item")
public class RemoveCartItemController extends HttpServlet {
    @SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));

        HttpSession session = request.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(item -> item.getProduct().getId() == productId);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
