package controller;

import beans.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "SubmitSubjectToDegreeController", value = "/SubmitSubjectToDegree")
public class SubmitSubjectToDegreeController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subject = request.getParameter("subjects").replaceAll("\\s", "");
        String degreeCode = request.getParameter("degreeCode");
        String degreeName = request.getParameter("degreeName");
        String[] subjectCodes = subject.split(",");

        Connection conn;
        PreparedStatement pst;


        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = conn.prepareStatement("INSERT INTO degree_subject(degree_code,subject_code) VALUES (?,?)");
            for (String subjectCode : subjectCodes) {
                // Set parameters for SQL statement
                pst.setString(1, degreeCode);
                pst.setString(2,subjectCode.trim());
                // Execute SQL statement
                pst.executeUpdate();
            }
            response.sendRedirect("ViewSubject?&degreeCode="+degreeCode+"&degreeName="+degreeName);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
