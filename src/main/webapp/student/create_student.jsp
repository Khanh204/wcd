
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Create Student</title>
</head>
<body>
<div class="container">
    <h1>Create Student</h1>
    <jsp:include page="/layout/css.jsp"/>
    <form method="post" >
        <div class="mb-3">
            <label for="InputName" class="form-label">Name</label>
            <input type="text" class="form-control" id="InputName" name="name">
        </div>
        <div class="mb-3">
            <label for="InputEmail" class="form-label">Email</label>
            <input type="email" class="form-control" id="InputEmail" name="email">
        </div>
        <div class="mb-3">
            <label for="InputAddress" class="form-label">Address</label>
            <input type="text" class="form-control" id="InputAddress" name="address">
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
