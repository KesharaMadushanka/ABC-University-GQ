<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Degree</title>
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
<div class="container" style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1000px">

    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header">
            Add New Degree
        </div>
        <div class="card-body">
            <form action="EditDegree" method="post">
                <div class="form-group mt-2">
                    <label for="degree_code">Enter Degree Code</label>
                    <input type="text" name="degree_code" id="degree_code" placeholder="Enter degree Code"
                           class="form-control" value="${degreeCode}"
                           required="" readonly>
                </div>
                <div class="form-group mt-2">
                    <label for="Degree_name">Enter Degree Name</label>
                    <input type="text" name="degree_name" id="Degree_name" placeholder="Enter Your Degree Name"
                           class="form-control" value="${degreeName}">
                </div>

                <div class="form-group mt-2">
                    <label for="degree_duration">Enter Degree Duration (Years)</label>
                    <input type="text" name="degree_duration" id="degree_duration" placeholder="Enter Degree Duration"
                           class="form-control" value="${degreeDuration}">
                </div>
                <div class="form-group mt-2">
                    <label for="degree_credits">Enter Degree Credits</label>
                    <input type="text" name="degree_credits" id="degree_credits" placeholder="Enter Your Degree Credits"
                           class="form-control" value="${degreeCredits}">
                </div>
                <div class="form-group mt-2">
                    <label for="degree_description">Enter Degree Description</label>
                    <textarea name="degree_description" id="degree_description" placeholder="Enter Degree Description"
                              class="form-control"> ${degreeDescription} </textarea>
                </div>
                <div class="form-group mt-2">
                    <input type="submit" value="Save Details" name="btnSave" id="btnSave" class="btn btn-success">
                    <input type="reset" class="btn btn-warning">
                    <a href="ViewDegree" class="btn btn-danger">Back</a>
                </div>


            </form>
        </div>
    </div>
</div>
</body>
</html>