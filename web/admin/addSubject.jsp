<%--subject_code 	subject_name 	subject_description 	subject_duration 	subject_credits--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Subject</title>
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Link jquery and Javascript -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../layout/adminNavbar.jsp" %>
<%--    display alert if success--%>
<% if ("true".equals(request.getParameter("success"))) { %>
<div class="alert alert-success" role="alert">
    Subject successfully added!
</div>
<% } else if ("false".equals(request.getParameter("success"))) { %>
<div class="alert alert-danger" role="alert">
    Error!
</div>
<%
    } %>

<div class="container" style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;">

    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header">
            Add New Subject
        </div>
        <div class="card-body">
            <form action="../AddSubject" method="post">
                <div class="form-group mt-2">
                    <label for="subject_code">Enter Subject Code</label>
                    <input type="text" name="subject_code" id="subject_code" placeholder="Enter subject Code"
                           class="form-control" required="">
                </div>
                <div class="form-group mt-2">
                    <label for="Subject_name">Enter Subject Name</label>
                    <input type="text" name="subject_name" id="Subject_name" placeholder="Enter Your Subject Name"
                           class="form-control">
                </div>
                <div class="form-group mt-2">
                    <label for="subject_credits">Enter Subject Credits</label>
                    <input type="text" name="subject_credits" id="subject_credits"
                           placeholder="Enter Your Subject Credits"
                           class="form-control">
                </div>
                <div class="form-group mt-2">
                    <label for="subject_description">Enter Subject Description</label>
                    <textarea name="subject_description" id="subject_description"
                              placeholder="Enter Subject Description"
                              class="form-control">
                    </textarea>
                </div>
                <div class="form-group mt-2">
                    <input type="submit" value="Add Subject" name="btnSave" id="btnSave"
                           class="btn btn-success btn-sm">
                    <input type="reset" class="btn btn-warning btn-sm">
                    <a href="home.jsp" class="btn btn-danger btn-sm">Back</a>
                </div>


            </form>
        </div>
    </div>
</div>
</body>
</html>