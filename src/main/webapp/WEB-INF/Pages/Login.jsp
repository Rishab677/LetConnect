<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Css/Login.css" />
</head>
<body>
	<div class="maincontainer">
		<div class="loginbox">
			<div class="image">
				<img
					src="${pageContext.request.contextPath}/Resources/Image/login/register.png"
					alt="Register Image">
			</div>
			<div class="Logindetails">
				<h1>Login</h1>

				

				<form method="post"
					action="${pageContext.request.contextPath}/login">
					<div class="Logindata">
						<label for="username">Username</label> <input type="text"
							id="username" name="username" placeholder="Enter your username"
							required> <label for="password">Password:</label> <input
							type="password" id="password" name="password"
							placeholder="Enter your password" required>
					</div>

					<a href="${pageContext.request.contextPath}/forgot-password"
						class="forgot">Forgot Password?</a> <input type="submit"
						value="Submit">

					<p class="register">
						Don’t have an account? <a
							href="${pageContext.request.contextPath}/registration">Register
							Now</a>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
