<%@ page import="bean.User" %>
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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/backButton.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<%
    if (session.getAttribute("UN") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<body>
<!-- partial:partials/_navbar.html -->
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" style="overflow-y: hidden">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center"
         style="overflow-y: hidden">
        <a class="navbar-brand brand-logo" href="admin/admin.jsp"><img src="images/navbar-logo.png"
                                                                 style="width: 200px; height: 50px;"
                                                                 alt="logo"/></a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

        <div class="m-auto">

            <%
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                //current hour
                int currentHour = calendar.get(java.util.Calendar.HOUR_OF_DAY);

                // time of day
                String timeOfDay;
                if (currentHour < 12) {
                    timeOfDay = "Good Morning";
                } else if (currentHour < 18) {
                    timeOfDay = "Good Afternoon";
                } else {
                    timeOfDay = "Good Evening";
                }
            %>

            <%=timeOfDay + ", " + session.getAttribute("UN")%>


        </div>

        <div class="d-flex align-items">
            <a href="logout.jsp" class="nav-link">
                <i style="color: #56595A" class="fa fa-sign-out-alt"> Logout
                </i>
            </a>
        </div>

    </div>
</nav>
<a class="back-button" href="admin/admin.jsp">
    <i class="fas fa-arrow-left"></i> Back
</a>

<div class="container" style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1000px">
    <%--    display alert if success--%>
        <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-danger" role="alert">
        User successfully Deleted!
    </div>
        <% } else if ("true".equals(request.getParameter("editSuccess"))) { %>
    <div class="alert alert-primary" role="alert">
        User successfully Updated!
    </div>
        <%
    }
%>

    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header">
            Users
        </div>
        <div class="card-body">
            <table class="table table-dark table-striped table-hover">
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
                    <form method="post" action="editUserForm">
                        <td>
                            <input type="hidden" name="userId" value="<%= user.getId() %>"/>
                            <button type="submit" class="btn btn-warning">Edit&nbsp;&nbsp; <i class="fa fa-edit"></i></button>
                        </td>
                    </form>

                    <form method="post" action="deleteUserController">
                        <td>
                            <input type="hidden" name="userId" value="<%= user.getId() %>"/>
                            <button type="submit" class="btn btn-danger">Delete&nbsp;&nbsp; <i class="fa fa-trash-alt"></i></button>
                        </td>
                    </form>


                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
