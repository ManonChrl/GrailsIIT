<%@ page import="blackboard.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'creditHours', 'error')} required">
	<label for="creditHours">
		<g:message code="course.creditHours.label" default="Credit Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="creditHours" type="number" value="${courseInstance.creditHours}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="course.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${courseInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="course.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${courseInstance?.title}"/>

</div>

