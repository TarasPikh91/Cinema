<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 9/24/2017
  Time: 8:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update User</title>
</head>
<body>
<form:form modelAttribute="currentUser" method="post">
        <input type="text" name="firstName" value="${currentUser.firstName}">
        <input type="text" name="lastName" value="${currentUser.lastName}">
        <input type="text" name="age" value="${currentUser.age}">
        <input type="email" name="email" value="${currentUser.email}">
        <input type="password" name="password" value="${currentUser.password}">
    <button>Update</button>
</form:form>
</body>
</html>
