<%@ page import="util.DashboardDetails" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin</title>

    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        #clock {

            display: flex;
            display: -webkit-flex;
            height: 130px;
            justify-content: space-around;
            -webkit-justify-content: space-around;
            width: 600px;
        }

        #countdown {

            display: flex;
            display: -webkit-flex;
            height: 130px;
            justify-content: space-around;
            -webkit-justify-content: space-around;
            width: 1000px;
        }

        .unit {
            background: linear-gradient(#aaa, #777);
            border-radius: 15px;
            box-shadow: 0 2px 2px #444;
            color: #fff;
            font-family: "Open Sans", sans-serif;
            font-size: 5em;
            height: 100%;
            line-height: 130px;
            margin: 0 10px;
            text-align: center;
            text-shadow: 0 2px 2px #666;
            width: 30%;
        }
    </style>
</head>
<%
    if (session.getAttribute("UN") == null) {
        response.sendRedirect("../index.jsp");
    }
%>
<body style="background: #DDDCE1;">
<div class="container-scroller">
    <%@ include file="../layout/adminNavbar.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper" style="height:705px">
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
                                    <a class="nav-link" href="addDegree.jsp">Add New Degree</a>
                                </li>
                                <li class="nav-item">
                                    <form action="../ViewDegree" method="get">
                                        <button class="btn nav-link">Add Subjects To Degree</button>
                                    </form>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="addSubject.jsp">Add New Subjects</a>
                                </li>
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
                    <div class="col-md-3 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title text-md-center text-xl-left">Students</p>
                                <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"><%=DashboardDetails.getStudentCount()%>
                                    </h3>
                                    <i class="ti-calendar icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                </div>
                                <p class="mb-0 mt-2 text-success"><%=DashboardDetails.getNewStudentCount()%><span
                                        class="text-black ms-1"><small>New Students</small></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title text-md-center text-xl-left">Users</p>
                                <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"><%=DashboardDetails.getUserCount()%>
                                    </h3>
                                    <i class="ti-user icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                </div>
                                <p class="mb-0 mt-2 text-success"><%=DashboardDetails.getAdminCount()%><span
                                        class="text-black ms-1"><small>Admins</small></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title text-md-center text-xl-left">Courses</p>
                                <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"><%=DashboardDetails.getDegreeCount()%>
                                    </h3>
                                    <i class="ti-agenda icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                </div>
                                <p class="mb-0 mt-2 text-success"><%=DashboardDetails.getSubjectCount()%><span
                                        class="text-black ms-1"><small>Subjects</small></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title text-md-center text-xl-left">Most Students Follows</p>
                                <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                    <h5 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"><%=DashboardDetails.getMostFollowDegreeName()%>
                                    </h5>
                                    <i class="ti-layers-alt icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                </div>
                                <p class="mb-0 mt-2 text-success"><%=DashboardDetails.getMostFollowDegreeCount()%><span
                                        class="text-black ms-1"><small>Students</small></span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <%@include file="../layout/calendar.jsp" %>
                    <div class="card col-md-6">
                        <div class="card-body">
                            <div class="row">
                                <div id="clock">
                                    <p class="unit" id="hours"></p>
                                    <p class="unit" id="minutes"></p>
                                    <p class="unit" id="seconds"></p>
                                    <p class="unit" id="ampm"></p>
                                </div>
                            </div>
                            <br>
                            <h3  style=" font-family: 'Roboto',sans-serif; color: #56595A">Days to End the Year</h3>
                            <div class="row">

                                <div id="countdown">
                                    <p class="unit" id="daysToYearEnd"></p>


                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>
</div>
<!-- content-wrapper ends -->


<script src="../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- End custom js for this page-->

<script>

    var $dOut = $('#date'),
        $hOut = $('#hours'),
        $mOut = $('#minutes'),
        $sOut = $('#seconds'),
        $ampmOut = $('#ampm');
    var months = [
        'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
    ];

    var days = [
        'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
    ];

    function update() {
        var date = new Date();

        var ampm = date.getHours() < 12
            ? 'AM'
            : 'PM';

        var hours = date.getHours() == 0
            ? 12
            : date.getHours() > 12
                ? date.getHours() - 12
                : date.getHours();

        var minutes = date.getMinutes() < 10
            ? '0' + date.getMinutes()
            : date.getMinutes();

        var seconds = date.getSeconds() < 10
            ? '0' + date.getSeconds()
            : date.getSeconds();

        var dayOfWeek = days[date.getDay()];
        var month = months[date.getMonth()];
        var day = date.getDate();
        var year = date.getFullYear();

        var dateString = dayOfWeek + ', ' + month + ' ' + day + ', ' + year;

        $dOut.text(dateString);
        $hOut.text(hours);
        $mOut.text(minutes);
        $sOut.text(seconds);
        $ampmOut.text(ampm);
    }

    update();
    window.setInterval(update, 1000);

</script>
<script>

    function calculateDaysToYearEnd() {
        const now = new Date();
        const currentYear = now.getFullYear();
        const endOfYear = new Date(currentYear, 11, 31, 23, 59, 59); // December 31st of the current year at 23:59:59
        const timeDifference = endOfYear.getTime() - now.getTime();
        const daysDifference = Math.ceil(timeDifference / (1000 * 60 * 60 * 24));
        return daysDifference;
    }

    function updateDaysToYearEnd() {
        document.getElementById('daysToYearEnd').textContent = calculateDaysToYearEnd();
    }

    function startUpdatingDaysToYearEnd() {
        const now = new Date();
        const timeUntilMidnight = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1, 0, 0, 0) - now;
        setTimeout(function () {
            updateDaysToYearEnd();
            setInterval(updateDaysToYearEnd, 24 * 60 * 60 * 1000); // Update daily at midnight
        }, timeUntilMidnight);
    }

    updateDaysToYearEnd();
    startUpdatingDaysToYearEnd();


</script>

</body>

</html>

