<%--
  Created by IntelliJ IDEA.
  User: Keshara
  Date: 4/25/2023
  Time: 1:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Keshara
  Date: 4/24/2023
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Student" %>
<%@ page import="util.CheckGrade" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Subjects</title>
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
<a class="back-button" href="ViewAllSubject" style="left: 12px">
    <i class="fas fa-arrow-left"></i> Back
</a>
<div class="container"
     style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1500px">


        <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success" role="alert">
        Students Successfully Graded!
    </div>

        <% } else if ("false".equals(request.getParameter("success"))) { %>
    <div class="alert alert-danger" role="alert">
        Grading Failed!
    </div>
        <%
    }
%>
    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header">
            ${subjectCode}
            <br>            <br>

        </div>

        <div class="card-body">
            <form action="SubmitGradeController" method="post">
                <input type="hidden" name="subjectCode" value="${subjectCode}">
                <table class="table table-dark table-striped table-hover">


                    <thead>
                    <tr>
                        <th>Subject Number</th>
                        <th>Subject Name</th>
                        <th>Grade</th>

                    </tr>
                    </thead>
                    <tbody>
                    <% for (Student student : (List<Student>) request.getAttribute("students")) { %>
                    <tr>

                        <td><%=student.getNumber() %>
                        </td>
                        <td><%=student.getName() %>
                        </td>
                        <td>
                            <fieldset <% if (CheckGrade.disabledGrade(student.getGrade())) {%> disabled <%}%>>
                                <div class="form-check form-check-inline">
                                    <label>
                                        <input class="form-check-input" type="radio"
                                               name="<%=student.getNumber() %>" value="A"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"A")){%> checked <%}%>
                                        >A
                                    </label>
                                </div>

                                <div class="form-check form-check-inline ">
                                    <label>
                                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>"
                                               value="A-"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"A-")){%> checked <%}%>
                                        >A-
                                    </label>
                                </div>


                                <div class="form-check form-check-inline">
                                    <label>
                                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>"
                                               value="B+"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"B+")){%> checked <%}%>
                                        > B+

                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label><input class="form-check-input" type="radio" name="<%=student.getNumber() %>"
                                                  value="B"
                                        <% if (CheckGrade.savedGrade(student.getGrade(),"B")){%> checked <%}%>
                                    > B

                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label>
                                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>"
                                               value="B-"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"B-")){%> checked <%}%>
                                        > B-

                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label>
                                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>"
                                               value="C+"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"C+")){%> checked <%}%>
                                        > C+

                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label>
                                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>"
                                               value="C"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"C")){%> checked <%}%>> C

                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label>
                                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>"
                                               value="C-"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"C-")){%> checked <%}%>
                                        > C-

                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label>
                                        <input class="form-check-input" type="radio"
                                               name="<%=student.getNumber() %>"
                                               value="D+"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"D+")){%> checked <%}%>
                                        > D+

                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label>
                                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>"
                                               value="D"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"D")){%> checked <%}%>> D

                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label>
                                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>"
                                               value="F"
                                            <% if (CheckGrade.savedGrade(student.getGrade(),"F")){%> checked <%}%>> F

                                    </label>
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                    <%}%>
                    <button class="btn btn-success" type="submit">Submit Grades</button>
                    <br>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</body>
</html>

