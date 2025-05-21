
package com.letsconnect.controller;

import com.letsconnect.service.ManageuserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteUser")
public class DeleteuserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ManageuserService userService;

    @Override
    public void init() {
        userService = new ManageuserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                boolean deleted = userService.deleteUserById(id);
                if (!deleted) {
                    System.err.println("[WARN] User with ID " + id + " not found or could not be deleted.");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        // Redirect to the user management page (must match your listing servlet)
        response.sendRedirect(request.getContextPath() + "/ManageUser");
    }
}