<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nueva editorial</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>
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
</head>
<body>
<%
	String nombre = (String) request.getAttribute("nombre");
	String contacto = (String) request.getAttribute("contacto");
	String telefono = (String) request.getAttribute("telefono");
%>

<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">

	<br>
	<h3>Nueva editorial</h3> <p></p>
	<div class="form-group">
	<form role="form" action="<%=url %>EditorialesController" method="POST">
		<input type="hidden" name="op" value="insertar">
		<input type="text" name="nombre" <%= (nombre == null) ? "placeholder='Nombre'" : "value='" + nombre + "'" %> pattern="[A-Za-zÑñáéíóúÁÉÍÓÚ\s]+" class="form-control" > <p></p>
		<input type="email"  name="contacto" <%= (contacto == null) ? "placeholder='Contacto'" : "value='" + contacto + "'" %> class="form-control" > <p></p>
		<input type="number" name="telefono" <%= (telefono == null) ? "placeholder='Telefono'" : "value='" + telefono + "'" %> pattern="[0-9]{9}$" class="form-control" > <p></p>
		<br>
		<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
		<a href="<%=url%>EditorialesController?op=listar" class="btn btn-outline-primary"> Volver </a>
	</form>
	</div>
	
</div>

</body>
</html>