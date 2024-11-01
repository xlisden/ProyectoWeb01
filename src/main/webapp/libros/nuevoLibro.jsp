<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	List<String> listaGeneros = (List<String>) request.getAttribute("nombresGeneros");
	%>
	
	<select class="form-select">
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

</body>
</html>
