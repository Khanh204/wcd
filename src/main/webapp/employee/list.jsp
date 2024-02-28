<%@ page import="wcd.jpa.entities.Employee" %>
<%@ page import="java.util.List" %><%--
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
    <h1> ABC Company's Employee List</h1>
    <a href="create-employee">Add new</a>
    <table class="table">
        <thead>
        <th>Employee Id</th>
        <th>Employ Name</th>
        <th>Birthday</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th></th>
        <th></th>
        </thead>
        <tbody>
        <% for (Employee s : (List<Employee>)request.getAttribute("employee")){ %>
        <tr>
            <td><%= s.getEmployee_id()  %></td>
            <td><%= s.getEmployee_name()  %></td>
            <td><%= s.getBirthday()  %></td>
            <td><%= s.getPhone_number()  %></td>
            <td><%= s.getEmail() %></td>
            <td><a href="edit-employee?employee_id=<%= s.getEmployee_id() %>">Edit</a> </td>
            <td><a class="text-danger" onclick="deleteEmployee(<%= s.getEmployee_id() %>)" href="javascript:void(0);">Delete</a> </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function deleteEmployee(id) {
        if(confirm("Are you sure?")) {
            var url = `list-employee?employee_id=` + id;
            fetch(url, {
                method: 'DELETE'
                // body: formData
            }).then(rs => {
                if (confirm("Delete successfully! Reload page?"))
                    window.location.reload();
            }).error(err => {
                alert(err)
            })
        }
    }
</script>
</body>
</html>
