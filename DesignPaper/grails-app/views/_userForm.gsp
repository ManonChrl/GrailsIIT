<g:form controller="user" action="doLogin" class="form-horizontal" role="form" >
	<div class="form-group">
		<label for="login" class="col-sm-2 control-label">Login : </label>	
		<div class="col-xs-3">
			<g:textField name="login" class="form-control"/>
		</div>
	</div>
	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password : </label>	
		<div class="col-xs-3">
			<g:passwordField name="password" class="form-control"/>
		</div>
	</div>
	<div class="form-group">
    	<div class="col-sm-offset-2 col-xs-3">
			<g:submitButton name="Log In" class="btn btn-default"/>
   		 </div>
  </div>
</g:form>
