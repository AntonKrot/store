<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Users</title>
</head>
<body>

<table>
    <thead>
    <tr>
        <th>id</th>
        <th>firstname</th>
        <th>lastname</th>
        <th>email</th>
        <th>address</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${users}">
        <tr>
            <td><a href="user/${list.id}" }>${list.id}</a></td>
            <td>${list.firstname}</td>
            <td>${list.lastname}</td>
            <td>${list.email}</td>
            <td>${list.address}</td>
            <td><a href="delete/${list.id}">delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="/shop/addUser" >Create new user</a>
</body>
</html>
