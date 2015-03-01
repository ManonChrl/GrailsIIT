
<%@ page import="designpaper.Book"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Books</title>
	</head>
	<body>
		
		
		<div id="list-course" class="content scaffold-list" role="main">
			<h1>Books</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${message}">
					<div class="alert alert-info" role="alert">
						${message}
					</div>
			</g:if>
			<g:if test="${session.role=='manager'}">
				<g:form controller="book" action="doAdd" class="form-horizontal" role="form" >
				<div class="form-group">
						<label for="title" class="col-sm-2 control-label">Title : </label>	
						<div class="col-xs-3">
							<g:textField name="title" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="authorFirstName" class="col-sm-2 control-label">Author first name : </label>	
						<div class="col-xs-3">
							<g:textField name="authorFirstName" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="authorLastName" class="col-sm-2 control-label">Author last name : </label>	
						<div class="col-xs-3">
							<g:textField name="authorLastName" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="librarySection" class="col-sm-2 control-label">Library Section : </label>	
						<div class="col-xs-3">
							<g:textField name="librarySection" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="barcode" class="col-sm-2 control-label">Barcode : </label>	
						<div class="col-xs-3">
							<g:textField name="barcode" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="loanAvailable" class="col-sm-2 control-label">Loan Available : </label>	
						<div class="col-xs-3">
							True : <g:radio name="loanAvailable" value="true" checked="true"/>
							False : <g:radio name="loanAvailable" value="false" />
						</div>
					</div>
					<div class="form-group">
				    	<div class="col-sm-offset-2 col-xs-3">
							<g:submitButton name="Add" class="btn btn-default"/>
				   		 </div>
				  </div>
				</g:form>
			</g:if>
		</div>
		
		
		<a href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>