package com.unu.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.unu.beans.Editorial;

public class EditorialesModel {

	private CallableStatement cs;
	private Connection conexion;
	private ResultSet rs;
	private Statement st;

	public List<Editorial> listarEditoriales(){
		ArrayList<Editorial> editoriales = new ArrayList<>();
		editoriales.add(new Editorial(1, "Editorial Uno", "nombre1", "987654321"));
		editoriales.add(new Editorial(2, "Editorial Dos", "nombre2", "951753654"));
		editoriales.add(new Editorial(3, "Editorial Tres", "nombre3", "963582417"));
		editoriales.add(new Editorial(4, "Editorial Cuatro", "nombre4", "987321456"));
		return editoriales;
	}
	
	
	
}
