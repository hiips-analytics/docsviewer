package com.hiips_analytics.docsviewer.dao;

import java.sql.*;
import java.util.*;

import com.hiips_analytics.docsviewer.model.User;

public class UserData {
	public static List<User> getTous() {
        List<User> liste = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM users")) {
            
            while (rs.next()) {
                liste.add(new User(
                    rs.getInt("id"), 
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }
	
	public static void ajouter(User u) {
        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
	
	public static void supprimer(int id) {
        String sql = "DELETE FROM users WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
        	ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
	
	public static void modifier(User u) {
	    String sql = "UPDATE users SET name = ?, email = ?, password = ? WHERE id = ?";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setString(1, u.getName());
	        ps.setString(2, u.getEmail());
	        ps.setString(3, u.getPassword());
	        ps.setInt(4, u.getId()); // On cible la ligne grâce à l'ID
	        
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public static User trouverParId(int id) {
	    User usr = null;
	    String sql = "SELECT * FROM users WHERE id = ?";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setInt(1, id);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                usr = new User(
	                    rs.getInt("id"),
	                    rs.getString("name"),
	                    rs.getString("email"),
	                    rs.getString("password")
	                );
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return usr;
	}

}
