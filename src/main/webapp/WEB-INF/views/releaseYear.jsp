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
    <title>Release Year</title>
</head>
<body>
<form:form modelAttribute="releaseYear" method="post">
    <form:input path="releaseYear"/> Release Year<br>
    <button>Save Year</button>
</form:form>

<c:forEach var="releaseYear" items="${releaseYears}">
    <ul>
        <li>${releaseYear.releaseYear} <a href="/deleteReleaseYear/${releaseYear.id}">Delete</a> <a href="/updateReleaseYear/${releaseYear.id}">Update</a> </li>
    </ul>
</c:forEach>
</body>
</html>
