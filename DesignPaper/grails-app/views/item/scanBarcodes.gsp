
<%@ page import="designpaper.Loan"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Barcodes</title>
	</head>
	<body>
		
		
		<div class="content scaffold-list" role="main">
			<h1>Scan Barcodes</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${message}">
					<div class="alert alert-info" role="alert">
						${message}
					</div>
			</g:if>
			<g:if test="${session.role=='deskOperator'}">
				<g:form controller="item" action="itemLoaned" class="form-horizontal" role="form" >
					<div class="form-group">
						<label for="barcode" class="col-sm-2 control-label">Barcode : </label>	
						<div class="col-xs-3">
							<g:field type="number" name="barcode" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="login" class="col-sm-2 control-label">User Login : </label>	
						<div class="col-xs-3">
							<g:textField name="login" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
				    	<div class="col-sm-offset-2 col-xs-3">
							<g:submitButton name="Loan Item" class="btn btn-default"/>
				   		 </div>
				  	</div>
				</g:form>
			</g:if>
		</div>
		
		
		<a href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>
