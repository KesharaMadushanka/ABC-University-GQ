
package controller;

import beans.DatabaseConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

/**
 * @author Keshara
 */
@WebServlet(name = "deleteUserController", urlPatterns = {"/deleteUserController"})
public class deleteUserController extends HttpServlet {
    PreparedStatement pst;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String userId = request.getParameter("userId");

        Connection con;
        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            pst = con.prepareStatement("DELETE FROM users WHERE id = ? ");
            pst.setInt(1, Integer.parseInt(userId));
            pst.executeUpdate();


        } catch (SQLException ex) {
            out.println("<h1> Something Went Wrong !!! </h1>");
        }

        response.sendRedirect(request.getContextPath() + "ViewUsers?success=true");

    }
}



