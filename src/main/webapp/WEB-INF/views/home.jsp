<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Movies Online</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../../css/home.css">
  <script src="../../js/home.js"></script>

</head>
<body>
      <nav class="navbar navbar-default" style="background-color: transparent" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">Online Movie</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/movie">Movie</a></li>
            <li><a href="/serial">Serial</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Country <b class="caret"></b></a>
              <ul class="dropdown-menu">
              <c:forEach var="country" items="${countries}">
                <li><a href="#">${country.countryName}</a></li>
              </c:forEach>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Genre<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <c:forEach var="genre" items="${genres}">
                  <li><a href="#">${genre.genreName}</a></li>
                </c:forEach>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Release Year<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <c:forEach var="releaseYear" items="${releaseYears}">
                  <li><a href="#">${releaseYear.releaseYear}</a></li>
                </c:forEach>
              </ul>
            </li>
            <li><a href="/user">Users</a></li>
            <li>
              <a href="#">Request</a>
            </li>
          </ul>
          <div class="col-sm-3 col-md-3 navbar-right">
            <form class="navbar-form" role="search">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" name="q">
                <div class="input-group-btn">
                  <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                </div>
              </div>
            </form>
          </div>
          <ul class="nav navbar-nav navbar-right">
            <sec:authorize access="!isAuthenticated()">
            <li class="nav-link" id="logIn"><a href="/login">Log In</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            <li style="margin-top: 8px"><form:form action="/logout" method="post"><button class="btn btn-default">Log Out</button></form:form></li>
            </sec:authorize>
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </nav>

   <span style="text-align: center; color: red">${logInException}</span><br>
   <span style="text-align: center; color: red">${SignUpException}</span><br>

    <div id="registration-form" class="container" style="display: none;">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div class="panel panel-login">
            <div class="panel-heading">
              <div class="row">
                <div class="col-xs-6">
                  <a href="#" class="active" id="login-form-link">LogIn</a>
                </div>
                <div class="col-xs-6">
                  <a href="#" class="active" id="signup-form-link">Sign Up</a>
                </div>
              </div>
            </div>
            <hr>
            <div class="panel-body">
              <div class="row">
                <div class="col-lg-12">
                  <form:form id="login-form" method="post" action="/login" style="display: block;">
                    <div class="form-group">
                      <input name="username" type="text" class="form-control input-sm" placeholder="user name">
                    </div>
                    <div class="form-group">
                      <input name="password" type="password" class="form-control input-sm" placeholder="password"><br>
                    </div>
                    <div class="form-group text-center">
                      <input type="checkbox" class="" name="remember me">
                      <label>Remember Me</label>
                    </div>
                    <div class="form-group">
                      <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                          <input type="submit" class="btn btn-login btn-success form-control" value="Log In">
                        </div>
                      </div>
                    </div>
                  </form:form>
                  <form:form id="signup-form" action="/SignUp" modelAttribute="user" method="post" style="display: none;">
                    <div class="form-group">
                      <form:input type="text" path="firstName" value="${user.firstName}" class="form-control input-sm" placeholder="first name"/>
                    </div>
                    <div class="form-group">
                        <form:input path="lastName" type="text" class="form-control input-sm" placeholder="last name"/>
                    </div>
                    <div class="form-group">
                        <form:input path="age" type="text" class="form-control input-sm" placeholder="age"/>
                    </div>
                    <div class="form-group">
                        <form:input path="email" type="email" class="form-control input-sm" placeholder="email"/>
                    </div>
                    <div class="form-group">
                        <form:input path="password" type="password" class="form-control input-sm" placeholder="password"/>
                    </div>
                    <div class="form-group">
                      <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                            <input type="submit" class="form-control btn btn-register btn-success" value="Sign Up">
                        </div>
                      </div>
                    </div>
                  </form:form>
                </div>
              </div>
            </div>
           </div>
           </div>
        </div>
     </div>
</body>
</html>