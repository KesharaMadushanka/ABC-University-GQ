<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register Page</title>
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container" style="margin-top:80px;background-image:url('images/Boat.jpg');background-size:cover;background-position:center;padding-left:20px;padding-top:20px;padding-right:20px;padding-bottom:20px">
                <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
                <div class="card-header">
                    Registration View
                </div>
                <div class="card-body">
                    <form action="registercontroller" method="post">
                        <div class="form-group mt-2">
                            <label for="">Enter Your Name</label>
                            <input type="text" name="userName" id="userName" placeholder="Enter Your Name" class="form-control" required="">
                        </div>
                        <div class="form-group mt-2">
                            <label for="">Enter Your Email Address</label>
                            <input type="email" name="userEmail" id="userEmail" placeholder="Enter Your Email" class="form-control">
                        </div>
                        <div class="form-group mt-2">
                            <label for="">Please Enter Your Password</label>
                            <input type="password" name="userPwd" id="userPwd" placeholder="Enter Your Password" class="form-control">
                        </div>
                        <div class="form-group mt-2">
                            <label for="">Please Enter Your Phone Number</label>
                            <input type="text" name="userPhone" id="userPhone" placeholder="Enter Your Phone" class="form-control">
                        </div>
                        <div class="form-group mt-2">
                            <label for="">Please Enter Your NIC Number</label>
                            <input type="text" name="userNic" id="userNic" placeholder="Enter Your NIC" class="form-control">
                        </div>
                        <div class="form-group mt-2">
                            <input type="submit" name="btnSave" id="btnsave" class="btn btn-success btn-sm">
                            <input type="reset" class="btn btn-danger btn-sm">
                        </div>
                    </form>
                </div>
                </div>
           </div>
       </div>
    </div>
</body>
</html>