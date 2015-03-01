
<%@ page import="blackboard.Course"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Courses</title>
	</head>
	<body>
		
		
		<div id="list-course" class="content scaffold-list" role="main">
			<h1>Courses</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${message}">
					<div class="alert alert-info" role="alert">
						${message}
					</div>
			</g:if>
			
			<a class="btn btn-primary" href="${resource()}/course/showCourses">See all courses</a><br/>
			
			<g:if test="${coursesRendered }" >
				<h2>First ${coursesRendered.size} results : </h2>
			</g:if>
			<g:if test="${coursesList || coursesRendered }">
				<table class="table table-striped">
				<thead>
						<tr>
						<g:sortableColumn property="title" title="${message(code: 'course.title.label', default: 'Title')}" />
						<g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Description')}" />
						<g:sortableColumn property="creditHours" title="${message(code: 'course.creditHours.label', default: 'Credit Hours')}" />
						<g:if test="${session.user}">
							<g:sortableColumn property="Register" title="${message(code: 'course.register.label', default: 'Register')}" />
						</g:if>
						</tr>
					</thead>
					<tbody>
						<g:each in="${coursesList}" var="course">
							<tr >
								<td>${fieldValue(bean: course, field: "title")}</td>
								<td>${fieldValue(bean: course, field: "description")}</td>
								<td>${fieldValue(bean: course, field: "creditHours")}</td>
								<g:if test="${session.user}">
									<td>
										<g:form controller="course" action="register" role="form">
											<g:hiddenField name="courseTitle" value="${course.title}"/>
											<g:submitButton name="Register" class="btn btn-default"/>
										</g:form>
									</td>
								</g:if>
							</tr>
						</g:each>
						<g:each in="${coursesRendered}" var="course">					
							<tr >
								<td>${fieldValue(bean: course, field: "title")}</td>
								<td>${fieldValue(bean: course, field: "description")}</td>
								<td>${fieldValue(bean: course, field: "creditHours")}</td>
								<g:if test="${session.user}">
									<td>
										<g:form controller="course" action="register" role="form">
											<g:hiddenField name="courseTitle" value="${course.title}"/>
											<g:submitButton name="Register" class="btn btn-default"/>
										</g:form>
									</td>
								</g:if>
							</tr>
						</g:each>
					</tbody>
				</table>
			</g:if>
			<g:else>
				<h2>No result</h2>
			</g:else>
		</div>
		<a class="btn btn-primary" href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>
