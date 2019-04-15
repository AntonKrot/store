<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>User information</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">

    <table class="table text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Username</th>
            <th scope="col">Firstname</th>
            <th scope="col">Lastname</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Phone</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.firstname}</td>
            <td>${user.lastname}</td>
            <td>${user.email}</td>
            <td>${user.address}</td>
            <td>${user.phone}</td>
        </tr>
        </tbody>
    </table>

    <div><a href="${path}" class="btn btn-outline-secondary">Back</a></div>
</div>
</body>
</html>
