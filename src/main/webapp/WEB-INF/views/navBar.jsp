<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page=".jsp"/>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
        <div class="container">
            <a class="navbar-brand" href="/shop/admin">AKStore</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar"
                    aria-controls="navbars" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbar">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <form id="basket" method="GET" action="/shop/basket/">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </li>
                </ul>

                <ul class="navbar-nav">
                    <li class="nav-item mr-3">
                        <a href="/shop/basket/" class="nav-link active">
                            My cart
                            <i class="ml-1 fa fa-shopping-cart"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/shop/setting/" class="nav-link active">
                            | Edit profile
                            <i class="ml-1 fa fa-cog"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${contextPath}/logout" class="nav-link active"> | Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</c:if>
<script src="$('.dropdown-toggle').dropdown()"></script>

<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.js"></script>
</body>
</html>
