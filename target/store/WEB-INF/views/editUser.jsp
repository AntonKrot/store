<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">


    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>
<body>

<div class="container">

<form id="updateForm" method="POST" action="${contextPath}/update">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <h2 class="form-signin-heading">Create your account</h2>
    <label title="id" type="text" name="id" value="${user.id}">

        <spring:bind path="username">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <form:input type="text" path="username" class="form-control" placeholder="Username"
                        autofocus="true" >${user.username}</form:input>
            <form:errors path="username"></form:errors>
        </div>
        </spring:bind>
    <%--<p>username</p>--%>
    <%--<input title="username" type="text" name="username" value="${user.username}">--%>
    <p>password</p>
    <input title="password" type="text" name="password" value="${user.password}">
    <p>firstname</p>
    <input title="firstname" type="text" name="firstname" value="${user.firstname}">
    <p>lastname</p>
    <input title="lastname" type="text" name="lastname" value="${user.lastname}">
    <p>email</p>
    <input title="email" type="text" name="email" value="${user.email}">
    <p>address</p>
    <input title="address" type="text" name="address" value="${user.address}">
    <p>phone</p>
    <input title="phone" type="text" name="phone" value="${user.phone}">
    <a onclick="document.forms['updateForm'].submit()">OK</a>
</form>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
