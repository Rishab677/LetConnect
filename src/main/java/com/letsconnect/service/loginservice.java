package com.letsconnect.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.letsconnect.model.User;
import com.letsconnect.configure.DbConfig;

public class loginservice {

    // Validates user credentials
    public boolean loginUser(User user) {
        String query = "SELECT password FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DbConfig.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());

            ResultSet rs = stmt.executeQuery();

            return rs.next(); // Returns true if user exists with matching password

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public User getUserByUsername(String username) {
        String query = "SELECT id, first_name, last_name, email, phone, gender, username, province, city, profile_photo, role FROM users WHERE username = ?";

        try (Connection conn = DbConfig.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));   
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setUsername(rs.getString("username"));
                user.setProvince(rs.getString("province"));
                user.setCity(rs.getString("city"));
                user.setProfilePhoto(rs.getString("profile_photo"));
                user.setRole(rs.getString("role"));
                return user;
            } else {
                System.out.println("User not found with username: " + username);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

}
