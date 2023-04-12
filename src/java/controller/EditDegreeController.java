package controller;

import beans.DatabaseConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

/**
 * @author Keshara
 */
@WebServlet(name = "EditDegree", urlPatterns = {"/EditDegree"})
public class EditDegreeController extends HttpServlet {
    PreparedStatement pst;
    Connection con;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String degreeCode = request.getParameter("degree_code");
        String degreeName = request.getParameter("degree_name");
        String degreeDescription = request.getParameter("degree_description");
        String degreeDuration = request.getParameter("degree_duration");
        String degreeCredits = request.getParameter("degree_credits");


        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            pst = con.prepareStatement("UPDATE degree SET degree_name = ?, degree_description = ?, degree_duration = ?, degree_credits = ? WHERE degree_code = ?");
            pst.setString(1, degreeName);
            pst.setString(2, degreeDescription);
            pst.setInt(3, Integer.parseInt(degreeDuration));
            pst.setInt(4, Integer.parseInt (degreeCredits));
            pst.setString(5, degreeCode);
            pst.executeUpdate();

        } catch (SQLException ex) {
            out.println("<h1> Something Went Wrong !!! </h1>");
        }

        response.sendRedirect(request.getContextPath() + "/ViewDegree?editSuccess=true");

    }
}


