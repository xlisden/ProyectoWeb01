<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.section {
	    display: flex;
	    align-items: center;
	    margin-bottom: 15px;
	    margin-top: 15px;
	}
	.select {
		height: 40px;
		width: 180px;
	}
	.btn-outline-dark {
		margin-left: 30px;
		height: 40px;
		width: 160px;
	}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>
<body>
<% List<String> listaGeneros = (List<String>) request.getAttribute("nombresGeneros"); %>
<% List<String> listaEditoriales = (List<String>) request.getAttribute("nombresEditoriales"); %>
<% List<String> listaAutores = (List<String>) request.getAttribute("nombresAutores"); %>

<%@ include file='/cabeceraMenu.jsp' %>
<div class="container">

	<br>
	<h3>Insertar libro</h3> <p></p>
	<div class="form-group">
		<form role="form" action="<%=url%>LibrosController" method="POST">
			<input type="hidden" name="op" value="insertar"> <p></p>
			<input type="text" name="nombre" placeholder="Nombre" class="form-control">  <p></p>
			<input type="number" name="existencias" placeholder="Nro de existencias" class="form-control"> <p></p>
			<input type="number" name="precio" placeholder="Precio" class="form-control"> <p></p>
			<section class="section">
				<select class="form-select" name="genero" class="select">
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
<%-- 					<a href="<%=url%>GenerosController?op=nuevo" class="btn btn-outline-dark">Nuevo genero</a> <p></p> --%>
				</section>
				<section class="section">
					<select class="form-select" name="editorial" class="select"> 
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
<%-- 					<a href="<%=url%>EditorialesController?op=nuevo" class="btn btn-outline-dark">Nueva editorial</a>  <p></p> --%>
				</section>
				<section class="section">
					<select class="form-select" name="autor" class="select">
					  <option selected>Autores</option>
					  <%
					  if(listaAutores != null){
						  for(int i=0; i<listaAutores.size(); i++){
					  %>
					   	<option><%= listaAutores.get(i) %></option>
					  <%
						  }
					  }
					  %>
					</select>
<%-- 					<a href="<%=url%>AutoresController?op=nuevo" class="btn btn-outline-dark" >Nuevo autor</a>  <p></p> --%>
				</section>
				<input type="text" name="descripcion" id="descripcion" placeholder="Descripcion" class="form-control"> <p></p>
				<br>
				<input type="submit" value="Guardar" name="Guardar" class="btn btn-primary">
				<a href="<%=url%>LibrosController?op=listar" class="btn btn-outline-primary"> Volver </a>
			</form>
		</div>
		<br>
		

	</div>	


</body>
</html>
