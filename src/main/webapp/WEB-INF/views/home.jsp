<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Movies Online</title>
  <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">--%>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="../../css/home.css">
  <script src="../../js/home.js"></script>

</head>
<body>


      <%--<sec:authorize access="isAuthenticated()">--%>
        <%--<li class="nav-item">--%>
          <%--<form:form action="/logout" method="post">--%>
            <%--<button class="btn btn-default btn-sm" style="text-align: center; margin-top: 10px;">--%>
              <%--<span class="glyphicon glyphicon-log-out"></span>Log Out--%>
            <%--</button></form:form>--%>
        <%--</li>--%>
      <%--</sec:authorize>--%>
    <%--</ul>--%>
    <%--<form class="form-inline my-2 my-lg-0">--%>
      <%--<input class="form-control mr-sm-2" type="text" placeholder="Search">--%>
      <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
    <%--</form>--%>
  <%--</div>--%>
<%--</nav>--%>
<nav class="navbar navbar-inverse">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-3">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">Cinema</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-collapse-3">
      <ul class="nav navbar-nav navbar-right">
       <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li><a href="/movie">Movie</a></li>
        <li><a href="/serial">Serial</a></li>
        <li><a href="/country">Country</a></li>
        <li><a href="/genre">Genre</a></li>
        <li><a href="/releaseYear">Release Year</a></li>
        <li><a href="/user">Users</a></li>
       </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
          <li id="logIn"><a href="/login">Log In</a></li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <li><a href="/logout">Log Out</a></li>
        </sec:authorize>
        <li>
          <a class="btn btn-default btn-outline btn-circle"  data-toggle="collapse" href="#nav-collapse3" aria-expanded="false" aria-controls="nav-collapse3">Search</a>
        </li>
      </ul>
      <div class="collapse nav navbar-nav nav-collapse" id="nav-collapse3">
        <form class="navbar-form navbar-right" role="search">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Search" />
          </div>
          <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
        </form>
      </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav><!-- /.navbar -->



   <%--<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-dark">--%>
     <%--<a class="navbar-brand" href="/">Online Movie</a>--%>
     <%--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">--%>
       <%--<span class="navbar-toggler-icon"></span>--%>
     <%--</button>--%>
     <%--<div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
       <%--<ul class=" mr-auto nav nav-pills">--%>
         <%--<sec:authorize access="hasRole('ROLE_ADMIN')">--%>
         <%--<li class="nav-item">--%>
           <%--<a class="nav-link" href="/country">Country</a>--%>
         <%--</li>--%>
         <%--<li class="nav-item">--%>
           <%--<a class="nav-link" href="/movie">Movie</a>--%>
         <%--</li>--%>
         <%--<li class="nav-item">--%>
           <%--<a class="nav-link" href="/genre">Genre</a>--%>
         <%--</li>--%>
         <%--<li class="nav-item">--%>
           <%--<a class="nav-link" href="/releaseYear">Release Year</a>--%>
         <%--</li>--%>
         <%--<li class="nav-item">--%>
           <%--<a class="nav-link" href="/serial">Serial</a>--%>
         <%--</li>--%>
           <%--<li>--%>
             <%--<a class="nav-link" href="/user">Users</a>--%>
           <%--</li>--%>
         <%--</sec:authorize>--%>
         <%--<sec:authorize access="!isAuthenticated()">--%>
         <%--<li class="nav-item">--%>
               <%--<button id="logIn" class="btn btn-secondary btn-sm" type="button">Log In</button>--%>
         <%--</li>--%>
         <%--</sec:authorize>--%>

         <%--<sec:authorize access="isAuthenticated()">--%>
           <%--<li class="nav-item">--%>
             <%--<form:form action="/logout" method="post">--%>
               <%--<button class="btn btn-default btn-sm" style="text-align: center; margin-top: 10px;">--%>
                 <%--<span class="glyphicon glyphicon-log-out"></span>Log Out--%>
               <%--</button></form:form></li>--%>
         <%--</sec:authorize>--%>
       <%--</ul>--%>
       <%--<form class="form-inline my-2 my-lg-0">--%>
         <%--<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">--%>
         <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
       <%--</form>--%>
     <%--</div>--%>
   <%--</nav>--%>
   <span style="text-align: center; color: red">${logInException}</span><br>
   <span style="text-align: center; color: red">${SignUpException}</span><br>

   <div id="registration-form" class="container">
     <div class="container">
<div id="loginbox" class="mainbox col-md-5 col-md-offset-4 col-sm-7 col-sm-offset-3">
<div class="panel panel-primary" >
  <div class="panel-heading">
    <div class="panel-title text-center"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</div>
  </div>

  <div class="panel-body" >

    <div id="login-alert" class="alert alert-danger col-sm-12"></div>
    <form:form action="/login" class="form-horizontal" method="post">

      <div class="input-group col-sm-offset-3 col-sm-7">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <input  type="text" class="form-control input-sm" name="username" value="" placeholder="username">
      </div>
      <div class="input-group col-sm-offset-3 col-sm-7">
        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
        <input type="password" class="form-control input-sm" name="password" placeholder="password">
      </div>

      <div class="input-group col-sm-offset-3 col-sm-7">
        <div class="checkbox">
          <label>
            <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
          </label>
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-12 controls text-center">
             <button class="btn btn-primary btn-sm">Log In</button>
        </div>
      </div>

      <div class="form-group">
        <div class="col-md-12 control">
          <div class="dontAcc">
            Don't have an account!
            <a href="/#signupbox" onClick="$('#loginbox').hide(); $('#signupbox').show()">
              Sign Up Here
            </a>
          </div>
        </div>
      </div>
    </form:form>



  </div>
</div>
</div>
<div id="signupbox" class="mainbox col-md-5 col-md-offset-4 col-sm-7 col-sm-offset-3">
<div class="panel panel-primary">
  <div class="panel-heading">
    <div class="panel-title text-center">Sign Up <i class="fa fa-user-plus"></i></div>
    <div class="signIn"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
  </div>
  <div class="panel-body" >
    <form:form method="post" action="/SignUp" modelAttribute="user"  class="form-horizontal">

      <div id="signupalert" class="alert alert-danger">
        <p>Error:</p>
        <span></span>
      </div>

      <div class="form-group">
        <label class="col-md-4 control-label">First Name</label>
        <div class="col-md-8">
          <form:input type="text" path="firstName" class="form-control input-sm" placeholder="first name"/>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-4 control-label">Last Name</label>
        <div class="col-md-8">
          <form:input path="lastName" type="text" class="form-control input-sm" placeholder="last name"/>
        </div>
      </div>

      <div class="form-group">

        <label class="col-md-4 control-label">Age</label>
        <div class="col-md-8">
          <form:input path="age" type="text" class="form-control input-sm" placeholder="age"/>
        </div>
      </div>

      <div class="form-group">

        <label class="col-md-4 control-label">Email</label>
        <div class="col-md-8">
          <form:input path="email" type="email" class="form-control input-sm" placeholder="email"/>
        </div>
      </div>
      <div class="form-group">

        <label class="col-md-4 control-label">Password</label>
        <div class="col-md-8">
          <form:input path="password" type="password" class="form-control input-sm" placeholder="password"/>
        </div>
      </div>

      <div class="form-group">
        <!-- Button -->
        <div class="col-md-offset-4 col-md-8">
          <button class="btn btn-primary btn-sm"> Sign Up <i class="fa fa-user-plus"></i></button>
        </div>
      </div>


      <div class="form-group">
        <div class="col-md-12 control">
          <div class="logInText">
            Do you have an account!
            <a href="#" onClick="$('#signupbox').hide(); $('#loginbox').show()">
              Login Here
            </a>
          </div>
        </div>
      </div>
    </form:form>
  </div>
</div>
</div>
</div>
</div>
</body>
</html>