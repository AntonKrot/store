<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 15.03.2019
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create user page</title>
</head>
<body>

<form name="user" action="/addUser" method="post">
    <p>id</p>
    <input title="iduser" type="text" name="id">
    <p>username</p>
    <input title="username" type="text" name="username">
    <p>password</p>
    <input title="password" type="text" name="password">
    <p>firstname</p>
    <input title="firstname" type="text" name="firstname">
    <p>lastname</p>
    <input title="lastname" type="text" name="lastname">
    <p>email</p>
    <input title="email" type="text" name="email">
    <p>address</p>
    <input title="address" type="text" name="address">
    <p>phone</p>
    <input title="phone" type="text" name="phone">
    <input type="submit" value="OK">
</form>

</body>
</html>
