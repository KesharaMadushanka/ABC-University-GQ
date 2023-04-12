<%@ page import="model.Degree" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Degrees</title>
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<h1>View Degrees</h1>

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

<table>
    <thead>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Duration (years)</th>
        <th>Credits</th>
        <th>Description</th>
        <th>View Subjects</th>
    </tr>
    </thead>
    <tbody>
    <% for (Degree degree : (List<Degree>) request.getAttribute("degrees")) { %>
    <tr>
        <td><%=degree.getDegreeCode() %>
        </td>
        <td><%=degree.getDegreeName() %>
        </td>
        <td><%=degree.getDegreeDuration() %>
        </td>
        <td><%=degree.getDegreeCredits() %>
        </td>
        <td><%=degree.getDegreeDescription() %>
        </td>
        <form method="post" action="ViewSubject">
            <td>
                <input type="hidden" name="degreeCode" value="<%= degree.getDegreeCode() %>"/>
                <input type="hidden" name="degreeName" value="<%= degree.getDegreeName() %>"/>
                <button type="submit" class="btn btn-primary">View Subjects Brlongs to <%= degree.getDegreeName() %></button>
            </td>
        </form>
        <form method="post" action="editDegreeForm">
            <td>
                <input type="hidden" name="degreeCode" value="<%= degree.getDegreeCode() %>"/>
                <button type="submit" class="btn btn-warning">Edit Degree</button>
            </td>
        </form>
        <form method="post" action="DeleteDegree">
            <td>
                <input type="hidden" name="degreeCode" value="<%= degree.getDegreeCode() %>"/>
                <button type="submit" class="btn btn-danger">Delete Degree</button>
            </td>
        </form>

        <% } %>
    </tr>
    </tbody>
</table>
</body>
</html>
