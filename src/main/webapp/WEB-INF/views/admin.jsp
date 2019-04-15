<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin</title>
</head>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>

<body>
<div class="container">

    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Options</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><a href="/shop/users">Show users</a></td>
        </tr>
        <tr>
            <td><a href="/shop/basket/orders">Show orders</a></td>
        </tr>
        <tr>
            <td><a href="/shop/producer/all">Show producers</a></td>
        </tr>
        <tr>
            <td><a href="/shop/category/all">Show categories</a></td>
        </tr>
        <tr>
            <td><a href="/shop/product/all">Show products</a></td>
        </tr>
        </tbody>
    </table>
    <a href="/shop/welcome/" class="btn btn-outline-secondary ">Back</a>
</div>
</body>
</html>
