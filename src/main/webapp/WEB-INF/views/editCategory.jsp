<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit category</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">
    <form id="category" class="form-signin" method="POST" action="/shop/category/edit">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <h2 class="form-heading text-center mt-2 mb-4">Edit category</h2>

        <input type="hidden" title="id" type="text" name="id" value="${category.id}"/>

        <div class="form-group">
            <label for="name">Name</label>
            <input title="name" type="text" id="name" placeholder="Name" class="form-control" name="name"
                   value="${category.name}">
        </div>

        <select name="idStatus" id="status" class="custom-select">
            <option selected>Choose a status</option>
            <c:forEach items="${status}" var="status">
                <option value="${status.id}">${status.name}</option>
            </c:forEach>
        </select>

        <div class="my-2">
            <button onclick="document.forms['updateForm'].submit()" class="btn btn-primary">Confirm</button>
            <a href="/shop/category/all" class="btn btn-outline-secondary">Back</a>
        </div>
    </form>
</div>

</body>
</html>
