package controller;

import util.DatabaseConnection;
import bean.Student;

import javax.servlet.RequestDispatcher;
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

@WebServlet(name = "ViewEnrolledStudents", value = "/ViewEnrolledStudents")
public class ViewEnrolledStudentsController extends HttpServlet {

    Connection conn;
    PreparedStatement pst;
    ResultSet rs;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String subjectCode = request.getParameter("subjectCode");

        try {
            conn = DatabaseConnection.connectToDatabase();
            pst = conn.prepareStatement("SELECT student.id, student.student_number, student.student_name " +
                    "FROM student INNER JOIN student_subject ON student.student_number = student_subject.student_number" +
                    " WHERE student_subject.subject_code = ? ");
            pst.setString(1, subjectCode);
            rs = pst.executeQuery();

            List<Student> studentSubjects = new ArrayList<>();
            while (rs.next()) {
                Student studentSubject = new Student();
                studentSubject.setId(rs.getInt("id"));
                studentSubject.setName(rs.getString("student_name"));
                studentSubject.setNumber(rs.getString("student_number"));
                studentSubjects.add(studentSubject);

            }
            conn.close();
            pst.close();
            request.setAttribute("studentSubjects", studentSubjects);
            request.setAttribute("subjectCode", subjectCode);
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/viewEnrolledStudents.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
