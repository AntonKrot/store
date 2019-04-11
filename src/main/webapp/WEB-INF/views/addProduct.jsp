<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>

<jsp:include page=".jsp"/>

<div class="container">
    <form:form methodParam="product" id="createForm" class="form-signin" method="POST" action="/shop/product/add">

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <h2 class="form-heading text-center mt-2 mb-4">Add product</h2>


        <%--<select name="category" id="category">--%>
        <%--<c:forEach items="${categories}" var="category">--%>
        <%--<option value="${category}">${category.name}</option>--%>
        <%--</c:forEach>--%>
        <%--</select>--%>

        <%--<form:select path="category">--%>
        <%--<form:options items="categories"/>--%>
        <%--</form:select>--%>


        <select name="idProducer" id="producer">
            <c:forEach items="${producers}" var="producer">
                <option value="${producer.id}">${producer.name}</option>
            </c:forEach>
        </select>

        <select name="idCategory" id="category">
            <c:forEach items="${categories}" var="category">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </select>

        <div class="form-group">
            <label for="model">Model</label>
            <input title="model" type="text" id="model" placeholder="Model" class="form-control"
                   name="model">
        </div>

        <div class="form-group">
            <label for="price">Price</label>
            <input title="price" type="text" id="price" class="form-control" name="price" placeholder="Price">
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <input title="description" type="text" id="description" placeholder="Description" class="form-control"
                   name="description">
        </div>

        <div>
            <button onclick="document.forms['createForm'].submit()" class="btn btn-primary">Confirm</button>
            <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
        </div>

    </form:form>

</div>

</body>
</html>
