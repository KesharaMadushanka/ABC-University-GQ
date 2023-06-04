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

@WebServlet(name = "ViewStudentController", value = "/ViewStudents")
public class ViewStudentController extends HttpServlet {

    Connection con;
    PreparedStatement pst;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            con = DatabaseConnection.connectToDatabase();

            pst = con.prepareStatement("SELECT * FROM student");
            ResultSet rs = pst.executeQuery();

            List<Student> studentList = new ArrayList<>();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setNumber(rs.getString("student_number"));
                student.setEmail(rs.getString("student_email"));
                student.setName(rs.getString("student_name"));
                student.setNic(rs.getString("student_nic"));
                student.setPhone(rs.getString("student_phone"));
                // Add the user to the list
                studentList.add(student);
            }
            con.close();
            pst.close();
            // Set the list as a request attribute
            request.setAttribute("students", studentList);
            // Forward the request to viewUser.jsp
            request.getRequestDispatcher("admin/viewStudents.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
