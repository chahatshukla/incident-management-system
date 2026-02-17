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

    <form action="registerServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

    

        <button type="submit">Register</button>
    </form>

    <p><a href="login.jsp">Already registered? Login</a></p>
</div>

<script>
function toggleTheme() {
    document.body.classList.toggle('dark');
}
</script>

</body>
</html>
