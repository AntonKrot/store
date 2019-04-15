<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>

<style>
    h1 {
        font-family: 'Times New Roman', Times, serif;
        font-size: 250%;
    }
    p {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 25pt;
    }
</style>

<div class="container"
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <h1><strong><p class="text-center">Welcome ${pageContext.request.userPrincipal.name}</p></strong></h1>
</c:if>

</div>

<div class="container my-2">
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Categories</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${categories}">
            <tr>
                <td><a href="/shop/product/category/${list.id}">${list.name}</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
