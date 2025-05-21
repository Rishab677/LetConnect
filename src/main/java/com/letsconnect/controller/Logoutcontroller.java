package com.letsconnect.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/logout")
public class Logoutcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the session
        HttpSession session = request.getSession(false);

        // If the session exists, invalidate it
        if (session != null) {
            session.invalidate();
        }

  
        response.sendRedirect(request.getContextPath() + "/login");
    }
}
