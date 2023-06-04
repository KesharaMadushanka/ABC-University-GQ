package controller;

import util.DatabaseConnection;
import bean.Student;

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

@WebServlet(name = "StudentGradeController", value = "/StudentGrade")
public class StudentGradeController extends HttpServlet {

    Connection con;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            con = DatabaseConnection.connectToDatabase();
            String subjectCode = request.getParameter("subjectCode");
            String query = "SELECT student.student_number, student.student_name, student_subject.grade FROM student " +
                    "INNER JOIN student_subject ON student.student_number = student_subject.student_number " +
                    "WHERE student_subject.subject_code = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, subjectCode);
            ResultSet resultSet = statement.executeQuery();

            List<Student> subjectStudents = new ArrayList<>();
            while (resultSet.next()) {
                Student subjectStudent = new Student();
                subjectStudent.setNumber(resultSet.getString("student_number"));
                subjectStudent.setName(resultSet.getString("student_name"));
                subjectStudent.setGrade(resultSet.getString("grade"));
                subjectStudents.add(subjectStudent);
            }
            con.close();
            statement.close();
            request.setAttribute("students", subjectStudents);
            request.setAttribute("subjectCode", subjectCode);
            request.getRequestDispatcher("user/studentGrade.jsp").forward(request, response);


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
