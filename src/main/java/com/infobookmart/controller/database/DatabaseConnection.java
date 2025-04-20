package com.infobookmart.controller.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    private static final String DATABASENAME = "infobookmart";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/" + DATABASENAME;
            conn = DriverManager.getConnection(url, USERNAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
