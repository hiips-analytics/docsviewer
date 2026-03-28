package com.hiips_analytics.docsviewer.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.hiips_analytics.docsviewer.model.Document;
import com.hiips_analytics.docsviewer.dao.DocumentData;

/**
 * Servlet implementation class DetailsServlet
 */
@WebServlet("/details")
public class DetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. On récupère l'ID depuis l'URL (ex: details?id=5)
        String idParam = request.getParameter("id");
        
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);

                // 2. On va chercher le VRAI document en base de données
                Document doc = DocumentData.trouverParId(id);

                if (doc != null) {
                    // 3. On l'envoie à la JSP
                    request.setAttribute("doc", doc);
                    request.getRequestDispatcher("details.jsp").forward(request, response);
                } else {
                    // Si l'ID n'existe pas dans la BDD
                    response.sendRedirect("accueil");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("accueil");
            }
        } else {
            response.sendRedirect("accueil");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
