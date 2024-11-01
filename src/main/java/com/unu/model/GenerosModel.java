package com.unu.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.unu.beans.Genero;

public class GenerosModel {

	private CallableStatement cs;
	private Connection conexion;
	private ResultSet rs;
	
	public List<Genero> listarGeneros(){
		List<Genero> listaGeneros = null;
		try {
			String sql = "CALL spListarGeneros()";
			listaGeneros = new ArrayList<Genero>();
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			
			while(rs.next()) {
				Genero genero = new Genero();
				genero.setIdgenero(rs.getInt("idgenero"));
				genero.setNombre(rs.getString("nombre"));
				genero.setDescripcion(rs.getString("descripcion"));
				listaGeneros.add(genero);
			}
			
			conexion = Conexion.cerrarConexion();
		} catch (Exception e) {
			System.out.println("Error en listarGeneros() " + e.getMessage());
		}
		return listaGeneros;
	}
	
	public Genero obtenerGenero(int idgenero) {
		Genero genero = null;
		try {
			String sql = "CALL spObtenerGenero(?)";
			conexion = Conexion.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idgenero);
			rs = cs.executeQuery();
			
			if(rs.next()) {
				genero = new Genero();
				genero.setIdgenero(rs.getInt("idgenero"));
				genero.setNombre(rs.getString("nombre"));
				genero.setDescripcion(rs.getString("descripcion"));
			}
			
			conexion = Conexion.cerrarConexion();
		} catch (Exception e) {
			System.out.println("Error en obtenerGenero() " + e.getMessage());
		}
		return genero;
	}
	
}
