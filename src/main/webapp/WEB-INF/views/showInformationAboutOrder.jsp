<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">
    <table class="table text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Picture</th>
            <th scope="col">Model</th>
            <th scope="col">Description</th>
            <th scope="col">Producer</th>
            <th scope="col">Price</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${order.products}">
            <tr>
                <td><img src="/shop/product/imageDisplay?id=${product.id}" width="200" height="200" class="picture"/>
                </td>
                <td>${product.model}</td>
                <td>${product.description}</td>
                <td>${product.producer}</td>
                <td>${product.price}</td>
            </tr>
        </c:forEach>
        <tr class="bg-light font-weight-bold">
            <td colspan="3"></td>
            <td>TOTAL PRICE:</td>
            <td>${order.totalPrice}</td>
        </tr>
        </tbody>
    </table>
    <a href="${path}" class="btn btn-outline-secondary">Back</a>
</div>
</body>
</html>
