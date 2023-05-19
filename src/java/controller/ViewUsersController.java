package controller;

import util.DatabaseConnection;
import bean.User;

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

/**
 * @author Keshara
 */

@WebServlet(name = "ViewUsersController", urlPatterns = {"/ViewUsers"})
public class ViewUsersController extends HttpServlet {

    Connection con;
    PreparedStatement pst;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            // Execute the SELECT query
            pst = con.prepareStatement("SELECT * FROM users");
            ResultSet rs = pst.executeQuery();

            // Store the result set in a List<User> object
            List<User> userList = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("userEmail"));
                user.setName(rs.getString("userName"));
                user.setNic(rs.getString("userNic"));
                user.setPhone(rs.getString("userPhone"));
                // Add the user to the list
                userList.add(user);
            }
            con.close();
            pst.close();
            // Set the list as a request attribute
            request.setAttribute("users", userList);
            // Forward the request to viewUser.jsp
            request.getRequestDispatcher("/admin/viewUsers.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }


}
