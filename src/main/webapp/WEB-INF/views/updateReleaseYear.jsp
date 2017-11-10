<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 9/24/2017
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Update Release Year</title>
</head>
<body>
<jsp:include page="adminPanel.jsp"/>
<div class="container" style="margin-top: 50px">
    <form:form modelAttribute="currentYear" method="post">
        <fieldset class="form-group">
            <label for="releaseYear">Release Year</label>
            <form:input path="releaseYear" type="text" class="form-control"/>
        </fieldset>
            <button type="submit" class="btn btn-default">Update</button>
    </form:form>
</div>
</body>
</html>
