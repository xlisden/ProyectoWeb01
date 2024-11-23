<%@page import="com.unu.beans.Genero"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listar generos</title>
<link rel="stylesheet"
		href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>
<script>
	function eliminar(id) {
		if(confirm("¿Desea eliminar el registro?") == true){
			location.href = "GenerosController?op=eliminar&idgenero=" + id;
		}
	}
	function modificar(id) {
		if(confirm("¿Desea modificar el registro?") == true){
			location.href = "GenerosController?op=obtener&idgenero=" + id;
		}
	}
</script>
</head>
<body>
<% List<Genero> generos = (List<Genero>) request.getAttribute("listaGeneros"); %>

<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">

	<br>
	<a href="<%=url%>GenerosController?op=nuevo" class="btn btn-primary"> Nuevo genero </a>
	<br> <br>
	<table id="tabla" class="table table-bordered">
		<thead>
			<tr>
				<th>Id genero</th>
				<th>Nombre</th>
				<th>Descripcion</th>
				<th>Operaciones</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (generos != null) {
				for (Genero genero : generos) {
			%>
			<tr>
				<td><%=genero.getIdgenero()%></td>
				<td><%=genero.getNombre()%></td>
				<td><%=genero.getDescripcion()%></td>
				<td>
				<a href="javascript:modificar(<%=genero.getIdgenero()%>)" class="btn btn-outline-warning"> Modificar </a> 
				<a href="javascript:eliminar(<%=genero.getIdgenero()%>)" class="btn btn-outline-danger"> Eliminar </a>
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