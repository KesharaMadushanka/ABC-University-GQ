package controller;

import util.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "SubmitStudentToSubjectController", value = "/SubmitStudentToSubject")
public class SubmitStudentToSubjectController extends HttpServlet {

    Connection conn;
    PreparedStatement pst;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String student = request.getParameter("student").replaceAll("\\s", "");
//        System.out.println(student);

        String subjectCode = request.getParameter("subjectCode");
        String[] studentCodes = student.split(",");



        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = conn.prepareStatement("INSERT INTO student_subject (student_number,subject_code) VALUES (?,?)");
            for (String studentCode : studentCodes) {
                // Set parameters for SQL statement
                pst.setString(1, studentCode.trim());
                pst.setString(2, subjectCode);
                // Execute SQL statement
                pst.executeUpdate();
            }
            response.sendRedirect("ViewEnrolledStudents?subjectCode="+subjectCode);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
