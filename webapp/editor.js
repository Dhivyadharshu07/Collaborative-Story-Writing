// script.js
function toggleBold() {
        const textarea = document.getElementById('text-input');
        
        // Get the selection range
        const selection = window.getSelection();
        
        if (selection.rangeCount > 0) {
            const range = selection.getRangeAt(0);
    
            // Get the content of the textarea
            const textareaContent = textarea.value;
    
            // Get the selected text
            const selectedText = textareaContent.substring(range.startOffset, range.endOffset);
    
            // Wrap the selected text with <b> tags
            const boldText = '<b>' + selectedText + '</b>';
    
            // Replace the selected text in the textarea content
            const newTextContent = textareaContent.substring(0, range.startOffset) +
                                  boldText +
                                  textareaContent.substring(range.endOffset);
    
            // Set the new content to the textarea
            textarea.value = newTextContent;
        }
    }
    

// Function to decrease font size
function decreaseFontSize() {
    var currentSize = parseInt(window.getComputedStyle(document.getElementById('text-input'), null).getPropertyValue('font-size'));
    if ((currentSize - 2)>7){
    document.getElementById('text-input').style.fontSize = (currentSize - 2) + 'px';
    document.getElementById('current-font-size').innerHTML=(currentSize - 2);
    }
}

// Function to increase font size
function increaseFontSize() {
    var currentSize = parseInt(window.getComputedStyle(document.getElementById('text-input'), null).getPropertyValue('font-size'));
    if ((currentSize + 2)<48){
    document.getElementById('text-input').style.fontSize = (currentSize + 2) + 'px';
    document.getElementById('current-font-size').innerHTML=(currentSize + 2);
    }
}

// Function to change font family
function changeFontFamily() {
    var fontFamily = document.getElementById('font-family').value;
    document.getElementById('text-input').style.fontFamily = fontFamily;
}

// Function to align text left
function alignLeft() {
    document.getElementById('text-input').style.textAlign = 'left';
}

// Function to align text center
function alignCenter() {
    document.getElementById('text-input').style.textAlign = 'center';
}

// Function to align text right
function alignRight() {
    document.getElementById('text-input').style.textAlign = 'right';
}

// Function to justify text
function alignJustify() {
    document.getElementById('text-input').style.textAlign = 'justify';
}

// Function to toggle bullets
function toggleBullets() {
    document.execCommand("insertUnorderedList", false, null);
}

// Function to toggle star
function toggleStar() {
    var starButton = document.getElementById('star-button');
    starButton.classList.toggle('active');
}

// Function to delete document
function deleteDocument() {
    // Add your delete document logic here
    console.log("Document deleted!");
}

// Function to start voice input
function startVoiceInput() {
    // Add your voice input logic here
    console.log("Voice input started!");
}

// Function to close account slider
function closeAccountSlider() {
    // Add your close account slider logic here
    console.log("Account slider closed!");
}
