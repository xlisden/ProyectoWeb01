<%@page import="com.unu.beans.Editorial"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar editoriales</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>

</head>
<body>

<%
	Editorial editorial = null;
	HttpSession sesion = request.getSession();
	if (request.getAttribute("editorial") == null) {
		editorial = new Editorial();
	} else {
		editorial = (Editorial) request.getAttribute("editorial");
	}
%>	

<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">

	<br>
	<h3> Editar Editorial </h3> <p></p>
	<div class="form-group">
	<form role="form" action="<%=url %>EditorialesController" method="POST">
		<input type="hidden" name="op" value="modificar">
		<input type="hidden" name="ideditorial" value="<%=editorial.getIdeditorial()%>" >
		
		<input type="text" name="nombre" id="nombre" value="<%=editorial.getNombre()%>" pattern="[A-Za-zÑñáéíóúÁÉÍÓÚ\s]+" class="form-control" > <p></p>
		<input type="email" name="contacto" id="contacto" value="<%=editorial.getContacto()%>" class="form-control" > <p></p>
		<input type="number" name="telefono" id="telefono" value="<%=editorial.getTelefono()%>" pattern="[0-9]{9}$" class="form-control" >  <p></p>
		<br>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
		<a href="<%=url%>EditorialesController?op=listar" class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>

</div>

</body>
</html>