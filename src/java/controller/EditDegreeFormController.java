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


@WebServlet(name = "editDegreeForm", urlPatterns = {"/editDegreeForm"})
public class EditDegreeFormController extends HttpServlet {
    PreparedStatement pst;
    Connection con;
    ResultSet rs;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String degreeCode = request.getParameter("degreeCode");

        try {
            con = DatabaseConnection.connectToDatabase();

            pst = con.prepareStatement("SELECT * FROM degree WHERE degree_code = ?");
            pst.setString(1, degreeCode);
            rs = pst.executeQuery();

            if (rs.next()) {
                request.setAttribute("degreeCode", rs.getString("degree_code"));
                request.setAttribute("degreeName", rs.getString("degree_name"));
                request.setAttribute("degreeDescription", rs.getString("degree_description"));
                request.setAttribute("degreeDuration", Integer.toString(rs.getInt("degree_duration")));
                request.setAttribute("degreeCredits", Integer.toString(rs.getInt("degree_credits")));
                con.close();
                pst.close();

            }

            request.getRequestDispatcher("admin/editDegree.jsp").forward(request, response);

        } catch (SQLException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

}
