<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Spaces Template</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"
	rel="stylesheet">

<!-- CSS External -->
<link href="${pageContext.request.contextPath}/static/css/spaces.css"
	rel="stylesheet">

<!-- Fonts  -->
<link href='https://fonts.googleapis.com/css?family=Cabin:500'
	rel='stylesheet' type='text/css'>

<script
	src="${pageContext.request.contextPath}/static/js/jquery-scrollto.js"></script>

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
		<div class="navbar-header">
			<a class="navbar-brand" id="brand-name"
				href="${pageContext.request.contextPath}">Spaces</a>
		</div>
	</nav>
	<!--End Navigation-->
	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="container">
						<div class="row">
							<div class="col-xs-3">
								<img alt="logo" class="tpad img-responsive"
									src="${pageContext.request.contextPath}/static/images/spaces-100px.png">
							</div>
							<div class="col-sm-9">
								<h1>Unified Real Estate Solution</h1>
								<p class="lead">Spaces is an App that helps people find
									places for rent, by connecting to the local real estate network</p>
								<p>
									<a class="btn btn-default btn-lg signup-btn" role="button"
										href="#">SIGN UP</a> <a
										class="btn btn-default btn-lg login-btn" role="button"
										href="#">LOGIN</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Features -->
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
		$(document).ready(function() {
			$("#about1").click(function() {
				$("#about2").scrollTo();
			});
		})
	</script>
</body>
</html>
