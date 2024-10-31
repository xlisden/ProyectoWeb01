<%@page import="com.unu.beans.Editorial"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar editoriales</title>

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
  
	<%
		String url = "http://localhost:8080/ProyectoWeb01/";
		Editorial editorial = null;
		HttpSession sesion = request.getSession();
	
		if (request.getAttribute("editorial") == null) {
			editorial = new Editorial();
		} else {
			editorial = (Editorial) request.getAttribute("editorial");
			System.out.println("Editorial: " + editorial.getNombre() + " " + editorial.getContacto() + " " + editorial.getTelefono());
		}
	%>	
	
	<div class="form-group">
	<form role="form" action="<%=url %>EditorialesController" method="POST">
		<br>
		<input type="hidden" name="op" value="modificar">
		<input type="hidden" name="ideditorial" value="<%=editorial.getIdeditorial()%>" >
		
		<input type="text" name="nombre" id="nombre" value="<%=editorial.getNombre()%>" class="form-control">
		<input type="email" name="contacto" id="contacto" value="<%=editorial.getContacto()%>" class="form-control">
		<input type="number" name="telefono" id="telefono" value="<%=editorial.getTelefono()%>" class="form-control">
		<br>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
		<a href="<%=url%>EditorialesController?op=listar" type="button"
			class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>

</div>

</body>
</html>