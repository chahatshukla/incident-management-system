<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Incident</title>

<style>


body{
    font-family: "Segoe UI", Arial;
}


.update-box{
    width: 450px;
}


label{
    font-weight:600;
}


input, select, textarea{
    width:100%;
    padding:8px;
    margin-top:5px;
    margin-bottom:15px;
    border:1px solid #ccc;
    border-radius:5px;
    box-sizing:border-box;
}

textarea{
    height:70px;
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
    border-collapse:collapse;
}

th,td{
    border:1px solid #ccc;
    padding:8px;
    text-align:center;
}

th{
    background:#f2f2f2;
}

</style>

<script>

let updates = [];

function updateIncident(){

    let id = document.getElementById("incidentId").value;
    let category = document.getElementById("category").value;
    let emp = document.getElementById("employee").value;
    let status = document.getElementById("status").value;
    let remarks = document.getElementById("remarks").value;

    if(id==""){
        alert("Enter Incident ID");
        return;
    }

    let obj = {
        id:id,
        category:category,
        employee:emp,
        status:status,
        remarks:remarks
    };

    updates.push(obj);

    showUpdates();
}

function showUpdates(){

    let html = `
    <tr>
        <th>ID</th>
        <th>Category</th>
        <th>Assigned To</th>
        <th>Status</th>
        <th>Remarks</th>
    </tr>`;

    for(let u of updates){

        html += `
        <tr>
            <td>${u.id}</td>
            <td>${u.category}</td>
            <td>${u.employee}</td>
            <td>${u.status}</td>
            <td>${u.remarks}</td>
        </tr>`;
    }

    document.getElementById("updateTable").innerHTML = html;
}

</script>

</head>

<body>

<div class="update-box">

<h2>Update Incident Status</h2>

<label>Incident ID:</label>
<input type="number" id="incidentId">


<label>Category:</label>
<select id="category">
    <option>Network</option>
    <option>Software</option>
    <option>Hardware</option>
</select>


<label>Assigned To:</label>
<select id="employee">
    <option>Rahul Sharma</option>
    <option>Priya Patel</option>
    <option>Rohan Mehta</option>
</select>


<label>Status:</label>
<select id="status">
    <option>Open</option>
    <option>In-Progress</option>
    <option>Resolved</option>
    <option>Closed</option>
</select>


<label>Remarks:</label>
<textarea id="remarks"></textarea>


<button onclick="updateIncident()">Update Status</button>

</div>

<hr>

<h3>Updated Incident List</h3>

<table id="updateTable">
<tr>
    <th>ID</th>
    <th>Category</th>
    <th>Assigned To</th>
    <th>Status</th>
    <th>Remarks</th>
</tr>
</table>

</body>
</html>
