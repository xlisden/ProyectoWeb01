<%@page import="com.unu.beans.Autor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar autor</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!-- <script src="assets/js/bootstrap.min/js"></script> -->
<script>
	function validar() {
		let resp = true;
		resp = validarCampo('nombre', 'Ingrese el nombre del autor.') && resp;
		resp = validarCampo('nacionalidad', 'Ingrese la nacionalidad del autor.') && resp;

		return resp;
	}
 	function validarCampo(parametro, mensaje){
 		let value = true;
 		const aux = document.getElementById(parametro).value.trim();
 		if(aux == null || aux == ''){
 			alert(mensaje);
 			document.getElementById(parametro).focus();
 			value = false;
 		}
 		return value;
 	}
</script>
</head>
<body>

<%
	Autor autor;
	HttpSession sesion = request.getSession();
	if (request.getAttribute("autor") == null) {
		autor = new Autor();
	} else {
		autor = (Autor) request.getAttribute("autor");
	}
%>
<% 
	String nombre = (String) request.getAttribute("nombre"); 
	System.out.println((nombre==null)? "nombre null" : nombre+"!!");
	String nacionalidad = (String) request.getAttribute("nacionalidad");
	System.out.println((nacionalidad==null)? "nacionalidad null" : nacionalidad+"!!!");
%>

<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">
	<br>	
	<h3>Editar autor</h3> <p></p>
	<div class="form-group">
	<form role="form" action="<%=url %>AutoresController" method="POST" onsubmit="return validar()">
		<input type="hidden" name="op" value="modificar">
		<input type="hidden" name="idautor" value="<%=autor.getIdAutor()%>" > 
		<input type="text" name="nombre" value="<%= (nombre == null) ? autor.getNombre() : nombre %>" class="form-control" id="nombre"> <p></p>
		<input type="text" name="nacionalidad" value="<%= (nacionalidad == null) ? autor.getNacionalidad() : nacionalidad %>" class="form-control" id="nacionalidad"> <p></p>
		<br>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
		<a href="<%=url%>AutoresController?op=listar" class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>
</div>

</body>

</html>