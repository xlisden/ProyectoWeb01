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
 
</head>
<body>

<div class="container">
	<br>
	<h3>Nuevo Autor</h3>
	<% String url = "http://localhost:8080/ProyectoWeb01/"; %>
	<div class="form-group">
		<form role="form" action="<%=url %>AutoresController" method="POST">
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