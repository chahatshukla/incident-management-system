<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<button class="theme-toggle" onclick="toggleTheme()">🌙 Dark Mode</button>

<div class="container1">
    <h1>Employee Registration</h1>
    
    <%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
    <p style="color:red; font-weight:bold; text-align:center;">
        <%= error %>
    </p>
<%
}
%>

    <form action="registerServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
<small id="passMsg" style="display:block; margin-top:5px;"></small><br>

    

        <button type="submit">Register</button>
    </form>

    <p><a href="login.jsp">Already registered? Login</a></p>
</div>

<script>

const passwordInput = document.getElementById("password");
const message = document.getElementById("passMsg");

passwordInput.addEventListener("input", function () {

    const value = passwordInput.value;

    const strongPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;

    if (value.length === 0) {
        message.textContent = "";
    }
    else if (!strongPattern.test(value)) {
        message.style.color = "red";
        message.textContent =
            "Password must be 8+ characters with uppercase, lowercase and number";
    }
    else {
        message.style.color = "green";
        message.textContent = "Strong Password ✔";
    }
});

function toggleTheme() {
    document.body.classList.toggle('dark');
}
</script>

</body>
</html>
