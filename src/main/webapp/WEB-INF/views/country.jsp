<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/tags" %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Country</title>
</head>
<body>
<jsp:include page="adminPanel.jsp"/>
<div class="container" style="margin-top: 50px">
    <form:form modelAttribute="country" method="post" enctype="multipart/form-data" action="/country?${_csrf.parameterName}=${_csrf.token}">
        <div class="">
        <faildset class="form-group">
                <label for="countryName">Country name</label>
                <span style="text-align: center; color: red">${countryNameException}</span>
                <form:input path="countryName" class="form-control"/><br>
        </faildset>
            <faildset class="form-group">
                <label>Image</label>
                <input name="image" type="file" class="form-control" >
            </faildset>
        </div>
        <button type="submit" class="btn btn-default">Save</button>
    </form:form>
</div>

<div class="container table-responsive">
<table class="table">
    <thead>
        <tr>
            <th>Id</th>
            <th>Country</th>
            <th>Image</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="country" items="${countries}">
        <tr>
            <td>${country.id}</td>
            <td>${country.countryName}</td>
            <td><img src="${country.pathImage}" alt="" width="50px" height="50px"></td>
            <td><a href="/updateCountry/${country.id}">Update</a></td>
            <td><a href="/deleteCountry/${country.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
