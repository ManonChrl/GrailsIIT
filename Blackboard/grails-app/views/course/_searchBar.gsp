<g:form class="navbar-form navbar-right" url='[controller: "course", action: "search"]' method="get">
	<g:textField class="form-control" name="query" value="${params.query}" size="25" placeholder="Search in courses..."/> 
    <input class="btn btn-primary" type="submit" value="Search" />
</g:form>