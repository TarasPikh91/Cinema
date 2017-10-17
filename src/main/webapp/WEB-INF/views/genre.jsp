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
    <title>Genre</title>
</head>
<body>
<form:form modelAttribute="genre" method="post">
    <form:input path="genreName"/>Genre Name<br>
    <button>Save Genre</button>
</form:form>

<c:forEach var="genre" items="${genres}">
    <ul>
        <li>${genre.genreName} <a href="/deleteGenre/${genre.id}">Delete</a> <a href="/updateGenre/${genre.id}">Update</a></li>
    </ul>
</c:forEach>
</body>
</html>
