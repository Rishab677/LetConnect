<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users - Let's Connect</title>
<style>
body {
	margin: 0;
}

.wrap {
	display: flex;
	min-height: 100vh;
}

.side {
	width: 220px;
	background: #151934;
	color: white;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 20px 15px;
}

.logo {
	font-size: 20px;
	font-weight: bold;
	color: #ae00ff;
	margin-bottom: 40px;
}

.nav a {
	display: block;
	color: white;
	text-decoration: none;
	padding: 12px 10px;
	border-radius: 5px;
	margin-bottom: 10px;
	transition: 0.3s;
}

.nav a.active {
	background: #ae00ff;
	color: white;
	font-weight: bold;
}
.nav a:hover {
	background: #292f53;
}
.logout {
	background: #ae00ff;
	border: none;
	color: white;
	padding: 10px;
	width: 100%;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}

.container {
	flex: 1;
	padding: 30px;
}

h2 {
	margin-bottom: 20px;
	color: #4b1c76;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #4b1c76;
	color: white;
}

.btn {
	padding: 5px 10px;
	border-radius: 4px;
	text-decoration: none;
	font-size: 14px;
}

.btn-red {
	background-color: #e74c3c;
	color: white;
}
</style>
</head>
<body>
	<div class="wrap">


		<div class="side">
			<div>
				<div class="logo">Let's Connect</div>
				<div class="nav">
					<a href="${pageContext.request.contextPath}/admin">Dashboard</a> <a
						href="${pageContext.request.contextPath}/UpdateProduct">Product</a>
					<a href="${pageContext.request.contextPath}/Orders">Orders</a> <a
						class="active"
						href="${pageContext.request.contextPath}/ManageUsers">Manage
						Users</a>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/LogoutServlet"
				method="post">
				<button class="logout">Log out</button>
			</form>
		</div>


		<div class="container">
			<h2>Manage Users</h2>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Gender</th>
						<th>Username</th>
						<th>Province</th>
						<th>City</th>
						<th>Role</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${user}">
						<tr>
							<td>${user.id}</td>
							<td>${user.firstName}</td>
							<td>${user.lastName}</td>
							<td>${user.email}</td>
							<td>${user.phone}</td>
							<td>${user.gender}</td>
							<td>${user.username}</td>
							<td>${user.province}</td>
							<td>${user.city}</td>
							<td>${user.role}</td>
							<td><a
								href="${pageContext.request.contextPath}/DeleteUser?id=${user.id}"
								class="btn btn-red"
								onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
