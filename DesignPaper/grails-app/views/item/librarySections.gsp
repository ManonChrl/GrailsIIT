
<%@ page import="designpaper.Loan"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Library Sections</title>
	</head>
	<body>
		
		
		<div class="content scaffold-list" role="main">
			<h1>Library Sections</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${message}">
					<div class="alert alert-info" role="alert">
						${message}
					</div>
			</g:if>
			<g:if test="${session.role=='manager'}">
				<g:form url='[controller: "item", action: "search"]' method="get">
					<g:textField class="form-control" name="query" value="${params.query}" size="25" placeholder="Search"/> 
				    <input type="submit" value="Search" />
				</g:form>
			</g:if>
			
			<g:if test="${itemList}">
				<g:each in="${itemList}" var="item">
					<g:if test="${item.type=='Book' }">
						<table class="table table-striped">
						<thead>
								<tr>
								<g:sortableColumn property="title" title="${message(code: 'item.title.label', default: 'Title')}" />
								<g:sortableColumn property="Author" title="${message(code: 'item.author.label', default: 'Author')}" />
								<g:sortableColumn property="Loan Available" title="${message(code: 'item.loanAvailable.label', default: 'Loan Available')}" />
								</tr>
							</thead>
							<tbody>
								<tr >
									<td>${item.title}</td>
									<td>${item.author}</td>
									<td>${item.loanAvailable}</td>
								</tr>
							</tbody>
						</table>
					</g:if>
					<g:if test="${item.type=='Disk' }">
						<table class="table table-striped">
							<thead>
									<tr>
									<g:sortableColumn property="title" title="${message(code: 'item.title.label', default: 'Title')}" />
									<g:sortableColumn property="publicationDate" title="${message(code: 'item.publicationDate.label', default: 'Date')}" />
									</tr>
								</thead>
								<tbody>
									<tr >
										<td>${item.title}</td>
										<td><g:formatDate format="MM/dd/yyyy" date="${item.publicationDate}"/></td>
									</tr>
								</tbody>
							</table>
					</g:if>
					<g:if test="${item.type=='Magazine' }">
					<table class="table table-striped">
						<thead>
								<tr>
								<g:sortableColumn property="name" title="${message(code: 'item.name.label', default: 'Name')}" />
								<g:sortableColumn property="publicationDate" title="${message(code: 'item.publicationDate.label', default: 'Publication Date')}" />
								</tr>
							</thead>
							<tbody>
								<tr >
									<td>${item.name}</td>
									<td><g:formatDate format="MM/dd/yyyy" date="${item.publicationDate}"/></td>
								</tr>
							</tbody>
						</table>
					</g:if>
				</g:each>
			</g:if>
		</div>
		
		
		<a href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>
