<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add User</title>
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<%
    if (session.getAttribute("UN") == null) {
        response.sendRedirect("../index.jsp");
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
            <a href="logout.jsp" class="nav-link">
                <i style="color: #56595A" class="fa fa-sign-out-alt"> Logout
                </i>
            </a>
        </div>

    </div>
</nav>
<div class="container" style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1000px">

    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header">
           Edit User
        </div>
        <div class="card-body">
            <form action="EditUsers" method="post">
                <div class="form-group mt-2">
                    <label for="userId">User ID</label>
                    <input type="text" name="userId" id="userId" placeholder="Enter Your ID" class="form-control"
                           required="" readonly value="${userId}">
                </div>
                <div class="form-group mt-2">
                    <label for="userName">Enter Your Name</label>
                    <input type="text" name="userName" id="userName" placeholder="Enter Your Name" class="form-control"
                           required="" value="${userName}">
                </div>
                <div class="form-group mt-2">
                    <label for="userEmail">Enter Your Email Address</label>
                    <input type="email" name="userEmail" id="userEmail" placeholder="Enter Your Email"
                           class="form-control" value="${email}">
                </div>
                <div class="form-group mt-2">
                    <label for="userPhone">Please Enter Your Phone Number</label>
                    <input type="text" name="userPhone" id="userPhone" placeholder="Enter Your Phone"
                           class="form-control" value="${phone}">
                </div>
                <div class="form-group mt-2">
                    <label for="userNic">Please Enter Your NIC Number</label>
                    <input type="text" name="userNic" id="userNic" placeholder="Enter Your NIC" class="form-control" value="${nic}">
                </div>
                <div class="form-group mt-2">
                    <input type="submit" value="Update User" name="btnSave" id="btnSave" class="btn btn-success">
                    <a href="ViewUsers" class="btn btn-danger">Back</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>