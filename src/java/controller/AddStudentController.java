package controller;

import util.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AddStudentController", value = "/AddStudent")
public class AddStudentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentName = request.getParameter("studentName");
        String studentEmail = request.getParameter("studentEmail");
        String studentPhone = request.getParameter("studentPhone");
        String studentNic = request.getParameter("studentNic");

        Connection conn;
        PreparedStatement pst;

        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            //insert data into student table
            pst = conn.prepareStatement("INSERT INTO student(student_name,student_email,student_phone,student_nic) VALUES (?,?,?,?)");
            pst.setString(1,studentName);
            pst.setString(2,studentEmail);
            pst.setString(3,studentPhone);
            pst.setString(4,studentNic);
            pst.executeUpdate();

            conn.close();
            pst.close();
            response.sendRedirect(request.getContextPath() + "/admin/addStudent.jsp?success=true");


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
