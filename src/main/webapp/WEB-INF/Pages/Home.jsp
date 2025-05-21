<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
body {
	margin: 0;
	padding: 0;
	color: #333;
	background-color: #f9f9f9;
}

a {
	text-decoration: none;
	color: inherit;
}

.slider {
	margin-top: 20px;
	position: relative;
	width: 100%;
	height: 500px;
	max-width: 1200px;
	margin: auto;
	overflow: hidden;
	position: relative;
}

.slider img {
	margin-top: 10px;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.slider img.slide {
	display: none;
}

.slider button {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	padding: 10px;
	cursor: pointer;
	font-size: 24px;
}

.slider button.prev {
	left: 10px;
}

.slider button.next {
	right: 10px;
}

.categories-section, .brands-section {
	text-align: center;
	padding: 50px 20px;
}

.categories-section h2, .brands-section h2 {
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 10px;
}

.underline, .brand-underline {
	width: 60px;
	height: 3px;
	background-color: black;
	margin: 0 auto 30px auto;
}

.categories-grid, .brands-grid {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 30px;
}

.brands-grid {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 80px 70px; /* row-gap 50px, column-gap 70px */
	padding-top: 30px;
}

.category-card, .brand-card {
	width: 150px;
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
	transition: transform 0.2s;
}

.category-card:hover, .brand-card:hover {
	transform: translateY(-5px);
}

.category-card img, .brand-card img {
	width: 100%;
	height: auto;
}

.category-card p, .brand-card p {
	margin-top: 10px;
	font-weight: bold;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/Pages/Header.jsp" />

	<main>


		<div class="slider">
			<img class="slide"
				src="https://cdn.grabon.in/gograbon/images/web-images/uploads/1618571140235/mobile-offers.jpg"
				alt="Slide 1"> <img class="slide"
				src="https://i0.wp.com/www.smartprix.com/bytes/wp-content/uploads/2020/03/fab-blog.png?fit=1200%2C630&ssl=1"
				alt="Slide 2"> <img class="slide"
				src="${pageContext.request.contextPath}/Resources/Image/login/hq720.jpg"
				alt="Slide 3">
			<button class="prev" onclick="prevSlide()">❮</button>
			<button class="next" onclick="nextSlide()">❯</button>
		</div>


		<section class="categories-section">
			<h2>MOST POPULAR CATEGORIES</h2>
			<div class="underline"></div>
			<div class="categories-grid">

				<a href="${pageContext.request.contextPath}/Productpagecontroller"
					class="category-card"> <img
					src="${pageContext.request.contextPath}/Resources/Image/login/oppomobile.png"
					alt="Oppo Mobile">
					<p>Oppo</p>
				</a> <a href="${pageContext.request.contextPath}/Productpagecontroller"
					class="category-card"> <img
					src="${pageContext.request.contextPath}/Resources/Image/login/onepluse.jpg"
					alt="OnePlus Mobile">
					<p>One +</p>
				</a> <a href="${pageContext.request.contextPath}/Productpagecontroller"
					class="category-card"> <img
					src="${pageContext.request.contextPath}/Resources/Image/login/Nokia.png"
					alt="Nokia Mobile">
					<p>Nokia</p>
				</a> <a href="${pageContext.request.contextPath}/Productpagecontroller"
					class="category-card"> <img
					src="${pageContext.request.contextPath}/Resources/Image/login/Redmi.jpg"
					alt="Redmi">
					<p>Redmi</p>
				</a> <a href="${pageContext.request.contextPath}/Productpagecontroller"
					class="category-card"> <img
					src="${pageContext.request.contextPath}/Resources/Image/login/Samsungmobile.png"
					alt="Samsung Mobile">
					<p>Samsung</p>
				</a> <a href="${pageContext.request.contextPath}/Productpagecontroller"
					class="category-card"> <img
					src="${pageContext.request.contextPath}/Resources/Image/login/iphonemobile.png"
					alt="iPhone">
					<p>iPhone</p>
				</a>

			</div>
		</section>



		<section class="brands-section">
			<h2>
				<span style="color: #d10e7f;">Featured</span> Brands
			</h2>
			<div class="brand-underline"></div>
			<div class="brands-grid">
				<div class="brand-card">
					<img
						src="${pageContext.request.contextPath}/Resources/Image/login/Apple.png"
						alt="Apple">
					<p>Apple</p>
				</div>
				<div class="brand-card">
					<img
						src="${pageContext.request.contextPath}/Resources/Image/login/samsunglogo.png"
						alt="Samsung">
					<p>Samsung</p>
				</div>
				<div class="brand-card">
					<img
						src="${pageContext.request.contextPath}/Resources/Image/login/onepluse.png"
						alt="OnePlus">
					<p>OnePlus</p>
				</div>
				<div class="brand-card">
					<img
						src="${pageContext.request.contextPath}/Resources/Image/login/ redmilogo.png"
						alt="Redmi">
					<p>Redmi</p>
				</div>

			</div>
		</section>

	</main>

	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />

	<script>
        const slides = document.querySelectorAll(".slide");
        let index = 0;

        function showSlide(i) {
            slides.forEach((slide, idx) => {
                slide.style.display = idx === i ? "block" : "none";
            });
        }

        function nextSlide() {
            index = (index + 1) % slides.length;
            showSlide(index);
        }

        function prevSlide() {
            index = (index - 1 + slides.length) % slides.length;
            showSlide(index);
        }

        showSlide(index);
        setInterval(nextSlide, 3000);
    </script>

</body>
</html>
