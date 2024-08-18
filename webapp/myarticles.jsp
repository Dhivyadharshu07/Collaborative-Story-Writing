<%@ page import="java.sql.*,java.util.*" %>
<%
    // JDBC connection information
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/csw";
    String USER = "root";
    String PASS = "Sanmitha@33";

    Connection conn = null;
    Statement stmt = null;

    try {
        // Register JDBC driver
        Class.forName(JDBC_DRIVER);

        // Open a connection
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
        HttpSession session1 = request.getSession();
        String author = (String)session1.getAttribute("authorName");
        // Execute SQL query
        String sql = "SELECT * FROM articles where author = '"+author+"';";
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        

        // Display articles in HTML format
%>
            <div class="items">
                <% while (rs.next()) { 
                String content = rs.getString("content");
        		String firstTenChars = content.substring(0, Math.min(content.length(), 10)) + "...";%>
                    <div class="item1">
                        <h3 class="t-op-nextlvl"><%= rs.getString("title") %></h3>
                        <h3 class="t-op-nextlvl"><%= rs.getString("author") %></h3>
                        <h3 class="t-op-nextlvl label-tag">Published</h3>
                        <button type="button" onclick='setSession("<%= rs.getString("title") %>");'>Read More</button>
                    </div>
                    <p id="desc"><%= firstTenChars %></p>
                <% } %>
            </div>
<%
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
