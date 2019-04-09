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

<jsp:include page=".jsp"/>

<body>

<div class="container">
    <p class="text-center">No orders</p>
    <a href="/shop/welcome" class="btn btn-outline-secondary">Back</a>
</div>

</body>
</html>
