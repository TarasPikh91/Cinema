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
    <title>Country</title>
</head>
<body>
<div class="container" style="margin-top: 50px">
    <form:form modelAttribute="country" method="post">
        <div class="">
        <faildset class="form-group">
                <label for="countryName">Country name</label>
                <span style="text-align: center; color: red">${countryNameException}</span>
                <form:input path="countryName" class="form-control"/><br>
        </faildset>
        </div>
        <button type="submit" class="btn btn-default">Save</button>
    </form:form>
</div>

<div class="container">
<table class="table">
    <thead>
        <tr>
            <th>Id</th>
            <th>Country</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="country" items="${countries}">
        <tr>
            <th>${country.id}</th>
            <th>${country.countryName}</th>
            <th><a href="/deleteCountry/${country.id}">Delete</a></th>
            <th><a href="/updateCountry/${country.id}">Update</a></th>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
