<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 15.03.2019
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit user</title>
</head>
<body>

<form name="user" action="/shop/update" method="post">
    <p>id</p>
    <input title="iduser" type="text" name="id" value="${user.id}">
    <p>username</p>
    <input title="username" type="text" name="username" value="${user.username}">
    <p>password</p>
    <input title="password" type="text" name="password" value="${user.password}">
    <p>firstname</p>
    <input title="firstname" type="text" name="firstname" value="${user.firstname}">
    <p>lastname</p>
    <input title="lastname" type="text" name="lastname" value="${user.lastname}">
    <p>email</p>
    <input title="email" type="text" name="email" value="${user.email}">
    <p>address</p>
    <input title="address" type="text" name="address" value="${user.address}">
    <p>phone</p>
    <input title="phone" type="text" name="phone" value="${user.phone}">
    <input type="submit" value="OK">
</form>

</body>
</html>
