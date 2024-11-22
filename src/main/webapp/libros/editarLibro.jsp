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

<%@ include file='/cabeceraMenu.jsp' %>
<%
	Libro libro = null;
	HttpSession sesion = request.getSession();
	if(request.getAttribute("libro") == null){
		libro = new Libro();
	}else{
		libro = (Libro)request.getAttribute("libro");
	}
%>
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
		<input type="text" name="autor" value="<%= libro.getAutor() %>" class="form-control" > <p></p>
		<input type="text" name="editorial" value="<%= libro.getEditorial() %>" class="form-control" > <p></p>
		<input type="text" name="genero" value="<%= libro.getGenero() %>" class="form-control" > <p></p>
		<input type="text" name="descripcion" value="<%= libro.getDescripcion() %>" class="form-control" > <p></p>
		<br>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary"> <p></p>
		<a href="<%= url %>LibrosController?op=listar" class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>
</div>

</body>
</html>