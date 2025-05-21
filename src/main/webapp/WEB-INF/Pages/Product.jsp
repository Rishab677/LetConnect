<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
</head>
<style>


h2 {
	color: #d32f2f;
	margin: 20px;
	text-align: center;
}

.phonegrid {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 20px;
	padding: 20px;
}

.card {
	background-color: #ffffff;
	padding: 15px;
	text-align: center;
	border-radius: 8px;
	width: 240px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.card img {
	width: 100%;
	height: 180px;
	object-fit: cover;
	border-radius: 8px;
}

.card h3 {
	margin: 15px 0 10px;
	font-size: 18px;
	color: #222;
	text-align: center;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-decoration: none;
}

.card p {
	font-size: 14px;
	color: #666;
	text-align: center;
	overflow: hidden;
	text-decoration: none;
}

.price {
	font-size: 18px;
	font-weight: bold;
	color: #d50000;
	margin: 10px 0;
	text-decoration: none;
}

.addtocartbtn {
	background-color: #5e3c7d;
	color: white;
	padding: 10px 14px;
	border: none;
	border-radius: 5px;
	font-size: 15px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.addtocartbtn:hover {
	background-color:#4b1c76;
}
</style>
<body>


	<jsp:include page="/WEB-INF/Pages/Header.jsp" />
	

	<h2>Our Available Products</h2>

	<div class="phonegrid">
		<c:if test="${not empty products}">
			<c:forEach var="product" items="${products}">
				<c:if
					test="${empty param.searchQuery or fn:containsIgnoreCase(product.name, param.searchQuery)}">
					<div class="card">
						<a
							href="${pageContext.request.contextPath}/productdetails?productId=${product.id}">
							<c:choose>
								<c:when test="${not empty product.imagePath}">
									<img src="${product.imagePath}" alt="${product.name}" />
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/resources/default-image.jpg"
										alt="Default Image" />
								</c:otherwise>
							</c:choose>
							<h3>${product.name}</h3>
							<p>
								<c:choose>
									<c:when test="${empty product.specifications}">
                                        No specifications available
                                    </c:when>
									<c:otherwise>
                                        ${product.specifications}
                                    </c:otherwise>
								</c:choose>
							</p>
							<div class="price">$${product.price}</div>
						</a>
						<form action="${pageContext.request.contextPath}/productdetails"
							method="get">
							<input type="hidden" name="productId" value="${product.id}" />
							<button type="hidden" name="productId" class="addtocartbtn">Order
								Now</button>
						</form>


					</div>
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${empty products}">
			<p class="message">No products available at the moment.</p>
		</c:if>
	</div>
	

	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />
</body>
</html>