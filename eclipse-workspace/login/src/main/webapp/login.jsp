<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel= "stylesheet" type="text/css" href="style.css">
</head>
<body>
<button class="theme-toggle" onclick="toggleTheme()">🌙 Dark Mode</button>

<div class = "container1">
<h1>Login</h1>
<form action="loginServlet" method="post">
<label for = "username"> Username:</label>
<input type="text" id="username" name="username"required><br>
<label for= "password">Password:</label>
<input type="password" id="password" name="password"required><br>
<button type="submit" name="loginType" value="ADMIN">Admin Login</button>
<button type="submit" name="loginType" value="EMPLOYEE">Employee Login</button>

</form>
<p><a href= "index.jsp"> back to home</a></p>

<% String error = request.getParameter("error");
if(error != null && error.equals("1")){ %>
<p style = "color: red;"> Invalid username or password. please try again
<% } %>

<% String rs = request.getParameter("registration");
if(rs != null && rs.equals("success")){ %>
<p style = "color: blue;"> your registration is successful. please login </p>
<% } %>
</div>
<script>
  function toggleTheme() {
    document.body.classList.toggle('dark');
  }
</script>

</body>
</html>