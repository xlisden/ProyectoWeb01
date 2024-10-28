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
import com.unu.model.EditorialesModel;


@WebServlet(name = "EditorialesController", urlPatterns = { "/EditorialesController" })
public class EditorialesController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	EditorialesModel modelo = new EditorialesModel();

	public EditorialesController() {
		super();
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()){
			if(request.getParameter("op") == null) {
				listar(request, response);
				return;
			}

			String operacion = request.getParameter("op");
			switch (operacion) {
			case "listar":
				listar(request, response);
				break;
			case "nuevo":
//				request.getRequestDispatcher("/autores/nuevoAutor.jsp").forward(request, response);
				break;
			case "insertar":
//				insertar(request, response);
			case "obtener":
//				obtener(request, response);
				break;
			case "modificar":
//				modificar(request, response);
				break;
			case "eliminar":
//				eliminar(request, response);
				break;

			}
		} catch (Exception e) {
			System.out.println("Error en processRequest() " + e.getMessage());
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void listar(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setAttribute("listaEditoriales", modelo.listarEditoriales());
			
//			Iterator<Autor> it = modelo.listarAutores().iterator();
//			while (it.hasNext()) {
//				Autor autor = it.next();
//				System.out.println(autor.getNombre() + " " + autor.getNacionalidad());
//			}
			
			request.getRequestDispatcher("/editoriales/listaEditoriales.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Error en listar() " + e.getMessage());
		}
	}

}
