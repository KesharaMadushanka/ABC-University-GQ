package controller;

import bean.Student;
import util.DatabaseConnection;

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

@WebServlet(name = "AddStudentToSubjectController", value = "/AddStudentToSubject")
public class AddStudentToSubjectController extends HttpServlet {

    Connection con;
    PreparedStatement subjectNameStmt, studentStmt, subjectStudentStmt;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subjectCode = request.getParameter("subjectCode");
        String subjectName = "No Subject Found";
        String subjectAvailable = "false";

        try {
            con = DatabaseConnection.connectToDatabase();

            String getSubjectNameSql = "SELECT subject_name,COUNT(*) AS count FROM subject WHERE subject_code = ?";
            String getAllStudentsExcludingExistSql = "SELECT id,student_number,student_name FROM student WHERE student_number " +
                    "NOT IN (SELECT student_number FROM student_subject WHERE subject_code = ?); ";
            String getAlreadyEnrolledStudents = "SELECT * FROM student WHERE student_number IN " +
                    "(SELECT student_number FROM student_subject WHERE subject_code = ?); ";


            subjectNameStmt = con.prepareStatement(getSubjectNameSql);
            subjectNameStmt.setString(1, subjectCode);
            ResultSet subjectRs = subjectNameStmt.executeQuery();


            studentStmt = con.prepareStatement(getAllStudentsExcludingExistSql);
            studentStmt.setString(1, subjectCode);
            ResultSet studentRs = studentStmt.executeQuery();

            subjectStudentStmt = con.prepareStatement(getAlreadyEnrolledStudents);
            subjectStudentStmt.setString(1, subjectCode);
            ResultSet stSub = subjectStudentStmt.executeQuery();

            List<Student> allStudents = new ArrayList<>();
            List<Student> subjectStudents = new ArrayList<>();

            while (studentRs.next()) {
                Student allStudent = new Student();
                allStudent.setId(studentRs.getInt("id"));
                allStudent.setNumber(studentRs.getString("student_number"));
                allStudent.setName(studentRs.getString("student_name"));
                allStudents.add(allStudent);
            }

            while (stSub.next()) {
                Student subjectStudent = new Student();
                subjectStudent.setId(stSub.getInt("id"));
                subjectStudent.setNumber(stSub.getString("student_number"));
                subjectStudent.setName(stSub.getString("student_name"));
                subjectStudents.add(subjectStudent);

            }

            if (subjectRs.next()) {
                int rowCount = subjectRs.getInt(2);
                if (rowCount > 0) {
                    subjectName = subjectRs.getString("subject_name");
                    subjectAvailable = "true";
                }
            }

//            request.setAttribute("subjectName" , subjectName);
            request.setAttribute("allStudents", allStudents);
            request.setAttribute("subjectStudents", subjectStudents);
            request.setAttribute("subjectCode", subjectCode);
            request.setAttribute("subjectName", subjectName);
            request.setAttribute("subjectAvailable", subjectAvailable);

            con.close();

            RequestDispatcher dispatcher = request.getRequestDispatcher("user/viewSubjects.jsp");
            dispatcher.forward(request, response);


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
