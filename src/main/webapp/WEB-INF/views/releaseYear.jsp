<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 9/20/2017
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Release Year</title>
</head>
<body>
<jsp:include page="adminPanel.jsp"/>
<div class="container" style="margin-top: 50px">
    <form:form modelAttribute="releaseYear" method="post">
        <fieldset class="form-group">
            <label for="releaseYear">Release Year</label>
            <span style="text-align: center; color: red">${ReleaseYearException}</span>
            <form:input path="releaseYear" class="form-control"/><br>
        </fieldset>
            <button type="submit" class="btn btn-default">Save Year</button>
    </form:form>
</div>

<div class="container table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>Id</th>
                <th>Release Year</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="year" items="${releaseYears}">
            <tr>
                <td>${year.id}</td>
                <td>${year.releaseYear}</td>
                <td><a href="/updateReleaseYear/${year.id}">Update</a></td>
                <td><a href="/deleteReleaseYear/${year.id}">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
