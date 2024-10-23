<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>

	<h3>Nuevo Autor</h3>

	<% String url = "http://localhost:8080/ProyectoWeb01/"; %>
	<form role="form" action="<%=url %>AutoresController" method="POST">
		<input type="hidden" name="op" value="insertar">
		Nombre del autor: <input type="text" name="nombre" id="nombre">
		<br>
		Nacionalidad: <input type="text" name="nacionalidad" id="nacionalidad">
		<br>
		<input type="submit" value="Guardar" name="Guardar">
		<a href="<%=url%>AutoresController?op=listar" type="button"
		class="btn btn-outline-primary"> Volver </a>
	</form>

</body>
</html>