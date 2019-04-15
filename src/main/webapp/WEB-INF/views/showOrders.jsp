<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Orders</title>
</head>
<body>

<jsp:include page=".jsp"/>
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
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <c:forEach var="order" items="${orders}">
                <td>${order.id}</td>
                <td>
                    <form id="informationAboutUser" method="GET" action="/shop/user/${order.user.id}">
                        <input type="hidden" name="path" value="/shop/basket/orders"/>
                    </form>
                    <a onclick="document.forms['informationAboutUser'].submit() " class="btn btn-link">${order.user.username}</a>

                </td>
                <td>${order.date}</td>
                <td>${order.totalPrice}</td>
                <td>${order.comment}</td>
                <td>
                    <form id="story" method="GET" action="/shop/basket/order/${order.id}">
                        <input type="hidden" name="path" value="/shop/basket/orders"/>
                    </form>
                    <a onclick="document.forms['story'].submit()" class="btn btn-outline-success">More</a>
                    <a href="/shop/basket/accept/order/${order.id}" class="btn btn-outline-primary">Accept</a>
                    <form id="cancelOrder" method="GET" action="/shop/basket/cancel/order/${order.id}">
                        <input type="hidden" name="path" value="/basket/orders"/>
                    </form>
                    <a onclick="document.forms['cancelOrder'].submit() " class="btn btn-outline-danger my-1">Cancel</a>
                </td>
            </c:forEach>
        </tr>
        </tbody>
    </table>
    <a href="/shop/admin" class="btn btn-outline-secondary">Back</a>
</div>
</body>
</html>
