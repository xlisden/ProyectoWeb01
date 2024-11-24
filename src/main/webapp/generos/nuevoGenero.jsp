<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Nuevo genero </title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>
</head>
<body>

<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">
	<br>
	<h3>Nuevo genero</h3> <p></p>
	<div class="form-group">
	<form role="form" action="<%=url%>GenerosController" method="POST">
		<br>
		<input type="hidden" name="op" value="insertar">
		
		<input type="text" name="nombre" placeholder="Nombre" pattern="[A-Za-zÑñáéíóúÁÉÍÓÚ\s]+"  class="form-control"> <p></p>
		<input type="text" name="descripcion" placeholder="Descripcion" pattern="[A-Za-zÑñáéíóúÁÉÍÓÚ\s]+" class="form-control"> <p></p>
		<br>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
		<a href="<%=url%>GenerosController?op=listar" class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>
</div>

</body>
</html>