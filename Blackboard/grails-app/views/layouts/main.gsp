<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Default Title"/></title>
		<asset:stylesheet src="bootstrap.css"/>
		<asset:stylesheet src="bootstrap.min.css"/>
		
		<g:layoutHead/>
	</head>
	<body>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${resource()}">Blackboard</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="${resource()}">Home</a></li>
            <li><a href="${resource()}/course/showCourses">Courses</a></li>
            <li><a href="${resource()}/enrollment/showEnrollments">Enrollment</a></li>
            <li><g:render contextPath="/course/" template="searchBar"/></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          	<g:if test="${session.user }">
          		<li><a class="btn btn-link disabled" href="${resource()}">Welcome ${session.username}</a></li>
            	<li><a href="${resource()}/user/doLogout">Log out</a></li>
            </g:if>
            <g:else>
            	<li><a href="${resource()}">Log In</a></li>
            	<li><a href="${resource()}/user/register">Register</a></li>
            </g:else>
          </ul>
        </div>
      </div>
    </nav>
	
		<g:layoutBody/>
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		
	</body>
</html>
