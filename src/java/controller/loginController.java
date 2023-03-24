/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import beans.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MADUSHIKA
 */
@WebServlet(name = "loginController", urlPatterns = {"/loginController"})
public class loginController extends HttpServlet {
 Connection con;
    PreparedStatement pst;
    ResultSet rs;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("userName");
        String pwd = request.getParameter("userPwd");
        
        PrintWriter out = response.getWriter();

Connection con;
        try {
            con = DatabaseConnection.connectToDatabase ("jdbc:mysql://localhost/abc_university_q","root","");
        
            pst = con.prepareStatement("SELECT userName,userPwd FROM users WHERE userName =? AND userPwd = ?");

            pst.setString(1,uname);
            pst.setString(2,pwd);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
            HttpSession session = request.getSession();
            session.setAttribute("UN",uname);
            request.setAttribute("message","Hello " + uname);
            response.sendRedirect("home.jsp");
            }else{
                request.setAttribute("Message","Hello " + " Error. " );
    request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(registercontroller.class.getName()).log(Level.SEVERE, null, ex);
            out.println("<h1> Somthing Went Wrong !!! </h1>");
        }
//        out.println("<h1> Success !</h1>");
//        response.sendRedirect("login.jsp");
//    request.setAttribute("Message","Hello " + uname + " Your registration is successfull. " + "Now you can loggin to the system");
//    request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}




