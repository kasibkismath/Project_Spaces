<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Spaces Home Page</title>

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
										data-toggle="modal" href="#signup-modal">SIGN UP</a> <a
										class="btn btn-default btn-lg login-btn" role="button"
										href="#login-modal" data-toggle="modal">LOGIN</a>
								</p>
							</div>
							<!-- Sign up modal -->
							<div class="modal fade" id="signup-modal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Sign Up</h4>
										</div>
										<div class="modal-body">
											<sf:form
												action="${pageContext.request.contextPath}/createUser"
												commandName="user" method="post" id="signUpFormDetails">
												<div class="form-group">
													<c:if
														test="${(not noNameError and not empty noNameError) or duplicateUser}">
														<div class="alert alert-danger" role="alert">
															<span class="glyphicon glyphicon-warning-sign"></span><br>
															<sf:errors path="username"></sf:errors>
														</div>
													</c:if>
													<label for="username">Username</label>
													<sf:input type="text" class="form-control" id="username"
														placeholder="Username" path="username" />
												</div>
												<div class="form-group">
													<c:if test="${not noEmailError and not empty noEmailError}">
														<div class="alert alert-danger" role="alert">
															<span class="glyphicon glyphicon-warning-sign"></span><br>
															<sf:errors path="email"></sf:errors>
														</div>
													</c:if>
													<label for="email">Email address</label>
													<sf:input type="email" class="form-control" id="email"
														placeholder="Email" path="email" />
												</div>
												<div class="form-group">
													<c:if
														test="${not noPasswordError and not empty noPasswordError}">
														<div class="alert alert-danger" role="alert">
															<span class="glyphicon glyphicon-warning-sign"></span><br>
															<sf:errors path="password"></sf:errors>
														</div>
													</c:if>
													<label for="password">Password</label>
													<sf:input type="password" class="form-control"
														id="password" placeholder="Password" path="password" />
												</div>
												<div class="form-group" id="confirmPass">
													<label for="confirmPassword">Confirm Password</label> <input
														type="password" class="form-control" id="confirmPassword"
														placeholder="Confirm Password">
													<div class="alert alert-success" role="alert"
														id="matchedPasswords">
														<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;<span>Passwords
															Match</span>
													</div>
													<div class="alert alert-danger unPass" role="alert"
														id="unMatchedPasswords">
														<span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;<span>Passwords
															Do Not Match</span>
													</div>
												</div>
												<button type="submit"
													class="btn btn-success modal-signupBtn">SIGN UP</button>
											</sf:form>
										</div>
									</div>
								</div>
							</div>
							<!-- Login Modal -->
							<div class="modal fade" id="login-modal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Login</h4>
										</div>
										<div class="modal-body">
											<c:if test="${param.error != null}">
												<div class="alert alert-danger">
													<strong>Error!</strong> Username or Password is incorrect
												</div>
											</c:if>
											<form name="loginForm"
												action="${pageContext.request.contextPath}/j_spring_security_check"
												method="post">
												<div class="form-group">
													<label for="loginUsername">Username</label> <input type="text"
														class="form-control" id="loginUsername" placeholder="Username"
														name="j_username" />
												</div>
												<div class="form-group">
													<label for="loginPassword">Password</label> <input
														type="password" class="form-control" id="loginPassword"
														placeholder="Password" name="j_password" />
												</div>
												<button type="submit" class="btn btn-success">LOGIN</button>
											</form>
										</div>
									</div>
								</div>
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
		$('#unMatchedPasswords').hide();
		$('#matchedPasswords').hide();

		signup_modal = "${signupmodal}";
		login_modal = "${loginModal}";

		if (signup_modal == "on") {
			$(document).ready(function() {
				$('#signup-modal').modal('show');
			});
		}

		if (login_modal == "on") {
			$(document).ready(function() {
				$('#login-modal').modal('show');
			});
		}

		//setting sign up modal focus
		$('#login-modal').on('shown.bs.modal', function() {
			$('#loginUsername').focus();
		});

		// setting login modal focus
		$('#signup-modal').on('shown.bs.modal', function() {
			$('#username').focus();
		});
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static/js/spaces.js"></script>
</body>
</html>
