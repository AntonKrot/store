<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
            <th scope="col">producer</th>
            <th scope="col">status</th>
            <th scope="col">price</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${products}">
            <tr>
                <td><img src="/shop/product/imageDisplay?id=${list.id}" class="picture" width="250" height="200"/></td>
                <td>${list.model}</td>
                <td>${list.description}</td>
                <td>${list.producer}</td>
                <td>${list.status.name}</td>
                <td>${list.price}</td>
                <td><a href="/shop/product/edit/${list.id}" class="btn btn-outline-primary">Edit</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/shop/product/add" class="btn btn-outline-primary">Add product</a>
    <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
</div>



<div>

</div>
</body>
</html>
