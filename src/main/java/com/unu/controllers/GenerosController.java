package com.unu.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
//import java.util.Iterator;

import com.unu.beans.Genero;
import com.unu.beans.Libro;
import com.unu.model.GenerosModel;

@WebServlet(name = "GenerosController", urlPatterns = { "/GenerosController" })
public class GenerosController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private GenerosModel generosModelo = new GenerosModel();
	
    public GenerosController() {
    	super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()) {
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
				request.getRequestDispatcher("/generos/nuevoGenero.jsp").forward(request, response);
				break;
			case "insertar":
				insertar(request, response);
				break;
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
			System.out.println("processRequest(): " + e.getMessage());
		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("listaGeneros", generosModelo.listarGeneros());
			
			request.getRequestDispatcher("/generos/listaGeneros.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Error en listar() en GenerosController: " + e.getMessage());
		}
	}
	
	protected void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Genero genero = new Genero();
			genero.setNombre(request.getParameter("nombre"));
			genero.setDescripcion(request.getParameter("descripcion"));
			
			if(generosModelo.insertarGenero(genero) > 0) {
				request.getSession().setAttribute("exito", "genero insertado");
			}else {
				request.getSession().setAttribute("fracaso", "genero NO insertado");
			}
			response.sendRedirect(request.getContextPath() + "/GenerosController?op=listar");
		} catch (Exception e) {
			System.out.println("Error en insertar() en GenerosController: " + e.getMessage());
		}
	}
	
	protected void obtener(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int idgenero = Integer.parseInt(request.getParameter("idgenero"));
			Genero genero = generosModelo.obtenerGenero(idgenero);
			if(genero != null) {
				request.setAttribute("libro", genero);
				request.getRequestDispatcher("/generos/editarGenero.jsp").forward(request, response);
			}else {
				System.out.println("obtener(): genero nulo");
				response.sendRedirect(request.getContextPath() + "/error404.jsp");
			}
		} catch (Exception e) {
			System.out.println("obtener(): " + e.getMessage());
		}
	}
	
	protected void modificar(HttpServletRequest request, HttpServletResponse response) {
		try {
			Genero genero = new Genero();
			genero.setIdgenero(Integer.parseInt(request.getParameter("idgenero")));
			genero.setNombre(request.getParameter("nombre"));
			genero.setDescripcion(request.getParameter("descripcion"));

			if (generosModelo.modificarGenero(genero) > 0) {
				request.getSession().setAttribute("exito", "genero modificado");
			} else {
				request.getSession().setAttribute("fracaso", "genero NO modificado");
			}
			response.sendRedirect(request.getContextPath() + "/GenerosController?op=listar");
		} catch (Exception e) {
			System.out.println("Ocurren problemas en modificar() en GenerosController" + e.getMessage());
		}
	}
	
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int idgenero = Integer.parseInt(request.getParameter("idgenero"));
			
			if(generosModelo.eliminarGenero(idgenero) > 0) {
				request.getSession().setAttribute("exito", "genero eliminado");
			} else {
				request.getSession().setAttribute("fracaso", "genero NO eliminado");
			}
			response.sendRedirect(request.getContextPath() + "/GenerosController?op=listar");
		} catch (Exception e) {
			System.out.println("eliminar(): " + e.getMessage());
		}
	}

}
