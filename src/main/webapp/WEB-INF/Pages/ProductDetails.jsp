<%@ page import="com.letsconnect.model.Product"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>

<style>
.box {
	display: flex;
	flex-direction: row;
	padding: 30px;
	gap: 30px;
	max-width: 1200px;
	margin: auto;
	background-color: #fff;
	text-align: left;
}

.img-box {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 8px;
	margin-left: 70px;
}

.img-box img {
	max-width: 100%;
	max-height: 400px;
	border-radius: 8px;
}

.details {
	flex: 2;
	display: flex;
	flex-direction: column;
}

.name {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.price {
	margin: 10px 0;
	font-size: 20px;
}

.new {
	color: #d32f2f;
	font-weight: bold;
}



.brand {
	margin: 15px 0;
	color: #444;
}

.sale {
	background-color: #fff3cd;
	border: 1px solid #ffeeba;
	padding: 10px;
	border-radius: 5px;
	margin: 15px 0;
	color: #856404;
}

.info {
	background-color: #f1f1f1;
	border-left: 4px solid #ccc;
	padding: 10px;
	margin: 10px 0;
	border-radius: 5px;
	font-size: 14px;
}

.qty {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-top: 15px;
}

.qty input {
	width: 40px;
	text-align: center;
}

.btns {
	margin-top: 20px;
	display: flex;
	gap: 10px;
}

.btns button {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	font-weight: bold;
	cursor: pointer;
}

.cart-btn {
	background-color: #4b1c76;
	color: white;
}

.buy-btn {
	background-color: #673AB7;
	color: white;
}

.desc {
	max-width: 1220px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
}

.desc h3 {
	margin-bottom: 10px;
}

.back {
	display: block;
	margin-top: 30px;
	text-align: center;
	font-size: 18px;
	color: #3498db;
	text-decoration: none;
	border: 2px solid #3498db;
	padding: 10px 20px;
	border-radius: 4px;
}

.back:hover {
	background-color: #3498db;
	color: white;
}

.notfound {
	text-align: center;
	font-size: 24px;
	color: #e74c3c;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/Pages/Header.jsp" />

	<c:if test="${not empty product}">
		<div class="box">
			<div class="img-box">
				<img src="${product.imagePath}" alt="Product Image" />
			</div>
			<div class="details">
				<h2 class="name">${product.name}</h2>

				<div class="price">
					<span class="new">$${product.price}</span>
					
				</div>

				<div class="brand">
					<p>Brand: ${product.brand}</p>
				</div>

				<div class="sale">
					<strong>Special Offer:</strong> 01:58:09 — Remains until the end of the sale.
				</div>

				<div class="info">
					<strong>Payment:</strong>
					Google Pay, Online card, UPI payment.
				</div>

				<div class="info">
					<strong>Warranty:</strong> This product is covered under the Consumer Protection Act.
				</div>

				<div class="btns">
					<form action="${pageContext.request.contextPath}/add-to-cart" method="post">
						<input type="hidden" name="productId" value="${product.id}" />
						<button type="submit" class="cart-btn">Add to Cart</button>
					</form>
				</div>
			</div>
		</div>

		<div class="desc">
			<h3>Product Description</h3>
			${product.specifications}
		</div>
	</c:if>

	<c:if test="${empty product}">
		<div class="notfound">
			<p>Product not found!</p>
		</div>
	</c:if>

	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />
</body>
</html>