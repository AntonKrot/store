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

<c:forEach var="order" items="${orders}">
    <span class="border border-dark">
        <table class="table table-bordered text-center">
            <thead class="thead-light">
            <tr>
                <th scope="col">Order №</th>
                <th scope="col">Username</th>
                <th scope="col">Date of order</th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${order.id}</td>
                <td>${order.user.username}</td>
                <td>${order.date}</td>
                <td>
                    <div>
                        <a href="${contextPath}/more/${order.id}" class="btn btn-outline-success">More</a>
                        <a href="/shop/basket/accept/order/${order.id}" class="btn btn-outline-primary">Accept</a>
                        <a href="/shop/basket/cancel/order/${order.id}" class="btn btn-outline-danger">Cancel</a>
                    </div>
                </tr>
            </tbody>
        </table>
    </span>
</c:forEach>
<a href="/shop/welcome" class="btn btn-outline-danger">Back</a>
</body>
</html>
