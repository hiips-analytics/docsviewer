package com.hiips_analytics.docsviewer.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/docsviewer_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PWD = ""; // Par défaut sur Laragon, c'est vide
    
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PWD);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
