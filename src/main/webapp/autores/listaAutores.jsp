<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.unu.beans.Autor"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listar autores</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min.js"></script>
<script>
	function eliminar(id) {
		if(confirm("¿Desea eliminar el registro?") == true){
			location.href = "AutoresController?op=eliminar&idautor=" + id;
		}
	}
	function modificar(id) {
		if(confirm("¿Desea modificar el registro?") == true){
			location.href = "AutoresController?op=obtener&idautor=" + id;
		}
	}
</script>
</head>
<body>

<% List<Autor> listaAutores = (List<Autor>) request.getAttribute("listaAutores"); %>

<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">

	<br>
	<a href="<%=url%>AutoresController?op=nuevo" class="btn btn-primary"> Nuevo Autor </a>
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
			if (listaAutores != null) {
				for (Autor autor : listaAutores) {
			%>
			<tr>
				<td><%=autor.getIdAutor()%></td>
				<td><%=autor.getNombre()%></td>
				<td><%=autor.getNacionalidad()%></td>
				<td>
					<a href="javascript:modificar(<%=autor.getIdAutor()%>)" class="btn btn-outline-warning"> Modificar </a>
					<%-- href="<%=url%>EditorialesController?op=obtener&ideditorial=<%=editorial.getIdeditorial()%>" --%>
					<a href="javascript:eliminar(<%=autor.getIdAutor()%>)" class="btn btn-outline-danger"> Eliminar </a>
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