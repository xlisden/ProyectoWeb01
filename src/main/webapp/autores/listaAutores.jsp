<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.unu.beans.Autor"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listar autor</title>

<link rel="stylesheet"
		href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>

<!--  <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
 -->
 
<script>
	function eliminar(id) {
		if(confirm("¿Desea eliminar el registro?") == true){
			location.href = "AutoresController?op=eliminar&idautor=" + id;
		}
	}
</script>
 
</head>
<body>



<br>
<%
	String url = "http://localhost:8080/ProyectoWeb01/";
%>

<div class="container">

<a href="<%=url%>AutoresController?op=nuevo" type="button"
	class="btn btn-primary"> Nuevo Autor </a>
<br> <br>

<table id="tabla" class="table table-bordered">
	<thead>
		<tr>
			<th>Id del autor</th>
			<th>Nombre del autor</th>
			<th>Nacionalidad del autor</th>
			<th>Operaciones</th>
		</tr>
	</thead>
	<tbody>
		<%
		List<Autor> listaAutores = (List<Autor>) request.getAttribute("listaAutores");

		if (listaAutores != null) {
			for (Autor autor : listaAutores) {
		%>
		<tr>
			<td><%=autor.getIdAutor()%></td>
			<td><%=autor.getNombre()%></td>
			<td><%=autor.getNacionalidad()%></td>
			<td>
				<a href="<%=url%>AutoresController?op=obtener&idautor=<%=autor.getIdAutor()%>"
				type="button" class="btn btn-outline-warning">Editar</a> 
				<!--
				<a href="<%=url%>AutoresController?op=eliminar&idautor=<%=autor.getIdAutor()%>"
				type="button" class="btn btn-outline-danger">Eliminar</a> 
				 -->
				<a href="javascript:eliminar(<%=autor.getIdAutor()%>)" type="button" 
				class="btn btn-outline-danger">Eliminar</a>
			</td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td>—</td>
			<td>—</td>
			<td>—</td>
			<td></td>
		</tr>
		<%
		}
		%>
	</tbody>
</table>
</div>


</body>
</html>