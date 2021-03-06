<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
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

<div class="container w-50">
    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-heading text-center mt-5 mb-4">Create your account</h2>
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Username" type="text" path="username" class="form-control" placeholder="Username"
                            autofocus="true"></form:input>
                <form:errors title="Username Errors" path="username"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Password" type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors title="Password Errors" path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="confirmPassword">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Confirm Password" type="password" path="confirmPassword" class="form-control"
                            placeholder="Confirm your password"></form:input>
                <form:errors title="Password Confirmation Errors" path="confirmPassword"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="firstname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="First Name" type="text" path="firstname" class="form-control" placeholder="Firstname"
                            autofocus="true"></form:input>
                <form:errors title="First Name Errors" path="firstname"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="lastname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Last Name" type="text" path="lastname" class="form-control" placeholder="Lastname"
                            autofocus="true"></form:input>
                <form:errors title="Last Name Errors" path="lastname"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="email">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Email" type="email" path="email" class="form-control" placeholder="Email"
                            autofocus="true"></form:input>
                <form:errors title="Email Errors" path="email"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="address">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Address" type="text" path="address" class="form-control" placeholder="Address"
                            autofocus="true"></form:input>
                <form:errors title="Address Errors" path="address"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="phone">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Phone" type="text" path="phone" class="form-control" placeholder="Phone"
                            autofocus="true"></form:input>
                <form:errors title="Phone Errors" path="phone"></form:errors>
            </div>
        </spring:bind>

        <div>
            <button type="submit" class="btn btn-primary">Create account</button>
            <a href="${contextPath}/login" class="btn btn-link">Log in</a>
        </div>
    </form:form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
