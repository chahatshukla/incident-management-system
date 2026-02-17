<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assign Incident</title>

<style>

/* Page Layout */
body{
    font-family: "Segoe UI", Arial;
}

.assign-box{
    width: 500px;
}

input, select{
    width:100%;
    padding:8px;
    margin-top:5px;
    margin-bottom:15px;
    border:1px solid #ccc;
    border-radius:5px;
    box-sizing:border-box;
}


button{
    background:#1abc9c;
    color:white;
    border:none;
    padding:10px 18px;
    border-radius:6px;
    cursor:pointer;
}

button:hover{
    background:#16a085;
}

table{
    margin-top:25px;
    width:100%;
}

</style>

<script>

let assignments = [];


window.onload = function(){

    let today = new Date().toISOString().split("T")[0];

    let dateInput = document.getElementById("assignDate");

    dateInput.min = today;
    dateInput.max = today;
};



function assignIncident(){

    let id = document.getElementById("incidentId").value;
    let category = document.getElementById("category").value;
    let emp = document.getElementById("employee").value;
    let priority = document.getElementById("priority").value;
    let date = document.getElementById("assignDate").value;

    if(id=="" || emp=="Select Employee"){
        alert("Please fill all fields");
        return;
    }

    let obj = {
        id:id,
        category:category,
        employee:emp,
        priority:priority,
        date:date,
        status:"Assigned"
    };

    assignments.push(obj);

    showAssignments();
}


/* Show Table */
function showAssignments(){

    let html = `
    <tr>
        <th>Incident ID</th>
        <th>Category</th>
        <th>Assigned To</th>
        <th>Priority</th>
        <th>Assign Date</th>
        <th>Status</th>
    </tr>`;

    for(let a of assignments){

        html += `
        <tr>
            <td>${a.id}</td>
            <td>${a.category}</td>
            <td>${a.employee}</td>
            <td>${a.priority}</td>
            <td>${a.date}</td>
            <td>${a.status}</td>
        </tr>`;
    }

    document.getElementById("assignTable").innerHTML = html;
}

</script>

</head>

<body>

<div class="assign-box">

<h2>Assign Incident</h2>

<label>Incident ID:</label>
<input type="text" id="incidentId" placeholder="Enter Incident ID">


<label>Category:</label>
<select id="category">
    <option>Network</option>
    <option>Software</option>
    <option>Hardware</option>
</select>


<label>Assign To Employee:</label>
<select id="employee">
    <option>Select Employee</option>
    <option>Rahul Sharma</option>
    <option>Priya Patel</option>
    <option>Rohan Mehta</option>
</select>


<label>Priority:</label>
<select id="priority">
    <option>Low</option>
    <option>Medium</option>
    <option>High</option>
</select>


<label>Assign Date:</label>
<input type="date" id="assignDate">


<button onclick="assignIncident()">Assign Incident</button>

</div>

<hr>

<h3>Assigned Incidents</h3>

<table border="1" cellpadding="10" id="assignTable">
<tr>
    <th>Incident ID</th>
    <th>Category</th>
    <th>Assigned To</th>
    <th>Priority</th>
    <th>Assign Date</th>
    <th>Status</th>
</tr>
</table>

</body>
</html>
