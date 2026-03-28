package com.hiips_analytics.docsviewer.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import com.hiips_analytics.docsviewer.model.Document;
import com.hiips_analytics.docsviewer.dao.DocumentData;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,       // 10 MB
    maxRequestSize = 1024 * 1024 * 100    // 100 MB
)
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action"); 
	    String page = request.getParameter("page");     

	    // 1. Gestion des actions (Delete / Edit)
	    String idParam = request.getParameter("id");
	    if (idParam != null && !idParam.isEmpty()) {
	        try {
	            int id = Integer.parseInt(idParam);
	            if ("delete".equals(action)) {
	                DocumentData.supprimer(id, "C:/uploads_docsviewer/");
	                response.sendRedirect("admin?page=list");
	                return;
	            } else if ("edit".equals(action)) {
	                request.setAttribute("doc", DocumentData.trouverParId(id));
	                request.getRequestDispatcher("modifier.jsp").forward(request, response);
	                return;
	            }
	        } catch (NumberFormatException e) {
	            // Optionnel : log l'erreur ou redirige
	        }
	    }
	    
	    // 2. Préparation des données pour la vue
	    request.setAttribute("documents", DocumentData.getTous());
	    
	    // 3. UNE SEULE DESTINATION : Le squelette admin.jsp
	    // C'est lui qui décidera d'inclure admin_add ou admin_list selon le paramètre 'page'
	    request.getRequestDispatcher("admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String titre = request.getParameter("titre");
        String auteur = request.getParameter("auteur");
        String contenu = request.getParameter("contenu");
        
     // --- Gestion du Fichier ---
        Part filePart = request.getPart("fichier");
        String fileName = filePart.getSubmittedFileName();
        
        if (fileName != null && !fileName.isEmpty()) {
            // Dossier de destination sur ton PC (Crée-le manuellement d'abord !)
            String uploadPath = "C:/uploads_docsviewer/";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            // Enregistrement physique du fichier
            filePart.write(uploadPath + fileName);
        }
        
        // Sauvegarde en BDD avec le nom du fichier
        Document nouveauDoc = new Document(0, titre, auteur, contenu, fileName);
        DocumentData.ajouter(nouveauDoc);

        response.sendRedirect("admin");
	}

}
