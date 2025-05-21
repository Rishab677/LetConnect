<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - Lets Connect</title>
<style>
body {
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
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
	top: 0;
	left: 0;
	z-index: 1;
	opacity: 0.5;
}

.body-container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    width: 100%;
}

.content-section {
    width: 45%;
    padding: 10px 20px;
    
    text-align: justify;
}

.content-section h2, .content-section h3 {
    color: #4b1c76;
}

.content-section p {
    margin-bottom: 15px;
}

.img-container {
    display: flex;
    margin-top: 20px;
    justify-content: flex-start;
    align-items: stretch;
    width: 45%;
}

.img-item {
    flex: 1;
    object-fit: cover;
    height: 100%;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/Pages/Header.jsp" />

	<div class="banner">
		<img src="${pageContext.request.contextPath}/Resources/Image/login/About.jpg" alt="About Banner">
	</div>


	<div class="body-container">
		<div class="container content-section">
			<h2>About Let'sConnectsFabs</h2>

			<p><strong style="color: #4b1c76;">Your Trusted Mobile Shop</strong><br>
			Welcome to <strong style="color: #4b1c76;">Let's Connect</strong>, where cutting-edge technology meets exceptional service. We're dedicated to providing you with the latest mobile devices, accessories, and unparalleled customer satisfaction. With years of experience in the industry, we've established ourselves as a trusted destination for all your mobile needs.</p>

			<p><strong style="color: #4b1c76;">Our Mission</strong><br>
			At <strong style="color: #4b1c76;">Let's Connect</strong>, our mission is simple: to connect you with the best mobile solutions that enhance your lifestyle. We strive to stay ahead of the curve, offering a diverse range of products from top brands to ensure you have access to the latest innovations.</p>

			<p><strong style="color: #4b1c76;">Why Choose Us?</strong><br>
			Expertise: Our team consists of knowledgeable professionals who are passionate about technology. Whether you're a tech enthusiast or a first-time buyer, we're here to provide expert guidance and assistance every step of the way.</p>

			<p><strong style="color: #4b1c76;">Quality Assurance:</strong><br>
			We understand the importance of quality when it comes to mobile devices. That's why we only source products from reputable manufacturers, ensuring you receive top-notch quality with every purchase.</p>

			<p><strong style="color: #4b1c76;">Wide Selection:</strong><br>
			From flagship smartphones to budget-friendly options, we have something for everyone. Explore our extensive collection of devices, accessories, and gadgets to find the perfect fit for your needs and preferences.</p>

			<p><strong style="color: #4b1c76;">Exceptional Service:</strong><br>
			Your satisfaction is our priority. We're committed to delivering an exceptional shopping experience, from personalized recommendations to timely support services. Count on us to go above and beyond to meet your expectations.</p>

			<p><strong style="color: #4b1c76;">Convenience:</strong><br>
			Shopping for mobile devices should be convenient and hassle-free. That's why we offer online ordering options, fast shipping, and flexible payment methods, so you can shop with ease from the comfort of your home or on the go.</p>

			<p><strong style="color: #4b1c76;">Our Commitment to You</strong><br>
			At <strong style="color: #4b1c76;">Lets Connect</strong>, we're more than just a retailer – we’re your partners in technology. Whether you're upgrading your device, accessorizing your smartphone, or seeking expert advice, you can trust us to be there every step of the way.<br>
			Join our community of satisfied customers and experience the difference with <strong style="color: #4b1c76;">Let's Connect</strong> today!</p>
		</div>

	
		<div class="img-container">
			<img src="${pageContext.request.contextPath}/Resources/Image/login/iamge1.jpeg" alt="Image 1" class="img-item"> 
		
		</div>
	</div>

	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />

</body>
</html>
