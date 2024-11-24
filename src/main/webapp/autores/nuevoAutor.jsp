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

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

</head>
<body>
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
 		if(aux == '' || aux == null){
 			alert(mensaje);
 			document.getElementById(parametro).focus();
 			value = false;
 		}
 		return value;
 	}
</script>
<% 
	if(request.getParameter("respuesta") != null){
		System.out.print("entro al respuesta verificar!!!");
		boolean respuesta = (boolean) request.getAttribute("respuesta");
		System.out.println(respuesta);
		if(respuesta){
			List<String> listaErrores = (ArrayList<String>) request.getAttribute("listaErrores");
			for(String error: listaErrores){
				System.out.println("en el for insando");
				%>
				<p class="text-danger"><span><%= error %></span></p>
				<%
			}
		}
	}
%>
<% 
	String nombre = (String) request.getAttribute("nombre"); 
	String nacionalidad = (String) request.getAttribute("nacionalidad");
%>
 
<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">

	<br>
	<h3>Nuevo Autor</h3>
	<div class="form-group">
		<form role="form" action="<%=url %>AutoresController" method="POST" onsubmit="return validar()">
			<input type="hidden" name="op" value="insertar">
			<input type="text" name="nombre" <%= (nombre == null) ? "placeholder='Nombre'" : "value='" + nombre + "'" %>  id="nombre" pattern="[A-Za-zÑñáéíóúÁÉÍÓÚ\s]+" class="form-control" > <p></p>
			<input type="text" name="nacionalidad" <%= (nacionalidad == null) ? "placeholder='Nacionalidad'" : "value='" + nacionalidad + "'" %>  id="nacionalidad" pattern="[A-Za-zÑñáéíóúÁÉÍÓÚ\s]+" class="form-control"  > <p></p>
			<br>
			<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
			<a href="<%=url%>AutoresController?op=listar" class="btn btn-outline-primary"> Volver </a>
		</form>
	</div>
</div>

</body>
</html>
