<%@ page import="model.User" %>
<%@ page import="java.util.List" %><%--
    Document   : home
    Created on : Mar 9, 2023, 10:27:53 AM
    Author     : MADUSHIKA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--<%--%>
<%--    // Establish a database connection--%>
<%--    Connection con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");--%>
<%--    // Create a statement object--%>
<%--    PreparedStatement pst = con.prepareStatement("SELECT * FROM users");--%>

<%--    // Execute the SQL query and store the result in a ResultSet--%>
<%--    ResultSet rs = pst.executeQuery();--%>
<%--%>--%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Users</title>

    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<%
    if (session.getAttribute("UN") == null) {
        response.sendRedirect("../index.jsp");
    }
%>
<body>
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">

    <div class="container-fluid">
        <a class="navbar-brand" href="#">ABC University</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
                <a class="nav-link" href="#">Features</a>
                <a class="nav-link" href="#">Pricing</a>
                <a class="nav-link disabled">Disabled</a>
            </div>
        </div>
    </div>
</nav>
<%--    display alert if success--%>
<% if ("true".equals(request.getParameter("success"))) { %>
<div class="alert alert-danger" role="alert">
    User successfully Deleted!
</div>
<% } %>

<div class="card col-md-5">
    <table class="table table-dark">
        <tr>
            <th>User ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>NIC</th>
            <th>Phone Number</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <tbody>

        <% for (User user : (List<User>) request.getAttribute("users")) { %>
        <tr>
            <td><%= user.getId() %>
            </td>
            <td><%= user.getName() %>
            </td>
            <td><%= user.getEmail() %>
            </td>
            <td><%= user.getNic() %>
            </td>
            <td><%= user.getPhone() %>
            </td>
            <form method="post" action="">
                <td>
                    <button type="submit" value="<%= user.getId() %>" class="btn btn-warning">Edit</button>
                </td>
            </form>

            <form method="post" action="deleteUserController">
                <td>
                    <input type="hidden" name="userId" value="<%= user.getId() %>" />
                    <button type="submit" class="btn btn-danger">Delete</button>
                </td>
            </form>


        </tr>
        <% } %>
        </tbody>
    </table>
</div>


</body>
</html>
