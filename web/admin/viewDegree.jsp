<%@ page import="model.Degree" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Degrees</title>
</head>
<body>
<h1>View Degrees</h1>
<table>
    <thead>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Duration (years)</th>
        <th>Credits</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <% for (Degree degree : (List<Degree>) request.getAttribute("degrees")) { %>
    <tr>
        <td><%=degree.getDegreeCode() %>
        </td>
        <td><%=degree.getDegreeCredits() %>
        </td>
        <td><%=degree.getDegreeDuration() %>
        </td>
        <td><%=degree.getDegreeCredits() %>
        </td>
        <td><%=degree.getDegreeDescription() %>
        </td>

        <% } %>
    </tr>
    </tbody>
</table>
</body>
</html>
