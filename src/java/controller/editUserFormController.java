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


@WebServlet(name = "editUserForm", urlPatterns = {"/editUserForm"})
public class editUserFormController extends HttpServlet {
    PreparedStatement pst;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String userId = request.getParameter("userId");

        Connection con;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            pst = con.prepareStatement("SELECT * FROM users WHERE id = ?");
            pst.setInt(1, Integer.parseInt(userId));
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                request.setAttribute("userId", Integer.toString(rs.getInt("id")));
                request.setAttribute("userName", rs.getString("userName"));
                request.setAttribute("email", rs.getString("userEmail"));
                request.setAttribute("phone", rs.getString("userPhone"));
                request.setAttribute("nic", rs.getString("userNic"));
            }
            con.close();
            pst.close();
            request.getRequestDispatcher("admin/editUser.jsp").forward(request, response);

        } catch (SQLException | ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
