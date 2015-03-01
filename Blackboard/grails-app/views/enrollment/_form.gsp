<%@ page import="blackboard.Enrollment" %>



<div class="fieldcontain ${hasErrors(bean: enrollmentInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="enrollment.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${blackboard.Course.list()}" optionKey="id" required="" value="${enrollmentInstance?.course?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: enrollmentInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="enrollment.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${blackboard.User.list()}" optionKey="id" required="" value="${enrollmentInstance?.user?.id}" class="many-to-one"/>

</div>

