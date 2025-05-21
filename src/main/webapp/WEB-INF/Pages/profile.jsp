<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<style>
body {
	background: #f5f5f5;
	margin: 0;
	padding: 0;
}

main {
	max-width: 900px;
	margin: 50px auto;
	display: flex;
	gap: 30px;
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.left {
	flex: 1;
	display: flex;
	align-items: center;
	justify-content: center;
}

.left img {
	width: 180px;
	height: 180px;
	border-radius: 10px;
	object-fit: cover;
}

.right {
	flex: 2;
}

.right h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

form {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 12px;
}

form input, form select {
	width: 90%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 13px;
}

.buttons {
	grid-column: span 2;
	text-align: center;
	margin-top: 10px;
}

.buttons button {
	background: #4b1c76;
	color: white;
	border: none;
	padding: 8px 18px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
	margin: 0 8px;
}

.buttons button:hover {
	background: #37155a;
}
</style>


</head>
<body>

	<jsp:include page="/WEB-INF/Pages/Header.jsp" />

	<main>
		<div class="left">
			<c:choose>
				<c:when test="${not empty user.profilePhoto}">
					<img
						src="${pageContext.request.contextPath}/Resources/Image/profile/${user.profilePhoto}"
						alt="Profile Photo" />
				</c:when>
				
			</c:choose>
		</div>

		<div class="right">
			<h2>User Profile</h2>
			<form action="updateProfile" method="post">
				<div>
					<label>First Name</label> <input type="text" name="firstName"
						value="${user.firstName}" readonly />
				</div>
				<div>
					<label>Last Name</label> <input type="text" name="lastName"
						value="${user.lastName}" readonly />
				</div>
				<div>
					<label>Email</label> <input type="email" name="email"
						value="${user.email}" readonly />
				</div>
				<div>
					<label>Phone Number</label> <input type="text" name="phone"
						value="${user.phone}" readonly />
				</div>
				<div>
					<label>Gender</label> <select name="gender" disabled>
						<option value="Male"
							<c:if test="${user.gender == 'Male'}">selected</c:if>>Male</option>
						<option value="Female"
							<c:if test="${user.gender == 'Female'}">selected</c:if>>Female</option>
						<option value="Other"
							<c:if test="${user.gender == 'Other'}">selected</c:if>>Other</option>
					</select>
				</div>
				<div>
					<label>Username</label> <input type="text" name="username"
						value="${user.username}" readonly />
				</div>
				<div>
					<label>Province</label> <input type="text" name="province"
						value="${user.province}" readonly />
				</div>
				<div>
					<label>City</label> <input type="text" name="city"
						value="${user.city}" readonly />
				</div>
				<div class="buttons">
					<button type="button" >Edit</button>
					<form action="${pageContext.request.contextPath}/logout"
						method="post">
						<button type="submit">Logout</button>
				</div>
			</form>
		</div>
	</main>

	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />

</body>
</html>
