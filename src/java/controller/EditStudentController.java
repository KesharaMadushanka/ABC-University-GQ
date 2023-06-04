package controller;

import util.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "EditStudentController", value = "/EditStudent")
public class EditStudentController extends HttpServlet {

    Connection con;
    PreparedStatement pst;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        String studentName = request.getParameter("studentName");
        String studentEmail = request.getParameter("studentEmail");
        String studentPhone = request.getParameter("studentPhone");
        String studentNic = request.getParameter("studentNic");

        try {
            con = DatabaseConnection.connectToDatabase();
            pst = con.prepareStatement("UPDATE student SET student_name = ?, student_email = ?, student_phone = ?, student_nic = ? " +
                    "WHERE id = ?");
            pst.setString(1, studentName);
            pst.setString(2,studentEmail);
            pst.setString(3,studentPhone);
            pst.setString(4,studentNic);
            pst.setInt(5, Integer.parseInt(studentId));
            pst.executeUpdate();
            con.close();
            pst.close();
            response.sendRedirect(request.getContextPath() + "/ViewStudents?editSuccess=true");

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
