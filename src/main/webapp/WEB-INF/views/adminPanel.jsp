<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 11/10/2017
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <nav class="navbar navbar-default" style="background-color: transparent" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><security:message code="lable.mainPage"/></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
            <ul class="nav navbar-nav">
                <%--admin navbar--%>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="active"><a href="/movie"><security:message code="lable.movie"/></a></li>
                    <li><a href="/serial"><security:message code="lable.serial"/></a></li>
                    <li><a href="/country"><security:message code="label.country"/></a></li>
                    <li><a href="/genre"><security:message code="lable.genre"/></a></li>
                    <li><a href="/releaseYear"><security:message code="lable.releaseYear"/></a></li>
                    <li><a href="/user"><security:message code="lable.user"/></a></li>
                </sec:authorize>
                <%--admin navbar--%>

            </ul>
            <div class="col-sm-3 col-md-3 navbar-right" style="margin-top: 8px;">
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/?lang=ua">укр</a></li>
                <li><a href="/?lang=en">eng</a></li>
                <sec:authorize access="isAuthenticated()">
                    <li style="margin-top: 8px"><form:form action="/logout" method="post"><button class="btn btn-default"><security:message code="lable.logOut"/></button></form:form></li>
                </sec:authorize>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
    <%--<!-- Navigation -->--%>
    <%--<nav class="navbar navbar-fixed-top" role="navigation">--%>

        <%--<!-- Top Navigation: Left Menu -->--%>
        <%--<ul class="nav navbar-nav navbar-left navbar-top-links">--%>
            <%--<li><a href="/"><i class="glyphicon glyphicon-home"></i><security:message code="lable.mainPage"/></a></li>--%>
        <%--</ul>--%>

        <%--<!-- Top Navigation: Right Menu -->--%>
        <%--<sec:authorize access="isAuthenticated()">--%>
            <%--<ul class="nav navbar-right navbar-top-links">--%>
                <%--<li>--%>
                    <%--<form:form action="/logout" method="post">--%>
                        <%--<button class="btn btn-default btn-sm col-md-12">--%>
                            <%--<span class="glyphicon glyphicon-log-out"></span><security:message code="lable.logOut"/>--%>
                        <%--</button>--%>
                    <%--</form:form>--%>
                <%--</li>--%>
            <%--</ul>--%>
        <%--</sec:authorize>--%>
    <%--</nav>--%>
</div>
</body>
</html>
