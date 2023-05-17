<%@ page import="bean.Subject" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Subjects</title>
    <!-- Link bootstrap css -->
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<%
    if (session.getAttribute("UN") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<body>
<!-- partial:partials/_navbar.html -->
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" style="overflow-y: hidden">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center"
         style="overflow-y: hidden">
        <a class="navbar-brand brand-logo" href="admin/admin.jsp"><img src="images/navbar-logo.png"
                                                                 style="width: 200px; height: 50px;"
                                                                 alt="logo"/></a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

        <div class="m-auto">

            <%
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                //current hour
                int currentHour = calendar.get(java.util.Calendar.HOUR_OF_DAY);

                // time of day
                String timeOfDay;
                if (currentHour < 12) {
                    timeOfDay = "Good Morning";
                } else if (currentHour < 18) {
                    timeOfDay = "Good Afternoon";
                } else {
                    timeOfDay = "Good Evening";
                }
            %>

            <%=timeOfDay + ", " + session.getAttribute("UN")%>


        </div>

        <div class="d-flex align-items">
            <a href="logout.jsp" class="nav-link">
                <i style="color: #56595A" class="fa fa-sign-out-alt"> Logout
                </i>
            </a>
        </div>

    </div>
</nav>
<div class="container"
     style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1300px">

        <% if ("true".equals(request.getParameter("subDel"))) { %>
    <div class="alert alert-danger" role="alert">
        Subject successfully Deleted!
    </div>

        <% } else if ("true".equals(request.getParameter("editSuccess"))) { %>
    <div class="alert alert-primary" role="alert">
        Subject successfully Updated!
    </div>
        <%
            }
        %>
    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header">
            Subjects
        </div>
        <div class="card-body">
            <table class="table table-dark table-striped">
                <thead>
                <tr>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Subject Credits</th>
                    <th>Subject Description</th>
                    <th>Delete Subject</th>
                    <th>Edit Subject</th>
                </tr>
                </thead>
                <tbody>
                <% for (Subject subject : (List<Subject>) request.getAttribute("subjects")) { %>
                <tr>
                    <td><%=subject.getSubjectCode() %>
                    </td>
                    <td><%=subject.getSubjectName() %>
                    </td>
                    <td><%=subject.getSubjectCredits() %>
                    </td>
                    <td><%=subject.getSubjectDescription() %>
                    </td>
                    <form method="get" action="DeleteSubject">
                        <td>
                            <input type="hidden" name="subjectCode" value="<%= subject.getSubjectCode() %>"/>
                            <button type="submit" class="btn btn-danger">Delete&nbsp;&nbsp; <i class="fa fa-trash-alt"></i>
                            </button>
                        </td>
                    </form>
                    <form method="post" action="EditSubjectForm">
                        <td>
                            <input type="hidden" name="subjectCode" value="<%= subject.getSubjectCode() %>"/>
                            <button type="submit" class="btn btn-warning">Edit&nbsp;&nbsp; <i class="fa fa-edit"></i></button>
                        </td>
                    </form>

                    <% } %>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
