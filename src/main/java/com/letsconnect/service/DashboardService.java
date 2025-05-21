package com.letsconnect.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.letsconnect.configure.DbConfig;

public class DashboardService {

    public static int getTotalProducts() {
        int count = 0;
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM product");
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static int getTotalUsers() {
        int count = 0;
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM users");
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}