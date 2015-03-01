
<%@ page import="blackboard.Enrollment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Enrollments</title>
	</head>
	<body>

		<div id="list-enrollment" class="content scaffold-list" role="main">
			<h1>Enrollments</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${!enrollmentsList }">
				<h2>No enrollment yet !</h2>
			</g:if>
			<g:else>
				<table  class="table table-striped">
				<thead>
						<tr>
							<th><g:message code="enrollment.course.label" default="Course" /></th>
							<th>Delete Enrollment</th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${enrollmentsList}" var="enrollmentInstance">
						<tr >
							<td>${fieldValue(bean: enrollmentInstance, field: "course")}</td>
							<td>
								<g:form controller="enrollment" action="deleteEnrollment" role="form">
									<g:hiddenField name="courseTitle" value="${enrollmentInstance.course.title}"/>
									<g:submitButton name="Delete" class="btn btn-default"/>
								</g:form>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</g:else>
		</div>
		<br/><br/>
		<a class="btn btn-primary" href="${createLink(uri: '/course/showCourses')}">Go Back to List of Courses</a><br/><br/>
		<a class="btn btn-primary" href="${createLink(uri: '/')}">Go Back Home</a>
	</body>
</html>
