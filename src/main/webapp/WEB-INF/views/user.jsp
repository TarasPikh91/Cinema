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
 <form:form modelAttribute="user" method="post">
     <form:input path="firstName"/>First Name
     <form:input path="lastName"/>Last Name
     <form:input path="age"/>Age
     <form:input path="email"/>Email
     <form:input path="password"/>Password
     <form:select path="movies" items="${movies}" itemLabel="title" itemValue="id"/>
     <button>Save</button>
 </form:form>

<c:forEach var="user" items="${users}">
    <ul>
        <li>${user.firstName} ${user.lastName} <a href="/updateUser/${user.id}">Update</a></li>
    </ul>
</c:forEach>
</body>
</html>
