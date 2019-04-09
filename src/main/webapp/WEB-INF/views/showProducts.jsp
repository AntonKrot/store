<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>All product</title>
</head>
<body>

<jsp:include page=".jsp"/>

<div class="container">
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">model</th>
            <th scope="col">description</th>
            <th scope="col">price</th>
            <th scope="col">producer</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${products}">
            <tr>
                <td>${list.model}</td>
                <td>${list.description}</td>
                <td>${list.price}</td>
                <td>${list.producer}</td>
                <td><a href="/shop/basket/add/${list.id}" class="btn btn-outline-danger">Basket</a></td>
                <td><a href="product/delete/${list.id}" class="btn btn-outline-danger">Delete</a></td> <%--ERROR--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
</div>
</body>
</html>
