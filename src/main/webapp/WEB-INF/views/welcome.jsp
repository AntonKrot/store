<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
      <title>Welcome</title>
</head>
<body>

<jsp:include page=".jsp"/>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="users" method="GET" action="${contextPath}/users">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="basket" method="GET" action="/shop/basket/">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="addProduct" method="GET" action="${contextPath}/product/add">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="addCategory" method="GET" action="/shop/category/add">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="showOrders" method="GET" action="/shop/basket/orders">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="showProducers" method="GET" action="/shop/producer/all">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="addProducer" method="GET" action="/shop/producer/add">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()"
                                                                   class="btn btn-outline-info">Logout</a>
            <a onclick="document.forms['addProducer'].submit()" class="btn btn-outline-info">Add producer</a>
            <a onclick="document.forms['addProduct'].submit()" class="btn btn-outline-info">Add product</a>
            <a onclick="document.forms['addCategory'].submit()" class="btn btn-outline-info">Add category</a>
            <a onclick="document.forms['users'].submit()" class="btn btn-outline-info">Show users</a>
            <a onclick="document.forms['basket'].submit()" class="btn btn-outline-info">Show basket</a>
            <a onclick="document.forms['showOrders'].submit()" class="btn btn-outline-info">Show orders</a>
            <a onclick="document.forms['showProducers'].submit()" class="btn btn-outline-info">Show producer</a>
        </h2>
    </c:if>

</div>

<div class="container">
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Categories</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${categories}">
            <tr>
                <td><a href="product/category/${list.id}">${list.name}</a></td>
                <td><a href="/shop/category/delete/${list.id}">Delete</a></td>
                <td><a href="/shop/category/edit/${list.id}">Edit</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
