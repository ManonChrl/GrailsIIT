
<%@ page import="designpaper.Loan"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Loans</title>
	</head>
	<body>
		
		
		<div class="content scaffold-list" role="main">
			<h1>Loans</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${message}">
					<div class="alert alert-info" role="alert">
						${message}
					</div>
			</g:if>
			<g:if test="${loanedItems }">
				<table class="table table-striped">
				<thead>
						<tr>
						<g:sortableColumn property="dueDate" title="Due Date" />
						<g:sortableColumn property="loanDate" title="Loan Date" />
						<g:sortableColumn property="item" title="Item" />	
						<g:sortableColumn property="type" title="Type" />				
						</tr>
					</thead>
					<tbody>
					<g:each in="${loanedItems}" var="loan">
						<tr >
							<td><g:formatDate format="MM/dd/yyyy" date="${loan.dueDate}"/></td>
							<td><g:formatDate format="MM/dd/yyyy" date="${loan.loanDate}"/></td>
							<td>${loan.item}</td>
							<td>${loan.item.type}</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</g:if>
			<g:else>
				<h2>No loaned items</h2>
			</g:else>
		</div>
		
		
		<a href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>
