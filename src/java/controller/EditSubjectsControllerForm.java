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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "editSubjectForm", urlPatterns = {"/EditSubjectForm"})
public class EditSubjectsControllerForm extends HttpServlet {

    PreparedStatement pst;
    Connection con;
    ResultSet rs;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String subjectCode = request.getParameter("subjectCode");

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT * FROM subject WHERE subject_code = ?");
            pst.setString(1, subjectCode);
            rs = pst.executeQuery();

            if(rs.next()){
                request.setAttribute("subjectCode", rs.getString("subject_code"));
                request.setAttribute("subjectName", rs.getString("subject_name"));
                request.setAttribute("subjectDescription", rs.getString("subject_description"));
                request.setAttribute("subjectCredits", Integer.toString(rs.getInt("subject_credits")));
            }
            con.close();
            pst.close();
            request.getRequestDispatcher("admin/editSubject.jsp").forward(request, response);


        } catch (SQLException | ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
