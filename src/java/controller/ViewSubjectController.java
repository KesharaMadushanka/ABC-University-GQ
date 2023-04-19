package controller;

import beans.DatabaseConnection;
import model.Subject;

import javax.servlet.RequestDispatcher;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ViewSubjectController", urlPatterns = {"/ViewSubject"})
public class ViewSubjectController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String degreeCode = req.getParameter("degreeCode");
        String degreeName = req.getParameter("degreeName");

        Connection conn;
        PreparedStatement pst;

        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            String subSql = "SELECT * FROM subject JOIN degree_subject ON subject.subject_code = degree_subject.subject_code " +
                    "WHERE degree_subject.degree_code = ?; ";

            //execute view subject query
            pst = conn.prepareStatement(subSql);
            pst.setString(1, degreeCode);
            ResultSet rs = pst.executeQuery();

            List<Subject> subjects = new ArrayList<Subject>();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSubjectCode(rs.getString("subject_code"));
                subject.setSubjectName(rs.getString("subject_name"));
                subject.setSubjectCredits(rs.getInt("subject_credits"));
                subject.setSubjectDescription(rs.getString("subject_description"));
                subjects.add(subject);

            }
            req.setAttribute("subjects", subjects);
            req.setAttribute("degreeName", degreeName);
            req.setAttribute("degreeCode", degreeCode);
            RequestDispatcher dispatcher = req.getRequestDispatcher("admin/viewSubjects.jsp");
            dispatcher.forward(req, resp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
