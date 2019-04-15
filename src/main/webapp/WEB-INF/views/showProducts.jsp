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
<jsp:include page="navBar.jsp"/>

<div class="container">
    <table class="table table-bordered text-center">
    <thead class="thead-dark">
    <tr>
    <th scope="col">picture</th>
    <th scope="col">model</th>
    <th scope="col">description</th>
    <th scope="col">price</th>
    <th scope="col">producer</th>
    <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${products}">
    <tr>
    <td><img src="/shop/product/imageDisplay?id=${list.id}" class="picture" width="200" height="200"/></td>
    <td>${list.model}</td>
    <td>${list.description}</td>
    <td>${list.price}</td>
    <td>${list.producer}</td>
    <td>

        <form id="addToBasket" method="GET" action="/shop/basket/add/${list.id}">
            <input type="hidden" name="path" value="/product/category/${list.category.id}"/>
        </form>
        <a onclick="document.forms['addToBasket'].submit() " class="btn btn-outline-primary my-1">Basket</a>

        <%--<a href="/shop/basket/add/${list.id}" class="btn btn-outline-primary">Basket</a>--%>


    </td>
    </tr>
    </c:forEach>
    </tbody>
    </table>

        <a href="/shop/welcome/" class="btn btn-outline-secondary">Back</a>
</div>
</body>
</html>
