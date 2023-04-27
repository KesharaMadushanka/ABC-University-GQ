<%--
  Created by IntelliJ IDEA.
  User: Keshara
  Date: 4/24/2023
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="bean.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Student" %>
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
  Student successfully Deleted!
</div>

<% } else if ("true".equals(request.getParameter("editSuccess"))) { %>
<div class="alert alert-primary" role="alert">
  Student successfully Updated!
</div>
<%
  }
%>

<table class="table table-dark">
  <thead>
  <tr>
    <th>Subject Number</th>
    <th>Subject Name</th>
    <th>Remove Students</th>

  </tr>
  </thead>
  <tbody>
  <% for (Student studentSubject : (List<Student>) request.getAttribute("studentSubjects")) { %>
  <tr>

    <td><%=studentSubject.getNumber() %>
    </td>
    <td><%=studentSubject.getName() %>
    </td>

    <form method="get" action="DeleteStudentFromSubject">
      <td>
        <input type="hidden" name="studentNumber" value="<%=studentSubject.getNumber() %>"/>
        <input type="hidden" name="subjectCode" value="${subjectCode}"/>
        <button type="submit" class="btn btn-danger">Remove Student</button>
      </td>
    </form>


    <% } %>
  </tr>
  </tbody>
</table>
</body>
</html>

