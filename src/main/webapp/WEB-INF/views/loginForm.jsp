<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

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
	<div class="container">
		<h1>Login da Casa do Codigo</h1>
		<form:form servletRelativeAction="/login" method="POST">
			<div class="form-group">
				<label>E-mail</label>
				<input name="username" type="text" class="form-control"/>
				<form:errors path="titulo" />
			</div>
			<div class="form-group">
				<label>Senha</label>
				<input name="password" type="password" class="form-control"/>
			</div>
			<button type="submit" class="btn btn-primary">Entrar</button>
		</form:form>
	</div>
	<script src="${jsPath }/jquery-3.5.1.min.js"></script>
	<script src="${jsPath }/bootstrap.min.js"></script>
</body>
</html>