<%@ page import="javax.jms.Message" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <style>
        .divider:after,
        .divider:before {
            content: "";
            flex: 1;
            height: 1px;
            background: #eee;
        }

        .h-custom {
            height: calc(100% - 73px);
        }

        @media (max-width: 450px) {
            .h-custom {
                height: 100%;
            }
        }
    </style>

</head>

<body style="background: #edd5f8">

<section class="vh-100">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <img src="images/index-bg-right.png"
                     class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-3 col-xl-4 offset-xl-1">
                <form action="loginController" method="post">
                    <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">

                        <img src="images/logo-transparent-noname.png" alt="logo" class="rounded mx-auto d-block"
                             style="width:50%">

                    </div>
                    <br>
                    <%--    display alert if success--%>
                    <% if ("true".equals(request.getParameter("restrict"))) { %>
                    <div class="alert alert-danger" role="alert">
                    Access Restricted! Please Log in Again
                    </div>
                    <%}%>
                    <% if (request.getAttribute("Message") != null) {
                        if (request.getAttribute("success") != null) {
                            if (request.getAttribute("success").equals(true)) {
                    %>
                    <div class="alert alert-success" role="alert">
                        <%= request.getAttribute("Message")%>
                    </div>
                    <% }} else { %>

                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("Message")%>
                    </div>
                    <% }
                    } %>
                    <!-- Email input -->
                    <div class="form-outline mb-4 align-content-center">
                        <br><br>
                        <input type="text" id="form3Example3" class="form-control form-control-lg"
                               placeholder="Enter Username"  required name="userName"/>
                        <label class="form-label" for="form3Example3"></label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-3">
                        <input type="password" id="form3Example4" class="form-control form-control-lg"
                               placeholder="Enter Password"  required name="userPwd"/>
                        <label class="form-label" for="form3Example4"></label>
                    </div>


                    <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn btn-primary btn-lg" name="btnLogin"
                                style="padding-left: 2.5rem; padding-right: 2.5rem;">Login
                        </button>
                        <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="register.jsp"
                                                                                          class="link-danger">Register</a>
                        </p>
                    </div>

                </form>
            </div>
        </div>
    </div>

</section>

</body>
</html>
