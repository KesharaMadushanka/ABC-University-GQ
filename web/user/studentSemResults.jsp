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
    <a class="navbar-brand brand-logo" href="user/user.jsp"><img src="images/navbar-logo.png"
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
<a class="back-button" href="user/user.jsp" style="left: 12px">
  <i class="fas fa-arrow-left"></i> Back
</a>
<div class="container" style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1000px">

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
        <%--      check if no records are found--%>
        <%
          if (((List<?>) request.getAttribute("results")).isEmpty()) {
        %>
        <h4 class="text-danger" style="text-align: center">
          <strong>No Records Found!</strong>
        </h4>
        <%
          }
        %>
        </tbody>
      </table>
    </div>

  </div>
</div>
</body>
</html>