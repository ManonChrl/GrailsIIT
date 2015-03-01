
<%@ page import="designpaper.Disk"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Disks</title>
	</head>
	<body>
		
		
		<div id="list-course" class="content scaffold-list" role="main">
			<h1>Disks</h1>
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
					<g:sortableColumn property="title" title="${message(code: 'disk.title.label', default: 'Title')}" />
					<g:sortableColumn property="publicationDate" title="${message(code: 'disk.publicationDate.label', default: 'Date')}" />
					<g:if test="${session.role=='manager'}">
						<g:sortableColumn property="librarySection" title="${message(code: 'disk.librarySection.label', default: 'Library Section')}" />
						<g:sortableColumn property="loanAvailable" title="${message(code: 'disk.loanAvailable.label', default: 'Loan Available')}" />					
						<td>	Edit disk</td>
					</g:if>
					</tr>
				</thead>
				<tbody>
				<g:each in="${disksList}" var="disk">
					<tr >
						<td>${fieldValue(bean: disk, field: "title")}</td>
						<td><g:formatDate format="MM/dd/yyyy" date="${disk.publicationDate}"/></td>
						<g:if test="${session.role=='manager'}">
							<td>${fieldValue(bean: disk, field: "librarySection")}</td>
							<td>${fieldValue(bean: disk, field: "loanAvailable")}</td>
							<td><g:form controller="disk" action="edit" class="form-horizontal" role="form" >
								<g:hiddenField name="barcode" value="${disk.barcode}" class="form-control"/>
								<g:submitButton name="Edit" class="btn btn-default"/>
							</g:form></td>
						</g:if>
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${session.role=='manager'}">
				<g:form controller="disk" action="add" class="form-horizontal" role="form" >
					<g:submitButton name="Add a Disk" class="btn btn-default"/>
				</g:form>
			</g:if>
		</div>
		<a href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>
