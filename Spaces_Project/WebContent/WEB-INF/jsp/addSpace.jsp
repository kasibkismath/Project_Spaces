<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Add Space</title>

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
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3>Thank you for submitting</h3>
				</div>
				<div class="modal-body">
					<p>
						<b>The space has been published successfully.</b>
					</p>
					<p class="tpad">
						<i>The Spaces Team</i>
					</p>
				</div>
				<div class="modal-footer">
					<a href="${pageContext.request.contextPath}"
						class="btn btn-default btn-lg">OK</a>
				</div>
			</div>
		</div>
	</div>
	<div class="addSpace">
		<div class="container padded">
			<div class="row">
				<div class="col-sm-8">
					<h1>Add Space</h1>
					<hr>
					<sf:form class="form-horizontal tpad" method="post"
						action="${pageContext.request.contextPath}/createdSpace"
						commandName="space">
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Name <b
								class="required-fields">*</b></label>
							<div class="col-sm-10">
								<sf:input type="text" class="form-control" id="name"
									placeholder="Name" path="name" />
							</div>
						</div>
						<div class="form-group">
							<label for="street" class="col-sm-2 control-label">Street
							</label>
							<div class="col-sm-10">
								<sf:input type="text" class="form-control" id="street"
									placeholder="Street" path="street" />
							</div>
						</div>
						<div class="form-group">
							<label for="city" class="col-sm-2 control-label">City </label>
							<div class="col-sm-10">
								<sf:input type="text" class="form-control" id="city"
									placeholder="City" path="city" />
							</div>
						</div>
						<div class="form-group">
							<label for="state" class="col-sm-2 control-label">State</label>
							<div class="col-sm-10">
								<sf:input type="text" class="form-control" id="state"
									placeholder="State" path="state" />
							</div>
						</div>
						<div class="form-group">
							<label for="country" class="col-sm-2 control-label">Country
								<b class="required-fields">*</b>
							</label>
							<div class="col-sm-10">
								<sf:input type="text" class="form-control" id="country"
									placeholder="Country" path="country" />
							</div>
						</div>
						<div class="form-group">
							<label for="contact" class="col-sm-2 control-label">Contact
								<b class="required-fields">*</b>
							</label>
							<div class="col-sm-10">
								<sf:input type="text" class="form-control" id="contact"
									placeholder="Contact" path="contact" />
							</div>
						</div>
						<div class="form-group btnPad">
							<div class="col-sm-offset-6 col-sm-6">
								<button type="submit" class="btn org-btn">Publish Space</button>
								<button type="button" style="display: none" data-toggle="modal"
									data-target="#myModal"></button>
							</div>
						</div>
					</sf:form>
				</div>
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
		status = "${status}";

		if (status == "yes") {
			$(document).ready(function() {
				$('#myModal').modal('show');

			});
		}
	</script>
</body>
</html>
