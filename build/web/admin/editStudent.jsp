<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Student</title>
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
           Edit Student
        </div>
        <div class="card-body">
            <form action="EditStudent" method="post">
                <div class="form-group mt-2">
                    <label for="studentNumber">Student Number</label>
                    <input type="text" name="studentNumber" id="studentNumber" placeholder="Student Number" class="form-control"
                           required="" readonly value="${studentNumber}">
                </div>
                <div class="form-group mt-2">
                    <label for="studentName">Enter Student Name</label>
                    <input type="text" name="studentName" id="studentName" placeholder="Enter Student Name" class="form-control"
                           required="" value="${studentName}">
                </div>
                <div class="form-group mt-2">
                    <label for="studentEmail">Enter Student Email Address</label>
                    <input type="email" name="studentEmail" id="studentEmail" placeholder="Enter Student Email"
                           class="form-control" value="${studentEmail}">
                </div>
                <div class="form-group mt-2">
                    <label for="studentPhone">Please Enter Student Phone Number</label>
                    <input type="text" name="studentPhone" id="studentPhone" placeholder="Enter Student Phone"
                           class="form-control" value="${studentPhone}">
                </div>
                <div class="form-group mt-2">
                    <label for="studentNic">Please Enter Student NIC Number</label>
                    <input type="text" name="studentNic" id="studentNic" placeholder="Enter Student NIC" class="form-control" value="${studentNic}">
                </div>
                <div class="form-group mt-2">
                    <input type="hidden" value="${studentId}" name="studentId">
                    <input type="submit" value="Update Student" name="btnSave" id="btnSave" class="btn btn-success btn-sm">
                    <input type="reset" class="btn btn-warning btn-sm">
                    <a href="admin/viewStudent.jsp" class="btn btn-danger btn-sm">Back</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>