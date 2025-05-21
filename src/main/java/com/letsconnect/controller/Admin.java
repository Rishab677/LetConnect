package com.letsconnect.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.letsconnect.service.DashboardService;

import java.io.IOException;


@WebServlet("/admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Admin() {
		super();
	}

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int totalProducts = DashboardService.getTotalProducts();
        int totalUsers = DashboardService.getTotalUsers();

        req.setAttribute("totalProducts", totalProducts);
        req.setAttribute("totalUsers", totalUsers);

        req.getRequestDispatcher("/WEB-INF/Pages/Admin.jsp").forward(req, resp);
    }
}
