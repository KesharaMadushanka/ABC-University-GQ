<%@ page import="util.DashboardDetails" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin</title>

    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<%
    if (session.getAttribute("UN") == null) {
        response.sendRedirect("../index.jsp");
    }
%>
<body style="background: #DDDCE1">
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo" href="admin.jsp"><img src="../images/navbar-logo.png"
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
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <div>
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">

                    <%--        user managment sidenav--%>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#userCollapse" role="button"
                           aria-expanded="true" aria-controls="userCollapse">
                            <span class="menu-title">User Management</span>
                        </a>
                        <div class="collapse show" id="userCollapse">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item">
                                    <a class="nav-link" href="addUser.jsp">Add New User</a>
                                </li>
                                <li class="nav-item">
                                    <form action="../ViewUsers" method="get">
                                        <button class="btn nav-link">View Users</button>
                                    </form>
                                </li>
                                <li class="nav-item">
                                    <form action="../ViewUsers" method="get">
                                        <button class="btn nav-link">Edit / Delete Users</button>
                                    </form>
                                </li>
                            </ul>

                        </div>

                        <%--          student managemnt side nav--%>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#studentCollapse" role="button"
                           aria-expanded="true" aria-controls="studentCollapse">
                            <span class="menu-title">Student Management</span>
                        </a>
                        <div class="collapse show" id="studentCollapse">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item">
                                    <a class="nav-link" href="addStudent.jsp">Add New Student</a>
                                </li>
                                <li class="nav-item">
                                    <form action="../ViewStudents" method="get">
                                        <button class="btn nav-link">View Students</button>
                                    </form>
                                </li>
                                <li class="nav-item">
                                    <form action="../ViewStudents" method="get">
                                        <button class="btn nav-link">Edit / Remove Students</button>
                                    </form>
                                </li>
                            </ul>

                        </div>

                    </li>
                    <%--degree managemnt side nav--%>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#degreeCollapse" role="button"
                           aria-expanded="true" aria-controls="degreeCollapse">
                            <span class="menu-title">Degree Management</span>
                        </a>
                        <div class="collapse show" id="degreeCollapse">
                            <ul class="nav flex-column sub-menu">

                                <li class="nav-item">
                                    <form action="../ViewDegree" method="get">
                                        <button class="btn nav-link">View Degrees</button>
                                    </form>
                                </li>

                                <li class="nav-item">
                                    <form action="../ViewAllSubject" method="get">
                                        <button class="btn nav-link">View Subjects</button>
                                    </form>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="addDegree.jsp">Add New Degree</a>
                                </li>
                                <li class="nav-item">
                                    <form action="../ViewDegree" method="get">
                                        <button class="btn nav-link">Add Subjects</button>
                                    </form>
                                </li>
                                <li class="nav-item">
                                    <form action="../ViewAllSubject" method="get">
                                        <button class="btn nav-link">Edit / Remove Subjects</button>
                                    </form>
                                </li>
                                <li class="nav-item">
                                    <form action="../ViewDegree" method="get">
                                        <button class="btn nav-link">Edit / Remove Degrees</button>
                                    </form>
                                </li>
                            </ul>

                        </div>

                    </li>
                </ul>

            </nav>
        </div>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12 grid-margin">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="font-weight-bold mb-0">Admin Dashboard</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title text-md-center text-xl-left">Total Students</p>
                                <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"><%=DashboardDetails.getStudentCount()%></h3>
                                    <i class="ti-calendar icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title text-md-center text-xl-left">Total Users</p>
                                <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"><%=DashboardDetails.getUserCount()%></h3>
                                    <i class="ti-user icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title text-md-center text-xl-left">Total Degrees Available</p>
                                <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">40016</h3>
                                    <i class="ti-agenda icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                </div>
                                <p class="mb-0 mt-2 text-success">64.00%<span
                                        class="text-black ms-1"><small>(30 days)</small></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title text-md-center text-xl-left">Most Students Follows</p>
                                <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">61344</h3>
                                    <i class="ti-layers-alt icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                </div>
                                <p class="mb-0 mt-2 text-success">23.00%<span
                                        class="text-black ms-1"><small>(30 days)</small></span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- content-wrapper ends -->
    <!-- partial:partials/_footer.html -->
    <footer class="footer">
        <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © <a
                    href="https://www.bootstrapdash.com/" target="_blank">bootstrapdash.com </a>2021</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Only the best <a
                    href="https://www.bootstrapdash.com/" target="_blank"> Bootstrap dashboard </a> templates</span>
        </div>
    </footer>
    <!-- partial -->
</div>


<script src="../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- End custom js for this page-->
</body>

</html>

