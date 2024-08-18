<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/csw";

    String USER = "root";
    String PASS = "Sanmitha@33";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        String title = request.getParameter("title-input");
        String content = request.getParameter("text-input");
        System.out.println(title);
        HttpSession session1 = request.getSession();
        
        String updateQuery = "UPDATE articles SET content = ? WHERE title = ?;";
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, content);
        pstmt.setString(2, title);

        int rowsUpdated = pstmt.executeUpdate();

        out.println("Data inserted successfully.");
        response.sendRedirect("dashboard.html");
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
