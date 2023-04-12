<%@ page import="model.Subject" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Subjects</title>
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<h1>Subjects Belongs to ${degreeName}</h1>
<table>
    <thead>
    <tr>
        <th>Subject Code</th>
        <th>Subject Name</th>
        <th>Subject Credits</th>
        <th>Subject Description</th>
    </tr>
    </thead>
    <tbody>
    <% for (Subject subject : (List<Subject>) request.getAttribute("subjects")) { %>
    <tr>
        <td><%=subject.getSubjectCode() %>
        </td>
        <td><%=subject.getSubjectName() %>
        </td>
        <td><%=subject.getSubjectCredits() %>
        </td>
        <td><%=subject.getSubjectDescription() %>
        </td>
        <% } %>
    </tr>
    </tbody>
</table>
</body>
</html>
