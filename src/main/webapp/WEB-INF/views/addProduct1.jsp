<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Create an account</title>
</head>
<body>

<jsp:include page=".jsp"/>

<div class="container w-50">
    <h2 class="form-heading text-center mt-5 mb-4">Add product</h2>


    <form:form method="POST" modelAttribute="product" action="add" class="form-signin" enctype="multipart/form-data">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <%--<div class="input-group mb-3">--%>
        <%--&lt;%&ndash;File to Upload:<input type="file" required="required" name="file"><br/><br/>&ndash;%&gt;--%>
        <%--<div class="custom-file" >--%>
        <%--<input class="custom-file-input" id="file" type="file" required="required" name="file">--%>
        <%--<label class="custom-file-label" for="file">Choose file</label>--%>
        <%--</div>--%>
        <%--</div>--%>

        <select name="category" id="category">
        <c:forEach items="${categories}" var="category">
        <option name="category" value="${category}">${category.name}</option>
        </c:forEach>
        </select>

        <%--<select name="producer" id="producer">--%>
        <%--<c:forEach items="${producers}" var="producer">--%>
        <%--<option name="producer" value="${producer}">${producer.name}</option>--%>
        <%--</c:forEach>--%>
        <%--</select>--%>

        <%--<form:select path="catego">--%>
        <%--<form:option value="idCategory" label="--Please Select--"/>--%>
        <%--<form:options items="${categories}" />--%>
        <%--</form:select>--%>

        <%--<form:select path="idCategory">--%>
        <%--<form:option value="idCategory" label="--Please Select--"/>--%>
        <%--<form:options items="${categories}" />--%>
        <%--</form:select>--%>

        <spring:bind path="model">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="model" type="text" path="model" class="form-control" placeholder="Model"
                            autofocus="true"></form:input>
                <form:errors title="Model Errors" path="model"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="price">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Price" type="text" path="price" class="form-control"
                            placeholder="Price"></form:input>
                <form:errors title="Price Errors" path="price"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="description">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Description" type="text" path="description" class="form-control"
                            placeholder="Description"></form:input>
                <form:errors title="Description Errors" path="description"></form:errors>
            </div>
        </spring:bind>

        <div>
            <button type="submit" class="btn btn-primary">Add product</button>
            <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
        </div>
    </form:form>

    <%--<form:form method="post" action="add" enctype="multipart/form-data" modelAttribute="product">--%>
    <%--File to Upload:<input type="file" required = "required" name="file"><br /><br />--%>

    <%--<spring:bind path="price">--%>
    <%--<div class="form-group ${status.error ? 'has-error' : ''}">--%>
    <%--<form:input title="Price" type="text" path="price" class="form-control"--%>
    <%--placeholder="Price"></form:input>--%>
    <%--<form:errors title="Price Errors" path="price"></form:errors>--%>
    <%--</div>--%>
    <%--</spring:bind>--%>
</div>
</body>
</html>
