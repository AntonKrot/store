<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
     <title>Create an account</title>
</head>

<body>

<jsp:include page=".jsp"/>

<div class="container">
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">id</th>
            <th scope="col">username</th>
            <th scope="col">firstname</th>
            <th scope="col">lastname</th>
            <th scope="col">email</th>
            <th scope="col">address</th>
            <th scope="col">phone</th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${users}">
            <tr>
                <th scope="row">${list.id}</th>
                <td>${list.username}</td>
                <td>${list.firstname}</td>
                <td>${list.lastname}</td>
                <td>${list.email}</td>
                <td>${list.address}</td>
                <td>${list.phone}</td>
                <td><a href="update/${list.id}" class="btn btn-outline-info">Update</a></td>
                <td><a href="delete/${list.id}" class="btn btn-outline-danger">Delete</a></td>
                <td><a href="role/${list.id}" class="btn btn-outline-primary">Add role</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
</div>
</body>
</html>
