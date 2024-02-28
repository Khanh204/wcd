<%@ page import="wcd.jpa.entities.Employee" %><%--
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
    <h1>Edit Employee</h1>
    <!--  Table students -->
    <div class="row">
        <div class="col-6">
            <% Employee employee = (Employee) request.getAttribute("employee"); %>
            <form method="post" action="edit-employee?employee_id=<%= employee.getEmployee_id() %>">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Employee name</label>
                    <input type="text" value="<%= employee.getEmployee_name() %>" name="name" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Birthday</label>
                    <input type="datetime-local" value="<%= employee.getBirthday() %>" name="name" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Phone Number</label>
                    <input type="text" value="<%= employee.getPhone_number() %>" name="phone_number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <input type="email" name="email" value="<%= employee.getEmail() %>" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
