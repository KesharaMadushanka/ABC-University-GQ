package controller;

import util.DatabaseConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;


@WebServlet(name = "DeleteSubject", urlPatterns = {"/DeleteSubject"})
public class DeleteSubjectController extends HttpServlet {
    PreparedStatement pst;
    Connection con;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String degreeCode = null;

        String subjectCode = request.getParameter("subjectCode");
        degreeCode = request.getParameter("degreeCode");
        String degreeName = request.getParameter("degreeName");

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            if (degreeCode != null){
                pst = con.prepareStatement("DELETE FROM degree_subject WHERE subject_code = ? AND degree_code = ? ");
                pst.setString(1, subjectCode);
                pst.setString(2, degreeCode);
                pst.executeUpdate();

                response.sendRedirect(request.getContextPath() + "/ViewSubject?subDelFromDeg=true&degreeCode=" + degreeCode + "&degreeName=" + degreeName);
            } else {
                pst = con.prepareStatement("DELETE FROM subject WHERE subject_code = ?");
                pst.setString(1, subjectCode);
                pst.executeUpdate();
                con.close();
                pst.close();
                response.sendRedirect(request.getContextPath() + "/ViewAllSubject?subDel=true");
            }



        } catch (SQLException ex) {
            out.println("<h1> Something Went Wrong !!! </h1>");
        }


    }
}
