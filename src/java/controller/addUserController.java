
package controller;

import beans.DatabaseConnection;
import beans.PasswordHasher;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author Keshara
 */
@WebServlet(name = "addUserController", urlPatterns = {"/addUsers"})
public class addUserController extends HttpServlet {
    PreparedStatement pst;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {


        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPhone = request.getParameter("userPhone");
        String userNic = request.getParameter("userNic");
        String userPwd = request.getParameter("userPwd");

        PrintWriter out = response.getWriter();

        Connection con;
        try {
            String hashedPassword = PasswordHasher.hashPassword(userPwd);

            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            pst = con.prepareStatement("INSERT INTO users(userName,userEmail,userPhone,userNic,userPwd) VALUES (?,?,?,?,?)");

            pst.setString(1, userName);
            pst.setString(2, userEmail);
            pst.setInt(3, Integer.parseInt(userPhone));
            pst.setString(4, userNic);
            pst.setString(5, hashedPassword);
            pst.executeUpdate();


        } catch (NoSuchAlgorithmException | SQLException ex) {
            out.println("<h1> Something Went Wrong !!! </h1>");
        }

        String message = "Success";

        request.setAttribute("successMessage", message);
        response.sendRedirect(request.getContextPath() + "/admin/addUser.jsp?success=true");

    }
}



