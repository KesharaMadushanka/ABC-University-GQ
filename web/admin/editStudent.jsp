<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Student</title>
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
        <a class="navbar-brand brand-logo" href="admin/admin.jsp"><img src="images/navbar-logo.png"
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
            <a href="admin/logout.jsp" class="nav-link">
                <i style="color: #56595A" class="fa fa-sign-out-alt"> Logout
                </i>
            </a>
        </div>

    </div>
</nav>
<a class="back-button" href="ViewStudents">
    <i class="fas fa-arrow-left"></i> Back
</a>
<div class="container" style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1000px">

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
                    <input type="submit" value="Update Student" name="btnSave" id="btnSave" class="btn btn-success">
                    <input type="reset" class="btn btn-warning">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>