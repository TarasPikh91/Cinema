<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <%--<meta charset="UTF-8">--%>
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
          <a class="navbar-brand" href="/"><security:message code="lable.logo"/></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
          <ul class="nav navbar-nav">
            <%--admin navbar--%>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <li class="active"><a href="/movie"><security:message code="lable.movie"/></a></li>
              <li><a href="/serial"><security:message code="lable.serial"/></a></li>
              <li><a href="/country"><security:message code="label.country"/></a></li>
              <li><a href="/genre"><security:message code="lable.genre"/></a></li>
              <li><a href="/releaseYear"><security:message code="lable.releaseYear"/></a></li>
              <li><a href="/user"><security:message code="lable.user"/></a></li>
            </sec:authorize>
            <%--admin navbar--%>

              <%--Anonimous navbar--%>
              <sec:authorize access="!isAuthenticated()">
            <li class="active"><a href="#"><security:message code="lable.movie"/></a></li>
            <li><a href="#"><security:message code="lable.serial"/></a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><security:message code="label.country"/><b class="caret"></b></a>
              <ul class="dropdown-menu">
              <c:forEach var="country" items="${countries}">
                <li><a href="#">${country.countryName}</a></li>
              </c:forEach>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><security:message code="lable.genre"/><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <c:forEach var="genre" items="${genres}">
                  <li><a href="#">${genre.genreName}</a></li>
                </c:forEach>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><security:message code="lable.releaseYear"/><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <c:forEach var="releaseYear" items="${releaseYears}">
                  <li><a href="#">${releaseYear.releaseYear}</a></li>
                </c:forEach>
              </ul>
            </li>
            <li>
              <a href="#"><security:message code="lable.request"/></a>
            </li>
              </sec:authorize>
            <%--anonimous navbar--%>

              <%--user navbar--%>
              <sec:authorize access="hasRole('ROLE_USER')">
                <li class="active"><a href="#"><security:message code="lable.movie"/></a></li>
                <li><a href="#"><security:message code="lable.serial"/></a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><security:message code="label.country"/><b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <c:forEach var="country" items="${countries}">
                      <li><a href="#">${country.countryName}</a></li>
                    </c:forEach>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><security:message code="lable.genre"/><b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <c:forEach var="genre" items="${genres}">
                      <li><a href="#">${genre.genreName}</a></li>
                    </c:forEach>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><security:message code="lable.releaseYear"/><b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <c:forEach var="releaseYear" items="${releaseYears}">
                      <li><a href="#">${releaseYear.releaseYear}</a></li>
                    </c:forEach>
                  </ul>
                </li>
                <li>
                  <a href="#"><security:message code="lable.request"/></a>
                </li>
              </sec:authorize>
            <%--user navbar--%>

          </ul>
          <div class="col-sm-3 col-md-3 navbar-right">
            <form class="navbar-form" role="search">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="<security:message code="lable.search"/>" name="q">
                <div class="input-group-btn">
                  <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                </div>
              </div>
            </form>
          </div>
          <ul class="nav navbar-nav navbar-right">
            <sec:authorize access="!isAuthenticated()">
            <li class="nav-link" id="logIn"><a href="/login"><security:message code="lable.logIn"/></a></li>
            </sec:authorize>
            <li><a href="/?lang=ua">укр</a></li>
            <li><a href="/?lang=en">eng</a></li>
            <sec:authorize access="isAuthenticated()">
            <li style="margin-top: 8px"><form:form action="/logout" method="post"><button class="btn btn-default"><security:message code="lable.logOut"/></button></form:form></li>
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
                  <a href="#" class="active" id="login-form-link"><security:message code="lable.logIn"/></a>
                </div>
                <div class="col-xs-6">
                  <a href="#" class="active" id="signup-form-link"><security:message code="lable.registration"/></a>
                </div>
              </div>
            </div>
            <hr>
            <div class="panel-body">
              <div class="row">
                <div class="col-lg-12">
                  <form:form id="login-form" method="post" action="/login" style="display: block;">
                    <div class="form-group">
                      <label class="col-md-4 control-label"><security:message code="lable.firstName"/></label>
                      <input name="username" type="text" class="form-control input-sm" placeholder="<security:message code="lable.firstName"/>">
                    </div>
                    <div class="form-group">
                      <label class="col-md-4 control-label"><security:message code="lable.password"/></label>
                      <input name="password" type="password" class="form-control input-sm" placeholder="<security:message code="lable.password"/>"><br>
                    </div>
                    <div class="form-group text-center">
                      <input type="checkbox" class="" name="remember me">
                      <label><security:message code="lable.rememberMe"/></label>
                    </div>
                    <div class="form-group">
                      <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                          <input type="submit" class="btn btn-login btn-success form-control" value="<security:message code="lable.logIn"/>">
                        </div>
                      </div>
                    </div>
                  </form:form>
                  <form:form id="signup-form" action="/SignUp" modelAttribute="user" method="post" style="display: none;">
                    <div class="form-group">
                      <label class="col-md-4 control-label"><security:message code="lable.firstName"/></label>
                      <form:input type="text" path="firstName" value="${user.firstName}" class="form-control input-sm" placeholder="first name"/>
                    </div>
                    <div class="form-group">
                      <label class="col-md-4 control-label"><security:message code="lable.lastName"/></label>
                      <form:input path="lastName" type="text" class="form-control input-sm" placeholder="last name"/>
                    </div>
                    <div class="form-group">
                      <label class="col-md-4 control-label"><security:message code="lable.age"/></label>
                      <form:input path="age" type="text" class="form-control input-sm" placeholder="age"/>
                    </div>
                    <div class="form-group">
                      <label class="col-md-4 control-label"><security:message code="lable.email"/></label>
                      <form:input path="email" type="email" class="form-control input-sm" placeholder="email"/>
                    </div>
                    <div class="form-group">
                      <label class="col-md-4 control-label"><security:message code="lable.password"/></label>
                      <form:input path="password" type="password" class="form-control input-sm" placeholder="password"/>
                    </div>
                    <div class="form-group">
                      <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                            <input type="submit" class="form-control btn btn-register btn-success" value="<security:message code="lable.registration"/>">
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

      <%--<script>--%>
          <%--// Only change code below this line.--%>
          <%--if (navigator.geolocation) {--%>
              <%--navigator.geolocation.getCurrentPosition(function(position) {--%>
                  <%--$("#data").html("latitude: " + position.coords.latitude + "<br>longitude: " + position.coords.longitude);--%>
              <%--});--%>
          <%--}--%>


          <%--// Only change code above this line.--%>
      <%--</script>--%>
      <%--<div id = "data">--%>
        <%--<h4>You are here:</h4>--%>

      <%--</div>--%>
</body>
</html>