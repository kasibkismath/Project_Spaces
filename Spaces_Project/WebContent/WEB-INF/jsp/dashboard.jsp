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
					<li id="currentUser"><span>Welcome, ${currentUser}</span></li>
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
					<div class="addSpaceContainer pull-right">
						<button type="button" class="btn btn-success" data-toggle="modal"
							data-target="#addSpaceModal">Add a New Space</button>
					</div>

					<!-- Add New Space Modal -->
					<div class="modal fade" id="addSpaceModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Add a New Space</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" name="addSpaceForm"
										id="addSpaceForm" ng-submit="addSpace()">
										
											<input type="hidden" name="currentUser" value="${currentUser}">
											
										<div class="form-group">
											<label for="space-add-name">Name</label>

											<div ng-messages="addSpaceForm.spaceAddName.$error"
												role="alert">
												<div ng-message="required" class="alert alert-danger">Name
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">Name
													must be at least 7 characters</div>
											</div>

											<input type="text" name="spaceAddName" class="form-control"
												id="space-add-name" placeholder="Name" required
												minlength="7" ng-model="addSpaceName">
										</div>


										<div class="form-group">

											<label for="space-add-street">Street</label>

											<div ng-messages="addSpaceForm.spaceAddStreet.$error"
												role="alert">
												<div ng-message="required" class="alert alert-danger">Street
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">Street
													must be at least 10 characters</div>
											</div>

											<input type="text" class="form-control" id="space-add-street"
												name="spaceAddStreet" placeholder="Street" required
												minlength="10" ng-model="addSpaceStreet" />

										</div>

										<div class="form-group">
											<label for="space-add-city">City</label>

											<div ng-messages="addSpaceForm.spaceAddCity.$error"
												role="alert">
												<div ng-message="required" class="alert alert-danger">City
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">City
													must be at least 5 characters</div>
											</div>

											<input type="text" name="spaceAddCity" class="form-control"
												id="space-add-city" placeholder="City" required
												minlength="5" ng-model="addSpaceCity">
										</div>

										<div class="form-group">
											<label for="space-add-state">State</label>

											<div ng-messages="addSpaceForm.spaceAddState.$error"
												role="alert">
												<div ng-message="minlength" class="alert alert-danger">State
													must be at least 2 characters</div>
											</div>

											<input type="text" name="spaceAddState" class="form-control"
												id="space-add-state" placeholder="State" minlength="2"
												ng-model="addSpaceState">
										</div>

										<div class="form-group">
											<label for="space-add-country">Country</label>

											<div ng-messages="addSpaceForm.spaceAddCountry.$error"
												role="alert">
												<div ng-message="required" class="alert alert-danger">Country
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">Country
													must be at least 3 characters</div>
											</div>

											<input type="text" name="spaceAddCountry"
												class="form-control" id="space-add-country"
												placeholder="Country" required minlength="3"
												ng-model="addSpaceCountry">
										</div>

										<div class="form-group">
											<label for="space-add-contact">Contact</label>

											<div ng-messages=addSpaceForm.spaceAddContact.$error
												"
												role="alert">
												<div ng-message="required" class="alert alert-danger">Contact
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">Contact
													must be at least 10 characters</div>
												<div ng-message="maxlength" class="alert alert-danger">Contact
													must be less than 13 characters</div>
											</div>

											<input name="spaceAddContact" type="text"
												class="form-control" id="space-add-contact"
												placeholder="Contact" required minlength="10"
												ng-maxlength="13" ng-model="addSpaceContact">
										</div>

										<div class="modal-footer">
											<input type="button" class="btn btn-default"
												data-dismiss="modal" value="Cancel" /> <input type="submit"
												class="btn btn-primary" name="addSpace" id="addSpace"
												value="Add Space" />
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Add New Space Modal -->
				</div>
			</div>
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
						<tr ng-repeat="space in spaces">
							<td ng-cloak>{{space.name}}</td>
							<td ng-cloak>{{space.street}}</td>
							<td ng-cloak>{{space.city}}</td>
							<td ng-cloak>{{space.state}}</td>
							<td ng-cloak>{{space.country}}</td>
							<td ng-cloak>{{space.contact}}</td>

							<td ng-cloak><a href="#space-edit-modal"
								class="open-SpaceEditModal btn btn-primary" data-toggle="modal"
								data-name='{{space.name}}' data-space-id='{{space.id}}'
								ng-click="showEditDetails(space.id)"> Edit </a></td>

							<td ng-cloak><a href="#space-delete-modal"
								class="open-SpaceDeleteModal btn btn-danger"
								id="space-delete-btn" data-toggle="modal"
								data-name='{{space.name}}' data-space-id='{{space.id}}'>
									Delete </a></td>
						</tr>
						<!-- ng-repeat finishes -->
					</table>

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
									<sf:form action="${pageContext.request.contextPath}/dashboard"
										commandName="space" method="post">
										<sf:input type="hidden" name="id" path="id" value=""
											id="spaceId" />
										<div id="modal-space-name" style="padding-bottom: 30px">
											Do you want to delete the Space - <span></span>?
										</div>
										<hr>
										<input type="button" class="btn btn-default" value="Cancel"
											data-dismiss="modal" />
										<input type="submit" class="btn btn-primary"
											name="deleteSpace" value="Delete Space" />
									</sf:form>
								</div>
							</div>
						</div>
					</div>

					<!-- Edit Modal -->
					<div class="modal fade" id="space-edit-modal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Edit Space</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" name="editForm">
										<div class="form-group">
											<label for="space-edit-id">ID</label><input type="text"
												class="form-control" id="space-edit-id" placeholder="ID"
												value="{{spaceEditObj.id}}" disabled>
										</div>

										<div class="form-group">
											<label for="space-edit-name">Name</label>

											<div ng-messages="editForm.spaceEditName.$error" role="alert">
												<div ng-message="required" class="alert alert-danger">Name
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">Name
													must be at least 7 characters</div>
											</div>

											<input type="text" name="spaceEditName" class="form-control"
												id="space-edit-id" placeholder="Name"
												value="{{spaceEditObj.name}}" required minlength="7"
												ng-model="editSpaceName">
										</div>

										<div class="form-group">

											<label for="space-edit-street">Street</label>

											<div ng-messages="editForm.spaceEditStreet.$error"
												role="alert">
												<div ng-message="required" class="alert alert-danger">Street
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">Street
													must be at least 10 characters</div>
											</div>

											<input type="text" class="form-control"
												name="spaceEditStreet" placeholder="Street"
												value="{{spaceEditObj.street}}" required minlength="10"
												ng-model="editSpaceStreet" />

										</div>

										<div class="form-group">
											<label for="space-edit-city">City</label>

											<div ng-messages="editForm.spaceEditCity.$error" role="alert">
												<div ng-message="required" class="alert alert-danger">City
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">City
													must be at least 5 characters</div>
											</div>

											<input type="text" name="spaceEditCity" class="form-control"
												id="space-edit-city" placeholder="City"
												value="{{spaceEditObj.city}}" required minlength="5"
												ng-model="editSpaceCity">
										</div>

										<div class="form-group">
											<label for="space-edit-city">State</label>

											<div ng-messages="editForm.spaceEditState.$error"
												role="alert">
												<div ng-message="minlength" class="alert alert-danger">State
													must be at least 2 characters</div>
											</div>

											<input type="text" name="spaceEditState" class="form-control"
												id="space-edit-state" placeholder="State"
												value="{{spaceEditObj.state}}" minlength="2"
												ng-model="editSpaceState">
										</div>

										<div class="form-group">
											<label for="space-edit-country">Country</label>

											<div ng-messages="editForm.spaceEditCountry.$error"
												role="alert">
												<div ng-message="required" class="alert alert-danger">Country
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">Country
													must be at least 3 characters</div>
											</div>

											<input type="text" name="spaceEditCountry"
												class="form-control" id="space-edit-country"
												placeholder="Country" value="{{spaceEditObj.country}}"
												required minlength="3" ng-model="editSpaceCountry">
										</div>

										<div class="form-group">
											<label for="space-edit-contact">Contact</label>

											<div ng-messages="editForm.spaceEditContact.$error"
												role="alert">
												<div ng-message="required" class="alert alert-danger">Contact
													is required</div>
												<div ng-message="minlength" class="alert alert-danger">Contact
													must be 10 characters</div>
												<div ng-message="maxlength" class="alert alert-danger">Contact
													must be 10 characters</div>
											</div>

											<input name="spaceEditContact" type="text"
												class="form-control" id="space-edit-contact"
												placeholder="Contact" value="{{spaceEditObj.contact}}"
												required minlength="10" maxlength="13"
												ng-model="editSpaceContact">
										</div>

										<div class="modal-footer">
											<input type="button" class="btn btn-default"
												data-dismiss="modal" value="Cancel" /> <input type="button"
												class="btn btn-primary" name="saveSpace" id="saveSpace"
												value="Save Space"
												ng-click="updateSpace(editSpaceId, editSpaceName, editSpaceStreet, editSpaceCity, editSpaceState, editSpaceCountry, editSpaceContact)" />
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>
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

		// delete modal 
		$(document).on("click", ".open-SpaceDeleteModal", function() {
			var spaceName = $(this).data('name');
			var spaceId = $(this).data('space-id');

			$(".modal-body #modal-space-name span").text(spaceName);

			$(".modal-body #spaceId").val(spaceId);

		});

		// edit modal
		$(document).on("click", ".open-SpaceEditModal", function() {
			var spaceName = $(this).data('name');
			var spaceId = $(this).data('space-id');

			$(".modal-body #spaceEditId").val(spaceId);

		});

		// close edit modal on click of the Save Space button
		$('#saveSpace').click(function() {
			$('#space-edit-modal').modal('hide');
		});
		
		// close add space modal in click
		$('#addSpace').click(function(){
			$('#addSpaceModal').modal('hide');
		});
	</script>
	<script src="//code.angularjs.org/1.4.7/angular.min.js"></script>
	<script src="//code.angularjs.org/1.4.7/angular-messages.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/app.js"></script>
</body>
</html>