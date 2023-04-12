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
        <form method="post" action="ViewSubject">
            <td>
                <input type="hidden" name="degreeCode" value="<%= degree.getDegreeCode() %>"/>
                <input type="hidden" name="degreeName" value="<%= degree.getDegreeName() %>"/>
                <button type="submit" class="btn btn-primary">View Subjects</button>
            </td>
        </form>

        <% } %>
    </tr>
    </tbody>
</table>
</body>
</html>
