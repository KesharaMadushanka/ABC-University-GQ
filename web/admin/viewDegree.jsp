<%@ page import="bean.Degree" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Degrees</title>
    <!-- Link bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <style>
        .modal-content {
            width: auto;
            max-width: 100%;
        }

        .modal-body {
            flex-grow: 1;
            overflow-y: auto;
            word-wrap: break-word;
            white-space: pre-line;
        }
    </style>
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
     style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1500px">
    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-danger" role="alert">
        Degree successfully Deleted!
    </div>
    <% } else if ("true".equals(request.getParameter("editSuccess"))) { %>
    <div class="alert alert-primary" role="alert">
        Degree successfully Updated!
    </div>
    <% } else if ("true".equals(request.getParameter("subDelFromDeg"))) { %>
    <div class="alert alert-warning" role="alert">
        Subject deleted from the degree!
    </div>
    <%
        }
    %>
    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header">
            Degrees
        </div>
        <div class="card-body">
            <table class="table table-dark table-striped">

                <thead>
                <tr>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Duration (years)</th>
                    <th>Credits</th>
                    <th>Description</th>
                    <th>View Subjects</th>
                    <th>Edit Degree</th>
                    <th>Delete Degree</th>
                </tr>
                </thead>
                <tbody>
                <% for (Degree degree : (List<Degree>) request.getAttribute("degrees")) { %>
                <tr>
                    <td><%=degree.getDegreeCode() %>
                    </td>
                    <td><%=degree.getDegreeName() %>
                    </td>
                    <td><%=degree.getDegreeDuration() %>
                    </td>
                    <td><%=degree.getDegreeCredits() %>
                    </td>
                    <td>
                        <%--            <!-- Button trigger modal -->--%>
                        <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#popupModal">
                            More Details&nbsp;&nbsp; <i class="fa fa-info"></i>
                        </button>
                        <div class="modal" id="popupModal">
                            <div class="modal-dialog modal-dialog-stretch">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" style="color: #1c1f23"> Details of <%=degree.getDegreeName() %>
                                        </h4>
                                    </div>
                                    <div class="modal-body" style="color: #1c1f23">
                                        <p><%=degree.getDegreeDescription() %>
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <form method="get" action="ViewSubject">
                        <td>
                            <input type="hidden" name="degreeCode" value="<%= degree.getDegreeCode() %>"/>
                            <input type="hidden" name="degreeName" value="<%= degree.getDegreeName() %>"/>
                            <button type="submit" class="btn btn-primary">View Subjects
                            </button>
                        </td>
                    </form>
                    <form method="post" action="editDegreeForm">
                        <td>
                            <input type="hidden" name="degreeCode" value="<%= degree.getDegreeCode() %>"/>
                            <button type="submit" class="btn btn-warning">Edit&nbsp;&nbsp; <i class="fa fa-edit"></i></button>
                        </td>
                    </form>
                    <form method="post" action="DeleteDegree">
                        <td>
                            <input type="hidden" name="degreeCode" value="<%= degree.getDegreeCode() %>"/>
                            <button type="submit" class="btn btn-danger">Delete&nbsp;&nbsp; <i class="fa fa-trash-alt"></i></button>
                        </td>
                    </form>

                    <% } %>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
