package com.unu.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import com.unu.beans.Genero;
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

}
