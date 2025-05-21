package com.letsconnect.controller;

import com.letsconnect.model.Product;
import com.letsconnect.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/productdetails")
public class ProductDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final ProductService productService = new ProductService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productIdStr = request.getParameter("productId");

		if (productIdStr == null || productIdStr.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}

		try {
			int productId = Integer.parseInt(productIdStr);
			Product product = productService.getProductById(productId);

			if (product != null) {
				request.setAttribute("product", product);
				request.getRequestDispatcher("/WEB-INF/Pages/ProductDetails.jsp").forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/home"); 
			}
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/home"); 
		}
	}
}
