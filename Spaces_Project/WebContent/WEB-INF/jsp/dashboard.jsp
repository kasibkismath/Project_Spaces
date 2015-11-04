<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Dashboard</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"
	rel="stylesheet">

<!-- CSS External -->
<link href="${pageContext.request.contextPath}/static/css/spaces.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		id="home">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" id="brand-name"
					href="${pageContext.request.contextPath}">Spaces</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">My Spaces</a></span></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li id="logout-link"><span class="glyphicon glyphicon-user"></span>
						<span><a
							href='<c:url value="/j_spring_security_logout"></c:url>'>Log
								out</a></span></li>


				</ul>
			</div>
		</div>
	</nav>
	<div class="main-content">
		<div class="container" style="height: 350px"></div>
	</div>
	<div class="ftr">
		<div class="container">
			<div class="row">
				<footer>
					<div class="pull-left ftr_space">
						<address>
							<h3>Spaces Inc.</h3>
							<span class="glyphicon glyphicon-map-marker"></span> &nbsp; 200
							Cambridge Place<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cinnamon
							Gardens, Sri Lanka.<br> <span
								class="glyphicon glyphicon-envelope"></span> &nbsp;<a
								href="mailto: admin@moveme.com">admin@spaces.com</a><br> <span
								class="glyphicon glyphicon-phone-alt"></span> &nbsp;<abbr></abbr>011-244-5470
						</address>
					</div>
					<div class="pull-right ftr_space">
						<img
							src="${pageContext.request.contextPath}/static/images/spaces-100px.png"
							class="img-responsive">
						<p>&copy; Spaces Inc.</p>
					</div>
				</footer>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<script>
		$('#logout-link').removeClass();
	</script>
</body>
</html>