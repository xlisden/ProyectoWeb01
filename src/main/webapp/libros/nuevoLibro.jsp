<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>
<body>

	<% String url = "http://localhost:8080/ProyectoWeb01/"; %>
	<% List<String> listaGeneros = (List<String>) request.getAttribute("nombresGeneros"); %>
	<% List<String> listaEditoriales = (List<String>) request.getAttribute("nombresEditoriales"); %>
	
	<div class="container">
		<div class="form-group">
			<form role="form" action="<%=url%>LibrosController" method="POST">
				<input type="hidden" name="op" value="insertar"> <p></p>
				<input type="text" name="nombre" id="nombre" placeholder="Nombre del libro" class="form-control">  <p></p>
				<input type="number" name="existencias" id="existencias" placeholder="Existencias del libro" class="form-control"> <p></p>
				<input type="number" name="precio" id="precio" placeholder="Precio del libro" class="form-control"> <p></p>
				<select class="form-select" aria-label="Default select example" name="genero" id="genero">
				  <option selected>Generos</option>
				  <%
				  if(listaGeneros != null){
					  for(int i=0; i<listaGeneros.size(); i++){
				  %>
				  		<option><%= listaGeneros.get(i) %></option>
				  <%
					  }
				  }
				  %>
				</select>
				<a href="<%=url%>LibrosController?op=nuevo" class="btn btn-outline-dark">Nuevo genero</a> <p></p>
				<select class="form-select" aria-label="Default select example" name="editorial" id="editorial">
				  <option selected>Editoriales</option>
				  <%
				  if(listaEditoriales != null){
					  for(int i=0; i<listaEditoriales.size(); i++){
				  %>
				  		<option><%= listaEditoriales.get(i) %></option>
				  <%
					  }
				  }
				  %>
				</select>
				<a href="<%=url%>LibrosController?op=nuevo" class="btn btn-outline-dark">Nueva editorial</a>  <p></p>
				<input type="text" name="autor" id="autor" value="Joyo Mayes" class="form-control"> <p></p>
				<input type="text" name="descripcion" id="descripcion" placeholder="Descripcion" class="form-control"> <p></p>
				<br>
				<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
				
			</form>
		</div>
		<br>
		

		

	</div>	


</body>
</html>
