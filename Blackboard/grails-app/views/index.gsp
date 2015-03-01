<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome on Blackbord</title>
	</head>
	<body>
		<div class="container">
			<div style="text-align:center" class="jumbotron">
				<h1>Welcome on Blackboard </h1><br/>
				<g:if test="${session.username}">
					<g:link style="align:center" class="btn btn-primary" controller="Course" action="showCourses">See Courses</g:link><br/><br/>
					<g:link class="btn btn-primary" controller="Enrollment" action="showEnrollments">See My Enrollments</g:link><br/><br/><br/><br/><br/><br/>
					<g:link class="btn btn-primary" controller="User" action="doLogout">Log out</g:link>
				</g:if>
			</div>
		</div>
		<g:if test="${!session.username}">
			<div class="container">
				<g:if test="${message}">
					<div class="alert alert-info" role="alert">
						${message}
					</div>
					<div class="form-horizontal">
						<g:render template="../userForm"></g:render>
					</div>
					If you have no account, please
					<div class="col-sm-offset-2 col-sm-10">
						<a class="btn btn-default" href="${createLink(uri: '/user/register')}">Register</a>
					</div>
				</g:if>
				<g:else>
					<g:render template="userForm"></g:render>
					If you have no account, please
					<div class="col-sm-offset-2 col-sm-10">
						<a class="btn btn-default" href="${createLink(uri: '/user/register')}">Register</a>
					</div>
				</g:else>
			</div>
		</g:if>
	</body>
</html>
