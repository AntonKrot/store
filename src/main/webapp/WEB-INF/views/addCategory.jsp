<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Create a category</title>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="sideBar.jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">
    <h2 class="form-heading text-center mt-5 mb-4">Add category</h2>

    <%--@elvariable id="category" type=""--%>
    <form:form method="POST" modelAttribute="category" class="form-signin">

        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input title="Name" type="text" path="name" class="form-control"
                            placeholder="Name"></form:input>
                <form:errors title="Name Errors" path="name"></form:errors>
            </div>
        </spring:bind>


        <div>
            <button type="submit" class="btn btn-primary">Add category</button>
            <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
        </div>

    </form:form>


</div>
</body>
</html>
