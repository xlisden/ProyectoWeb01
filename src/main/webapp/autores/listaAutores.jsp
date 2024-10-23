<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import = "java.util.List" %>
<%@ page import = "com.unu.beans.Autor" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<table id="tabla" class="table table-bordered">
  <thead>
  	<tr>
  		<th> Id del autor </th>
  		<th> Nombre del autor </th>
  		<th> Nacionalidad del autor </th>
  		<th> Operaciones </th>
  	</tr>
  </thead>
  <tbody>
  	<%
  		List<Autor> listaAutores = (List<Autor>) request.getAttribute("listaAutores");
  		
  		if(listaAutores != null){
  			for(Autor autor: listaAutores){
  	%>
  				<tr>
  					<td class="border-primary"><%= autor.getIdAutor() %></td>
  					<td class="border-danger"><%= autor.getNombre() %></td>
  					<td class="border-success"><%= autor.getNacionalidad() %></td>
  					<td></td>
  				</tr>
	<%				
  			}
  		} else {
  	%>
  				<tr>
  					<td> — </td>
  					<td> — </td>
  					<td> — </td>
  					<td></td>
  				</tr>
  	<%
  		}
  	%>
  </tbody>
</table>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>


</body>
</html>