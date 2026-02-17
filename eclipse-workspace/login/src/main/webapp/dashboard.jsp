<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Incident Dashboard</title>
<link rel="stylesheet" href="incident.css">



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



<script>

let incidents = [];


function addIncidentFromPage() {

    let date = document.getElementById("date").value;
    let description = document.getElementById("description").value;
    let category = document.getElementById("category").value;
    let severity = document.getElementById("severity").value;

    let obj = {
        date: date,
        description: description,
        category: category,
        severity: severity,
        status: "Open"
    };

    incidents.push(obj);

    showIncidentTable(); 
}


function showIncidentTable() {

    let tableArea = document.getElementById("incidentListArea");
    if (!tableArea) return; // if list area not present

    let html = "<table border='1' cellpadding='5'><tr>";
    html += "<th>Date</th><th>Description</th><th>Category</th><th>Severity</th><th>Status</th></tr>";

    for (let i of incidents) {
        html += "<tr>";
        html += "<td>" + i.date + "</td>";
        html += "<td>" + i.description + "</td>";
        html += "<td>" + i.category + "</td>";
        html += "<td>" + i.severity + "</td>";
        html += "<td>" + i.status + "</td>";
        html += "</tr>";
    }

    html += "</table>";

    tableArea.innerHTML = html;
}


function loadPage(pageName) {
    $("#content").load(pageName, function() {
        showIncidentTable();  
    });
}


function updateIncidentFromPage() {

    let index = document.getElementById("incidentIndex").value;
    let newStatus = document.getElementById("newStatus").value;

    index = parseInt(index) - 1; // incidents 0 se start

    if (index < 0 || index >= incidents.length) {
        alert("Invalid Incident Number!");
        return;
    }

    
    incidents[index].status = newStatus;

    
    showIncidentTable();

    alert("Incident Updated Successfully!");
}


</script>

</head>
<body>

<h2 style="background:#1abc9c; color:white; padding:10px;">Incident Module</h2>

<div id="menu">
    <div onclick="loadPage('addincident.jsp')">Add Incident</div>

    <div onclick="loadPage('reopenclose.jsp')">Reopen/Close</div>
    
</div>

<div id="content">
    <h3>Welcome! Select a menu option.</h3>
</div>

</body>
</html>
