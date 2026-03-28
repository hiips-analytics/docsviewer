package com.hiips_analytics.docsviewer.dao;

import java.sql.*;
import java.util.*;
import com.hiips_analytics.docsviewer.model.Category;

public class CategoryData {
	public static List<Category> getTous() {
        List<Category> liste = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM categories")) {
            
            while (rs.next()) {
                liste.add(new Category(
                    rs.getInt("id"), 
                    rs.getString("name"), 
                    rs.getInt("nb_docs")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }
	
	public static void ajouter(Category c) {
        String sql = "INSERT INTO categories (name) VALUES (?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getName());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
	
	public static void supprimer(int id) {
        String sql = "DELETE FROM categories WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
        	ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
	
	public static void modifier(Category c) {
	    String sql = "UPDATE categories SET name = ? WHERE id = ?";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setString(1, c.getName());
	        ps.setInt(2, c.getId()); // On cible la ligne grâce à l'ID
	        
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public static Category trouverParId(int id) {
	    Category cat = null;
	    String sql = "SELECT * FROM categories WHERE id = ?";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setInt(1, id);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                cat = new Category(
	                    rs.getInt("id"),
	                    rs.getString("name"),
	                    rs.getInt("nb_docs")
	                );
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cat;
	}

}
