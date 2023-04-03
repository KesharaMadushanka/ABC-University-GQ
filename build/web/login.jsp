<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login Page</title>
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container"
     style="margin-top:80px;background-image:url('images/Boat.jpg');background-size:cover;background-position:center;padding-left:20px;padding-top:20px;padding-right:20px;padding-bottom:20px">
    <div class="row">
        <div class="col-md-6">
            <div class="card text-dark  mb-3" style="background-color:rgba(255, 255, 255, 0.9)">
                <div class="card-header">
                    Login Section
                </div>
                <div class="card-body">
                    <%
                        String message = (String) request.getAttribute("Message");
                        if (message != null) {

                    %>
                    <h5><%=message%>
                    </h5>
                    <%
                        }
                    %>
                    <form action="loginController" method="post">
                        <div class="form-group mt-3">
                            <label for="userName">Enter Your userName</label>
                            <input type="text" name="userName" id="userName" class="form-control"
                                   placeholder="Enter Your username">
                        </div>

                        <div class="form-group mt-3">
                            <label for="userPwd">Enter Your Password</label>
                            <input type="password" name="userPwd" id="userPwd" class="form-control"
                                   placeholder="Enter Your Password">
                        </div>

                        <div class="form-group mt-3">
                            <input type="submit" class="btn btn-primary btn-sm" value="Submit" name="btnLogin"
                                   style="background-color: black;">
                            <input type="reset" class="btn btn-outline-warning btn-sm">
                            <a class="btn btn-primary" href="index.jsp" role="button">Home</a>
                            <a class="btn btn-primary" href="register.jsp" role="button">register</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>



