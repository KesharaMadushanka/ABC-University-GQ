<%--
  Created by IntelliJ IDEA.
  User: Keshara
  Date: 5/15/2023
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<%
    if (session.getAttribute("UN") == null) {
        response.sendRedirect("../index.jsp");
    }
%>

<%
    // Invalidate session
    session.invalidate();

    // Redirect to login page
    response.sendRedirect("../index.jsp");
%>

