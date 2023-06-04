/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import util.DatabaseConnection;
import util.PasswordHasher;
import util.UserAuthorization;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author KESHARA
 */
@WebServlet(name = "loginController", urlPatterns = {"/loginController"})
public class loginController extends HttpServlet {
    PreparedStatement pst;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("userName");
        String pwd = request.getParameter("userPwd");

        PrintWriter out = response.getWriter();

        Connection con;
        try {
            //hash input password
            String hashedPassword = PasswordHasher.hashPassword(pwd);

            con = DatabaseConnection.connectToDatabase();

            pst = con.prepareStatement("SELECT userName,userPwd,userRole FROM users WHERE userName =? AND userPwd = ?");

            pst.setString(1, uname);
            pst.setString(2, hashedPassword);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                //authorize admin privileges
                if (Objects.equals(UserAuthorization.authorizeUser(uname), "admin")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("UN", uname);
                    session.setAttribute("role", rs.getString("userRole"));
                    response.sendRedirect("admin/admin.jsp");
                    //authorize user privileges
                } else if (Objects.equals(UserAuthorization.authorizeUser(uname), "user")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("UN", uname);
                    session.setAttribute("role", rs.getString("userRole"));
                    response.sendRedirect("user/user.jsp");
                }


            } else {
                request.setAttribute("Message", "User Name or Password Incorrect");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            con.close();
            pst.close();
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(registercontroller.class.getName()).log(Level.SEVERE, null, ex);
            out.println("<h1> Something Went Wrong !!! </h1>");
        }
    }
}




