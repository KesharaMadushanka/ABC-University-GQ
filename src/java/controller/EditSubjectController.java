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


@WebServlet(name = "EditSubject", urlPatterns = {"/EditSubject"})
public class EditSubjectController extends HttpServlet {

    PreparedStatement pst;
    Connection con;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String subjectCode = request.getParameter("subject_code");
        String subjectName = request.getParameter("subject_name");
        String subjectDescription = request.getParameter("subject_description");
        String subjectCredits = request.getParameter("subject_credits");


        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            pst = con.prepareStatement("UPDATE subject SET subject_name = ?, subject_description = ?, subject_credits = ? WHERE subject_code = ?");
            pst.setString(1, subjectName);
            pst.setString(2, subjectDescription);
            pst.setInt(3, Integer.parseInt(subjectCredits));
            pst.setString(4, subjectCode);
            pst.executeUpdate();
            con.close();
            pst.close();
        } catch (SQLException ex) {
            out.println("<h1> Something Went Wrong !!! </h1>");
        }

        response.sendRedirect(request.getContextPath() + "/ViewAllSubject?editSuccess=true");
    }

    }
