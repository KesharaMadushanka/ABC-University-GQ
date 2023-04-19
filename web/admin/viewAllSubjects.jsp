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
<h1>Subjects</h1>

<% if ("true".equals(request.getParameter("subDel"))) { %>
<div class="alert alert-danger" role="alert">
    Subject successfully Deleted!
</div>

<%--<% } else if ("true".equals(request.getParameter("editSuccess"))) { %>--%>
<%--<div class="alert alert-primary" role="alert">--%>
<%--    User successfully Updated!--%>
<%--</div>--%>
<%
    }
%>

<table class="table table-dark">
    <thead>
    <tr>
        <th>Subject Code</th>
        <th>Subject Name</th>
        <th>Subject Credits</th>
        <th>Subject Description</th>
        <th>Delete Subject from the degree</th>

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
        <form method="get" action="DeleteSubject">
            <td>
                <input type="hidden" name="subjectCode" value="<%= subject.getSubjectCode() %>"/>
                <button type="submit" class="btn btn-outline-danger">Delete Subject <%= subject.getSubjectName() %></button>
            </td>
        </form>

        <% } %>
    </tr>
    </tbody>
</table>
</body>
</html>
