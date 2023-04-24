package controller;

import beans.DatabaseConnection;
import beans.UserAuthorization;
import model.Subject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "ViewAllSubjectController", urlPatterns = {"/ViewAllSubject"})
public class ViewAllSubjectController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn;
        PreparedStatement pst;

        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            String sql = "SELECT * FROM subject ";

            //execute view subject query
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            List<Subject> subjects = new ArrayList<>();
            while (rs.next()) {
                Subject allsubject = new Subject();
                allsubject.setSubjectCode(rs.getString("subject_code"));
                allsubject.setSubjectName(rs.getString("subject_name"));
                allsubject.setSubjectDescription(rs.getString("subject_description"));
                allsubject.setSubjectCredits(rs.getInt("subject_credits"));
                subjects.add(allsubject);

            }

            HttpSession session = req.getSession();
            if (Objects.equals(UserAuthorization.authorizeUser(String.valueOf(session.getAttribute("UN"))), "admin")) {
                req.setAttribute("subjects", subjects);
                RequestDispatcher dispatcher = req.getRequestDispatcher("admin/viewAllSubjects.jsp");
                dispatcher.forward(req, resp);

                conn.close();

            } else if (Objects.equals(UserAuthorization.authorizeUser(String.valueOf(session.getAttribute("UN"))), "user")){
                req.setAttribute("subjects", subjects);
                RequestDispatcher dispatcher = req.getRequestDispatcher("user/viewAllSubjects.jsp");
                dispatcher.forward(req, resp);

                conn.close();
            }



        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
