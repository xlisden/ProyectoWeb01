<%@page import="com.unu.model.Mensajes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
		href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>
<!--  <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
 -->
 <script>
 	function validar() {
		const nombre = document.getElementById('nombre').value.trim();
		const nacionalidad = document.getElementById('nacionalidad').value.trim();
		
		if(nombre === ''){
			alert(<%= Mensajes.AUTOR_NOMBRE_ERROR %>);
			document.getElementById('nombre').focus();
			return false;
		}
		if(nacionalidad === ''){
			alert(<%= Mensajes.AUTOR_NACIONALIDAD_ERROR %>);
			document.getElementById('nacionalidad').focus();
			return false;
		}
	}
 </script>
</head>
<body>

<div class="container">
<%@ include file='/cabeceraMenu.jsp' %>
<% 
if(request.getParameter("respuesta") != null){
	boolean respuesta = (boolean) request.getAttribute("respuesta");
	if(respuesta){
		List<String> listaErrores = (ArrayList<String>) request.getAttribute("listaErrores");
		for(String error: listaErrores){
			%>
			<p class="text-danger"><span><%= error %></span></p>
			<%
		}
	}
}
%>

	<br>
	<h3>Nuevo Autor</h3>
<%-- 	<% String url = "http://localhost:8080/ProyectoWeb01/"; %> --%>
	<div class="form-group">
		<form role="form" action="<%=url %>AutoresController" method="POST" onsubmit="return validar()">
			<input type="hidden" name="op" value="insertar">
			<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre del autor" >
			<input type="text" class="form-control" name="nacionalidad" id="nacionalidad" placeholder="Nacionalidad del autor" >
			<br>
			<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
			<a href="<%=url%>AutoresController?op=listar" type="button"
			class="btn btn-outline-primary"> Volver </a>
		</form>
	</div>
</div>


</body>
</html>