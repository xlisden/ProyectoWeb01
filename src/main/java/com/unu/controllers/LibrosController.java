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

import com.unu.model.EditorialesModel;
import com.unu.model.GenerosModel;

@WebServlet(name = "LibrosController", urlPatterns = { "/LibrosController" })
public class LibrosController extends HttpServlet {
	
	GenerosModel generosModel = new GenerosModel();
	EditorialesModel editorialesModel = new EditorialesModel();
	
	private static final long serialVersionUID = 1L;
    public LibrosController() {
    	super();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()) {
			if(request.getParameter("op") == null) {
				listarSelects(request, response);
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
	
//	protected void listarGeneros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			request.setAttribute("nombresGeneros", generosModel.listarNombresGeneros());
//			request.getRequestDispatcher("/libros/nuevoLibro.jsp").forward(request, response);
//		} catch (Exception e) {
//			System.out.println("Error en listarGeneros() " + e.getMessage());
//		}
//	}
	
//	protected void listarEditoriales(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			request.setAttribute("nombresEditoriales", editorialesModel.listarNombresEditoriales());
//			request.getRequestDispatcher("/libros/nuevoLibro.jsp").forward(request, response);
//		} catch (Exception e) {
//			System.out.println("Error en listarEditoriales() " + e.getMessage());
//		}
//	}

	protected void listarSelects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("nombresEditoriales", editorialesModel.listarNombresEditoriales());
			request.setAttribute("nombresGeneros", generosModel.listarNombresGeneros());
			request.getRequestDispatcher("/libros/nuevoLibro.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Error en listarSelects() " + e.getMessage());
		}
	}

}
