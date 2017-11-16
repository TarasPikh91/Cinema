<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 10/12/2017
  Time: 10:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Update Serial</title>
</head>
<body>
<jsp:include page="adminPanel.jsp"/>
<div class="container">
    <form:form modelAttribute="serialToUpdate" method="post" action="/updateSerial/${serialToUpdate.id}?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
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
        <fieldset class="form-group">
            <label>Image</label>
            <input class="form-control" type="file" name="image">
        </fieldset>
        <button type="submit" class="btn btn-default">Update Serial</button>
    </form:form>
</div>
</body>
</html>
