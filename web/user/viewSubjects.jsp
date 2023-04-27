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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<div class="row">
    <div class="col-md-6">
        <table id="all-subjects" class="table table-striped">
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
                        Add
                    </button>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <div class="col-md-6">
        <table id="degree-subjects" class="table table-striped">
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
        <form id="form" method="post" action="SubmitStudentToSubject">
            <input type="hidden" id="addedSubjectsInput" name="student">
            <input type="hidden" name="subjectCode" value="${subjectCode}">
<%--            <input type="hidden" name="degreeName" value="${degreeName}">--%>
            <button type="submit" class="submit-btn btn btn-primary">Submit</button>
        </form>
    </div>
</div>


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
                "</td><td><button class='remove-item btn btn-danger'>Remove</button></td></tr>";
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
