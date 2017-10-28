<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 9/20/2017
  Time: 11:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="user" items="${users}">
    <ul>
        <li>${user.firstName} ${user.lastName} <a href="/updateUser/${user.id}">Update</a><<a href="/deleteUser/${user.id}">Delete</a></li>
    </ul>
</c:forEach>
</body>
</html>
