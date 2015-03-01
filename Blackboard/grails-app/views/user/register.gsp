
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome on Blackbord</title>
	</head>
	<body>
		<g:if test="${message}">
			<div class="alert alert-info" role="alert">
				${message}
			</div>
		</g:if>
		<g:render template="registerForm"></g:render>
		<br/>
		<br/>
		<br/>
		<a class="btn btn-primary" href="${resource()}">Go Back to Home Page</a><br/>
	</body>
</html>
