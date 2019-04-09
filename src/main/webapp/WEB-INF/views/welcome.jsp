<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="users" method="GET" action="${contextPath}/users">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="basket" method="GET" action="${contextPath}/product/basket">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="addProduct" method="GET" action="${contextPath}/product/addproduct">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="addCategory" method="GET" action="${contextPath}/product/addcategory">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="showOrders" method="GET" action="${contextPath}/product/basket/orders">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()"
                                                                   class="btn btn-outline-info">Logout</a>
            <a onclick="document.forms['users'].submit()" class="btn btn-outline-info">All users</a>
            <a onclick="document.forms['addProduct'].submit()" class="btn btn-outline-info">Add product</a>
            <a onclick="document.forms['addCategory'].submit()" class="btn btn-outline-info">Add category</a>
            <a onclick="document.forms['basket'].submit()" class="btn btn-outline-info">Show basket</a>
            <a onclick="document.forms['showOrders'].submit()" class="btn btn-outline-info">Show orders</a>
        </h2>
    </c:if>

</div>

<div class="container">
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Categories</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${categories}">
            <tr>
                <td><a href="product/category/${list.id}">${list.name}</a></td>
                <td><a href="product/delete/${list.id}">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
