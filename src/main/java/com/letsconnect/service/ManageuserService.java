

package com.letsconnect.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.letsconnect.model.User;
import com.letsconnect.configure.DbConfig;

public class ManageuserService {

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();

        try (Connection con = DbConfig.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM users")) {

            while (rs.next()) {
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
                user.setRole(rs.getString("role"));

                System.out.println("[DEBUG] Loaded user: " + user.getUsername()); // Optional: for debugging

                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    public boolean deleteUserById(int id) {
        try (Connection con = DbConfig.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id = ?")) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}