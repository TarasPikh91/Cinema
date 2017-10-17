<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 9/24/2017
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form method="post" modelAttribute="currentMovieWithCountries">
    <input type="text" value="${currentMovieWithCountries.title}" name="title"/>
    <c:forEach items="${currentMovieWithCountries.countries}" var="country">
        ${country.countryName}<a href="/updateMovie/${currentMovieWithCountries.id}/${country.id}">delete</a>
    </c:forEach>
    <button>Update</button>
</form:form>
</body>
</html>
