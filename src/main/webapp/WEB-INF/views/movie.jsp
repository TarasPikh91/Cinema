<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 9/20/2017
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie</title>
</head>
<body>
<form:form modelAttribute="movie" method="post">
    <form:input path="title"/>Title <br>
    <form:input path="duration"/>Duration <br>
    <form:input path="description"/>Description <br>
    <form:select path="releaseYear" items="${releaseYears}" itemLabel="releaseYear" itemValue="id"/>
    <select multiple name="genreIds" type="text">
        <c:forEach var="genre" items="${genres}">
            <option value="${genre.id}">${genre.genreName}</option>
        </c:forEach>
    </select><br>
    <select multiple name="countryIds" type="text">
        <c:forEach var="country" items="${countries}">
            <option value="${country.id}">${country.countryName}</option>
        </c:forEach>
    </select>
    <button>Save Movie</button>
</form:form>

<c:forEach var="movie" items="${movies}">
    <ul>
        <li>${movie.title}<a href="/deleteMovie/${movie.id}">Delete</a> <a href="/updateMovie/${movie.id}">Update</a></li>
    </ul>
</c:forEach>
</body>
</html>
