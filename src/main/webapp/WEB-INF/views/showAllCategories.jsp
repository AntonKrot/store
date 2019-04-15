<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All category</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">name</th>
            <th scope="col">status</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="category" items="${categories}">
            <tr>
                <td>${category.name}</td>
                <td>${category.status.name}</td>
                <td><a href="/shop/category/edit/${category.id}" class="btn btn-outline-primary">Edit</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div>
    <a href="/shop/category/add" class="btn btn-outline-primary">Add category</a>
    <a href="/shop/admin" class="btn btn-outline-secondary">Back</a>

    </div>
</div>

</body>
</html>
