package com.unu.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.unu.beans.Autor;
import com.unu.model.AutoresModel;
import com.unu.model.Mensajes;

@WebServlet(name = "AutoresController", urlPatterns = { "/AutoresController" })
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
				request.getRequestDispatcher("/autores/nuevoAutor.jsp").forward(request, response);
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
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			System.out.println("Error en doGet " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			System.out.println("Error en doPost " + e.getMessage());
		}
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setAttribute("listaAutores", modelo.listarAutores());

			Iterator<Autor> it = modelo.listarAutores().iterator();
			while (it.hasNext()) {
				Autor autor = it.next();
			}

			request.getRequestDispatcher("/autores/listaAutores.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Ocurren problemas en listar() en AutoresController " + e.getMessage());
		}
	}
	
	private boolean validar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean hayErrores = false;
		List<String> listaErrores = new ArrayList<String>();
		try {
			validarParametro(request, response, "nombre", listaErrores, Mensajes.AUTOR_NOMBRE_ERROR);
			validarParametro(request, response, "nacionalidad", listaErrores, Mensajes.AUTOR_NACIONALIDAD_ERROR);
			if(listaErrores.size() > 0) {
				hayErrores  = true;
			}
			request.setAttribute("respuesta", hayErrores);
			request.setAttribute("listaErrores", listaErrores);
		} catch (Exception e) {
			System.out.println("validar(): " + e.getMessage());
		}
		return hayErrores;
	}
	
	private void validarParametro(HttpServletRequest request, HttpServletResponse response, String parametro, List<String> listaErrores, String mensaje) throws ServletException, IOException {
		try {
			String aux = request.getParameter(parametro);
			if(aux == null || aux.isEmpty()) {
				listaErrores.add(mensaje);
				request.setAttribute(parametro, null);
			}else {
				request.setAttribute(parametro, request.getParameter(parametro));
			}
		} catch (Exception e) {
			System.out.println("validarParametro() " + e.getMessage());
		}
//		String aux = request.getParameter(parametro);
//		if(aux == null) {
//			listaErrores.add(mensaje);
//			request.setAttribute(parametro, null);
//		}else if(aux.isEmpty()){
//			listaErrores.add(mensaje);
//			request.setAttribute(parametro, null);
//		}else {
//			request.setAttribute(parametro, request.getParameter(parametro));
//		}
	}

	private void insertar(HttpServletRequest request, HttpServletResponse response) {
		try {
			if(!validar(request, response)) {
				Autor autor = new Autor();
				autor.setNombre(request.getParameter("nombre"));
				autor.setNacionalidad(request.getParameter("nacionalidad"));

				if (modelo.insertarAutor(autor) > 0) {
					request.getSession().setAttribute("exito", "autor creado");
				} else {
					request.getSession().setAttribute("fracaso", "autor NO creado");
				}
				response.sendRedirect(request.getContextPath() + "/AutoresController?op=listar");
			}else {
				request.getRequestDispatcher("/autores/nuevoAutor.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("insertar() " + e.getMessage());
		}
	}

	private void obtener(HttpServletRequest request, HttpServletResponse response) {
		try {
//			if(!validar(request, response)) {
				int idautor = Integer.parseInt(request.getParameter("idautor"));
				Autor autor = modelo.obtenerAutor(idautor);
				
				if (autor != null) {
					request.setAttribute("autor", autor);
					request.getRequestDispatcher("/autores/editarAutor.jsp").forward(request, response);
				} else {
					response.sendRedirect(request.getContextPath() + "/error404.jsp");
				}
//			}
		} catch (Exception e) {
			System.out.println("obtener() " + e.getMessage());
		}
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response) {
		try {
			if(!validar(request, response)) {
				Autor autor = new Autor();
				autor.setIdAutor(Integer.parseInt(request.getParameter("idautor")));
				autor.setNombre(request.getParameter("nombre"));
				autor.setNacionalidad(request.getParameter("nacionalidad"));
				request.setAttribute("autor", autor);

				if (modelo.modificarAutor(autor) > 0) {
					request.getSession().setAttribute("exito", "autor modificado ");
				} else {
					request.getSession().setAttribute("fracaso", "autor NO modificado");
				}
				response.sendRedirect(request.getContextPath() + "/AutoresController?op=listar");
			}else {
				request.getRequestDispatcher("/autores/editarAutor.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("modificar() " + e.getMessage());
		}
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		try {
			int idautor = Integer.parseInt(request.getParameter("idautor"));

			if (modelo.eliminarAutor(idautor) > 0) {
				request.getSession().setAttribute("exito", "Autor eliminado exitosamente");
			} else {
				request.getSession().setAttribute("fracaso", "El autor no se ha eliminado");
			}
			request.getRequestDispatcher("/AutoresController?op=listar").forward(request, response);
		} catch (Exception e) {
			System.out.println("Ocurren problemas en eliminar() en AutoresController " + e.getMessage());
		}
	}
}
