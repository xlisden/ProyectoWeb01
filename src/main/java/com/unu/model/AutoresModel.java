package com.unu.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.unu.beans.Autor;

public class AutoresModel {

	private CallableStatement cs;
	private Connection conexion;
	private ResultSet rs;

//	public List<Autor> listarAutores() {
//		ArrayList<Autor> autores = new ArrayList<>();
//		autores.add(new Autor(1, "Garcia Marquez", "Argentina"));
//		autores.add(new Autor(2, "Borges", "Argentina"));
//		autores.add(new Autor(3, "Allende", "Chilena"));
//		return autores;
//	}

	public List<Autor> listarAutores() throws SQLException {
		try {
			List<Autor> lista = new ArrayList<>();
			String sql = "CALL spListarAutores()";
			
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Autor autor = new Autor();
				autor.setIdAutor(rs.getInt("idautor"));
				autor.setNombre(rs.getString("nombre"));
				autor.setNacionalidad(rs.getString("nacionalidad"));
				lista.add(autor);
			}
			
			conexion = Conexion.cerrarConexion();
			return lista;
		} catch (SQLException ex) {
			System.out.println("Error en listarAutores() " + ex.getMessage());
			conexion = Conexion.cerrarConexion();
			return null;
		}
	}

	public void insertarAutores(String nombre, String nacionalidad) {
		try {
			String sql = "CALL spInsertarAutores(?, ?)";
			
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setNString(1, nombre);
			cs.setNString(2, nacionalidad);
			int rs = cs.executeUpdate();
			if (rs != 0) {
				System.out.println("Insertado correctamente el autor " + nombre + nacionalidad);
			}
			
			conexion = Conexion.cerrarConexion();
		} catch (SQLException ex) {
			System.out.println("Error en insertarAutores() " + ex.getMessage());
			conexion = Conexion.cerrarConexion();
		}
	}

}
