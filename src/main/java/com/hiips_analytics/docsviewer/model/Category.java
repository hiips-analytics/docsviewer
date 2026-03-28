package com.hiips_analytics.docsviewer.model;

public class Category {
	private int id;
	private String name;
	private int nb_docs;
	
	public Category(int id, String name, int nb_docs) {
		this.id = id;
		this.name = name;
		this.nb_docs = nb_docs;
	}
	
	public int getId() { return id;}
	public String getName() { return name;}
	public int getNb_docs() { return nb_docs;}

}
