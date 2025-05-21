package com.letsconnect.controller;

import com.letsconnect.model.User;
import com.letsconnect.service.RegisterService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/registration")
@MultipartConfig(maxFileSize = 2097152) // 2MB
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// POST: Handle registration form submission
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = extractUserFromRequest(req);
		setFormAttributes(req, user);

		String validationError = validateUser(user);
		if (validationError != null) {
			handleError(req, resp, validationError);
			return;
		}

		RegisterService registerService = new RegisterService();
		boolean exists = registerService.userExists(user.getUsername(), user.getEmail());

		if (exists) {
			handleError(req, resp, "Username or Email already exists. Please use a different one.");
			return;
		}

		boolean isAdded = registerService.registerUser(user);
		if (isAdded) {
			handleSuccess(req, resp, "Your account has been successfully created!", "/WEB-INF/Pages/Login.jsp");
		} else {
			handleError(req, resp, "Could not register your account. Please try again later.");
		}
	}

	// GET: Show registration page
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/Pages/Register.jsp").forward(req, resp);
	}

	/**
	 * Extracts user data and profile image from the request.
	 */
	private User extractUserFromRequest(HttpServletRequest req) throws IOException, ServletException {
		User user = new User();
		user.setFirstName(req.getParameter("firstName"));
		user.setLastName(req.getParameter("lastName"));
		user.setEmail(req.getParameter("email"));
		user.setPhone(req.getParameter("phone"));
		user.setGender(req.getParameter("gender"));
		user.setUsername(req.getParameter("username"));
		user.setProvince(req.getParameter("province"));
		user.setCity(req.getParameter("city"));
		user.setPassword(req.getParameter("password"));

		Part filePart = req.getPart("ProfilePhoto");
		if (filePart != null && filePart.getSize() > 0) {
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

			// Get absolute path of the webapp deployed folder
			String uploadPath = getServletContext().getRealPath("") + File.separator + "Resources" + File.separator
					+ "Image" + File.separator + "profiles";
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			// Write file to the destination folder
			filePart.write(uploadPath + File.separator + fileName);

			// Save relative path to user object to store in DB
			String profilePhotoPath = "Resources/Image" + fileName;
			user.setProfilePhoto(profilePhotoPath);
		} else {
			// No file uploaded, set null or default path
			user.setProfilePhoto(null);
		}
		return user;

	}

	/**
	 * Validates user input.
	 */
	private String validateUser(User user) {
		if (user.getFirstName() == null || user.getFirstName().trim().isEmpty())
			return "First name is required.";
		if (user.getLastName() == null || user.getLastName().trim().isEmpty())
			return "Last name is required.";
		if (user.getEmail() == null || !user.getEmail().matches("^\\S+@\\S+\\.\\S+$"))
			return "A valid email is required.";
		if (user.getGender() == null || user.getGender().trim().isEmpty())
			return "Gender is required.";
		if (user.getUsername() == null || user.getUsername().trim().isEmpty())
			return "Username is required.";
		if (user.getProvince() == null || user.getProvince().trim().isEmpty())
			return "Province is required.";
		if (user.getCity() == null || user.getCity().trim().isEmpty())
			return "City is required.";
		if (user.getPassword() == null || user.getPassword().length() < 6)
			return "Password must be at least 6 characters.";
		return null;
	}

	/**
	 * Sets form field values back to request so user doesn't lose input on error.
	 */
	private void setFormAttributes(HttpServletRequest req, User user) {
		req.setAttribute("firstName", user.getFirstName());
		req.setAttribute("lastName", user.getLastName());
		req.setAttribute("email", user.getEmail());
		req.setAttribute("phone", user.getPhone());
		req.setAttribute("gender", user.getGender());
		req.setAttribute("username", user.getUsername());
		req.setAttribute("province", user.getProvince());
		req.setAttribute("city", user.getCity());
	}

	/**
	 * Handles successful registration.
	 */
	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
			throws ServletException, IOException {
		req.getSession().setAttribute("successMessage", message);
		req.getRequestDispatcher(redirectPage).forward(req, resp);
	}

	/**
	 * Handles error and redirects to the registration page.
	 */
	private void handleError(HttpServletRequest req, HttpServletResponse resp, String errorMessage)
			throws ServletException, IOException {
		req.setAttribute("errorMessage", errorMessage);
		req.getRequestDispatcher("/WEB-INF/Pages/Register.jsp").forward(req, resp);
	}
}
