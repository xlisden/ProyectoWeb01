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
import com.unu.beans.Editorial;
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

		try (PrintWriter out = response.getWriter()) {
			if (request.getParameter("op") == null) {
				listar(request, response);
				return;
			}

			String operacion = request.getParameter("op");
			switch (operacion) {
				case "listar":
					listar(request, response);
					break;
				case "nuevo":
					request.getRequestDispatcher("/editoriales/nuevaEditorial.jsp").forward(request, response);
					break;
				case "insertar":
					insertar(request, response);
				case "obtener":
					obtener(request, response);
					break;
				case "modificar":
					modificar(request, response);
					break;
				case "eliminar":
					eliminar(request, response);
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

			Iterator<Editorial> it = modelo.listarEditoriales().iterator();
			while (it.hasNext()) {
				Editorial editorial = it.next();
			}

			request.getRequestDispatcher("/editoriales/listaEditoriales.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Error en listar() " + e.getMessage());
		}
	}

	private void insertar(HttpServletRequest request, HttpServletResponse response) {
		try {
			Editorial editorial = new Editorial();
			editorial.setNombre(request.getParameter("nombre"));
			editorial.setContacto(request.getParameter("contacto"));
			editorial.setTelefono(request.getParameter("telefono"));

			if (modelo.insertarEditorial(editorial) > 0) {
				request.getSession().setAttribute("exito", "Editorial creada exitosamente");
			} else {
				request.getSession().setAttribute("fracaso", "La editorial no se ha creado");
			}
			response.sendRedirect(request.getContextPath() + "/EditorialesController?op=listar");
		} catch (Exception e) {
			System.out.println("Ocurren problemas en insertar() en EditorialesController" + e.getMessage());
		}
	}

	private void obtener(HttpServletRequest request, HttpServletResponse response) {
		try {
			int ideditorial = Integer.parseInt(request.getParameter("ideditorial"));
			Editorial editorial = modelo.obtenerEditorial(ideditorial);
			System.out.println("Editorial en obtener de controller: " + editorial.getNombre());
			
			if(editorial != null) {
				request.setAttribute("editorial", editorial);
				request.getRequestDispatcher("/editoriales/editarEditoriales.jsp").forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath() + "/error404.jsp");
			}
		} catch (Exception e) {
			System.out.println("Ocurren problemas en obtener() en EditorialesController: " + e.getMessage());
		}
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response) {
		try {
			Editorial editorial = new Editorial();
			editorial.setIdeditorial(Integer.parseInt(request.getParameter("ideditorial")));
			editorial.setNombre(request.getParameter("nombre"));
			editorial.setContacto(request.getParameter("contacto"));
			editorial.setTelefono(request.getParameter("telefono"));

			if (modelo.modificarEditorial(editorial) > 0) {
				request.getSession().setAttribute("exito", "Editorial creada exitosamente");
			} else {
				request.getSession().setAttribute("fracaso", "La editorial no se ha creado");
			}
			response.sendRedirect(request.getContextPath() + "/EditorialesController?op=listar");
		} catch (Exception e) {
			System.out.println("Ocurren problemas en insertar() en EditorialesController" + e.getMessage());
		}
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		try {
			int ideditorial = Integer.parseInt(request.getParameter("ideditorial"));

			if (modelo.eliminarEditorial(ideditorial) > 0) {
				request.getSession().setAttribute("exito", "Editorial eliminada exitosamente");
			} else {
				request.getSession().setAttribute("fracaso", "La editorial no se ha eliminado");
			}
			request.getRequestDispatcher("/EditorialesController?op=listar").forward(request, response);
		} catch (Exception e) {
			System.out.println("Ocurren problemas en eliminar() en EditorialesController " + e.getMessage());
		}
	}
}
