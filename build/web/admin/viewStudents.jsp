<%@ page import="model.Student" %>
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
<%--    PreparedStatement pst = con.prepareStatement("SELECT * FROM students");--%>

<%--    // Execute the SQL query and store the result in a ResultSet--%>
<%--    ResultSet rs = pst.executeQuery();--%>
<%--%>--%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Students</title>

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
<%@ include file="../layout/adminNavbar.jsp" %>
<%--    display alert if success--%>
<% if ("true".equals(request.getParameter("success"))) { %>
<div class="alert alert-danger" role="alert">
    Student successfully Deleted!
</div>
<% } else if ("true".equals(request.getParameter("editSuccess"))) { %>
<div class="alert alert-primary" role="alert">
    Student successfully Updated!
</div>
<%
    }
%>

<div class="card col-md-5">
    <table class="table table-dark">
        <tr>
            <th>Student Number</th>
            <th>Student name</th>
            <th>Student Email</th>
            <th>Student NIC</th>
            <th>Student Phone Number</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <tbody>

        <% for (Student student : (List<Student>) request.getAttribute("students")) { %>
        <tr>
            <td><%= student.getNumber() %>
            </td>
            <td><%= student.getName() %>
            </td>
            <td><%= student.getEmail() %>
            </td>
            <td><%= student.getNic() %>
            </td>
            <td><%= student.getPhone() %>
            </td>
            <form method="post" action="EditStudentForm">
                <td>
                    <input type="hidden" name="studentId" value="<%= student.getId() %>"/>
                    <button type="submit" class="btn btn-warning">Edit</button>
                </td>
            </form>

            <form method="get" action="DeleteStudent">
                <td>
                    <input type="hidden" name="studentId" value="<%= student.getId() %>"/>
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
