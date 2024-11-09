<%@page import="com.unu.beans.Autor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar autor</title>

<link rel="stylesheet"
		href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>
<!--  <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
 -->
 
</head>
<body>
	<%
	String url = "http://localhost:8080/ProyectoWeb01/";
	Autor autor;
	HttpSession sesion = request.getSession();

	if (request.getAttribute("autor") == null) {
		autor = new Autor();
	} else {
		autor = (Autor) request.getAttribute("autor");
// 		System.out.println("Autor: " + autor.getNombre() + " " + autor.getNacionalidad());
	}
	%>
	
		<h3>Editar autor</h3>
		<br>
	
	
	<div class="form-group">
		<form role="form" action="<%=url %>AutoresController" method="POST">
		<input type="hidden" name="op" value="modificar">
		<input type="hidden" name="idautor" value="<%=autor.getIdAutor()%>" / class="form-control">

		<input type="text" name="nombre" id="nombre" value="<%=autor.getNombre() %>" class="form-control">
		<input type="text" name="nacionalidad" id="nacionalidad" value="<%=autor.getNacionalidad() %>" class="form-control">
		
		<br><p>   </p>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
		<a href="<%=url%>AutoresController?op=listar" type="button"
		class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>
</body>
</html>