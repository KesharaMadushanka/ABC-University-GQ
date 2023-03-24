<%-- 
    Document   : logout
    Created on : Mar 9, 2023, 10:48:05 AM
    Author     : MADUSHIKA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   if(session.getAttribute("UN")!= null){
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
%>
