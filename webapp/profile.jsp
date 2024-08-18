<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<%
    // Assuming 'authorName' is stored in session attributes
    HttpSession session1 = request.getSession();
    String name = (String) session1.getAttribute("authorName");

    // Establish database connection
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/csw";
    String USER = "root";
    String PASS = "Sanmitha@33";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        // Fetch user's email from the 'users' table based on the name
        String emailQuery = "SELECT email FROM users WHERE name = ?";
        String emailQuery1 = "SELECT count(*) FROM articles WHERE author = ?";
        PreparedStatement pstmt = conn.prepareStatement(emailQuery);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        
        // Extracting the email if found
        String email = "";
        if (rs.next()) {
            email = rs.getString("email");
        }
        PreparedStatement pstmt1 = conn.prepareStatement(emailQuery1);
        pstmt1.setString(1, name);
        rs1 = pstmt1.executeQuery();
		String count=null;
        if (rs1.next()) {
            count="Articles written : "+(String)rs1.getString("count(*)");
        }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="profile.css">
</head>
<body>
  <div class="profile-container">
    <div class="profile-box">
      <div class="profile-icon">
        <img src="https://th.bing.com/th?id=OIP.QxU5QM6CI1w0MgSFCyp4AgHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2" alt="Profile Icon">
      </div>
      <div class="profile-details">
        <div class="profile-info">
          <h2><%= name %></h2>
          <br>
          <p><%= email %></p>
          <br>
          <!-- If you have an article count in the session or database, you can display it here -->
          <p><%= count %></p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
<%
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the finally block
        try {
            if (rs != null) rs.close();
            if (rs1 != null) rs1.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>