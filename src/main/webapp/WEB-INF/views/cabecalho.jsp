<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<header id="layout-header">
	<div class="clearfix container">
		<a href="/casadocodigo" id="logo"> </a>
		<div id="header-content">
			<nav id="main-nav">
				<ul class="clearfix">
					<li><a href="/casadocodigo/carrinho" rel="nofollow"> <fmt:message
								key="menu.carrinho">
								<fmt:param value="${carrinhoCompras.quantidade }" />
							</fmt:message>
					</a></li>
					<security:authorize access="isAuthenticated()">
						<li><a href="/casadocodigo/produtos" rel="nofollow">Lista
								de Produtos</a></li>
						<li><a href="/casadocodigo/produtos/form" rel="nofollow">Cadastro
								de Produtos</a></li>
					</security:authorize>
					<li><a href="?locale=pt" rel="nofollow"> <fmt:message
								key="menu.pt" />
					</a></li>

					<li><a href="?locale=en_US" rel="nofollow"> <fmt:message
								key="menu.en" />
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<nav class="categories-nav">
	<ul class="container">
		<li class="category"><a href="http://www.casadocodigo.com.br">Home</a></li>
		<li class="category"><a href="/collections/livros-de-agile">
				Agile </a></li>
		<li class="category"><a href="/collections/livros-de-front-end">
				Front End </a></li>
		<li class="category"><a href="/collections/livros-de-games">
				Games </a></li>
		<li class="category"><a href="/collections/livros-de-java">
				Java </a></li>
		<li class="category"><a href="/collections/livros-de-mobile">
				Mobile </a></li>
		<li class="category"><a
			href="/collections/livros-desenvolvimento-web"> Web </a></li>
		<li class="category"><a href="/collections/outros"> Outros </a></li>
	</ul>
</nav>