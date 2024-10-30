package com.unu.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.unu.beans.Autor;

public class AutoresModel {

	private CallableStatement cs;
	private Connection conexion;
	private ResultSet rs;
	private Statement st;

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

	public int insertarAutor(Autor autor) {
		int filasAfectadas = 0;
		try {
			String sql = "CALL spInsertarAutor(?, ?)";

			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, autor.getNombre());
			cs.setString(2, autor.getNacionalidad());
			filasAfectadas = cs.executeUpdate();
			if (filasAfectadas != 0) {
				System.out.println("Insertado correctamente el autor " + autor.getNombre() + autor.getNacionalidad());
			}

			conexion = Conexion.cerrarConexion();
		} catch (SQLException ex) {
			System.out.println("Error en insertarAutores() " + ex.getMessage());
			conexion = Conexion.cerrarConexion();
		}
		return filasAfectadas;
	}

	public int eliminarAutor(int idAutor) {
		int filasAfectadas = 0;
		try {
			String sql = "CALL spEliminarAutor(?)";

			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idAutor);
			filasAfectadas = cs.executeUpdate();
			if (filasAfectadas != 0) {
				System.out.println("Autor eliminado correctamente.");
			}

			conexion = Conexion.cerrarConexion();
		} catch (SQLException ex) {
			System.out.println("Error en eliminarAutor() " + ex.getMessage());
			conexion = Conexion.cerrarConexion();
		}
		return filasAfectadas;
	}

	public int modificarAutor(Autor autor) {
		int filasAfectadas = 0;
		try {
			String sql = "CALL spModificarAutor(?, ?, ?)";

			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, autor.getIdAutor());
			cs.setString(2, autor.getNombre());
			cs.setString(3, autor.getNacionalidad());
			filasAfectadas = cs.executeUpdate();
			if (filasAfectadas != 0) {
				System.out.println("Autor modificado correctamente.");
			}
			conexion = Conexion.cerrarConexion();
		} catch (SQLException ex) {
			System.out.println("Error en eliminarAutor() " + ex.getMessage());
			conexion = Conexion.cerrarConexion();
		}
		return filasAfectadas;
	}

	public Autor obtenerAutor(int idAutor) throws SQLException {
		Autor autor = null;
		try {
			String sql = "CALL spObtenerAutor(?)";
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idAutor);
			rs = cs.executeQuery();

			if (rs.next()) {
				autor = new Autor();
				autor.setIdAutor(rs.getInt("idautor"));
				autor.setNombre(rs.getString("nombre"));
				autor.setNacionalidad(rs.getString("nacionalidad"));
				return autor;
			}
		} catch (SQLException ex) {
			System.out.println("Error en obtenerAutor() " + ex.getMessage());
		}
		conexion = Conexion.cerrarConexion();
		return autor;
	}

	public int totalAutores() throws SQLException {
		int totalAutores = 0;
		try {
			String sql = "SELECT COUNT(idautor) as totalAutores FROM autor";

			conexion = Conexion.abrirConexion();
			st = conexion.prepareStatement(sql);
			rs = st.getResultSet();
			while (rs.next()) {
				totalAutores = rs.getInt("totalAutores");
			}
		} catch (SQLException ex) {
			System.out.println("Error en totalAutores() " + ex.getMessage());
		} finally {
			conexion = Conexion.cerrarConexion();
		}
		return totalAutores;
	}

}
