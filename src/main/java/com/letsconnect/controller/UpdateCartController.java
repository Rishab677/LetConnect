// com.letsconnect.controller.UpdateCartServlet.java
package com.letsconnect.controller;

import com.letsconnect.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/update-cart")
public class UpdateCartController extends HttpServlet {
    @SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        if (cart != null) {
            for (Cart item : cart) {
                if (item.getProduct().getId() == productId) {
                    if (quantity <= 0) {
                        cart.remove(item); // remove item if qty <= 0
                    } else {
                        item.setQuantity(quantity);
                    }
                    break;
                }
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
