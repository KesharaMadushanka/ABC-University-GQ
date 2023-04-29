<%--
    Document   : home
    Created on : Mar 9, 2023, 10:27:53 AM
    Author     : MADUSHIKA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student</title>

    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<%
    if (session.getAttribute("UN") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<body>
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">

    <div class="container-fluid">
        <a class="navbar-brand" href="#">Student</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
                <a class="nav-link" href="#">Features</a>
                <a class="nav-link" href="#">Pricing</a>
                <a class="nav-link disabled">Disabled</a>
            </div>
        </div>
    </div>
</nav>

<%--add stdents to subject card--%>
<div class="card" style="width: 18rem;">
    <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <form class="form-inline my-2 my-lg-0" method="POST" action="../AddStudentToSubject">
            <input class="form-control mr-sm-2" type="search" placeholder="Enter Subject Code" aria-label="Search"
                   name="subjectCode">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Enroll Students to the Subject</button>
        </form>
    </div>
</div>
<%--add stdents to subject card--%>

<%--view subjects card--%>
<div class="card" style="width: 18rem;">
    <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text"></p>
        <form action="../ViewAllSubject" method="get">
            <button class="btn btn-primary">View Subjects</button>
        </form>
    </div>
</div>
<%--view subjects card--%>
<div class="card" style="width: 18rem;">
    <div class="card-body">
        <h5 class="card-title">Results</h5>
        <p class="card-text"></p>
        <form action="../ViewResults" method="get">
            <button class="btn btn-primary">View Results sheet</button>
        </form>
    </div>
</div>

<%--add stdents to subject card--%>
<div class="card" style="width: 18rem;">
    <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <form class="form-inline my-2 my-lg-0" method="post" action="../StudentResult">
            <input class="form-control mr-sm-2" type="search" placeholder="Enter Student Number" aria-label="Search"
                   name="studentNumber">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Submit</button>
        </form>
    </div>
</div>
<%--add stdents to subject card--%>
<div class="card" style="width: 18rem;">
    <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <form class="form-inline my-2 my-lg-0" method="post" action="../StudentSemResult">
            <input class="form-control mr-sm-2" type="search" placeholder="Enter Student Number" aria-label="Search"
                   name="studentNumber">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Submit</button>
        </form>
    </div>
</div>

</body>
</html>
