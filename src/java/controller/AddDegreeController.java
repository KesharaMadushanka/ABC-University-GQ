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


/**
 * @author Keshara
 */
@WebServlet(name = "AddDegreeController", urlPatterns = {"/addDegree"})
public class AddDegreeController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String degreeCode = req.getParameter("degree_code");
        String degreeName = req.getParameter("degree_name");
        String degreeDuration = req.getParameter("degree_duration");
        String degreeCredits = req.getParameter("degree_credits");
        String degreeDescription = req.getParameter("degree_description");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DatabaseConnection.connectToDatabase();

            String sql = "INSERT INTO degree (degree_code, degree_name, degree_duration, degree_credits, degree_description) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, degreeCode);
            pstmt.setString(2, degreeName);
            pstmt.setInt(3, Integer.parseInt(degreeDuration));
            pstmt.setInt(4, Integer.parseInt(degreeCredits));
            pstmt.setString(5, degreeDescription);

            // Execute SQL statement
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected == 1) {
                // Redirect to success page
                resp.sendRedirect(req.getContextPath() + "/admin/addDegree.jsp?success=true");
            } else {
                // Redirect to error page
                resp.sendRedirect(req.getContextPath() + "/admin/addDegree.jsp?success=false");
            }

        } catch (SQLException ex) {
            // Redirect to error page with error message
            ex.printStackTrace();;
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

    }
}
