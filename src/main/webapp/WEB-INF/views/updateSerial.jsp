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
    <form:form method="post" modelAttribute="serialWithCountries">
        <fieldset class="form-group">
            <label>Update Serial</label>
            <input class="form-control" type="text" value="${serialWithCountries.title}" name="title"/>
            <c:forEach items="${serialWithCountries.countries}" var="country">
                ${country.countryName}<a href="/updateSerial/${serialWithCountries.id}/${country.id}">delete</a><br>
            </c:forEach>
        </fieldset>
        <button type="submit" class="btn btn-default">Update</button>
    </form:form>
</div>
</body>
</html>
