<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <meta name="_csrf_parameter" content="_csrf" />
    <meta name="_csrf_header" content="X-CSRF-TOKEN" />
    <meta name="_csrf" content="e62835df-f1a0-49ea-bce7-bf96f998119c" />
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">
    <form:form methodParam="product" id="createForm" class="form-signin" method="POST" action="/shop/product/add" enctype="multipart/form-data" >

        <%--<input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}"/>--%>

        <h2 class="form-heading text-center mt-2 mb-4">Add product</h2>

        <div class="custom-file" >
            <input class="custom-file-input" id="file" type="file" required="required" name="file">
            <label class="custom-file-label" for="file">Choose file</label>
        </div>

        <select name="idProducer" id="producer" class="custom-select my-3">
            <option selected>Choose a producer</option>
            <c:forEach items="${producers}" var="producer">
                <option value="${producer.id}">${producer.name}</option>
            </c:forEach>
        </select>

        <select name="idStatus" id="status" class="custom-select my">
            <option selected>Choose a status</option>
            <c:forEach items="${status}" var="status">
                <option value="${status.id}">${status.name}</option>
            </c:forEach>
        </select>

        <select name="idCategory" id="category" class="custom-select my-2">
            <option selected>Choose a category</option>
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
            <a href="/shop/product/all" class="btn btn-outline-secondary">Back</a>
        </div>

    </form:form>

</div>

</body>
</html>
