package com.letsconnect.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AboutusController
 */
@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ContactUs() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forwarding to the about.jsp page
    	request.getRequestDispatcher("/WEB-INF/Pages/ContactUs.jsp").forward(request, response);
    }
}
