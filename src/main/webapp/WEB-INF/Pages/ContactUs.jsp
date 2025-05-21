<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - Lets Connect</title>
<style>
body {
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;

	color: #1a1a1a;
}

a {
	text-decoration: none;
	color: #ff0066;
}

.banner {
	position: relative;
	height: 500px;
	overflow: hidden;
	text-align: center;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
}

.banner img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
}

.contact-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	gap: 40px;
	padding: 60px 80px;
	flex-direction: row;
	align-items: center;
	width: 100%; /* Changed from 50% to 100% to avoid cramping */
	box-sizing: border-box;
}

.left-side {
	flex: 1;
	width: 85%%;
}

.right-side {
	background-color: #fff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	flex: 1;
	width: 80%;
}

.left-side h2 {
	color: #4b1c76;
	margin-bottom: 10px;
}

.left-side p {
	font-size: 16px;
	line-height: 1.6;
	margin-bottom: 30px;
}

.contact-info {
	margin-top: 20px;
}

.contact-info h3 {
	color: #4b1c76;
	margin-bottom: 10px;
}

.contact-info p {
	display: flex;
	margin: 10px 0;
	font-weight: 600;
}

.contact-info img {
	width: 20px;
	margin-right: 10px;
}

.contact-form h2 {
	font-size: 24px;
	color: #4b1c76;
	margin-bottom: 20px;
}

.contact-form input {
	width: 80%;
	padding: 12px 15px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 14px;
}

.contact-form textarea {
	width: 80%;
	padding: 12px 15px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 14px;
}

.contact-form button {
	background-color: #4b1c76;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	transition: 0.3s ease;
	border: none;
	padding: 12px 20px;
	border-radius: 8px;
	width: 20%;
}

.contact-form button:hover {
	background-color: #2f0a52;
}

.social-icons {
	margin-top: 20px;
}

.social-icons a {
	margin-right: 15px;
	color: #ff0066;
	font-size: 20px;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/Pages/Header.jsp" />

	<div class="banner">
		<img
			src="${pageContext.request.contextPath}/Resources/Image/login/contact.jpg"
			alt="Contact Us Banner">
	</div>

	<div class="contact-container">

		<div class="left-side">
			<h2>Get In Touch</h2>
			<p>At the same time, the fact that we are wholly owned and
				totally independent from manufacturer and other group control gives
				you confidence that we will only recommend what is right for you.</p>

			<div class="contact-info">
				<h3>Connect With Us</h3>
				<p>
					<img
						src="${pageContext.request.contextPath}/Resources/Image/login/phone.png"
						alt="Phone">9842057605
				</p>
				<p>
					<img
						src="${pageContext.request.contextPath}/Resources/Image/login/location.png"
						alt="Location">Kathmandu, Old-Baneswor, Nepal
				</p>
				<p>
					<img
						src="${pageContext.request.contextPath}/Resources/Image/login/email.png"
						alt="Email">letsconnect@gmail.com
				</p>
			</div>




			<div class="right-side">
				<form class="contact-form">
					<h2>Contact Form</h2>
					<input type="text" id="firstName" name="firstName"
						placeholder="First Name" required> <input type="text"
						id="lastName" name="lastName" placeholder="Last Name" required>
					<input type="email" id="email" name="email"
						placeholder="Email address" required> <input type="tel"
						id="phoneNumber" name="phoneNumber" placeholder="Phone Number"
						required>
					<textarea id="message" name="message" rows="4"
						placeholder="Message" required></textarea>
					<button type="submit">Send Enquiry</button>
				</form>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />



</body>
</html>