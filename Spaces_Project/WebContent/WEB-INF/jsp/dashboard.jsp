<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" ng-app="spacesApp">
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
<body ng-controller="mainController">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		id="home">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#dashboard-collapse"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" id="brand-name"
					href="${pageContext.request.contextPath}">Spaces</a>
			</div>
			<div class="collapse navbar-collapse" id="dashboard-collapse">
				<ul class="nav navbar-nav" id="nav-elements">
					<li><a href="#">My Spaces</a></li>
					<li><a href="#">Settings</a></li>
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
	<!-- End of Navigation -->
	<div class="main-content">
		<div class="container tpad-dashboard" style="height: 1000px">
			<div class="row">
				<div class="col-xs-12">
					<!-- Table -->
					<table class="table">
						<tr>
							<th>Name</th>
							<th>Street</th>
							<th>City</th>
							<th>State</th>
							<th>Country</th>
							<th>Contact</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<%-- <c:forEach var="space" items="${spaces}"> --%>
							<tr ng-repeat="space in spaces">
								<td>{{space.name}}</td>
								<td>{{space.street}}</td>
								<td>{{space.city}}</td>
								<td>{{space.state}}</td>
								<td>{{space.country}}</td>
								<td>{{space.contact}}</td>
								<td><a href="#" class="btn btn-primary">Edit</a></td>

								<td><a href="#space-delete-modal"
									class="open-SpaceDeleteModal btn btn-danger"
									id="space-delete-btn" data-toggle="modal"
									data-name='{{space.name}}' data-space-id='{{space.id}}'>Delete</a></td>
							</tr>
							<!-- Delete Modal -->
							<div class="modal fade" id="space-delete-modal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Delete Space</h4>
										</div>
										<div class="modal-body">
											<sf:form
												action="${pageContext.request.contextPath}/dashboard"
												commandName="space" method="post">
												<sf:input type="hidden" name="id" path="id" value=""
													id="spaceId" />
												<div id="modal-space-name" style="padding-bottom: 30px">
													Do you want to delete the Space - <span></span>?
												</div>
												<hr>
												<input type="submit" class="btn btn-primary"
													name="deleteSpace" value="Delete Space" />
											</sf:form>
										</div>
									</div>
								</div>
							</div>
						<%-- </c:forEach> --%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- End of main content -->
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
	<!-- End of footer -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<script>
		$('#logout-link').removeClass();

		$(document).on("click", ".open-SpaceDeleteModal", function() {
			var spaceName = $(this).data('name');
			var spaceId = $(this).data('space-id');

			$(".modal-body #modal-space-name span").text(spaceId);

			$(".modal-body #spaceId").val(spaceId);
			
			console.log($('.modal-body #spaceId').val());

		});

		/* setTimeout(function() {
			window.location.reload(1);
		}, 5000); */
	</script>
	<script src="//code.angularjs.org/1.4.7/angular.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/app.js"></script>
</body>
</html>