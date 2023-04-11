<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add User</title>
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;">

    <%--    display alert if success--%>
    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success" role="alert">
        User successfully added!
    </div>
    <% } else if ("false".equals(request.getParameter("success"))) { %>
    <div class="alert alert-danger" role="alert">
        Error!
    </div>
    <%
        } %>

    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header">
            Add User
        </div>
        <div class="card-body">
            <form action="../addUsers" method="post">
                <div class="form-group mt-2">
                    <label for="userName">Enter Your Name</label>
                    <input type="text" name="userName" id="userName" placeholder="Enter Your Name" class="form-control"
                           required="">
                </div>
                <div class="form-group mt-2">
                    <label for="userEmail">Enter Your Email Address</label>
                    <input type="email" name="userEmail" id="userEmail" placeholder="Enter Your Email"
                           class="form-control">
                </div>
                <div class="form-group mt-2">
                    <label for="userPwd">Please Enter Your Password</label>
                    <input type="password" name="userPwd" id="userPwd" placeholder="Enter Your Password"
                           class="form-control">
                </div>
                <div class="form-group mt-2">
                    <label for="userPhone">Please Enter Your Phone Number</label>
                    <input type="text" name="userPhone" id="userPhone" placeholder="Enter Your Phone"
                           class="form-control">
                </div>
                <div class="form-group mt-2">
                    <label for="userNic">Please Enter Your NIC Number</label>
                    <input type="text" name="userNic" id="userNic" placeholder="Enter Your NIC" class="form-control">
                </div>
                <div class="form-group mt-2">
                    <input type="submit" value="Add User" name="btnSave" id="btnSave" class="btn btn-success btn-sm">
                    <input type="reset" class="btn btn-warning btn-sm">
                    <a href="home.jsp" class="btn btn-danger">Back</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>