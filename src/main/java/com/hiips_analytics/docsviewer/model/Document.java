package com.hiips_analytics.docsviewer.model;

public class Document {
	private int id;
    private String titre;
    private String auteur;
    private String contenu;
    private String nomFichier;

    // Constructeur pour créer un document facilement
    public Document(int id, String titre, String auteur, String contenu, String nomFichier) {
        this.id = id;
        this.titre = titre;
        this.auteur = auteur;
        this.contenu = contenu;
        this.nomFichier = nomFichier;
    }

    // Getters (Indispensables pour l'affichage en JSP)
    public int getId() { return id; }
    public String getTitre() { return titre; }
    public String getAuteur() { return auteur; }
    public String getContenu() { return contenu; }
    public String getNomFichier() { return nomFichier; }
}
