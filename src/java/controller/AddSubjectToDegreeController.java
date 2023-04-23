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
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddSubjectToDegreeController", urlPatterns = {"/AddSubjectToDegree"})
public class AddSubjectToDegreeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String degreeCode = req.getParameter("degreeCode");
        String degreeName = req.getParameter("degreeName");

        Connection conn = null;
        PreparedStatement pst1 = null,pst2 = null;

        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String sql = "SELECT * FROM subject WHERE NOT EXISTS (" +
                "SELECT 1 FROM degree_subject " +
                "WHERE degree_subject.subject_code = subject.subject_code);";

        String subSql = "SELECT * FROM subject JOIN degree_subject ON subject.subject_code = degree_subject.subject_code " +
                "WHERE degree_subject.degree_code = ?; ";

        try {

            assert conn != null;
            pst1 = conn.prepareStatement(sql);
            pst2 = conn.prepareStatement(subSql);
            pst2.setString(1, degreeCode);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        PrintWriter out = resp.getWriter();

        ResultSet rs1 = null;
        ResultSet rs2 = null;

        try {

            assert pst1 != null;
            rs1 = pst1.executeQuery();
            assert pst2 != null;
            rs2 = pst2.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }


        List<Subject> allSubjects = new ArrayList<>();
        List<Subject> degreeSubjects = new ArrayList<>();

        try {
            while (true) {
                assert rs1 != null;
                if (!rs1.next()) break;
                Subject allSubject = new Subject();
                allSubject.setSubjectCode(rs1.getString("subject_code"));
                allSubject.setSubjectName(rs1.getString("subject_name"));
                allSubject.setSubjectDescription(rs1.getString("subject_description"));
                allSubject.setSubjectCredits(rs1.getInt("subject_credits"));
                allSubjects.add(allSubject);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            //view degree subject


            //execute view subject query
        try {

            while (true) {
                assert rs2 != null;
                if (!rs2.next()) break;
                Subject degreeSubject = new Subject();
                degreeSubject.setSubjectCode(rs2.getString("subject_code"));
                degreeSubject.setSubjectName(rs2.getString("subject_name"));
                degreeSubject.setSubjectCredits(rs2.getInt("subject_credits"));
                degreeSubject.setSubjectDescription(rs2.getString("subject_description"));
                degreeSubjects.add(degreeSubject);

            }
            req.setAttribute("allSubjects", allSubjects);
            req.setAttribute("degreeName", degreeName);
            req.setAttribute("degreeCode", degreeCode);


            req.setAttribute("degreeSubjects", degreeSubjects);
            RequestDispatcher dispatcher = req.getRequestDispatcher("admin/addNewSubjectsToDegree.jsp");
            dispatcher.forward(req, resp);

            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
