package com.infobookmart.controller.dao;

import com.infobookmart.controller.database.DatabaseConnection;
import com.infobookmart.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminUserDAO {

    public static int addUser(User user) {
        int status = 0;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO users (email, firstName, lastName, userName, password, role, accountStatus, dateOfBirth, registerDate, profileImg, contactNo, gender, address) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getUserName());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getRole());
            ps.setString(7, user.getAccountStatus());
            ps.setDate(8, new Date(user.getDateOfBirth().getTime()));
            ps.setDate(9, new Date(user.getRegisterDate().getTime()));
            ps.setString(10, user.getProfileImg());
            ps.setString(11, user.getContactNo());
            ps.setString(12, user.getGender());
            ps.setString(13, user.getAddress());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                User user = extractUser(rs);
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public static User getUserById(int id) {
        User user = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE userId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = extractUser(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static int updateUser(User user) {
        int status = 0;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE users SET email=?, firstName=?, lastName=?, userName=?, password=?, role=?, accountStatus=?, dateOfBirth=?, profileImg=?, contactNo=?, gender=?, address=? WHERE userId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getUserName());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getRole());
            ps.setString(7, user.getAccountStatus());
            ps.setDate(8, new Date(user.getDateOfBirth().getTime()));
            ps.setString(9, user.getProfileImg());
            ps.setString(10, user.getContactNo());
            ps.setString(11, user.getGender());
            ps.setString(12, user.getAddress());
            ps.setInt(13, user.getUserId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int deleteUser(int id) {
        int status = 0;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM users WHERE userId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    private static User extractUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("userId"));
        user.setEmail(rs.getString("email"));
        user.setFirstName(rs.getString("firstName"));
        user.setLastName(rs.getString("lastName"));
        user.setUserName(rs.getString("userName"));
        user.setPassword(rs.getString("password"));
        user.setRole(rs.getString("role"));
        user.setAccountStatus(rs.getString("accountStatus"));
        user.setDateOfBirth(rs.getDate("dateOfBirth"));
        user.setRegisterDate(rs.getDate("registerDate"));
        user.setProfileImg(rs.getString("profileImg"));
        user.setContactNo(rs.getString("contactNo"));
        user.setGender(rs.getString("gender"));
        user.setAddress(rs.getString("address"));
        return user;
    }
}