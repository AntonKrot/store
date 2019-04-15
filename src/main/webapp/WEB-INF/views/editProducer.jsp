<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit producer</title>
</head>
<body>

<jsp:include page=".jsp"/>
<jsp:include page="navBar.jsp"/>

<div class="container">
    <form id="producer" class="form-signin" method="POST" action="/shop/producer/edit">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <h2 class="form-heading text-center mt-2 mb-4">Edit producer</h2>

        <input type="hidden" title="id" type="text" name="id" value="${producer.id}"/>

        <div class="form-group">
            <label for="name">Name</label>
            <input title="name" type="text" id="name" placeholder="Name" class="form-control" name="name"
                   value="${producer.name}">
        </div>

        <div>
            <button onclick="document.forms['updateForm'].submit()" class="btn btn-primary">Confirm</button>
            <a href="/shop/producer/all" class="btn btn-outline-secondary">Back</a>
        </div>

    </form>
</div>

</body>
</html>
