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
    <title>Genre</title>
</head>
<body>
<jsp:include page="adminPanel.jsp"/>
<div class="container" style="margin-top: 50px">
    <form:form modelAttribute="genre" method="post">
        <faildset class="form-group">
            <label for="genreName">Genre Name</label>
            <span style="text-align: center; color: red">${GenreNameException}</span>
            <form:input path="genreName" class="form-control"/><br>
        </faildset>
            <button type="submit" class="btn btn-default">Save Genre</button>
    </form:form>
</div>
<div class="container table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>Id</th>
                <th>Genre Name</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="genre" items="${genres.content}">
            <tr>
                <td>${genre.id}</td>
                <td>${genre.genreName}</td>
                <td><a href="/updateGenre/${genre.id}">Update</a></td>
                <td><a href="/deleteGenre/${genre.id}">Delete</a></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<a href="/genre?page=${genres.number}&size = ${genres.size}">Previous</a>
<a href="/genre?page=${genres.number}&size = ${genres.size}">Next</a>
</body>
</html>
