const accountIcon = document.getElementById("account-icon");
const accountSlider = document.getElementById("account-slider");

accountIcon.addEventListener("click", () => {
    if (accountSlider.style.right === "0px") {
        accountSlider.style.right = "-250px";
    } else {
        accountSlider.style.right = "0px";
    }
});

function closeAccountSlider() {
    accountSlider.style.right = "-250px";
}

function toggleBold() {
    document.execCommand("bold");
}

function toggleItalic() {
    document.execCommand("italic");
}

function toggleUnderline() {
    document.execCommand("underline");
}

function alignLeft() {
    document.execCommand("justifyLeft");
}

function alignCenter() {
    document.execCommand("justifyCenter");
}

function alignRight() {
    document.execCommand("justifyRight");
}

function alignJustify() {
    document.execCommand("justifyFull");
}

function toggleBullets() {
    document.execCommand("insertUnorderedList");
}

const starButton = document.getElementById("star-button");
let isStarred = false;

function toggleStar() {
    isStarred = !isStarred;
    if (isStarred) {
        starButton.innerHTML = '<i class="fas fa-star"></i>';
    } else {
        starButton.innerHTML = '<i class="far fa-star"></i>';
    }
}

function updateLastModified() {
    const lastModified = new Date().toLocaleString();
    document.getElementById("last-modified").textContent = "Last Modified: " + lastModified;
}

// Function to delete the document (you can customize this)
function deleteDocument() {
    if (confirm("Are you sure you want to delete this document?")) {
        // Perform the deletion action here
        // For example, you can clear the title and text input fields
        document.getElementById("title-input").value = "";
        document.getElementById("text-input").value = "";
        // Clear the last modified date
        document.getElementById("last-modified").textContent = "Last Modified: N/A";
    }
}

// Function to save the document (you can customize this)
function saveDocument() {
    // Save the document's content
    // You can also update the last modified date here
    updateLastModified();
    // Perform other save actions
}

// Initialize the last modified date
updateLastModified();

let menuicn = document.querySelector(".menuicn");
let nav = document.querySelector(".navcontainer");

menuicn.addEventListener("click", () => {
	nav.classList.toggle("navclose");
})
