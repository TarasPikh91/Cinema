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
    <title>Serial</title>
</head>
<body>
<form:form modelAttribute="serial" method="post">
    <form:input path="title"/>Title
    <form:input path="description"/>Description
    <form:input path="duration"/>Duration
    <form:select path="releaseYear" items="${releaseYears}" itemValue="id" itemLabel="releaseYear"/>Release Year
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
    <button>Save</button>
</form:form>
<c:forEach items="${serials}" var="serial">
    <ul>
        <li>${serial.title}<a href="/delete/${serial.id}">Delete</a><a href="/updateSerial/${serial.id}">Update</a></li>
    </ul>
</c:forEach>
</body>
</html>
