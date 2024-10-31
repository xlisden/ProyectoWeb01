package com.unu.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.unu.beans.Autor;
import com.unu.beans.Editorial;

public class EditorialesModel {

	private CallableStatement cs;
	private Connection conexion;
	private ResultSet rs;
	private Statement st;

//	public List<Editorial> listarEditoriales(){
//		ArrayList<Editorial> editoriales = new ArrayList<>();
//		editoriales.add(new Editorial(1, "Editorial Uno", "nombre1", "987654321"));
//		editoriales.add(new Editorial(2, "Editorial Dos", "nombre2", "951753654"));
//		editoriales.add(new Editorial(3, "Editorial Tres", "nombre3", "963582417"));
//		editoriales.add(new Editorial(4, "Editorial Cuatro", "nombre4", "987321456"));
//		return editoriales;
//	}
	
	public List<Editorial> listarEditoriales(){
		ArrayList<Editorial> editoriales = null;
		try {
			String sql = "CALL spListarEditoriales()";
			editoriales = new ArrayList<>();
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			
			while (rs.next()) {
				Editorial editorial = new Editorial();
				editorial.setIdeditorial(rs.getInt("ideditorial"));
				editorial.setNombre(rs.getString("nombre"));
				editorial.setContacto(rs.getString("contacto"));
				editorial.setTelefono(rs.getString("telefono"));
				editoriales.add(editorial);
			}
			
			conexion = Conexion.cerrarConexion();
		} catch (Exception e) {
			System.out.println("Error en listarEditoriales() " + e.getMessage());
		}
		return editoriales;
	}

	public int insertarEditorial(Editorial editorial) {
		int filasAfectadas = 0;
		try {
			String sql = "CALL spInsertarEditorial(?, ?, ?)";
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			
			cs.setString(1, editorial.getNombre());
			cs.setString(2, editorial.getContacto());
			cs.setString(3, editorial.getTelefono());
			filasAfectadas = cs.executeUpdate();
			if (filasAfectadas != 0) {
				System.out.println("Insertada correctamente la editorial " + editorial.getNombre() + editorial.getContacto());
			}
		} catch (SQLException ex) {
			System.out.println("Error en insertarEditorial() " + ex.getMessage());
		}
		conexion = Conexion.cerrarConexion();
		return filasAfectadas;
	}
	
	public Editorial obtenerEditorial(int idEditorial) throws SQLException {
		Editorial editorial = null;
		try {
			String sql = "CALL spObtenerEditorial(?)";
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idEditorial);
			rs = cs.executeQuery();

			if (rs.next()) {
				editorial = new Editorial();
				editorial.setIdeditorial(rs.getInt("ideditorial"));
				editorial.setNombre(rs.getString("nombre"));
				editorial.setContacto(rs.getString("contacto"));
				editorial.setTelefono(rs.getString("telefono"));
			}
		} catch (SQLException ex) {
			System.out.println("Error en obtenerAutor() " + ex.getMessage());
		}
		conexion = Conexion.cerrarConexion();
		return editorial;
	}
	
	public int modificarEditorial(Editorial editorial) {
		int filasAfectadas = 0;
		try {
			String sql = "CALL spModificarEditorial(?, ?, ?, ?)";
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			
			cs.setInt(1, editorial.getIdeditorial());
			cs.setString(2, editorial.getNombre());
			cs.setString(3, editorial.getContacto());
			cs.setString(4, editorial.getTelefono());
			filasAfectadas = cs.executeUpdate();
			if (filasAfectadas != 0) {
				System.out.println("Editorial correctamente modificada.");
			}

			conexion = Conexion.cerrarConexion();
		} catch (SQLException ex) {
			System.out.println("Error en modificarEditorial() " + ex.getMessage());
			conexion = Conexion.cerrarConexion();
		}
		return filasAfectadas;
	}

	public int eliminarEditorial(int ideditorial) {
		int filasAfectadas = 0;
		try {
			String sql = "CALL spEliminarEditorial(?)";
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			
			cs.setInt(1, ideditorial);
			filasAfectadas = cs.executeUpdate();
			if (filasAfectadas != 0) {
				System.out.println("Editorial eliminada correctamente.");
			}
		} catch (SQLException ex) {
			System.out.println("Error en eliminarEditorial() " + ex.getMessage());
		}
		
		conexion = Conexion.cerrarConexion();
		return filasAfectadas;
	}
	
}
