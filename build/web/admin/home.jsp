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
    <title>Admin Dashboard</title>

    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<%
    if (session.getAttribute("UN") == null) {
        response.sendRedirect("../index.jsp");
    }
%>
<body>
<%@ include file="../layout/adminNavbar.jsp" %>

<%--view user card--%>
<div class="card" style="width: 18rem;">
    <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text"></p>
        <form action="../ViewUsers" method="get">
            <button class="btn btn-primary">View Users</button>
        </form>
    </div>
</div>

<%--view subjects card--%>
<div class="card" style="width: 18rem;">
    <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text"></p>
        <form action="../ViewDegree" method="get">
            <button class="btn btn-primary">View Degrees</button>
        </form>
    </div>
</div>


</body>
</html>
