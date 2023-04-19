<%@ page import="model.Subject" %>
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
    <!-- Link jquery and Javascript -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<h1>Subjects Belongs to ${degreeName}</h1>

<% if ("true".equals(request.getParameter("subDel"))) { %>
<div class="alert alert-danger" role="alert">
    Subject successfully Deleted!
</div>

<%--<% } else if ("true".equals(request.getParameter("editSuccess"))) { %>--%>
<%--<div class="alert alert-primary" role="alert">--%>
<%--    User successfully Updated!--%>
<%--</div>--%>
<%
    }
%>


<table class="table table-dark">
    <thead>
    <tr>
        <th>Subject Code</th>
        <th>Subject Name</th>
        <th>Subject Credits</th>
        <th>Delete Subject from the degree</th>
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
                <button type="submit" class="btn btn-outline-danger">Delete Subject "<%= subject.getSubjectName() %>
                    from ${degreeName}"
                </button>
            </td>
        </form>
        <td>
            <%--            <!-- Button trigger modal -->--%>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#popupModal">
                More Details
            </button>
            <%--            <!-- Modal -->--%>
            <%--            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
            <%--                <div class="modal-dialog modal-dialog-centered" role="document">--%>
            <%--                    <div class="modal-content">--%>
            <%--                        <div class="modal-header">--%>
            <%--                            <h5 class="modal-title" id="exampleModalLongTitle">Details of <%=subject.getSubjectName() %></h5>--%>
            <%--                        </div>--%>
            <%--                        <div class="modal-body">--%>
            <%--                            <%=subject.getSubjectDescription() %>--%>
            <%--                        </div>--%>
            <%--                        <div class="modal-footer">--%>
            <%--                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <%--        </td>--%>

            <!-- Modal -->


            <div class="modal" id="popupModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" style="color: #1c1f23"> Details of Subject: <%=subject.getSubjectName() %> </h4>
                        </div>
                        <div class="modal-body" style="color: #1c1f23">
                            <p> <%=subject.getSubjectDescription() %> </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
                <% } %>
    </tr>
    </tbody>
</table>
</body>
</html>
