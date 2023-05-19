<%--
  Created by IntelliJ IDEA.
  User: Keshara
  Date: 4/24/2023
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="bean.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Student" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Subject</title>
    <!-- Link bootstrap css -->
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
<br><br><br>
<%
    if (request.getAttribute("subjectAvailable").equals("true")) {
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <div class="container"
                 style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;">
                <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
                    <div class="card-header">
                        Student List
                    </div>
                    <div class="card-body">
                        <table id="all-subjects" class="table table-dark table-striped table-hover">
                            <thead>
                            <tr>
                                <th>Student Number</th>
                                <th>Student name</th>
                                <th>Add</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for (Student allStudents : (List<Student>) request.getAttribute("allStudents")) { %>
                            <tr>
                                <td><%= allStudents.getNumber() %>
                                </td>
                                <td><%= allStudents.getName() %>
                                <td>
                                    <button class="add-subject btn btn-success" id="add-subject">
                                        <i class="fa fa-plus"></i> &nbsp; Add
                                    </button>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="container"
                 style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;">
                <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
                    <div class="card-header">
                        Enrolled Student to ${subjectName}
                    </div>
                    <div class="card-body">
                        <table id="degree-subjects" class="table table-striped table-dark table-hover">
                            <thead>
                            <tr>
                                <th>Student Number</th>
                                <th>Student name</th>
                                <th>Remove</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for (Student subjectStudents : (List<Student>) request.getAttribute("subjectStudents")) { %>
                            <tr>
                                <td><%= subjectStudents.getNumber() %>
                                </td>
                                <td><%= subjectStudents.getName() %>
                                </td>
                                <td>
                                    <button id="remove-button" class="btn btn-danger disabled">Remove</button>
                                </td>

                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                        <br>
                        <form id="form" method="post" action="SubmitStudentToSubject">
                            <input type="hidden" id="addedSubjectsInput" name="student">
                            <input type="hidden" name="subjectCode" value="${subjectCode}">
                            <%--            <input type="hidden" name="degreeName" value="${degreeName}">--%>
                            <button type="submit" class="submit-btn btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%
} else {
%>
<div class="container"
     style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1300px">
    <div class="alert alert-danger" role="alert" style="text-align: center">
        No Subject Found! Please Check the Subject Code.
    </div>
<%
    }
%>

</body>

<script>


    $(document).ready(function () {


        // Initialize array to store added subject codes
        var addedSubjectCodes = [];

        // Add button click event handler for all subjects table
        $("#all-subjects").on("click", ".add-subject", function () {
            // Get the clicked row and its data
            var row = $(this).closest("tr");
            var rowData = {
                subjectCode: row.find("td:eq(0)").text(),
                subjectName: row.find("td:eq(1)").text()
            };

            // Check if the subject code is already added to the degree subjects table
            if ($.inArray(rowData.subjectCode, addedSubjectCodes) !== -1) {
                alert("This subject has already been added.");
                return;
            }

            // Add the row to the degree subjects table
            var newRow = "<tr><td>" + rowData.subjectCode + "</td><td>" + rowData.subjectName +
                "</td><td><button class='remove-item btn btn-danger'>Remove <i class='fa fa-trash-alt'></i></button></td></tr>";
            $("#degree-subjects tbody").append(newRow);

            // Add the subject code to the array of added subject codes
            addedSubjectCodes.push(rowData.subjectCode);

        });

        // Remove button click event handler for degree subjects table
        $("#degree-subjects").on("click", ".remove-item", function () {
            // Get the clicked row and its data
            var row = $(this).closest("tr");
            var rowData = {
                subjectCode: row.find("td:eq(0)").text()
            };

            // Remove the row from the degree subjects table
            row.remove();

            // Remove the subject code from the array of added subject codes
            addedSubjectCodes = $.grep(addedSubjectCodes, function (value) {
                return value !== rowData.subjectCode;


            });


        })
        $("#form").submit(function () {
            if (addedSubjectCodes.length === 0) {
                event.preventDefault();
                alert("No New Subjects Added")
            } else {
                // Set the value of the hidden input field to the contents of the addedSubjectCodes array
                $("#addedSubjectsInput").val(addedSubjectCodes.join(","));
            }
        });


    });


</script>
</html>

