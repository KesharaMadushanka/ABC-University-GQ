<%@ page import="bean.StudentResult" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Keshara
  Date: 4/27/2023
  Time: 8:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>

  <!-- Link bootstrap css -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Link jquery and Javascript -->
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;">

  <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
    <div class="card-header">

      <%
        boolean hasRun = false;
        for (StudentResult result : (List<StudentResult>) request.getAttribute("results")) { %>
      <%
        if (!hasRun) {
      %>

      <h5 style="text-align: center">
        <strong>Number : </strong>
        <%= result.getStudentNumber() %>
      </h5>
      <h5 style="text-align: center">
        <strong>Name : </strong>
        <%= result.getStudentName() %>
      </h5>
    </div>
    <div class="card-body">
      <table class="table table-dark">

        <thead>
        <tr>
          <th>Subject Code</th>
          <th>Subject Name</th>
          <th>Grade</th>

        </tr>
        </thead>
        <tbody>

        <tr>

          <%
              hasRun = true;
            }
          %>

          <td><%= result.getSubjectCode() %>
          </td>
          <td><%= result.getSubjectName() %>
          </td>
          <td><%= result.getGrade() %>
          </td>

        </tr>
        <%}%>
        </tbody>
      </table>
    </div>

  </div>
</div>
</body>
</html>