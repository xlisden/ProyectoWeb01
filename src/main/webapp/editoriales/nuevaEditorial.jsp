<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nueva editorial</title>

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

<div class="container">
<%@ include file='/cabeceraMenu.jsp' %>
	<br>
	<h3>Nueva editorial</h3>
<%-- 	<% String url = "http://localhost:8080/ProyectoWeb01/"; %> --%>
	<div class="form-group">
	<form role="form" action="<%=url %>EditorialesController" method="POST">
		<input type="hidden" name="op" value="insertar">
		<input type="text" name="nombre" id="nombre" placeholder="Nombre de la editorial" class="form-control">
		<input type="email"name="contacto" id="contacto" placeholder="Contacto de la editorial" class="form-control">
		<input type="number" name="telefono" id="telefono" placeholder="Telefono de la editorial" class="form-control">
		<br>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
		<a href="<%=url%>EditorialesController?op=listar" type="button"
			class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>
</div>


</body>
</html>