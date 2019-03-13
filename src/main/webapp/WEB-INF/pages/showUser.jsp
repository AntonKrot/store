<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 13.03.2019
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User info</h1>
<table>
    <tr>
        <td>Id</td>
        <td>${user.id}</td>
    </tr>
    <tr>
        <td>username</td>
        <td>${user.username}</td>
    </tr>
    <tr>
        <td>firstname</td>
        <td>${user.firstname}</td>
    </tr>
    <tr>
        <td>lastname</td>
        <td>${user.lastname}</td>
    </tr>
    <tr>
        <td>address</td>
        <td>${user.address}</td>
    </tr>
    <tr>
        <td>phone</td>
        <td>${user.phone}</td>
    </tr>
</table>
<a href="users">back</a>
</body>
</html>
