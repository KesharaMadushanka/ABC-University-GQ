<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register Page</title>
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


        button {
            width: 100%;
            max-width: 200px; /* Optional: set a maximum width for the button */
        }

    </style>

</head>
<body style="background: #f5c2c6">
<section class="vh-100">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <img src="images/register-bg-right.png"
                     class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-3 col-xl-4 offset-xl-1">
                <div class="container"
                     style="margin-top:80px;background-size:cover;background-position:center;padding-left:20px;padding-top:20px;padding-right:20px;padding-bottom:20px">
                    <form action="registercontroller" method="post">
                        <div class="form-group mt-2">
                            <label for="userName"></label>
                            <input type="text" name="userName" id="userName" placeholder="Enter Your Name"
                                   class="form-control" required="">
                        </div>
                        <div class="form-group mt-2">
                            <label for="userEmail"></label><input type="email" name="userEmail" id="userEmail"
                                                                  placeholder="Enter Your Email"
                                                                  class="form-control">
                        </div>
                        <div class="form-group mt-2">
                            <label for="userPwd"></label>
                            <input type="password" name="userPwd" id="userPwd" placeholder="Enter Your Password"
                                   class="form-control">
                        </div>
                        <div class="form-group mt-2">
                            <label for="confirmPassword"></label>
                            <input type="password" name="userPwdCon" id="confirmPassword"
                                   placeholder="Enter Your Password"
                                   class="form-control">
                        </div>
                        <div class="form-group mt-2">
                            <label for="userPhone"></label>
                            <input type="text" name="userPhone" id="userPhone" placeholder="Enter Your Phone"
                                   class="form-control">
                        </div>
                        <div class="form-group mt-2">
                            <label for="userNic"></label>
                            <input type="text" name="userNic" id="userNic" placeholder="Enter Your NIC"
                                   class="form-control">
                        </div>
                        <div class="form-group mt-2">
                            <input type="submit" name="btnSave" id="btnsave" onclick="validateForm()"
                                   class="btn btn-primary btn-lg"  value="Create an Account" style="align-items: center; width: 100%;
  max-width: 200px;">
                            <input type="reset" class="btn btn-warning">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</section>
</body>
<script>
    function validateForm() {
        var password = document.getElementById("userPwd").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        if (password !== confirmPassword) {
            alert("Passwords do not match");
            return false;
        }
        return true;
    }

</script>
</html>