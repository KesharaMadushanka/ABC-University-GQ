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
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<h1>Subjects ${subjectCode}</h1>

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
<form action="SubmitGradeController" method="post">
    <input type="hidden" name="subjectCode" value="${subjectCode}">
    <table class="table table-dark">

        <thead>
        <button class="btn btn-primary" type="submit">Submit Grades</button>
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
                <fieldset <% if (CheckGrade.disabledGrade(student.getGrade())){%> disabled <%}%>>
                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="radio"
                               name="<%=student.getNumber() %>" value="A"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"A")){%> checked <%}%>
                        >A
                    </label>
                </div>

                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>" value="A-"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"A-")){%> checked <%}%>
                        >A-
                    </label>
                </div>


                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>" value="B+"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"B+")){%> checked <%}%>
                        > B+

                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <label><input class="form-check-input" type="radio" name="<%=student.getNumber() %>" value="B"
                        <% if (CheckGrade.savedGrade(student.getGrade(),"B")){%> checked <%}%>
                    > B

                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>" value="B-"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"B-")){%> checked <%}%>
                        > B-

                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>" value="C+"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"C+")){%> checked <%}%>
                        > C+

                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>" value="C"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"C")){%> checked <%}%>> C

                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>" value="C-"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"C-")){%> checked <%}%>
                        > C-

                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input is-valid" type="radio" name="<%=student.getNumber() %>"
                               value="D+"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"D+")){%> checked <%}%>
                        > D+

                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>" value="D"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"D")){%> checked <%}%>> D

                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="radio" name="<%=student.getNumber() %>" value="F"
                            <% if (CheckGrade.savedGrade(student.getGrade(),"F")){%> checked <%}%>> F

                    </label>
                </div>
                </fieldset>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</form>
</body>
</html>

