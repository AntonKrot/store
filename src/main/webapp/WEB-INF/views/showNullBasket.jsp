<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
     <title>Basket</title>
</head>
<body>

<jsp:include page=".jsp"/>

<div class="container">
    <p class="text-center">Your basket is empty!</p>
    <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
</div>

</body>
</html>
