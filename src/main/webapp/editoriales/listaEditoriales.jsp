<%@page import="com.unu.beans.Editorial"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Listar editoriales</title>


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
			location.href = "EditorialesController?op=eliminar&ideditorial=" + id;
		}
	}
</script>

</head>
<body>


<br>
<%String url = "http://localhost:8080/ProyectoWeb01/";%>

<div class="container">

<a href="<%=url%>EditorialesController?op=nuevo" type="button"
	class="btn btn-primary"> Nueva Editorial </a>
<a href="<%=url%>" type="button"
	class="btn btn-outline-info"> Volver a la página principal </a>	
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
		List<Editorial> listaEditoriales = (List<Editorial>) request.getAttribute("listaEditoriales");

		if (listaEditoriales != null) {
			for (Editorial editorial : listaEditoriales) {
		%>
		<tr>
			<td><%=editorial.getIdeditorial()%></td>
			<td><%=editorial.getNombre()%></td>
			<td><%=editorial.getContacto()%></td>
			<td><%=editorial.getTelefono()%></td>
			<td>
				<a href="<%=url%>EditorialesController?op=obtener&ideditorial=<%=editorial.getIdeditorial()%>"
				type="button" class="btn btn-outline-warning">Editar</a> 
				<a href="javascript:eliminar(<%=editorial.getIdeditorial()%>)"
				type="button" class="btn btn-outline-danger">Eliminar</a>
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