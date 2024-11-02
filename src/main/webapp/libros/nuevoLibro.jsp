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
	
	<div class="container">
		<br>
		<% List<String> listaGeneros = (List<String>) request.getAttribute("nombresGeneros"); %>
		<select class="form-select" aria-label="Default select example">
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
		<a href="<%=url%>EditorialesController?op=nuevo" class="btn btn-outline-dark">Nuevo genero</a>
		<br>
		<% List<String> listaEditoriales = (List<String>) request.getAttribute("nombresEditoriales"); %>
		<select class="form-select" aria-label="Default select example">
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
		<a href="<%=url%>EditorialesController?op=nuevo" class="btn btn-outline-dark">Nueva editorial</a>
	</div>	


</body>
</html>
