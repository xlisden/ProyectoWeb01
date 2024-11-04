package com.unu.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.unu.beans.Libro;

public class LibrosModel {
	
	private CallableStatement cs;
	private Connection conexion;
	private ResultSet rs;
	private Statement st;
	
	public int insertarLibro(Libro libro) {
		int filasAfectadas = 0;
		try {
			String sql = "CALL spInsertarLibros(?, ?, ?, ?, ?, ?, ?)";
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, libro.getNombre());
			cs.setInt(2, libro.getExistencias());
			cs.setDouble(3, libro.getPrecio());
			cs.setString(4, libro.getAutor());
			cs.setString(5, libro.getEditorial());
			cs.setString(6, libro.getGenero());
			cs.setString(7, libro.getDescripcion());
			filasAfectadas = cs.executeUpdate();
			if (filasAfectadas != 0) {
				System.out.println("Insertado libro" + libro.getNombre() + libro.getPrecio());
			}
		} catch (SQLException ex) {
			System.out.println("Error en insertarLibro() " + ex.getMessage());
		}
		conexion = Conexion.cerrarConexion();
		return filasAfectadas;
	}

}
