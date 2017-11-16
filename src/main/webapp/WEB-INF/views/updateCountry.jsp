<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 9/24/2017
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Update Country</title>
</head>
<body>
<jsp:include page="adminPanel.jsp"/>
<div class="container" style="margin-top: 50px">
<form:form modelAttribute="currentCountry" method="post" action="/updateCountry/${currentCountry.id}?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
    <div class="">
        <fieldset class="form-group">
            <label for="countryName">Update Country</label>
            <%--<span style="text-align: center; color: red"></span>--%>
            <form:input path="countryName" class="form-control" type="text" />
        </fieldset>
        <fieldset class="form-group">
            <label>Update Image</label>
            <input name="image" type="file" class="form-control">
        </fieldset>
    </div>
        <button type="submit" class="btn btn-default">Update</button>
        </form:form>
</div>
</body>
</html>
