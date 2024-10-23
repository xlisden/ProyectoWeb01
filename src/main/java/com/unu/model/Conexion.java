package com.unu.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

	private static String url = "jdbc:mysql://localhost:3306/bibliotecapoo2";
	private static String user = "root";
	private static String password = "123456";
	protected static Connection conexion;

	public static Connection abrirConexion() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println("Error al abrir conexión: " + e.getMessage());
		}
		return conexion;
	}

	public static Connection cerrarConexion() {
		try {
			if (conexion != null && !conexion.isClosed()) {
				conexion.close();
				System.out.println("Conexión cerrada.");
			}
		} catch (SQLException e) {
			System.out.println("Error al cerrar conexión: " + e.getMessage());
		}
		return conexion;
	}

}
