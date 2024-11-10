package com.unu.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import com.unu.beans.Editorial;
import com.unu.beans.Libro;
import com.unu.model.AutoresModel;
import com.unu.model.EditorialesModel;
import com.unu.model.GenerosModel;
import com.unu.model.LibrosModel;

@WebServlet(name = "LibrosController", urlPatterns = { "/LibrosController" })
public class LibrosController extends HttpServlet {
	
	private AutoresModel autoresModel = new AutoresModel();
	private EditorialesModel editorialesModel = new EditorialesModel();
	private GenerosModel generosModel = new GenerosModel();
	private LibrosModel librosModel = new LibrosModel();
	
	private static final long serialVersionUID = 1L;
    public LibrosController() {
    	super();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()) {
			if(request.getParameter("op") == null) {
//				listarSelects(request, response);
				listar(request, response);
				return;
			}
			
			String operacion = request.getParameter("op");
			switch (operacion) {
			case "listar":
				listar(request, response);
				break;
			case "nuevo":
				listarSelects(request, response);
				break;
			case "insertar":
				insertar(request, response);
				break;
			case "eliminar":
				eliminar(request, response);
				break;
			}
		} catch (Exception e) {
			System.out.println("Error en processRequest() " + e.getMessage());
		}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void listarSelects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("nombresEditoriales", editorialesModel.listarNombresEditoriales());
			request.setAttribute("nombresGeneros", generosModel.listarNombresGeneros());
			request.setAttribute("nombresAutores", autoresModel.listarNombresAutores());
			request.getRequestDispatcher("/libros/nuevoLibro.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Error en listarSelects() " + e.getMessage());
		}
	}
	
	protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("listaLibros", librosModel.listarLibros());
			request.getRequestDispatcher("/libros/listaLibros.jsp").forward(request, response);
//			response.sendRedirect(request.getContextPath() + "/LibrosController?op=listar");
		} catch (Exception e) {
			System.out.println("Error en listar() " + e.getMessage());
		}
	}
	
	protected void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Libro libro = new Libro();
			libro.setNombre(request.getParameter("nombre"));
			libro.setExistencias(Integer.parseInt(request.getParameter("existencias")));
			libro.setPrecio(Double.parseDouble(request.getParameter("precio")));
			libro.setAutor(request.getParameter("autor"));
			libro.setEditorial(request.getParameter("editorial"));
			libro.setGenero(request.getParameter("genero"));
			libro.setDescripcion(request.getParameter("descripcion"));

			if (librosModel.insertarLibro(libro) > 0) {
				request.getSession().setAttribute("exito", "libro creado");
			} else {
				request.getSession().setAttribute("fracaso", "libro no se ha creado");
			}
			response.sendRedirect(request.getContextPath() + "/LibrosController?op=listar");
		} catch (Exception e) {
			System.out.println("Ocurren problemas en insertar() en LibrosController " + e.getMessage());
		}
	}
	
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int idlibro = Integer.parseInt(request.getParameter("idlibro"));
			
			if(librosModel.eliminarLibro(idlibro) > 0) {
				request.getSession().setAttribute("exito", "libro eliminado");
			} else {
				request.getSession().setAttribute("fracaso", "libro NO eliminado");
			}
//			request.getRequestDispatcher("/LibrosController?op=listar").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/LibrosController?op=listar");
		} catch (Exception e) {
			System.out.println("eliminar(): " + e.getMessage());
		}
	}
}
