<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
		href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min/js"></script>

<title>index.html</title>

<!--  <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
 -->
<script>
	function navigate(page) {
		location.href = "/" + page + "Controller";
		
	}
</script>

</head>
<body>
	
	<% String url = "http://localhost:8080/ProyectoWeb01/"; %>

	<div class="container">
		<br>
		<h1>Navegar a:</h1>
		<br>
	  	<a href="<%=url%>AutoresController" class="btn btn-info"> Autores </a>
	  	<a href="<%=url%>EditorialesController" class="btn btn-info"> Editoriales </a>
	  	<a href="<%=url%>GenerosController" class="btn btn-info"> Generos </a>
	  	<a href="<%=url%>LibrosController" class="btn btn-info"> Libros </a>
	</div>

</body>
</html>