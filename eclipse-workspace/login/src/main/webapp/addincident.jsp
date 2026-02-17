<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>Add Incident</h2>

Date: <input type="date" id="date"><br><br>

Description:<br>
<textarea id="description"></textarea><br><br>

Category:
<select id="category">
    <option>Network</option>
    <option>Software</option>
    <option>Hardware</option>
</select><br><br>

Severity:
<select id="severity">
    <option>Low</option>
    <option>Medium</option>
    <option>High</option>
</select><br><br>

<button onclick="addIncidentFromPage()">Add Incident</button>

<hr>

<h3>Added Incidents</h3>
<div id="incidentListArea"></div>


<script>

function addIncidentLocal() {

    let obj = {
        date: document.getElementById("date").value,
        description: document.getElementById("description").value,
        category: document.getElementById("category").value,
        severity: document.getElementById("severity").value,
        status: "Open"
    };

    // FIXED → Global function call
    window.addIncidentGlobal(obj);

    showIncidents();
}

function showIncidents() {

    
    let list = window.getIncidentsGlobal();

    let html = "<table border='1' cellpadding='5' cellspacing='0'>";
    html += "<tr><th>Date</th><th>Description</th><th>Category</th><th>Severity</th><th>Status</th></tr>";

    for (let i of list) {
        html += `
            <tr>
                <td>${i.date}</td>
                <td>${i.description}</td>
                <td>${i.category}</td>
                <td>${i.severity}</td>
                <td>${i.status}</td>
            </tr>`;
    }

    html += "</table>";

    document.getElementById("incidentListArea").innerHTML = html;
}

</script>
