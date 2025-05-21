<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mobile Product Management</title>
<style>
.body {
	margin: 0;
	background: #f4f4f4;
}

.wrap {
	display: flex;
	width: 100%;
	min-height: 1000px;
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
	width: 100%;
	padding: 20px;
	background: #f4f4f4;
	display: flex;
	flex-direction: column;
	align-items: center;
}

h2 {
	margin-bottom: 20px;
	color: #333;
}

.btn-purple {
	background-color: #6a0dad;
	color: white;
	padding: 10px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
	text-decoration: none;
	display: inline-block;
	margin-bottom: 20px;
	align-items: right;
}

.btn-red {
	background-color: #e74c3c;
	color: white;
	padding: 10px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
	text-decoration: none;
	display: inline-block;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: white;
}

table, th, td {
	border: 1px solid #ddd;
}

th {
	background-color: #6a0dad;
	color: white;
}

th, td {
	padding: 12px;
	text-align: left;
}

img {
	max-width: 50px;
	height: auto;
}

.nav a.active {
	background: #ae00ff;
	color: white;
	font-weight: bold;
}

/* Modal styles */
.modal {
	display: none;
	position: fixed;
	z-index: 100;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fff;
	margin: 5% auto;
	padding: 30px;
	border-radius: 10px;
	width: 500px;
	position: relative;
}

.button-container {
	width: 100%;
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
}

.close {
	color: #aaa;
	position: absolute;
	top: 15px;
	right: 20px;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover {
	color: black;
}

.modal-content form input, .modal-content form textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
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
						class="active"
						href="${pageContext.request.contextPath}/UpdateProduct">Product</a>
					<a href="${pageContext.request.contextPath}/Orders">Orders</a> <a
						href="${pageContext.request.contextPath}/ManageUser">Manage
						User</a>
				</div>
			</div>
			<button class="logout">Log out</button>
		</div>

		<div class="container">
			<h2>Mobile Product Management</h2>

			<div class="button-container">
				<button class="btn-purple" onclick="openAddProductModal()">+
					Add Product</button>
			</div>

			<!-- Modal Popup -->
			<div id="addProductModal" class="modal">
				<div class="modal-content">
					<span class="close" onclick="closeAddProductModal()">&times;</span>
					<form id="productForm"
						action="${pageContext.request.contextPath}/UpdateProduct"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="productId"
							value="${editProduct != null ? editProduct.id : ''}" /> <input
							type="text" name="product_name" placeholder="Product Name"
							required value="${editProduct != null ? editProduct.name : ''}" />
						<input type="text" name="product_brand" placeholder="Brand"
							required value="${editProduct != null ? editProduct.brand : ''}" />
						<input type="text" name="product_price" placeholder="Price"
							required value="${editProduct != null ? editProduct.price : ''}" />
						<textarea name="product_specifications"
							placeholder="Specifications" rows="3" required>${editProduct != null ? editProduct.specifications : ''}</textarea>
						<input type="file" name="product_image"
							${editProduct == null ? "required" : ""} />
						<button type="submit" class="btn-purple">${editProduct != null ? "Update" : "Add"}
							Product</button>
						<button type="button" class="btn-red"
							onclick="closeAddProductModal()">Cancel</button>
					</form>
				</div>
			</div>

			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Brand</th>
						<th>Price</th>
						<th>Specifications</th>
						<th>Image</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${products}">
						<tr>
							<td>${p.id}</td>
							<td>${p.name}</td>
							<td>${p.brand}</td>
							<td>${p.price}</td>
							<td>${p.specifications}</td>
							<td><c:if test="${not empty p.imagePath}">
									<img src="${pageContext.request.contextPath}/${p.imagePath}"
										alt="${p.name}" />
								</c:if></td>
							<td><a
								href="${pageContext.request.contextPath}/UpdateProduct?action=edit&id=${p.id}"
								class="btn-purple">Edit</a> <a href="#"
								onclick="deleteProduct(${p.id})" class="btn-red">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<form id="deleteForm"
				action="${pageContext.request.contextPath}/UpdateProduct"
				method="post" style="display: none;">
				<input type="hidden" name="action" value="delete" /> <input
					type="hidden" name="id" id="deleteId" />
			</form>
		</div>
	</div>

	<script>
function openAddProductModal() {
    document.getElementById('addProductModal').style.display = "block";
}

function closeAddProductModal() {
    document.getElementById('addProductModal').style.display = "none";
}

function cancelForm() {
    closeAddProductModal();
    window.location.href = "${pageContext.request.contextPath}/UpdateProduct";
}

function deleteProduct(id) {
    if (confirm("Are you sure you want to delete this product?")) {
        document.getElementById('deleteId').value = id;
        document.getElementById('deleteForm').submit();
    }
}
</script>

	<!-- Auto-open modal if editing -->
	<c:if test="${editProduct != null}">
		<script>
        window.onload = openAddProductModal;
    </script>
	</c:if>

</body>
</html>