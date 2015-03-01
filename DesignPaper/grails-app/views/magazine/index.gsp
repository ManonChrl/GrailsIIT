
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
			<table class="table table-striped">
			<thead>
					<tr>
					<g:sortableColumn property="name" title="${message(code: 'magazine.name.label', default: 'Name')}" />
					<g:sortableColumn property="publicationDate" title="${message(code: 'magazine.publicationDate.label', default: 'Publication Date')}" />
					<g:if test="${session.role=='manager'}">
						<g:sortableColumn property="librarySection" title="${message(code: 'magazine.librarySection.label', default: 'Library Section')}" />
						<g:sortableColumn property="loanAvailable" title="${message(code: 'magazine.loanAvailable.label', default: 'Loan Available')}" />					
						<td>	Edit magazine</td>
					</g:if>
					</tr>
				</thead>
				<tbody>
				<g:each in="${magazinesList}" var="mag">
					<tr >
						<td>${fieldValue(bean: mag, field: "name")}</td>
						<td><g:formatDate format="MM/dd/yyyy" date="${mag.publicationDate}"/></td>
						<g:if test="${session.role=='manager'}">
							<td>${fieldValue(bean: mag, field: "librarySection")}</td>
							<td>${fieldValue(bean: mag, field: "loanAvailable")}</td>
							<td><g:form controller="magazine" action="edit" class="form-horizontal" role="form" >
								<g:hiddenField name="barcode" value="${mag.barcode}" class="form-control"/>
								<g:submitButton name="Edit" class="btn btn-default"/>
							</g:form></td>
						</g:if>
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${session.role=='manager'}">
				<g:form controller="magazine" action="add" class="form-horizontal" role="form" >
					<g:submitButton name="Add a Magazine" class="btn btn-default"/>
				</g:form>
			</g:if>
		</div>
		
		
		<a href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>
