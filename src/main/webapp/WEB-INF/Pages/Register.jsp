<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<style>
/* Basic reset and structure */
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
}

.container {
	max-width: 1350px;
	margin: 40px auto;
	padding: 20px;
}

.box {
	display: flex;
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.image {
	flex: 1;
	background-color: #eee;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 20px;
}

.image img {
	max-width: 100%;
	height: auto;
	object-fit: contain;
}

.content {
	flex: 2;
	padding: 40px;
}

.content h1 {
	margin-bottom: 25px;
	font-size: 28px;
	color: #333;
	text-align: center;
}

.formDetails {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px 30px;
}

.field {
	display: flex;
	flex-direction: column;
}

.field label {
	margin-bottom: 6px;
	font-weight: 500;
	color: #444;
}

.field input, .field select {
	padding: 10px 12px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
	width: 100%;
	box-sizing: border-box;
}

.btnregister {
	margin-top: 30px;
	width: 100%;
	padding: 12px;
	font-size: 16px;
	background-color: #5a2ea6;
	color: #fff;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btnregister:hover {
	background-color: #47258a;
}

.login {
	margin-top: 15px;
	text-align: center;
	font-size: 14px;
}

.login a {
	color: #5a2ea6;
	text-decoration: none;
	font-weight: bold;
}

.login a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<div class="box">
			<div class="image">
				<img
					src="${pageContext.request.contextPath}/Resources/Image/login/register.png"
					alt="Register Image">
			</div>
			<div class="content">
				<h1>Registration</h1>

				<%
				if (request.getAttribute("errorMessage") != null) {
				%>
				<p style="color: red;"><%=request.getAttribute("errorMessage")%></p>
				<%
				}
				%>

				<form action="registration" method="post"
					enctype="multipart/form-data">

					<div class="formDetails">
						<div class="field">
							<label for="firstName">First Name</label> <input type="text"
								id="firstName" name="firstName"
								placeholder="Enter your first name"
								value="<%=request.getAttribute("firstName") != null ? request.getAttribute("firstName") : ""%>"
								required>
						</div>

						<div class="field">
							<label for="lastName">Last Name</label> <input type="text"
								id="lastName" name="lastName" placeholder="Enter your last name"
								value="<%=request.getAttribute("lastName") != null ? request.getAttribute("lastName") : ""%>"
								required>
						</div>

						<div class="field">
							<label for="email">Email</label> <input type="email" id="email"
								name="email" placeholder="Enter your email"
								value="<%=request.getAttribute("email") != null ? request.getAttribute("email") : ""%>"
								required>
						</div>

						<div class="field">
							<label for="phone">Phone Number</label> <input type="text"
								id="phone" name="phone" placeholder="Enter your number"
								value="<%=request.getAttribute("phone") != null ? request.getAttribute("phone") : ""%>"
								required>
						</div>

						<div class="field">
							<label for="gender">Gender</label> <select id="gender"
								name="gender" required>
								<option value=""
									<%=request.getAttribute("gender") == null ? "selected" : ""%>>--
									Select Gender --</option>
								<option value="Male"
									<%="Male".equals(request.getAttribute("gender")) ? "selected" : ""%>>Male</option>
								<option value="Female"
									<%="Female".equals(request.getAttribute("gender")) ? "selected" : ""%>>Female</option>
							</select>
						</div>

						<div class="field">
							<label for="username">Username</label> <input type="text"
								id="username" name="username" placeholder="Enter your username"
								value="<%=request.getAttribute("username") != null ? request.getAttribute("username") : ""%>"
								required>
						</div>

						<div class="field">
							<label for="province">Province</label> <input type="text"
								id="province" name="province" placeholder="Enter your province"
								value="<%=request.getAttribute("province") != null ? request.getAttribute("province") : ""%>"
								required>
						</div>

						<div class="field">
							<label for="city">City</label> <input type="text" id="city"
								name="city" placeholder="Enter your city"
								value="<%=request.getAttribute("city") != null ? request.getAttribute("city") : ""%>"
								required>
						</div>

						<div class="field">
							<label for="password">Password</label> <input type="password"
								id="password" name="password" placeholder="Enter your password"
								required>
						</div>

						<div class="field">
							<label for="confirmPassword">Confirm Password</label> <input
								type="password" id="confirmPassword" name="confirmPassword"
								placeholder="Confirm your password" required>
						</div>

						<div class="field">
							<label for="ProfilePhoto">Profile Photo</label> <input
								type="file" id="ProfilePhoto" name="ProfilePhoto"
								accept="image/*">

						</div>

						<input type="submit" value="Register" class="btnregister">

						<p class="login">
							Already have an account? <a
								href="${pageContext.request.contextPath}/login">Login Now</a>
						</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>