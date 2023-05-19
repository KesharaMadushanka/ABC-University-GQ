package controller;

import bean.StudentResult;
import util.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentResultController", value = "/StudentResult")
public class StudentResultController extends HttpServlet {

    Connection conn;
    PreparedStatement pst;
    ResultSet rs;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String studentNumber = request.getParameter("studentNumber");

        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = conn.prepareStatement("SELECT s.student_number, s.student_name, su.subject_code, su.subject_name, ss.grade, sg.gpa " +
                    "FROM student s JOIN student_subject ss ON s.student_number = ss.student_number JOIN subject su " +
                    "ON ss.subject_code = su.subject_code JOIN student_gpa sg ON s.student_number = sg.student_number " +
                    "WHERE s.student_number = ?");

            pst.setString(1, studentNumber);
            rs = pst.executeQuery();

            List<StudentResult> studentResults = new ArrayList<>();
            while (rs.next()) {
                StudentResult studentResult = new StudentResult();
                studentResult.setStudentNumber(rs.getString("student_number"));
                studentResult.setStudentName(rs.getString("student_name"));
                studentResult.setSubjectCode(rs.getString("subject_code"));
                studentResult.setSubjectName(rs.getString("subject_name"));
                studentResult.setGrade(rs.getString("grade"));
                studentResult.setGpa(rs.getDouble("gpa"));
                studentResults.add(studentResult);

            }
            conn.close();
            pst.close();
            // Set the list as a request attribute
            request.setAttribute("results", studentResults);
            // Forward the request to viewUser.jsp
            request.getRequestDispatcher("user/studentResults.jsp").forward(request, response);


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
