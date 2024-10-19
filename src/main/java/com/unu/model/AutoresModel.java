package com.unu.model;

import java.util.ArrayList;
import java.util.List;

import com.unu.beans.Autor;

public class AutoresModel {

	public List<Autor> listarAutores() {
		ArrayList<Autor> autores = new ArrayList<>();
		autores.add(new Autor(1, "Garcia Marquez", "Argentina"));
		autores.add(new Autor(2, "Borges", "Argentina"));
		autores.add(new Autor(3, "Allende", "Chilena"));
		return autores;
	}

}
