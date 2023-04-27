package controller;

import util.DatabaseConnection;
import bean.Degree;

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


@WebServlet(name = "ViewDegreeController", urlPatterns = {"/ViewDegree"})
public class ViewDegreeController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Degree> degrees = new ArrayList<>();


        try {
            Connection con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            String sql = "SELECT * FROM degree";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Degree degree = new Degree();
                degree.setDegreeCode(rs.getString("degree_code"));
                degree.setDegreeName(rs.getString("degree_name"));
                degree.setDegreeDuration(rs.getInt("degree_duration"));
                degree.setDegreeCredits(rs.getInt("degree_credits"));
                degree.setDegreeDescription(rs.getString("degree_description"));
                degrees.add(degree);
            }

            request.setAttribute("degrees", degrees);
            request.getRequestDispatcher("admin/viewDegree.jsp").forward(request, response);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
