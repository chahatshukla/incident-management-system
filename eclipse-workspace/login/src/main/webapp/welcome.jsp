<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

<%
    HttpSession session1 = request.getSession(false);

    // No session → login
    if (session1 == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String role = (String) session1.getAttribute("role");
    String username = (String) session1.getAttribute("username");

    // Admin ko yahan allow nahi
    if ("ADMIN".equals(role)) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>

<div class="container">
    <h1>Welcome <%= username %>!</h1>

    <h3>Incident Management Dashboard</h3>

    <p>
        If you are facing any technical issues such as Network, Software, 
or Hardware problems, you can quickly report them here. <a href="logoutServlet">LOGOUT</a> securely.
    </p>

    <br><br>

    <a href="dashboard.jsp">
        <button class="incident-btn">Add New Incident</button>
    </a>
</div>

<script>
function logoutAllTabs() {
    localStorage.setItem('logout', Date.now());
    setTimeout(() => localStorage.removeItem('logout'), 1000);
    window.location.href = 'logoutServlet';
}

window.addEventListener('storage', function(event) {
    if (event.key === 'logout') {
        window.location.href = 'login.jsp';
    }
});
</script>

</body>
</html>
