<%@ page import="jakarta.servlet.http.*" %>
<%
    String title = request.getParameter("title");
    HttpSession session1 = request.getSession();
    session1.setAttribute("articleTitle", title);
%>