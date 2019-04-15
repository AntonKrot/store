<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Users</title>
</head>

<body>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">id</th>
            <th scope="col">username</th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${users}">
            <tr>

                <th scope="row">
                    <form id="informationAboutUser" method="GET" action="/shop/user/${list.id}">
                        <input type="hidden" name="path" value="/shop/users"/>
                    </form>
                    <a onclick="document.forms['informationAboutUser'].submit()">${list.id}</a>
                </th>
                <td>${list.username}</td>
                <td><a href="/shop/basket/story/${list.id}" class="btn btn-outline-info">Order story</a></td>

                <td>
                    <form id="updateForm" method="GET" action="/shop/update/${list.id}/">
                        <input type="hidden" name="path" value="/shop/users"/>
                    </form>
                    <a onclick="document.forms['updateForm'].submit()" class="btn btn-outline-info">Update</a>
                </td>

                <td><a href="delete/${list.id}" class="btn btn-outline-danger">Delete</a></td>
                <td><a href="role/${list.id}" class="btn btn-outline-primary">Add role</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
</div>
</body>
</html>
