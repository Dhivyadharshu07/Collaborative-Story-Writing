<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/csw"; 

    String USER = "root";
    String PASS = "Sanmitha@33";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        String query = "SELECT * FROM users WHERE email=? AND password=?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        
        rs = pstmt.executeQuery();

        if (rs.next()) {
        	String name=rs.getString("name");
            HttpSession session1 = request.getSession();
            session1.setAttribute("authorName", name);
            session1.setAttribute("authorEmail", email);
            response.sendRedirect("dashboard.html");
            
        } else {
            out.println("Invalid credentials. Please try again.");
            // response.sendRedirect("login.html");
        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
