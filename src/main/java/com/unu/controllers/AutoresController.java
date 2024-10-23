package com.unu.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import com.unu.beans.Autor;
import com.unu.model.AutoresModel;

public class AutoresController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AutoresModel modelo = new AutoresModel();

	public AutoresController() {
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			if (request.getParameter("opcion") == null) {
				listar(request, response);
				return;
			}

			String operacion = request.getParameter("opcion");

			switch (operacion) {
			case "listar":
				listar(request, response);
				break;
			case "nuevo":
				// crear nuevoAutor.jsp
//				request.getRequestDispatcher("/autores/nuevoAutor.jsp").forward(request, response);
				break;
			case "insertar":
//				 insertar(request, response);

			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			processRequest(request, response);
		} catch (Exception e) {
			System.out.println("Error en goGet " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		doGet(request, response);
		try {
			processRequest(request, response);
		} catch (Exception e) {
			System.out.println("Error en goGet " + e.getMessage());
		}
	}

	protected void listar(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setAttribute("listaAutores", modelo.listarAutores());

			System.out.println("Número de autores: " + modelo.listarAutores().size());

			Iterator<Autor> it = modelo.listarAutores().iterator();
			while (it.hasNext()) {
				Autor autor = it.next();
				System.out.println(autor.getNombre() + " " + autor.getNacionalidad());
			}

			request.getRequestDispatcher("/autores/listaAutores.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Ocurren problemas en listar() en AutoresController");
		}
	}

}
