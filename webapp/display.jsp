<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/csw";
    String USER = "root";
    String PASS = "Sanmitha@33"; // Replace with your actual database password

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
        HttpSession session1 = request.getSession();
        String author = (String)session1.getAttribute("authorName");
        String title = (String)session1.getAttribute("articleTitle");
        String sql = "SELECT title, content FROM articles where title='"+title+"';";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        %>
        <div class="items">
    <% while (rs.next()) { 
        String title_field= rs.getString("title");
        String content_field =rs.getString("content");
        session1.setAttribute("content",content_field);%>  
        <div class="item1">      
		<h1 id="title-input"><%= title_field %></h1>
		<p id="text-input"><%= content_field %></p>
		</div>
		<% } %>
	</div>
<%
        
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

