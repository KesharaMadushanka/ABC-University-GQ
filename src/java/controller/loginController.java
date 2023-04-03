/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import beans.DatabaseConnection;
import beans.PasswordHasher;
import beans.UserAuthorization;

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

            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            pst = con.prepareStatement("SELECT userName,userPwd FROM users WHERE userName =? AND userPwd = ?");

            pst.setString(1, uname);
            pst.setString(2, hashedPassword);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                //authorize user privileges
                if (Objects.equals(UserAuthorization.authorizeUser(uname), "admin")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("UN", uname);
                    request.setAttribute("message", "Hello " + uname);
                    response.sendRedirect("admin/home.jsp");
                } else if (Objects.equals(UserAuthorization.authorizeUser(uname), "student")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("UN", uname);
                    request.setAttribute("message", "Hello " + uname);
                    response.sendRedirect("student/studentHome.jsp");
                }


            } else {
                request.setAttribute("Message", "Hello " + " Error. ");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(registercontroller.class.getName()).log(Level.SEVERE, null, ex);
            out.println("<h1> Something Went Wrong !!! </h1>");
        }
    }
}




