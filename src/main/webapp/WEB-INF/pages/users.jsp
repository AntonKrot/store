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
        <th>firstname</th>
        <th>lastname</th>
        <th>email</th>
        <th>address</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <:c:forEach var="list" items="${users}">
            <td>${list.firstname}</td>
            <td>${list.lastname}</td>
            <td>${list.email}</td>
            <td>${list.address}</td>
        </:c:forEach>
    </tr>
    </tbody>
</table>

</body>
</html>
