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

        String insertQuery = "INSERT INTO users (name, email, password) VALUES (?, ?,?)";
        
        // Get title and textarea content from request parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        HttpSession session1 = request.getSession();
        session1.setAttribute("authorName", name);
        session1.setAttribute("authorEmail", email);

        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, password);

        pstmt.executeUpdate();

        out.println("Data inserted successfully.");
        
        
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
