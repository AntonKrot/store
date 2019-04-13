<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Basket</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="sideBar.jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">model</th>
            <th scope="col">description</th>
            <th scope="col">price</th>
            <th scope="col">producer</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${order.products}">
            <tr>
                <td>${list.model}</td>
                <td>${list.description}</td>
                <td>${list.price}</td>
                <td>${list.producer}</td>
                <td><a href="/shop/basket/cancel/${list.id}" class="btn btn-outline-danger">cancel</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <form:form method="POST" modelAttribute="order" class="form-signin">

        <spring:bind path="address">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Address" type="text" path="address" class="form-control" placeholder="Address"
                            autofocus="true"></form:input>
                <form:errors title="Address Errors" path="address"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="phone">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Phone" type="text" path="phone" class="form-control" placeholder="Phone"
                            autofocus="true"></form:input>
                <form:errors title="Phone Errors" path="phone"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="comment">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Comment" type="text" path="comment" class="form-control" placeholder="Comment"
                            autofocus="true"></form:input>
                <form:errors title="Comment Errors" path="comment"></form:errors>
            </div>
        </spring:bind>


        <div class="alert alert-dark">Total price: ${order.totalPrice}</div>

        <div>
            <button type="submit" class="btn btn-primary">Send</button>
            <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
        </div>
    </form:form>


</div>
</body>
</html>
