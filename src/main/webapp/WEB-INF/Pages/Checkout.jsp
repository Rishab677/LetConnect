<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.letsconnect.model.Cart"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
List<Cart> cart = (List<Cart>) session.getAttribute("cart");
String paymentID = (String) request.getAttribute("paymentID");
String deliveryID = (String) request.getAttribute("deliveryID");

if (paymentID == null)
	paymentID = "AUTO_PAYMENT";
if (deliveryID == null)
	deliveryID = "AUTO_DELIVERY";

int totalQty = 0;
double totalPrice = 0.0;

if (cart != null) {
	for (Cart item : cart) {
		totalQty += item.getQuantity();
		totalPrice += item.getProduct().getPrice() * item.getQuantity();
	}
}

String invoiceNumber = "INV" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

String error = (String) request.getAttribute("error");
String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #eef;
	margin: 0;
	padding: 0;
}

.container {
	width: 90%;
	max-width: 1100px;
	margin: 20px auto;
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 20px;
}

.form-section, .summary-section {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

h2, h3 {
	margin-bottom: 10px;
	color: #333;
}

label {
	display: block;
	margin-top: 10px;
	font-weight: bold;
	color: #444;
}

input[type="text"], input[type="number"], input[type="hidden"], select {
	width: 100%;
	padding: 8px 10px;
	margin-top: 4px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	box-sizing: border-box;
}

input[type="text"][readonly] {
	background-color: #f9f9f9;
	color: #555;
}

input[type="submit"] {
	margin-top: 20px;
	background-color: #28a745;
	color: white;
	padding: 12px;
	width: 100%;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #1e7e34;
}

.summary-item {
	margin: 10px 0;
	font-size: 15px;
	color: #222;
}

.message {
	font-weight: bold;
	padding: 10px;
	margin: 10px 0;
	border-radius: 6px;
}

.error {
	background-color: #ffd5d5;
	color: #a10000;
	border: 1px solid #f5a5a5;
}

.success {
	background-color: #d6ffd8;
	color: #006b1b;
	border: 1px solid #a5f5ab;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/Pages/Header.jsp" />
	<div class="container">

		<div class="form-section">
			<h2>Checkout</h2>

			<%
			if (error != null) {
			%>
			<div class="message error">
				⚠️
				<%=error%></div>
			<%
			} else if (message != null) {
			%>
			<div class="message success">
				✅
				<%=message%></div>
			<%
			}
			%>

			<form method="POST"
				action="${pageContext.request.contextPath}/checkout">

				<input type="hidden" name="paymentID" value="<%=paymentID%>">
				<input type="hidden" name="deliveryID" value="<%=deliveryID%>">

				<h3>Order Details</h3>
				<label for="quantity">Quantity</label> <input type="number"
					id="quantity" name="quantity" value="<%=totalQty%>" required>

				<label for="totalPrice">Total Price</label> <input type="text"
					id="totalPrice" name="totalPrice"
					value="<%=String.format("%.2f", totalPrice)%>" readonly> <label
					for="location">Delivery Location</label> <input type="text"
					id="location" name="location" required>

				<h3>Delivery Information</h3>
				<label for="delivery_agency">Agency</label> <input type="text"
					id="delivery_agency" name="delivery_agency" required> <label
					for="delivery_state">State</label> <input type="text"
					id="delivery_state" name="delivery_state" required> <label
					for="delivery_location">Drop Location</label> <input type="text"
					id="delivery_location" name="delivery_location" required>

				<h3>Payment Information</h3>

				<label for="payment_method">Method</label> <select
					id="payment_method" name="payment_method" required>
					<option value="" disabled selected>Select Payment Method</option>
					<option value="esewa">esewa</option>
					<option value="khalti">khalti</option>
				</select> <label for="payment_invoice">Invoice</label> <input type="text"
					id="payment_invoice" name="payment_invoice"
					value="<%=invoiceNumber%>" readonly> <label
					for="payment_verification">Verification</label> <select
					id="payment_verification" name="payment_verification" required>
					<option value="" disabled selected>Select Verification
						Status</option>
					<option value="complete">complete</option>
					<option value="uncomplete">uncomplete</option>
				</select> <input type="submit" value="Place Order">
			</form>
		</div>

		<div class="summary-section">
			<h2>Order Summary</h2>
			<%
			if (cart != null && !cart.isEmpty()) {
			%>
			<%
			for (Cart item : cart) {
			%>
			<div class="summary-item">
				🛒 <strong><%=item.getProduct().getName()%></strong> x
				<%=item.getQuantity()%>
				- Rs.
				<%=String.format("%.2f", item.getProduct().getPrice() * item.getQuantity())%>
			</div>
			<%
			}
			%>
			<hr>
			<div class="summary-item">
				<strong>Total Quantity:</strong>
				<%=totalQty%></div>
			<div class="summary-item">
				<strong>Total Price:</strong> Rs.
				<%=String.format("%.2f", totalPrice)%></div>
			<%
			} else {
			%>
			<p>Your cart is empty.</p>
			<%
			}
			%>
		</div>

	</div>

	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />
</body>
</html>