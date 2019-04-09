<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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


<div class="container w-50">
    <%--@elvariable id="product" type=""--%>
    <form:form method="POST" modelAttribute="product" class="form-signin">
        <h2 class="form-heading text-center mt-5 mb-4">Add product</h2>

        <spring:bind path="model">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="model" type="text" path="model" class="form-control" placeholder="Model"
                            autofocus="true"></form:input>
                <form:errors title="Model Errors" path="model"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="price">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Price" type="text" path="price" class="form-control"
                            placeholder="Price"></form:input>
                <form:errors title="Price Errors" path="price"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="description">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Description" type="text" path="description" class="form-control"
                            placeholder="Description"></form:input>
                <form:errors title="Description Errors" path="description"></form:errors>
            </div>
        </spring:bind>

        <div>
            <button type="submit" class="btn btn-primary">Add product</button>
        </div>
    </form:form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
