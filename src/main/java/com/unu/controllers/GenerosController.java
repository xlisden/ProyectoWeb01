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
	private GenerosModel modelo = new GenerosModel();
	
    public GenerosController() {
    	super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()) {
			if(request.getParameter("op") == null) {
//				listar(request, response);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("listaGeneros", modelo.listarGeneros());
			
			Iterator<Genero> it = modelo.listarGeneros().iterator();
			while(it.hasNext()) {
				Genero genero = it.next();
			}
			
			request.getRequestDispatcher("/generos/ListaGeneros.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Error en listar() en GenerosController: " + e.getMessage());
		}
	}

}
