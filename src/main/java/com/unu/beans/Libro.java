package com.unu.beans;

public class Libro {

	// INSERT INTO libro (idlibro, nombre, existencias, precio, idautor,
	// ideditorial, idgenero, descripcion)
	private int idLibro;
	private String nombre;
	private int existencias;
	private double precio;
	private String autor;
	private String editorial;
	private String genero;
	private String descripcion;

	public Libro() {
		this(0, "", 0, 0, "", "", "", "");
	}

	public Libro(int idLibro, String nombre, int existencias, double precio, String autor, String editorial,
			String genero, String descripcion) {
		this.idLibro = idLibro;
		this.nombre = nombre;
		this.existencias = existencias;
		this.precio = precio;
		this.autor = autor;
		this.editorial = editorial;
		this.genero = genero;
		this.descripcion = descripcion;
	}

	public int getIdLibro() {
		return idLibro;
	}

	public void setIdLibro(int idLibro) {
		this.idLibro = idLibro;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getExistencias() {
		return existencias;
	}

	public void setExistencias(int existencias) {
		this.existencias = existencias;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getEditorial() {
		return editorial;
	}

	public void setEditorial(String editorial) {
		this.editorial = editorial;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
