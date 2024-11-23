<%@page import="java.util.List"%>
<%@page import="com.unu.beans.Libro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Editar libro </title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
</head>
<body>
<% List<String> listaGeneros = (List<String>) request.getAttribute("nombresGeneros"); %>
<% List<String> listaEditoriales = (List<String>) request.getAttribute("nombresEditoriales"); %>
<% List<String> listaAutores = (List<String>) request.getAttribute("nombresAutores"); %>
<%
	Libro libro = null;
	HttpSession sesion = request.getSession();
	if(request.getAttribute("libro") == null){
		libro = new Libro();
	}else{
		libro = (Libro)request.getAttribute("libro");
	}
%>

<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">

	<br>
	<h3> Editar libro </h3> <p></p>
	<div class="form-group">
	<form role="form" action="<%=url %>LibrosController" method="POST">
		<input type="hidden" name="op" value="modificar">
		<input type="hidden" name="idlibro" value="<%= libro.getIdLibro() %>">
		
		<input type="text" name="nombre" value="<%= libro.getNombre() %>" class="form-control" > <p></p>
		<input type="number" name="existencias" value="<%= libro.getExistencias() %>" class="form-control" > <p></p>
		<input type="number" name="precio" value="<%= libro.getPrecio() %>" class="form-control" > <p></p>
		<section class="section">
			<select class="form-select" name="autor" class="select">
				<%
					if(listaAutores != null){
						for(int i=0; i<listaAutores.size(); i++){
							String autor = listaAutores.get(i);
							if( autor.equalsIgnoreCase(libro.getAutor()) ){
				%>
								<option selected="selected"><%= autor %></option>
				<%
							}else{
				%>
								<option><%= autor %></option>
				<%
							}
						}
					}
				%>
			</select>
			<%--<a href="<%=url%>AutoresController?op=nuevo" class="btn btn-outline-dark">Nuevo autor</a> <p></p> --%>
		</section> <p></p>
		<section class="section">
			<select class="form-select" name="editorial" class="select">
				<%
					if(listaEditoriales != null){
						for(int i=0; i<listaEditoriales.size(); i++){
							String editorial = listaEditoriales.get(i);
							if( editorial.equalsIgnoreCase(libro.getEditorial()) ){
				%>
								<option selected="selected"><%= editorial %></option>
				<%
							}else{
				%>
								<option><%= editorial %></option>
				<%
							}
						}
					}
				%>
			</select>
			<%--<a href="<%=url%>EditorialesController?op=nuevo" class="btn btn-outline-dark">Nueva editorial</a> <p></p> --%>
		</section> <p></p>
		<section class="section">
			<select class="form-select" name="genero" class="select">
				<%
					if(listaGeneros != null){
						for(int i=0; i<listaGeneros.size(); i++){
							String genero = listaGeneros.get(i);
							if( genero.equalsIgnoreCase(libro.getGenero()) ){
				%>
								<option selected="selected"><%= genero %></option>
				<%
							}else{
				%>
								<option><%= genero %></option>
				<%
							}
						}
					}
				%>
			</select>
			<%-- <a href="<%=url%>GenerosController?op=nuevo" class="btn btn-outline-dark">Nuevo genero</a> <p></p> --%>
		</section> <p></p>
		<input type="text" name="descripcion" value="<%= libro.getDescripcion() %>" class="form-control" > <p></p>
		<br>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
		<a href="<%= url %>LibrosController?op=listar" class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>
	
</div>

</body>
</html>