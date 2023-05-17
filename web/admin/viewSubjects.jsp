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
        <a class="navbar-brand brand-logo" href="admin.jsp"><img src="images/navbar-logo.png"
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
     style="margin-top:80px;background-size:cover;background-position:center;padding: 20px;width: 1000px">
    <% if ("true".equals(request.getParameter("subDelFromDeg"))) { %>
    <div class="alert alert-danger" role="alert">
        Subject successfully Deleted!
    </div>
    <% } else if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success" role="alert">
        Subjects successfully Added!
    </div>
    <%
        }
    %>

    <div class="card" style="background-color:rgba(255, 255, 255, 0.5)">
        <div class="card-header align-items-center justify-content-start">
            <h5>Subjects Belongs to ${degreeName}</h5>
            <form action="AddSubjectToDegree" method="get">
                <input type="hidden" name="degreeCode" value="${degreeCode}"/>
                <input type="hidden" name="degreeName" value="${degreeName}"/>
                <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i>
                    Add New Subject
                </button>
            </form>


        </div>
        <div class="card-body">


            <table class="table table-dark">
                <thead>
                <tr>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Subject Credits</th>
                    <th>Remove Subject from the degree</th>
                    <th>More Details</th>

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
                    <form method="get" action="DeleteSubject">
                        <td>
                            <input type="hidden" name="subjectCode" value="<%= subject.getSubjectCode() %>"/>
                            <input type="hidden" name="degreeCode" value="${degreeCode}"/>
                            <input type="hidden" name="degreeName" value="${degreeName}"/>
                            <button type="submit" class="btn btn-danger">Remove&nbsp;&nbsp;&nbsp; <i
                                    class="fas fa-trash-alt"></i>
                            </button>
                        </td>
                    </form>
                    <td>
                        <%--            <!-- Button trigger modal -->--%>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#popupModal">
                            More Details&nbsp;&nbsp; <i class="fas fa-info-circle"></i>
                        </button>
                        <div class="modal" id="popupModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" style="color: #1c1f23"> Details of
                                            Subject: <%=subject.getSubjectName() %>
                                        </h4>
                                    </div>
                                    <div class="modal-body" style="color: #1c1f23">
                                        <p><%=subject.getSubjectDescription() %>
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <% } %>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
