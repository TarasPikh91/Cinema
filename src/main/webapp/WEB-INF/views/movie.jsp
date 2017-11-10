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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Movie</title>
</head>
<body>
<jsp:include page="adminPanel.jsp"/>
<div class="container" style="margin-top: 20px">
    <form:form modelAttribute="movie" method="post">
        <h3 style="text-align: center">Movie</h3>
    <fieldset class="form-group">
        <label for="Title">Title</label>
        <span style="text-align: center; color: red">${titleException}</span><br>
            <form:input path="title" type="text" class="form-control"/><br>
        <label>Duration</label>
        <span style="text-align: center; color: red">${durationException}</span><br>
    <form:input path="duration" type="text" class="form-control"/><br>

        <label>Description</label>
        <span style="text-align: center; color: red">${descriptionException}</span>
    <form:input path="description" type="text" class="form-control"/><br>

        <div class="dropdown">
        <label>Release Year</label>
        <form:select path="releaseYear" class="selectpicker form-control show-menu-picker">
                <option>release Year</option>
            <c:forEach var="releaseYear" items="${releaseYears}">
                <option value="${releaseYear.id}">${releaseYear.releaseYear}</option>
            </c:forEach>
        </form:select>
        </div><br>

        <label>Genre</label>
        <select multiple class="form-control" name="genreIds" type="text" required>
            <c:forEach var="genre" items="${genres}">
                <option value="${genre.id}">${genre.genreName}</option>
            </c:forEach>
        </select><br>

        <label>Countries</label>
        <select multiple class="form-control" name="countryIds" type="text" required>
            <c:forEach var="country" items="${countries}">
                <option value="${country.id}">${country.countryName}</option>
            </c:forEach>
        </select>
    </fieldset>
        <button class="btn btn-default" type="submit">Save Movie</button>
</form:form>
</div>

<div class="container table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Duration</th>
                <th>Description</th>
                <th>Release Year</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="movie" items="${movies}">
                <tr>
                    <td>${movie.id}</td>
                    <td>${movie.title}</td>
                    <td>${movie.duration}</td>
                    <td>${movie.description}</td>
                    <td>${movie.releaseYear.releaseYear}</td>
                    <td><a href="/updateMovie/${movie.id}">Update</a></td>
                    <td><a href="/deleteMovie/${movie.id}">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
