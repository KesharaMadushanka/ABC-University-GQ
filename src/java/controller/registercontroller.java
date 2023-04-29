/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import util.DatabaseConnection;
import util.PasswordHasher;
import util.VerifyUnamePwd;

import javax.servlet.ServletException;
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
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "registercontroller", urlPatterns = {"/registercontroller"})
public class registercontroller extends HttpServlet {

    Connection con;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPhone = request.getParameter("userPhone");
        String userNic = request.getParameter("userNic");
        String userPwd = request.getParameter("userPwd");

        PrintWriter out = response.getWriter();

        Connection con;
        String reply = null;
        try {

            if (!VerifyUnamePwd.verifyUname(userName)) {
                reply = " Username already exists. Please login !";
            } else if (!VerifyUnamePwd.verifyUemail(userEmail)) {
                reply = " User Email already exists. Please login";
            } else {


                String hashedPassword = PasswordHasher.hashPassword(userPwd);
                con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
                String insertQuery = "INSERT INTO users(userName,userEmail,userPhone,userNic,userPwd) VALUES (?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(insertQuery);


                pst.setString(1, userName);
                pst.setString(2, userEmail);
                pst.setInt(3, Integer.parseInt(userPhone));
                pst.setString(4, userNic);
                pst.setString(5, hashedPassword);
                pst.executeUpdate();

                reply = " Successfully registered. Please login !";

            }
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(registercontroller.class.getName()).log(Level.SEVERE, null, ex);
            out.println("<h1> Somthing Went Wrong !!! </h1>");
        }

        request.setAttribute("Message", "Hello " + userName + reply);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


}