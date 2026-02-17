<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="adminDashboard.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
function loadPage(page) {
    $("#content").load(page);
}
</script>
</head>

<body>

<%
    HttpSession session1 = request.getSession(false);

    if (session1 == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String role = (String) session1.getAttribute("role");

    // Employee ko admin dashboard allow nahi
    if (!"ADMIN".equals(role)) {
        response.sendRedirect("welcome.jsp");
        return;
    }
%>

<div class="header">Admin Incident Dashboard</div>

<div id="menu">
    <div onclick="loadPage('assignincident.jsp')">Assign Incident</div>
    <div onclick="loadPage('updateincident.jsp')">Update Incident</div>
    <div onclick="loadPage('reopenclose.jsp')">List & Filter</div>
    <div onclick="loadPage('listincident.jsp')">Reopen / Close</div>
    <div onclick="window.location.href='logoutServlet'">Logout</div>
</div>

<div id="content">
    <h3>Welcome Admin 👋</h3>
    <p>Select an option from the menu.</p>
</div>

</body>
</html>
