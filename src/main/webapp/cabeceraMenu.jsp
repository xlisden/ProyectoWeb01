<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<% String url = "http://localhost:8080/ProyectoWeb01/"; %>

<!-- <div class="container"> -->
<nav  class="navbar navbar-expand-lg" style="background-color: #1f1f1e;" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<%=url%>">   Biblioteca </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<%=url%>AutoresController?op=listar">Autor</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=url%>EditorialesController?op=listar">Editorial</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=url%>GenerosController?op=listar">Genero</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=url%>LibrosController?op=listar">Libro</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Reportes
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=url%>AutoresController?op=listar">Por Autor</a></li>
            <li><a class="dropdown-item" href="<%=url%>LibrosController?op=listar">Por Libro</a></li>
            <li><a class="dropdown-item" href="<%=url%>EditorialesController?op=listar">Por Editorial</a></li>
            <li><a class="dropdown-item" href="<%=url%>GenerosController?op=listar">Por Genero</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- </div> -->

</body>
</html>