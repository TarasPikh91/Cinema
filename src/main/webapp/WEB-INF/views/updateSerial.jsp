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
    <title>Title</title>
</head>
<body>
<form:form modelAttribute="serial" method="post">
    <input type="text" value="${serial.title}" name="title">
    <c:forEach var="country" items="${serial.countries}">
        <%--${country.countryName}<a href="/updateSerial/$"></a>--%>
    </c:forEach>
</form:form>
</body>
</html>
