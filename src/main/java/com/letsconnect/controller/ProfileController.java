package com.letsconnect.controller;

import com.letsconnect.model.User;
import com.letsconnect.service.loginservice;
import com.letsconnect.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final loginservice loginService = new loginservice();
    private static final Logger logger = Logger.getLogger(ProfileController.class.getName());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = (String) SessionUtil.getAttribute(req, "username");

        if (username == null) {
            // No user in session, redirect to login
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Fetch latest user info from DB
        User user = loginService.getUserByUsername(username);
        

        if (user != null) {
            logger.info("User details fetched: " + user.getUsername());
            req.setAttribute("user", user);
            req.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(req, resp);
        } else {
            logger.warning("No user found with username: " + username);
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }
}
