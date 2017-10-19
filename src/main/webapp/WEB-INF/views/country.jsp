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
    <title>Country</title>
</head>
<body>
<div class="container">
    <form:form modelAttribute="country" method="post">
        <span style="text-align: center; color: red">${countryNameException}</span>
        <form:input path="countryName"/>
        <button>Save</button>
    </form:form>
</div>
<c:forEach var="country" items="${countries}">
    <ul>
        <li>${country.countryName} <a href="/deleteCountry/${country.id}">Delete</a><a href="/updateCountry/${country.id}">Update</a></li>
    </ul>
</c:forEach>
</body>
</html>
