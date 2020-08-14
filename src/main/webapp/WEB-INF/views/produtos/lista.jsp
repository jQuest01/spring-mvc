<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
<c:url value="/resources/css" var="cssPath"/>
<c:url value="/resources/js" var="jsPath"/>
<link rel="stylesheet" href="${ cssPath }/bootstrap.min.css">
<style type="text/css">
	h1{
		padding-top: 80px;
	}
	.logout{
		padding-right: 1000px;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
		<div class="container">
		    <div class="navbar-header">
				<a class="navbar-brand" href="${s:mvcUrl('HC#index').build() }">Casa do Código</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
		        	<span class="navbar-toggler-icon"></span>
		      	</button>
		      </div>
		    <div class="collapse navbar-collapse" id="navbar">
		      <ul class="navbar-nav mr-auto">
		      	<li class="nav-item active">
	            	<a class="nav-link" href="${ s:mvcUrl('PC#listar').build() }">Lista de Produtos <span class="sr-only">(current)</span></a>
	          	</li>
		        <li class="nav-item"><a class="nav-link" href="${ s:mvcUrl('PC#form').build() }">Cadastro de Produtos</a></li>
		      </ul>
		      <ul class="navbar-nav ml-auto">
		      	<li class="nav-item">
		      		<a href="#" class="nav-link"><security:authentication property="principal.nome"/></a>
		      	</li>
		      	<li class="nav-item"><a id="logout" href="/casadocodigo/logout" class="btn btn-danger">Sair</a></li>
		      </ul>
		    </div>
		</div>
	</nav>
	<div class="container">
		<h1>Lista de Produtos</h1>
		
		<div>${sucesso }</div>
		<div>${falha }</div>
		
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Título</th>
				<th>Descrição</th>
				<th>Precos</th>
				<th>Páginas</th>
			</tr>
			<c:forEach items="${produtos }" var="produto">
				<tr>
					<td><a href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build() }">${produto.titulo }</a> </td>
					<td>${produto.descricao }</td>
					<td>${produto.precos }</td>
					<td>${produto.paginas }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script src="${jsPath }/jquery-3.5.1.min.js"></script>
	<script src="${jsPath }/bootstrap.min.js"></script>
</body>
</html>