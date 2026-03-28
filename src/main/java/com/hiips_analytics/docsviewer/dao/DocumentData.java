package com.hiips_analytics.docsviewer.dao;

import java.io.File;
import java.sql.*;
import java.util.*;
import com.hiips_analytics.docsviewer.model.Document;

public class DocumentData {
	
	// 
	public static List<Document> getTous() {
        List<Document> liste = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM documents")) {
            
            while (rs.next()) {
                liste.add(new Document(
                    rs.getInt("id"), 
                    rs.getString("titre"), 
                    rs.getString("auteur"), 
                    rs.getString("contenu"),
                    rs.getString("nom_fichier")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }
	
	public static void ajouter(Document d) {
        String sql = "INSERT INTO documents (titre, auteur, contenu, nom_fichier) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, d.getTitre());
            ps.setString(2, d.getAuteur());
            ps.setString(3, d.getContenu());
            ps.setString(4, d.getNomFichier());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
	
	public static void supprimer(int id, String uploadPath) {
		// 1. Trouver le nom du fichier avant de supprimer la ligne
	    Document doc = trouverParId(id);
	    
	    if (doc != null) {
	        // 2. Supprimer la ligne dans MySQL
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement("DELETE FROM documents WHERE id = ?")) {
	            ps.setInt(1, id);
	            ps.executeUpdate();
	            
	            // 3. Supprimer le fichier physique si le nom existe
	            if (doc.getNomFichier() != null && !doc.getNomFichier().isEmpty()) {
	                File fichierPhysique = new File(uploadPath + doc.getNomFichier());
	                if (fichierPhysique.exists()) {
	                    fichierPhysique.delete(); // Suppression réelle sur le disque
	                    System.out.println("Fichier supprimé : " + doc.getNomFichier());
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
    }
	
	public static void modifier(Document d) {
	    String sql = "UPDATE documents SET titre = ?, auteur = ?, contenu = ? WHERE id = ?";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setString(1, d.getTitre());
	        ps.setString(2, d.getAuteur());
	        ps.setString(3, d.getContenu());
	        ps.setInt(4, d.getId()); // On cible la ligne grâce à l'ID
	        
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public static Document trouverParId(int id) {
	    Document doc = null;
	    String sql = "SELECT * FROM documents WHERE id = ?";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setInt(1, id);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                doc = new Document(
	                    rs.getInt("id"),
	                    rs.getString("titre"),
	                    rs.getString("auteur"),
	                    rs.getString("contenu"),
	                    rs.getString("nom_fichier")
	                );
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return doc;
	}
}
