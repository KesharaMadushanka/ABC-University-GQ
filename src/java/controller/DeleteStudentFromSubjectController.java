package controller;

import util.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "DeleteStudentFromSubjectController", value = "/DeleteStudentFromSubject")
public class DeleteStudentFromSubjectController extends HttpServlet {

    Connection conn;
    PreparedStatement pst;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String subjectCode = request.getParameter("subjectCode");
        String studentNumber = request.getParameter("studentNumber");

        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = conn.prepareStatement("DELETE FROM student_subject WHERE student_number = ? AND subject_code = ?");
            pst.setString(1, studentNumber);
            pst.setString(2,subjectCode);
            pst.executeUpdate();

            conn.close();
            pst.close();

            response.sendRedirect(request.getContextPath() + "/ViewEnrolledStudents?subjectCode="+subjectCode+"&success=true");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
