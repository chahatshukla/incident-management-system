<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>index page</title>  
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

  <div class="container">
    <h1>Welcome to this page</h1>
    <h3>This project has been created by Chahat Shukla</h3>
    <p>Feel free to <span class="emoji">👍</span> login or <span class="emoji">🙌</span> register to get started</p>

    
    <button class="theme-toggle" onclick="toggleTheme()">🌙Dark Mode</button>

    <div class="links">
      <a href="login.jsp">Login</a>
      <a href="register.jsp">Register</a>
    </div>
  </div>

  <script>
    function toggleTheme() {
      document.body.classList.toggle('dark');
    }
  </script>

</body>
</html>
