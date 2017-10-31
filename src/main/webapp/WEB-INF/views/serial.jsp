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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Serial</title>
</head>
<body>
<div class="container" style="margin-top: 20px">
    <h3 style="text-align: center">Serial</h3>
<form:form modelAttribute="serial" method="post">
    <faildset class="form-group">
        <label>Title</label>
    <span style="text-align: center; color: red">${titleException}</span>
    <form:input path="title" class="form-control"/>

        <label>Description</label>
    <span style="text-align: center; color: red">${descriptionException}</span>
    <form:input path="description" class="form-control"/>

        <label>Duration</label>
    <span style="text-align: center; color: red">${durationException}</span>
    <form:input path="duration" class="form-control"/>

        <label>Release Year</label>
        <form:select class="form-control show-menu-picker" path="releaseYear">
            <option>Release Year</option>
            <c:forEach var="releaseYear" items="${releaseYears}">
                <option value="${releaseYear.id}">${releaseYear.releaseYear}</option>
            </c:forEach>
        </form:select>

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
        </select><br>
    </faildset>
    <button type="submit" class="btn btn-default">Save Serial</button>
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
        <c:forEach var="serial" items="${serials}">
            <tr>
                <td>${serial.id}</td>
                <td>${serial.title}</td>
                <td>${serial.duration}</td>
                <td>${serial.description}</td>
                <td>${serial.releaseYear.releaseYear}</td>
                <td><a href="/updateSerial/${serial.id}">Update</a></td>
                <td><a href="/deleteSerial/${serial.id}">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
