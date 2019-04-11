<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<html lang="en">
<head>
    <title>Edit an account</title>

</head>
<body>

<jsp:include page=".jsp"/>

<div class="container">
    <form id="updateForm" class="form-signin" method="POST" action="${contextPath}/update">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <h2 class="form-heading text-center mt-2 mb-4">Edit your account</h2>
        <input type="hidden" title="id" type="text" name="id" value="${user.id}"/>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <label for="username">Username</label>
            <input title="username" type="text" id="username" placeholder="Username" class="form-control"
                   name="username" value="${user.username}">
        </div>
        <div class="form-group">
            <label for="new_password">New password</label>
            <input title="password" type="password" id="new_password" placeholder="New password" class="form-control"
                   name="password">
        </div>
        <div class="form-group">
            <label for="firstname">Firstname</label>
            <input title="firstname" type="text" id="firstname" placeholder="Firstname" class="form-control"
                   name="firstname"
                   value="${user.firstname}">
        </div>
        <div class="form-group">
            <label for="lastname">Lastname</label>
            <input title="lastname" type="text" id="lastname" placeholder="Lastname" class="form-control"
                   name="lastname"
                   value="${user.lastname}">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input title="email" type="email" id="email" class="form-control" name="email" value="${user.email}">
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input title="address" type="text" id="address" placeholder="Address" class="form-control" name="address"
                   value="${user.address}">
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input title="phone" type="text" id="phone" placeholder="Phone" class="form-control" name="phone"
                   value="${user.phone}">
        </div>
        <div>
            <button onclick="document.forms['updateForm'].submit()" class="btn btn-primary">Confirm</button>
            <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
        </div>
    </form>

</div>
</body>
</html>
