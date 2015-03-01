<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome on the library</title>
	</head>
	<body>
		<div class="container">
			<div style="text-align:center" class="jumbotron">
				<h1>Welcome on the library </h1><br/>
			</div>
		</div>
		<g:if test="${!session.login}">
			<div class="container">
				<g:if test="${message}">
					<div class="alert alert-info" role="alert">
						${message}
					</div>
					<div class="form-horizontal">
						<g:render template="../userForm"></g:render>
					</div>
				</g:if>
				<g:else>
					<g:render template="userForm"></g:render>
				</g:else>
			</div>
		</g:if>
	</body>
</html>
