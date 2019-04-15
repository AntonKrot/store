<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>All producers</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>
<div class="container">
    <table class="table  text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">name</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${producers}">
            <tr>
                <td>${list.name}</td>
                <td><a href="/shop/producer/edit/${list.id}" class="btn btn-outline-primary">Edit</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
<div>
    <a href="/shop/producer/add" class="btn btn-outline-primary">Add producer</a>
    <a href="/shop/admin" class="btn btn-outline-secondary">Back</a>
</div>
</div>
</body>
</html>
