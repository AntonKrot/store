<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Log in with your account</title>
</head>

<body>

<jsp:include page=".jsp"/>

<div class="container w-50">

    <form method="POST" action="${contextPath}/login">
        <div class="form-group">
            <h2 class="form-heading text-center mt-5 mb-4">Log in</h2>

            <div class="form-group ${error != null ? 'has-error' : ''}">
                <input name="username" title="Username" type="text" class="form-control" id="username"
                       placeholder="Username"
                       autofocus="true"/>
                <form:errors title="Username Errors" path="username"></form:errors>
            </div>
            <div class="form-group ${error != null ? 'has-error' : ''}">
                <input name="password" title="Password" type="password" class="form-control" id="password"
                       placeholder="Password"/>
            </div>
            <div class="form-group">
                <span class="text-danger">${error}</span>
            </div>
            <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>

            <div>
                <button type="submit" class="btn btn-primary">Log in</button>
                <a href="${contextPath}/registration" class="btn btn-link">Create an account</a>
            </div>
        </div>
    </form>

</div>
</body>
</html>
