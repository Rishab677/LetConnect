<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body.darkmode {
	background-color: #111827;
	color: #f3f4f6;
}

.wrap {
	max-width: 1400px;
	margin: 0 auto;
	padding: 0 16px;
}

.head {
	width: 100%;
	border-bottom: 1px solid #e5e7eb;
	background-color: #4b1c76; 
}

.nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 80px;
	gap: 16px;
}

.leftnav {
	display: flex;
	align-items: center;
	gap: 24px;
	flex: 1;
}

.leftnav img {
	height: 32px;
	width: auto;
}

.brand {
	font-size: 20px;
	line-height: 1.2;
}

.brand span {
	color: #a6ff00;
	font-weight: normal;
}

.brand .connect {
	color: #000;
	font-weight: bold;
}

.menu {
	display: none;
}

@media (min-width: 768px) {
	.menu {
		display: flex;
		gap: 16px;
	}
}

.link {
	padding: 8px 16px;
	font-weight: 500;
	color: #fff;
	text-decoration: none;
	transition: color 0.2s;
}

.link:hover, .link.active {
	color: #000;
	font-weight: 600;
}

.searchbox {
	position: relative;
	max-width: 300px;
	width: 100%;
}

.sicon {
	position: absolute;
	left: 8px;
	top: 50%;
	transform: translateY(-50%);
	color: #9ca3af;
}

.input {
	width: 300px;
	padding: 8px 12px 8px 32px;
	border: 1px solid #d1d5db;
	border-radius: 6px;
	font-size: 14px;
}

.input:focus {
	outline: none;
	border-color: #3b82f6;
	box-shadow: 0 0 0 1px #3b82f6;
}

.secnav {
	display: none;
	margin-left: 130px;
}

@media (min-width: 768px) {
	.secnav {
		display: flex;
		gap: 16px;
	}
}

.icons {
	display: flex;
	align-items: center;
	gap: 32px;
}

.iconbtn {
	padding: 4px;
	background: none;
	border: none;
	cursor: pointer;
	color: #4b5563;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: color 0.2s;
}

.iconbtn:hover {
	color: #000;
}

.logout {
	background-color: #fce7f3;
	color: #4b5563;
	padding: 6px 16px;
	border-radius: 6px;
	font-size: 14px;
	font-weight: 500;
	border: none;
	cursor: pointer;
	transition: background-color 0.2s;
	margin-right: 30px;
}

.logout:hover {
	background-color: #fbcfe8;
}

.drop {
	position: relative;
}

.dropbtn {
	background: none;
	border: none;
	cursor: pointer;
	padding: 4px;
	display: flex;
	align-items: center;
}

.userimg {
	width: 35px;
	height: 35px;
}

.menuitems {
	display: none;
	position: absolute;
	right: 0;
	top: 100%;
	width: 120px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 6px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	list-style: none;
	padding: 8px 0;
	z-index: 1000;
}

.menuitems li {
	padding: 8px 16px;
}

.menuitems li a {
	text-decoration: none;
	color: #4b5563;
	font-size: 14px;
	display: block;
}

.menuitems li:hover {
	background-color: #f3f4f6;
}

.drop:hover .menuitems {
	display: block;
}

.modebtn {
	height: 20px;
	width: 20px;
	margin-right: 1px;
	background: none;
	border: none;
	color: #e5e7eb;
	opacity: 0;
	transition: opacity 0.3s;
}

.modebtn:hover {
	opacity: 1;
	color: #000;
	cursor: pointer;
}
</style>
</head>
<body>

	<header class="head">
		<div class="wrap">
			<div class="nav">
				<div class="leftnav">
					<a href="${pageContext.request.contextPath}/home">
						<img src="${pageContext.request.contextPath}/Resources/Image/login/Logo.jpg" alt="Logo" />
					</a>
					<div class="brand">
						<span>LET’S </span><br />
						<span style="color: #ffffff; font-weight: bold;">CONNECT</span>
					</div>
					<nav class="menu">
						<a href="${pageContext.request.contextPath}/home" class="link">Home</a>
						<a href="${pageContext.request.contextPath}/Productpagecontroller" class="link">Product</a>
					</nav>
					<div class="searchbox">
						<form action="${pageContext.request.contextPath}/Productpagecontroller" method="get">
							<div class="sicon">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      								<circle cx="11" cy="11" r="8"></circle>
     							 	<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
    							</svg>
							</div>
							<input type="text" name="searchQuery"
								placeholder="Search your product name for order"
								class="input" value="${param.searchQuery}" />
						</form>
					</div>
					<div class="secnav">
						<a href="${pageContext.request.contextPath}/Aboutus" class="link">AboutUs</a>
						<a href="${pageContext.request.contextPath}/ContactUs" class="link">ContactUs</a>
					</div>
					<div class="icons">
						<a href="${pageContext.request.contextPath}/cart" class="iconbtn" title="Cart" aria-label="Cart">
							<img src="${pageContext.request.contextPath}/Resources/Image/login/shopping-cart.png"
								alt="Cart" width="20" height="20" />
						</a>
						<div class="drop">
							<button class="dropbtn">
								<a href="${pageContext.request.contextPath}/profile">
									<img src="${pageContext.request.contextPath}/Resources/Image/login/user.png"
										alt="Profile" class="userimg" />
								</a>
							</button>
							<ul class="menuitems">
								<li><a href="${pageContext.request.contextPath}/profile">My Profile</a></li>
								<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

</body>
</html>
