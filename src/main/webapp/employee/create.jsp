<%--
  Created by IntelliJ IDEA.
  User: Khanh Nguyen
  Date: 28/02/2024
  Time: 2:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <h1>Add Employee</h1>
    <!--  Table students -->
    <div class="row">
        <div class="col-6">
            <form method="post" action="create-employee">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Employee name</label>
                    <input type="text" name="name" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Birthday</label>
                    <input type="datetime-local" name="birthday" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Phone Number</label>
                    <input type="text" name="phone_number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <input type="text" name="email" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
