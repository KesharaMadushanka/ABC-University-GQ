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


@WebServlet(name = "DeleteDegree", urlPatterns = {"/DeleteDegree"})
public class DeleteDegreeController extends HttpServlet {
    PreparedStatement pst;
    Connection con;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String degreeCode = request.getParameter("degreeCode");


        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            pst = con.prepareStatement("DELETE FROM degree WHERE degree_code = ? ");
            pst.setString(1, degreeCode);
            pst.executeUpdate();


        } catch (SQLException ex) {
            out.println("<h1> Something Went Wrong !!! </h1>");
        }

        response.sendRedirect(request.getContextPath() + "/ViewDegree?success=true");


    }
}
