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
import java.util.Enumeration;

@WebServlet(name = "SubmitGradeController", value = "/SubmitGradeController")
public class SubmitGradeController extends HttpServlet {

    Connection conn;
    PreparedStatement pst;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String subjectCode = request.getParameter("subjectCode");
        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                String[] paramValues = request.getParameterValues(paramName);
                if (paramValues.length > 0 && !"disabled".equals(paramValues[0])) {

                    String grade = paramValues[0];

                    pst = conn.prepareStatement("UPDATE student_subject SET grade = ? WHERE student_number = ? AND subject_code = ?");
                    pst.setString(1, grade);
                    pst.setString(2, paramName);
                    pst.setString(3, subjectCode);
                    pst.executeUpdate();
                    // save the grade to the database or do other processing
                }
            }

        } catch (SQLException e) {
            response.sendRedirect(request.getContextPath() + "/StudentGrade?success=false&subjectCode"+subjectCode);
        }


        // redirect to a success page
        response.sendRedirect(request.getContextPath() + "/StudentGrade?success=true&subjectCode="+subjectCode);

    }

}

