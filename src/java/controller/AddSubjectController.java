package controller;

import util.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AddSubjectController", urlPatterns = {"/AddSubject"})
public class AddSubjectController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String subjectCode = req.getParameter("subject_code");
        String subjectName = req.getParameter("subject_name");
        String subjectCredits = req.getParameter("subject_credits");
        String subjectDescription = req.getParameter("subject_description");

        Connection conn = null;
        PreparedStatement pst = null;

        try {
            conn = DatabaseConnection.connectToDatabase();

            String sql = "INSERT INTO subject (subject_code, subject_name, subject_credits, subject_description) VALUES (?, ?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, subjectCode);
            pst.setString(2, subjectName);
            pst.setInt(3, Integer.parseInt(subjectCredits));
            pst.setString(4, subjectDescription);

            // Execute SQL statement
            int rowsAffected = pst.executeUpdate();

            if (rowsAffected == 1) {
                // Redirect to success page
                resp.sendRedirect(req.getContextPath() + "/admin/addSubject.jsp?success=true");
            } else {
                // Redirect to error page
                resp.sendRedirect(req.getContextPath() + "/admin/addSubject.jsp?success=false");
            }

        } catch (SQLException ex) {
            // Redirect to error page with error message
            ex.printStackTrace();
            ;
        } finally {
            // Close resources
            try {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

    }
}

