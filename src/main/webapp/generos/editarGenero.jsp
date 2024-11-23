<%@page import="com.unu.beans.Genero"%>
<%@page import="com.unu.beans.Libro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Editar genero </title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
</head>
<body>

<%@ include file='/cabeceraMenu.jsp' %>
<%
	Genero genero = null;
	HttpSession sesion = request.getSession();
	if(request.getAttribute("genero") == null){
		genero = new Genero();
	}else{
		genero = (Genero)request.getAttribute("genero");
	}
%>
<div class="container">
	<br>
	<h3> Editar genero </h3> <p></p>
	<div class="form-group">
	<form role="form" action="<%=url %>GenerosController" method="POST">
		<input type="hidden" name="op" value="modificar">
		<input type="hidden" name="idgenero" value="<%= genero.getIdgenero()                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                %>">
		
		<input type="text" name="nombre" value="<%= genero.getNombre() %>" class="form-control" > <p></p>
		<input type="text" name="descripcion" value="<%= genero.getDescripcion() %>" class="form-control" > <p></p>
		<br>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
		<a href="<%= url %>GenerosController?op=listar" class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>
</div>

</body>
</html>