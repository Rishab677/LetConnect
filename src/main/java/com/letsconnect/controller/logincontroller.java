package com.letsconnect.controller;

import java.io.IOException;

import com.letsconnect.model.User;
import com.letsconnect.service.loginservice;
import com.letsconnect.util.CookieUtil;
import com.letsconnect.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class logincontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final loginservice loginService = new loginservice();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            req.setAttribute("error", "Please fill in both username and password.");
            req.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(req, resp);
            return;
        }

        username = username.trim();
        password = password.trim();

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        boolean isValidUser = loginService.loginUser(user);

        if (isValidUser) {
            User fullUser = loginService.getUserByUsername(username);
            String role = fullUser.getRole();
            int userId = fullUser.getId();  

            
            SessionUtil.setAttribute(req, "username", username);
            SessionUtil.setAttribute(req, "role", role);
            SessionUtil.setAttribute(req, "userID", userId); 

     
            CookieUtil.addCookie(resp, "role", role, 5 * 30);

          
            if ("admin".equalsIgnoreCase(role)) {
                resp.sendRedirect(req.getContextPath() + "/admin");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }

        } else {
            req.setAttribute("error", "Invalid username or password.");
            req.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(req, resp);
        }
    }
}
