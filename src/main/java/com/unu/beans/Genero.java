package com.unu.beans;

public class Genero {

	private int idgenero;
	private String nombre;
	private String descripcion;

	public Genero() {
	}

	public Genero(int idgenero, String nombre, String descripcion) {
		this.idgenero = idgenero;
		this.nombre = nombre;
		this.descripcion = descripcion;
	}

	public int getIdgenero() {
		return idgenero;
	}

	public void setIdgenero(int idgenero) {
		this.idgenero = idgenero;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
