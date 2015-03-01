
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
			<table class="table table-striped">
			<thead>
					<tr>
					<g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}" />
					<g:sortableColumn property="Author" title="${message(code: 'book.author.label', default: 'Author')}" />
					<g:if test="${session.role=='manager'}">
						<g:sortableColumn property="librarySection" title="${message(code: 'book.librarySection.label', default: 'Library Section')}" />
						<g:sortableColumn property="loanAvailable" title="${message(code: 'book.loanAvailable.label', default: 'Loan Available')}" />					
						<td>	Edit book</td>
					</g:if>
					</tr>
				</thead>
				<tbody>
				<g:each in="${booksList}" var="book">
					<tr >
						<td>${fieldValue(bean: book, field: "title")}</td>
						<td>${fieldValue(bean: book, field: "author")}</td>
						<g:if test="${session.role=='manager'}">
							<td>${fieldValue(bean: book, field: "librarySection")}</td>
							<td>${fieldValue(bean: book, field: "loanAvailable")}</td>
							<td><g:form controller="book" action="edit" class="form-horizontal" role="form" >
								<g:hiddenField name="barcode" value="${book.barcode}" class="form-control"/>
								<g:submitButton name="Edit" class="btn btn-default"/>
							</g:form></td>
						</g:if>
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${session.role=='manager'}">
				<g:form controller="book" action="add" class="form-horizontal" role="form" >
					<g:submitButton name="Add a Book" class="btn btn-default"/>
				</g:form>
			</g:if>
		</div>
		
		
		<a href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>
