<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 9/24/2017
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Update Movie</title>
</head>
<body>
<div class="container" style="margin-top: 50px">
<form:form method="post" modelAttribute="currentMovieWithCountries">
    <fieldset class="form-group">
        <label>Update Movie</label>
    <input class="form-control" type="text" value="${currentMovieWithCountries.title}" name="title"/>
    <c:forEach items="${currentMovieWithCountries.countries}" var="country">
        ${country.countryName}<a href="/updateMovie/${currentMovieWithCountries.id}/${country.id}">delete</a><br>
    </c:forEach>
    </fieldset>
    <button type="submit" class="btn btn-default">Update</button>
</form:form>
</div>
</body>
</html>
