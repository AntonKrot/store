<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>showUser</title>
</head>
<body>
<table>
    <tbody>

    <c:forEach var="list" items="${users}">
        <tr>
            <td>${list.id}</td>
            <td>${list.firstname}</td>
            <td>${list.lastname}</td>
            <td>${list.email}</td>
            <td>${list.address}</td>
            <td><a href="delete/${list.id}">delete | </a></td>
            <td><a href="update/${list.id}">update</a></td>
        </tr>

    </c:forEach>
    </tbody>
</table>
</body>
</html>
