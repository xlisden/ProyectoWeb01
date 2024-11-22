<%@page import="com.unu.model.Mensajes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo autor </title>

<link rel="stylesheet"
		href="assets/css/bootstrap.min.css">
<!-- <script src="assets/js/bootstrap.min.js"></script> -->
<!--  <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
 -->

</head>
<body>
 <script>
 	function validar() {
		const resp = true;
		const nombre = document.getElementById('nombre').value.trim();
		const nacionalidad = document.getElementById('nacionalidad').value.trim();
		
			if(nombre == ''){
				alert("Ingrese el nombre del autor.");
				document.getElementById('nombre').focus();
				resp = false;
			}
			if(nacionalidad == ''){
				alert("Ingrese la nacionalidad del autor.");
				document.getElementById('nacionalidad').focus();
				resp = false;
			}
			return resp;
			
	}
 </script>
 
<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">
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
			<%
			if(request.getAttribute("nombre") == null){
			%>
<!-- 				<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre del autor" required="required"> -->
				<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre del autor" >
			<%
			}else{
				String nombre = (String)request.getAttribute("nombre");
			%>
<%-- 				<input type="text" class="form-control" name="nombre" id="nombre" value="<%= nombre %>" required="required"> --%>
				<input type="text" class="form-control" name="nombre" id="nombre" value="<%= nombre %>" >
			<%
			}
			%>
			<%
			if(request.getAttribute("nacionalidad") == null){
			%>
<!-- 				<input type="text" class="form-control" name="nacionalidad" id="nacionalidad" placeholder="Nacionalidad del autor" required="required"> -->
				<input type="text" class="form-control" name="nacionalidad" id="nacionalidad" placeholder="Nacionalidad del autor" >
			<%
			}else{
				String nacionalidad = (String)request.getAttribute("nacionalidad");
			%>
<%-- 				<input type="text" class="form-control" name="nacionalidad" id="nacionalidad" value="<%= nacionalidad %>" > --%>
				<input type="text" class="form-control" name="nacionalidad" id="nacionalidad" value="<%= nacionalidad %>" >
			<%
			}
			%>
			<br>
			<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
			<a href="<%=url%>AutoresController?op=listar" type="button"
			class="btn btn-outline-primary"> Volver </a>
		</form>
	</div>
</div>


</body>
</html>
