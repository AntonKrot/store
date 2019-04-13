<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order story</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="sideBar.jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">

    <table class="table table-bordered text-center">
        <thead class="thead-light">
        <tr>
            <th scope="col">Order №</th>
            <th scope="col">Username</th>
            <th scope="col">Date of order</th>
            <th scope="col">Total price</th>
            <th scope="col">Comment</th>
            <th scope="col">Status</th>
            <th scope="col">Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>

                <td>${order.id}</td>
                <td>${order.user.username}</td>
                <td>${order.date}</td>
                <td>${order.totalPrice}</td>
                <td>${order.comment}</td>
                <td>
                    <c:choose>
                        <c:when test="${order.status.id eq 1}">Success</c:when>
                        <c:when test="${order.status.id eq 3}">Cancel</c:when>
                        <c:when test="${order.status.id eq 2}">Processing</c:when>
                        <c:when test="${order.status.id eq 4}">Filling</c:when>
                    </c:choose>
                </td>
                <td>
                    <form id="story" method="GET" action="/shop/basket/order/${order.id}">
                        <input type="hidden" name="path" value="/shop/basket/story/${order.id}"/>
                    </form>
                    <a onclick="document.forms['story'].submit()" class="btn btn-outline-success">More</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
</div>

</body>
</html>
