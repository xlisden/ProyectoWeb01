<%@page import="com.unu.beans.Editorial"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Listar editoriales</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


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


</head>
<body>

</body>
</html>