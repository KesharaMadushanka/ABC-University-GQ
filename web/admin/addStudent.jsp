<%--
  Created by IntelliJ IDEA.
  User: Keshara
  Date: 4/23/2023
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Students</title>

    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
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
<%@ include file="../layout/adminNavbar.jsp" %>
<%@ include file="../layout/backButton.jsp" %>
<div class="container" style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1000px">

    <%--    display alert if success--%>
    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success" role="alert">
        Student successfully added!
    </div>
    <% } else if ("false".equals(request.getParameter("success"))) { %>
    <div class="alert alert-danger" role="alert">
        Error!
    </div>
    <%
        } %>

    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header">
            Add Student
        </div>
        <div class="card-body">
            <form action="../AddStudent" method="post">
                <div class="form-group mt-2">
                    <label for="studentName">Enter Student Name</label>
                    <input type="text" name="studentName" id="studentName" placeholder="Enter Student Name" class="form-control"
                           required="">
                </div>
                <div class="form-group mt-2">
                    <label for="studentEmail">Enter Student Email Address</label>
                    <input type="email" name="studentEmail" id="studentEmail" placeholder="Enter Student Email"
                           class="form-control">
                </div>
                <div class="form-group mt-2">
                    <label for="studentPhone">Enter Student Contact Number</label>
                    <input type="text" name="studentPhone" id="studentPhone" placeholder="Enter Student Phone"
                           class="form-control">
                </div>
                <div class="form-group mt-2">
                    <label for="studentNic">Enter Student NIC Number</label>
                    <input type="text" name="studentNic" id="studentNic" placeholder="Enter Student NIC" class="form-control">
                </div>
                <div class="form-group mt-2">
                    <input type="submit" value="Add User" name="btnSave" id="btnSave" class="btn btn-success">
                    <input type="reset" class="btn btn-warning">
                </div>
            </form>
        </div>
    </div>
</div>

</body>

</html>
