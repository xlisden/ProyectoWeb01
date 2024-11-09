<%@page import="com.unu.beans.Libro"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listar Libros</title>
<link rel="stylesheet"
		href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>

<script>
	function eliminar(id) {
		if(confirm("¿Desea eliminar el registro?") == true){
			location.href = "LibrosController?op=eliminar&idlibro=" + id;
		}
	}
	function editar(id) {
		if(confirm("¿Desea editar el registro?") == true){
			location.href = "LibrosController?op=editar&idlibro=" + id;
		}
	}
</script>
</head>
<body>

<% String url = "http://localhost:8080/ProyectoWeb01/"; %>
<% List<Libro> libros = (List<Libro>) request.getAttribute("listaLibros"); %>

<div class="container">
	<br>
	<a href="<%=url%>LibrosController?op=nuevo"
		class="btn btn-primary"> Nuevo libro </a>
	<a href="<%=url%>" type="button"
		class="btn btn-outline-primary"> Volver a la página principal </a>	
	<br> <br>
	<table id="tabla" class="table table-bordered">
		<thead>
			<th>Id libro</th>
			<th>Nombre</th>
			<th>Cant.</th>
			<th>Precio</th>
			<th>Autor</th>
			<th>Editorial</th>
			<th>Genero</th>
			<th>Descripcion</th>
			<th>Operaciones</th>
		</thead>
		<tbody>
			<%
			if (libros != null) {
				for (Libro libro : libros) {
			%>
			<tr>
				<td><%=libro.getIdLibro()%></td>
				<td><%=libro.getNombre()%></td>
				<td><%=libro.getExistencias()%></td>
				<td><%=libro.getPrecio()%></td>
				<td><%=libro.getAutor()%></td>
				<td><%=libro.getEditorial()%></td>
				<td><%=libro.getGenero()%></td>
				<td><%=libro.getDescripcion()%></td>
				<td>
				<a href="javascript:editar(<%=libro.getIdLibro()%>)" class="btn btn-outline-warning">Editar</a> 
				<a href="javascript:eliminar(<%=libro.getIdLibro()%>)" class="btn btn-outline-danger">Eliminar</a>
				</td>
			</tr>
			<%
				}
			}
			%>
		</tbody>
	</table>
</div>

</body>
</html>