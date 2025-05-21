
package com.letsconnect.controller;

import com.letsconnect.service.ManageuserService;

import com.letsconnect.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/ManageUser")
public class Manageuser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ManageuserService userService;

    @Override
    public void init() {
        userService = new ManageuserService();
     
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  

        List<User> userList = userService.getAllUsers();



        request.setAttribute("user", userList);
        request.getRequestDispatcher("/WEB-INF/Pages/ManageUser.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.sendRedirect(request.getContextPath() + "/ManageUser");
    }
}