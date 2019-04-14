<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit product</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="sideBar.jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">
    <form:form methodParam="newProduct" id="editForm" class="form-signin" method="POST" action="/shop/product/edit"
               enctype="multipart/form-data">


        <div class="custom-file">
            <input class="custom-file-input" id="file" type="file" required="required" name="file">
            <label class="custom-file-label" for="file">Choose file</label>
        </div>

        <select name="idProducer" id="producer" class="custom-select">
            <option selected>Choose a producer</option>
            <c:forEach items="${producers}" var="producer">
                <option value="${producer.id}">${producer.name}</option>
            </c:forEach>
        </select>

        <select name="idStatus" id="status" class="custom-select">
            <option selected>Choose a status</option>
            <c:forEach items="${status}" var="status">
                <option value="${status.id}">${status.name}</option>
            </c:forEach>
        </select>

        <select name="idCategory" id="category" class="custom-select">
            <option selected>Choose a category</option>
            <c:forEach items="${categories}" var="category">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </select>

        <div class="form-group">
            <label for="model">Model</label>
            <input title="model" type="text" id="model" placeholder="Model" class="form-control"
                   name="model" value="${product.model}">
        </div>

        <div class="form-group">
            <label for="price">Price</label>
            <input title="price" type="text" id="price" class="form-control" name="price" placeholder="Price" value="${product.price}">
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <input title="description" type="text" id="description" placeholder="Description" class="form-control"
                   name="description" value="${product.description}">
        </div>

        <input type="hidden" title="id" type="text" name="id" value="${product.id}"/>

        <div>
            <button onclick="document.forms['editForm'].submit()" class="btn btn-primary">Confirm</button>
            <a href="/shop/product/all" class="btn btn-outline-secondary">Back</a>
        </div>

    </form:form>

</div>

</body>
</html>
