<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
<c:url value="/resources/css" var="cssPath"/>
<link rel="stylesheet" href="${ cssPath }/bootstrap.min.css">
<style type="text/css">
	h1{
		padding: 80px 0px;
		padding-bottom: 0px;
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
		      	<li class="nav-item">
	            	<a class="nav-link" href="${ s:mvcUrl('PC#listar').build() }">Lista de Produtos</a>
	          	</li>
		        <li class="nav-item active">
		        	<a class="nav-link" href="${ s:mvcUrl('PC#form').build() }">Cadastro de Produtos 
		        		<span class="sr-only">(current)</span>
		        	</a>
		        </li>
		      </ul>
		      <ul class="navbar-nav ml-auto">
		      	<li class="nav-item">
		      		<a href="#" class="nav-link"><security:authentication property="principal.nome"/></a>
		      	</li>
		      	<li class="nav-item"><a href="/casadocodigo/logout" class="btn btn-danger">Sair</a></li>
		      </ul>
		    </div>
		</div>
	</nav>
	<div class="container">
		<h1>Casa do Código</h1>
		<form:form action="${s:mvcUrl('PC#gravar').build() }" method="post" commandName="produto" enctype="multipart/form-data">
			<div class="form-group">
				<label>Título</label>
				<form:input path="titulo" cssClass="form-control"/>
				<form:errors path="titulo" />
			</div>
			<div class="form-group">
		        <label>Descrição</label>
				<form:textarea path="descricao" cssClass="form-control"/>
		        <form:errors path="descricao" />
			</div>
			<div class="form-group">
				<label>Páginas</label>
				<form:input path="paginas" cssClass="form-control"/>
		        <form:errors path="paginas" />
			</div>
			<div class="form-group">
				<label>Data de  Lançamento</label>
				<form:input path="dataLancamento" cssClass="form-control"/>
		        <form:errors path="dataLancamento" />
			</div>
			<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
				<div class="form-group">
					<label>${tipoPreco}</label>
					<form:input path="precos[${status.index}].valor" cssClass="form-control"/>
					<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}"/>
				</div>
			</c:forEach>
			<div class="form-group">
			    <label>Sumário</label>
			    <input name="sumario" type="file" class="form-control"/>
			</div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>
	</div>
	<script src="${jsPath }/jquery-3.5.1.min.js"></script>
	<script src="${jsPath }/bootstrap.min.js"></script>
</body>
</html>