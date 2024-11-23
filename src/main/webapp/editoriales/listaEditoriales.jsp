<%@page import="com.unu.beans.Editorial"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Listar editoriales</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>
<script>
	function eliminar(id) {
		if(confirm("¿Desea eliminar el registro?") == true){
			location.href = "EditorialesController?op=eliminar&ideditorial=" + id;
		}
	}
	function modificar(id) {
		if(confirm("¿Desea modificar el registro?") == true){
			location.href = "EditorialesController?op=obtener&ideditorial=" + id;
		}
	}
</script>
</head>
<body>
<% List<Editorial> listaEditoriales = (List<Editorial>) request.getAttribute("listaEditoriales"); %>

<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">

	<br>
	<a href="<%=url%>EditorialesController?op=nuevo"  class="btn btn-primary"> Nueva Editorial </a>
	<br> <br>
	<table id="tabla" class="table table-bordered">
		<thead>
			<tr>
				<th>Id de la editorial</th>
				<th>Nombre de la editorial</th>
				<th>Contacto de la editorial</th>
				<th>Telefono de la editorial</th>
				<th>Operaciones</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (listaEditoriales != null) {
				for (Editorial editorial : listaEditoriales) {
			%>
			<tr>
				<td><%=editorial.getIdeditorial()%></td>
				<td><%=editorial.getNombre()%></td>
				<td><%=editorial.getContacto()%></td>
				<td><%=editorial.getTelefono()%></td>
				<td>
					<a href="javascript:modificar(<%=editorial.getIdeditorial()%>)" class="btn btn-outline-warning"> Modificar </a> 
					<a href="javascript:eliminar(<%=editorial.getIdeditorial()%>)" class="btn btn-outline-danger"> Eliminar </a>
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