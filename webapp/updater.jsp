<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<%
    // Retrieve data from session attributes
    HttpSession session1 = request.getSession();
    String articleTitle = (String) session1.getAttribute("articleTitle");
    String content = (String) session1.getAttribute("content");

    // Your existing HTML with JSP to fill in the retrieved data
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Text Editor</title>
    <link rel="stylesheet" href="editor_styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <script src="editor.js"></script>
    <script > 
        function toggleItalic() {
    const textarea = document.getElementById('text-input');
    const selection = window.getSelection();
    
    if (selection.rangeCount > 0) {
        const textareaContent = textarea.value;
        const selectedIndex = textareaContent.italicText(selection.value);
        alert(selectedIndex);
        const italicText = '<i>' + selectedText + '</i>';
        alert(selectedIndex);
    }
}

    </script>
</head>
<body>
	<input type="hidden" id= "author" value=""/>
    <div id="editor">
        <span id="account-icon">&#9776;</span>
         <h1 id="title-input"><%= articleTitle %></h1>
         <span id="last-modified">Last Modified: 2023-10-29</span>
        <span id="delete-icon" onclick="deleteDocument()"><b>&#128465;</b></span>
        <div id="format-options">
            <div id="formatting-options">
                <button onclick="toggleBold()"><i class="fas fa-bold"></i></button>
                <button onclick="toggleItalic()"><i class="fas fa-italic"></i></button>
                <button onclick="toggleUnderline()"><i class="fas fa-underline"></i></button>
            </div>
            <div id="font-size-options">
                <button onclick="decreaseFontSize()"><i class="fas fa-caret-down"></i></button>
                <span id="current-font-size">12</span>
                <button onclick="increaseFontSize()"><i class="fas fa-caret-up"></i></button>
            </div>
            <div id="font-family-select">
                <select id="font-family" onchange="changeFontFamily()">
                    <option value="Arial, sans-serif">Arial</option>
                    <option value="Times New Roman, Times, serif">Times New Roman</option>
                    <option value="Courier New, Courier, monospace">Courier New</option>
                    <option value="Georgia, serif">Georgia</option>
                    <option value="Verdana, Geneva, sans-serif">Verdana</option>
                </select>
            </div>
            <div id="alignment-options">
                <button onclick="alignLeft()"><i class="fas fa-align-left"></i></button>
                <button onclick="alignCenter()"><i class="fas fa-align-center"></i></button>
                <button onclick="alignRight()"><i class="fas fa-align-right"></i></button>
                <button onclick="alignJustify()"><i class="fas fa-align-justify"></i></button>
            </div>
            <button onclick="toggleBullets()"><i class="fas fa-list-ul"></i></button>
            <button id="star-button" onclick="toggleStar()"><i class="far fa-star"></i></button>
            <div class="voice-input-container" onclick="startVoiceInput()">
                <i class="fas fa-microphone"></i>
            </div>
        </div>
    <div>
        <textarea id="text-input"><%= content %></textarea>
        <button id="save-button" type="button" onclick="add()">Save</button>
    </div>
    </div>
    <script>
    	function add() {
            const title = document.getElementById('title-input').innerText;
            const content = document.getElementById('text-input').value;

            const xhr = new XMLHttpRequest();
            const url = 'updator.jsp';
            const params = 'title-input=' + title + '&text-input=' + content;
            xhr.open('POST', url, true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        console.log('Data saved successfully');
                        window.location.href = 'dashboard.html';
                    } else {
                        console.error('Error occurred while saving data');
                    }
                }
            };

            xhr.send(params);
        }
    </script>
    
    <div id="account-slider">
        <span id="close-slider" onclick="closeAccountSlider()">&times;</span>
        <div id="profile-info">
            <div id="profile-pic-container">
                <img src="https://www.techspot.com/images2/trivia/bigimage/2017/2017-03-19-image-46.jpg" alt="Profile Picture" id="profile-pic">
            </div>
            <div id="profile-details">
                <h2>Your Name</h2>
                <p>your.email@example.com</p>
            </div>
        </div>
        <a href="dashboard.html" id="dashboard-link">Go to Dashboard</a>
        
    </div>
</body>
</html>
