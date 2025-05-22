package com.infobookmart.controller.dao;

import com.infobookmart.controller.database.DatabaseConnection;
import com.infobookmart.model.User;

import java.sql.*;

public class UserDAO {

    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (email, firstName, lastName, userName, role, accountStatus, "
                   + "dateOfBirth, password, registerDate, profileImg, contactNo, gender, address) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getFirstName());
            stmt.setString(3, user.getLastName());
            stmt.setString(4, user.getUserName());
            stmt.setString(5, user.getRole());
            stmt.setString(6, user.getAccountStatus());
            stmt.setDate(7, new java.sql.Date(user.getDateOfBirth().getTime()));
            stmt.setString(8, user.getPassword());
            stmt.setDate(9, new java.sql.Date(user.getRegisterDate().getTime()));
            stmt.setString(10, user.getProfileImg());
            stmt.setString(11, user.getContactNo());
            stmt.setString(12, user.getGender());
            stmt.setString(13, user.getAddress());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User loginUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setEmail(rs.getString("email"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setUserName(rs.getString("userName"));
                user.setRole(rs.getString("role"));
                user.setAccountStatus(rs.getString("accountStatus"));
                user.setDateOfBirth(rs.getDate("dateOfBirth"));
                user.setPassword(rs.getString("password"));
                user.setRegisterDate(rs.getDate("registerDate"));
                user.setProfileImg(rs.getString("profileImg"));
                user.setContactNo(rs.getString("contactNo"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Check if a user with the given email already exists.
     * @param email the email to check
     * @return true if email is found in users table, false otherwise
     */
    public boolean emailExists(String email) {
        String sql = "SELECT 1 FROM users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            // In case of error assume it exists to prevent duplicate
            return true;
        }
    }
    
    public boolean updateUser(User user) {
        String sql = "UPDATE users SET firstName = ?, lastName = ?, userName = ?, email = ?, " +
                     "dateOfBirth = ?, contactNo = ?, gender = ?, address = ?, profileImg = ? WHERE userId = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getUserName());
            stmt.setString(4, user.getEmail());
            stmt.setDate(5, new java.sql.Date(user.getDateOfBirth().getTime())); // Convert to java.sql.Date
            stmt.setString(6, user.getContactNo());
            stmt.setString(7, user.getGender());
            stmt.setString(8, user.getAddress());
            stmt.setString(9, user.getProfileImg());
            stmt.setInt(10, user.getUserId());


            return stmt.executeUpdate() > 0;



        } catch (SQLException e) {

            e.printStackTrace();

            return false;

        }
       
    }
}
