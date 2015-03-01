
<%@ page import="designpaper.Magazine"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Magazines</title>
	</head>
	<body>
		
		
		<div id="list-course" class="content scaffold-list" role="main">
			<h1>Magazines</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${message}">
					<div class="alert alert-info" role="alert">
						${message}
					</div>
			</g:if>
			<g:if test="${session.role=='manager'}">
				<g:form controller="magazine" action="doEdit" class="form-horizontal" role="form" >
					<div class="form-group">
						<label for="librarySection" class="col-sm-2 control-label">Library Section : </label>	
						<div class="col-xs-3">
							<g:textField name="librarySection" value="${mag.librarySection }" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="loanAvailable" class="col-sm-2 control-label">Loan Available : </label>	
						<div class="col-xs-3">
							True : <g:radio name="loanAvailable" value="true" checked="true"/>
							False : <g:radio name="loanAvailable" value="false" />
						</div>
					</div>
					<g:hiddenField type="number" name="barcode" value="${mag.barcode }" class="form-control"/>
					<div class="form-group">
				    	<div class="col-sm-offset-2 col-xs-3">
							<g:submitButton name="Edit" class="btn btn-default"/>
				   		 </div>
				  </div>
				</g:form>
			</g:if>
		</div>
		
		
		<a href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>
